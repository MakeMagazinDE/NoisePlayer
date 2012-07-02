program NoisePlayer;

// Spielt bis zu acht 8-Bit-WAVs aus DataFlash ab, mit einstellbarer Start-, Ende- und
// Loop-Adresse. Ist Loop-Adresse = -1, stoppt der Player am Ende, ansonsten weiter
// bei Loop. Kompatibel mit c't-Lab-Syntax.

// Spezialversion Hammond Grinding Noise Generator (HAGRINOG)
// Schaltet Relais und +5V für HOAX ein, wenn Startsequenz korrekt absolviert
// Belegung PL1: Pin 1 (PC0) = START Button,  2 (PC1) = RUN SWITCH (an Masse Pin 8)


{$NOSHADOW}
{ $WG}                     {global Warnings off}
{$W- Warnings}            {Warnings off}
{$TYPEDCONST OFF}
{$OPTI_QUICK}

{$DEFINE ATMEGA168}

{$IFDEF ATMEGA168}
Device = mega168, VCC=5;
{$ELSE}
Device = mega8, VCC=5;
{$ENDIF}
{ $BOOTRST $01C00}         {Reset Jump to $01C00}

Import SysTick, PWMport1A, SerPort;

From System Import LongInt;


Define
  ProcClock      = 16000000;       {Hertz}
  SysTick        = 2;             {msec}
  StackSize      = $0040, iData;
  FrameSize      = $0040, iData;
  SerPort        = 57600, Stop1, timeout;    {Baud, StopBits|Parity}
  RxBuffer       = 32, iData;
  TxBuffer       = 32, iData;

  PWMpresc1 = 1; {prescaler timer1}
  PWMres1 = 8; {resolution timer1}
  PWMmode1 = slow, positive; {optional define}
  
Implementation

{--------------------------------------------------------------}
{ Type Declarations }

type
  tError = (NoErr, UserReq, BusyErr, FileErr, SyntaxErr, ParamErr,
  LockedErr, ChecksumErr, FPGAconfErr, DFconfErr);


{--------------------------------------------------------------}
{ Const Declarations }
const
  LEDoutPort                 = @PortD;   {LED-Port}
  DFport                     = @PortB;   {FPGA-SPI-Port}
  PWMport                    = @PinB;   {MISO}

  b_SCK                      = 5; //Takt für alle, SPI-Belegung!
  b_MISO                     = 4; //SPI Daten von allen
  b_MOSI                     = 3; //Daten an alle
  b_SS                       = 2; //für MMC-Karte benutzt, HW-SPI!
  b_DataFlash                = 0; //DataFlash Chipselect


{$IFDEF ATMEGA168}
  ErrStrArr      : array[0..9] of String[8] = (
  '[OK]', '[USR]', '[BUSY]', '[FILE]', '[CMDERR]', '[PARERR]',
  '[LOCKED]', '[CHKSUM]', '[FPGA]', '[DFERR]');
{$ENDIF}


  ErrSubCh: Integer          = 255;

  Vers1Str                   = '1.00 [NOISEPLAY by CM 11/2011]';    //Vers1

{--------------------------------------------------------------}
{$IFDEF ATMEGA168}

  CmdStrArr      : array[0..15] of String[3] = (
  'STR', // Status Request 255
  'IDN', // Identify Version number 254
  'SDB', // Sound Data Beginn Adresse
  'SDL', // Sound Data Loop Adresse
  'SDE', // Sound Data Ende Adresse
  'PLY', // Play 0...7, z.B. "PLY 0"
  'STP', // Stop Sound

  'DFS', // 9920 DataFlash Status
  'DFX', // 9930 DataFlash Config from XMODEM Receive, DFX 1=xx relativ zu Conf-Ende
  'DFE', // 9940 DataFlash Chip Erase, DFE 1=xx Block/Sector-Erase relativ zu Conf-Ende
  
  'RST', // 9999 System Reset

  'WEN', // 250 Write enable
  'ERC', // 251 ErrCount seit letztem Reset
  'SBD', // 252 SerBaud UBRR-Register mit U2X=1
  'REM', // 253
  'NOP');

  Cmd2SubChArr   : array[0..15] of integer = (
  255, 254,
  0,10,20,30,40,
  9920,
  9930, 9940,
  9999,
  250, 251, 252, 253, 253);

  cmdAnzahl                  = 14; // letzter Eintrag, statt tCmdwhich
  cmdErr                     = cmdAnzahl+1; // Error, Statt tCmdwhich
{$ENDIF}

  high: Boolean              = true;
  low : Boolean              = false;

structconst
{$EEPROM}
// Noise:                                     Start    Run    RunStart  Auslauf Auslauf unvollst.
  EEWaveStartArray : array[0..7] of LongInt = (44,     167000, 133052,  262003, 385000, 44,44,44);
  EEWaveLoopArray : array[0..7] of LongInt =  (133052, 207052, 133052,  -1,     -1,     -1,-1,-1);
  EEWaveEndArray : array[0..7] of LongInt =  (161752,  261552, 161752,  489004, 489004, 0,0,0);

{--------------------------------------------------------------}
{ Var Declarations }
var

{$DATA}
  h, i, m, sw_debounce              : byte;
  DF_send, DF_receive  : byte;
  
{$IDATA}
  LEDrelais[LEDOutPort, 2] : bit; {Bit 2 LED Remote-Activity}
  LEDstartOK[LEDOutPort, 3] : bit; {Bit 2 LED Remote-Activity}

  F_DataFlash[DFport, b_DataFlash]: bit;    // CS für AT25DF021
  PWMpin[PWMport, 1]: bit;    // PWM-Ausgang

  Switchport, oldSwitchport, wavesel: byte;
  SW0[@Switchport, 0]: bit;    // Switch 0
  SW1[@Switchport, 1]: bit;    // Switch 1
  startcomplete,  PWMenabled, PWMslower, wasrunning: Boolean;

  CmdWhich       : byte; // tcmdwhich nicht mehr benutzt
  CmdStr         : String[3];
  SubCh          : integer;
  CurrentCh      : byte;
  OmniFlag, verbose    : boolean;
//  Param          : float;
  ParamInt       : integer;
  ParamAlpha     : boolean; // Flag für Zeichenfolge hinter "="
  ParamLong      : LongInt;
  ParamLong0[@ParamLong+0]: byte;
  ParamLong1[@ParamLong+1]: byte;
  ParamLong2[@ParamLong+2]: byte;
  ParamLong3[@ParamLong+3]: byte;
  Paramword      : word;
  Parambyte      : byte;
  BinaryMode     : boolean;

  MainCh         : byte;
  SerInpStr      : String[31];
  SerInpPtr, ParsePtr      : byte;

  DF_long        : LongInt;  // DF-Registerwert Langwort
  DF_long0[@DF_long+0]       : byte;
  DF_long1[@DF_long+1]       : byte;
  DF_long2[@DF_long+2]       : byte;
  DF_long3[@DF_long+3]       : byte;


  PWMbit: Boolean;


  //für Parser
  ParamStr       : String[40]; // auch für Display

  isInteger, Request: boolean;
  Status         : byte;  // 0..3 Fehlernummer
  UserSRQFlag[@Status, 6]    : bit;
  FileErrorFlag[@Status, 5]  : bit;  //
  EEUnlocked[@Status, 4]     : bit; // EEPROM-unlocked-Flag

{  FaultStrArr : array[0..3] of String[10] = (
    '[READERR]',
    '[NOCARD]',
    '[CONFERR]',
    '[WRITERR]');  }

  FaultFlags     : byte;
  ReadErr[@FaultFlags, 0]    : bit;
  NoCard[@FaultFlags, 1]     : bit;
  ConfErr[@FaultFlags, 2]    : bit;
  WriteErr[@FaultFlags, 3]   : bit;
  ErrCount       : integer;
  ErrFlag        : boolean;
  byteCount,
  SoundStart, WaveEnd, WaveLoop: LongInt;

  WaveStartArray : array[0..7] of LongInt;
  WaveLoopArray : array[0..7] of LongInt;
  WaveEndArray : array[0..7] of LongInt;


  VerifyTable    : Table[0..255] of byte;
  BlockTable     : Table[0..255] of byte;
  Blockarray2[@BlockTable]   : array[0..127] of word;
  Blockarray4[@BlockTable]   : array[0..63] of LongInt;
  BlockStr[@BlockTable]      : String[255];

{--------------------------------------------------------------}
{ functions }

procedure InitPorts;
begin
  PortD:= %00000000;
  DDRD:=  %00011100;
  PortB:= %00101111;
  DDRB:=  %00111111;
  PortC:= %00111111;
  DDRC:=  %00000000;

  SPCR := %01011100;          // Enable SPI, Master, CPOL/CPHA=1,1 Mode 3
  SPSR := %00000000;          // %00000001 = Double Rate, %00000000 = Normal Rate
end InitPorts;

{$I NP_hwasm.pas}
{$I NP_com.pas}

function DF_checkprotected: boolean;
begin
  if (DF_status and %11101111) <> 0 then
    WriteChPrefix;
    writeln(SerOut, '-6 [DF Protected Error]');
    return(true);
  else
    return(false);
  endif;
end;

{$IFDEF ATMEGA168}
{$I NP_parser.pas}
{$ENDIF}

procedure CheckSer;
var
  myChar: char; myByte:Byte;
begin
  myChar:= serInp;
{$IFDEF ATMEGA168}
  case myChar of
    #8: // BS
      if (length(SerInpStr) > 0) then
        setlength(SerInpStr, length(SerInpStr) - 1);
      endif;
      |
    #13: // CR
      BinaryMode:= false;
      ParseSubCh;               // Befehl interpretieren, wenn für uns
      SerInpStr:= '';
      |
    #32..#127: // nur 7-Bit-ASCII ohne Controls
      append(myChar, SerInpStr);
      |
  endcase;
{$ELSE}
  case myChar of
    'v': // version
      WriteChPrefix;
      writeln(serout,Vers1Str);
      |
    'u': // unprotect
      DF_unprotect;
      |
    'e': // erase
      WriteChPrefix;
      if not DF_checkprotected then
        if (not DF_erase) then
          writeln(SerOut, '-3 [DF FullErase Error]');
        else
          writeln(serout, '0 [DF Erase OK]');
        endif;
      endif;
      |
    'x': // xmodem receive
      if not DF_checkprotected then
        XModemRxToDF(0);
      endif;
      |
    'r': // reset
      DF_protect;
      System_Reset;
      |
  endcase;
  SerPrompt;
{$ENDIF}
end;

procedure GetWaveParams;
begin
  DF_long:= WaveStartArray[wavesel];
  WaveLoop:=  WaveLoopArray[wavesel]; // Schleifenstart
  WaveEnd:=   WaveEndArray[wavesel];  // Schleifenende
end;

{--------------------------------------------------------------}
{ Main Program }
{$IDATA}

begin
  InitPorts;
  EnableInts;
  WriteChPrefix;
  write(serout,Vers1Str);
{$IFNDEF ATMEGA168}
  SerPrompt;
{$ENDIF}
  PWMport1A:= $80;
  for i:= 0 to 7 do
    WaveStartArray[i]:=EEWaveStartArray[i];
    WaveLoopArray[i]:=EEWaveLoopArray[i];
    WaveEndArray[i]:=EEWaveEndArray[i];
  endfor;
  oldSwitchport:= 0;

  loop
    //disableInts;
    if serStat then
      CheckSer;
    endif;
    Switchport:= PinC and 3;
    if (Switchport <> oldSwitchPort) or (Switchport=3) then
      if Switchport=3 then
        dectolim(sw_debounce,0);
        LEDstartOK:=low;
        if wasrunning then
          if startcomplete then
            wavesel:=3; // langer Auslauf
          else
            wavesel:=4; // kurzer Auslauf
          endif;
          GetWaveParams;
          PWMslower:=false;
          wasrunning:=false;
          if sw_debounce=0 then
            startcomplete:=false;
          endif;
        endif;
      endif;
      if not SW0 then  // Schalter START
        wavesel:=0;
        GetWaveParams;
        PWMenabled:=true;
        wasrunning:=true;
      endif;
      if not SW1 then
        wavesel:=1;
        GetWaveParams;
        wasrunning:=true;
        sw_debounce:=255;
        if not SW0 then  // Schalter EIN
          wavesel:=2;
          GetWaveParams;
        else
          wavesel:=1;
          GetWaveParams;
        endif;
        if startcomplete then
          LEDrelais:=high;
        else
          PWMslower:=true;
        endif;
      else
        LEDrelais:=low;
      endif;
      DFsetReadAddr;
    endif;
    oldSwitchPort:= Switchport;
    if PWMslower then
      udelay(2);
    endif;
// Adresse in DF_long wird "mitgeführt", DF inkrementiert Adresse automatisch
// nach Lesen eines Bytes
    if PWMenabled then
      if DF_long > WaveEnd then
        DF_long:= WaveLoop;
        DFsetReadAddr;         // Adresse in DF_Long für Lesen setzen
        if wavesel=0 then  // Starten beendet?
          startcomplete:=true;
          LEDstartOK:=true;
        endif;
      else
        inc(DF_Long);
      endif;
// Wenn Loop-Adresse -1 geladen, Ausgabe beenden
      if DF_long3 = 255 then
        PWMenabled:=false;
        PWMslower:=false;
        startcomplete:=false;
        DF_receive:=$80;
        F_DataFlash:= high;  // Lesen beendet
      else
        DF_sr;     // Adresse in DF_Long, Ergebnis in DF_receive
      endif;
    else
      DF_receive:=$80;
      F_DataFlash:= high;  // Lesen beendet
    endif;
    asm;
    PWM_wait1:
       LDS    _ACCA, TCNT1L ; Portbit PB1
       ANDI   _ACCA, $80
       BREQ   PWM_wait1     ; auf Mitte des PWM-pulses warten
    PWM_wait2:
       LDS    _ACCA, TCNT1L ; Portbit PB1
       ANDI   _ACCA, $80
       BRNE   PWM_wait2
       STS    OCR1AL, NoisePlayer.DF_receive ; neuer PWM-Wert
    endasm;
  endloop;
end.

