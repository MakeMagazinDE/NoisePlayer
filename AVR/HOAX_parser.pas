{###########################################################################}
function DF_checkprotected: boolean;
begin
  if DF_status <> 0 then
    WriteChPrefix;
    writeln(SerOut, '-6 [DF Protected Error]');
    return(true);
  else
    return(false);
  endif;
end;

// gerätespezifischer Parser-Teil
procedure ParseGetParam;
var
    myByte:byte;
    myIndex:Byte;

begin
  myIndex:=byte(SubCh mod 10);  // angespr. Register 0..9 errechnen aus SubCh-Rest
  case SubCh of
    0..249: // FPGA-Lese-Register
      ParamLong:=ReceiveFPGA(byte(SubCh));
      WriteParamLongSerHex;
      |
    251: // Fehlerzähler auslesen
      ParamInt:=Errcount;
      WriteParamIntSer;
      |
    253: // SerTest, gibt Input-String komplett und unverändert wieder aus
      write(serout, SerInpStr);
      SerCRLF;
      return;
      |
    254: // Version
      WriteChPrefix;
      write(serout,Vers1Str);
      write(serout,Vers2Str);
      write(serout, ']');
      SerCRLF;
      |
    255: // Status
      serprompt(NoErr);
      |
    300..331: // HOAX-Parameter-Tabelle
      myIndex:=byte(SubCh - 300);
      ParamByte:=gettable(ParamTable,myIndex);
      WriteParamByteSer;
      |
    399: // local lockout setzen (Abschaltung der eigenen Bedienelemente-Abfrage)
      ParamByte:=byte(Local_Lockout);
      WriteParamByteSer;
      |
    500..531: // HOAX-Parameter Defaults
      myIndex := byte(SubCh-500) +32;
      // ParamByte:= EEDefaultsArray[myIndex]    // direkt aus EEPROM
      ParamByte:=gettable(ParamTable,myIndex);
      WriteParamByteSer;
      |
    600..631: // Leslie-Parameter-Tabelle Byte Delays
      myIndex:=byte(SubCh - 600);
      ParamByte:=gettable(LeslieDelayTable,myIndex);
      WriteParamByteSer;
      |
    640..655: // Leslie-Default-Parameter-Tabelle
      myIndex:=byte(SubCh - 640);
      ParamByte:=gettable(LeslieDefaultsTable,myIndex);
      WriteParamByteSer;
      |
    660..691: // Leslie-Parameter-Tabelle Word Equalizer
      myIndex:= byte(SubCh - 660);
      ParamInt:=integer(gettable(LeslieEqualizerTable,myIndex));
      WriteParamIntSer;
      |
    700: // Program Change Upper
      ParamByte:=pt_PresetUpper;
      WriteParamByteSer;
      |
    701: // Program Change Lower
      ParamByte:=pt_PresetLower;
      WriteParamByteSer;
      |

    705:  // Button-Ports
      ParamByte:= PL05_state;
      WriteParamByteSer;
      |
    707:  // Button-Ports
      ParamByte:= PL07_state;
      WriteParamByteSer;
      |
    708:  // Button-Ports
      ParamByte:= PL08_state;
      WriteParamByteSer;
      |
    711:  // Button-Ports
      ParamByte:=PL11_state;
      WriteParamByteSer;
      |
    712:  // Button-Ports
      ParamByte:=PL12_state;
      WriteParamByteSer;
      |
    720..753:  // 24 analoge Eingänge Raw-Werte 0..255
      myIndex:=byte(SubCh - 720);
      ParamByte:=gettable(adc_Table, myIndex);
      WriteParamByteSer;
      |
      
    1000..1255:
      myIndex:= byte(SubCh - 1000);
      ParamByte:= EEUpperDumpArray[myIndex];
      WriteParamByteSer;
      |
    1256..1511:
      myIndex:= byte(SubCh - 1256);
      ParamByte:= EELowerDumpArray[myIndex];
      WriteParamByteSer;
      |

    9900..9909: // DFP xx?
      PBcoreConfDF(myIndex+PB_block_offset, false);
      serprompt(NoErr);
      |
    9910: // DFC? DataFlash Config to FPGA
      FPGAconfDF;
      if FaultFlags<>0 then
        serprompt(FPGAconfErr);
      else
        serprompt(NoErr);
      endif;
      |
    9920: // DFS? DataFlash Command Status Read
      Parambyte:=DF_status;
      WriteParamByteSer;
      |
{
    9925: // DFN 0?  -> "security string"
      WriteChPrefix;
      DFreadOTP(0);
      write(serout,'0 [$');
      for i := 0 to 63 do
        write(serout,bytetohex(gettable(BlockTable,i)));
      endfor;
      write(serout,']');
      SerCRLF;
      |
    9926: // DFN 1?  -> read serial number
      WriteChPrefix;
      DFreadOTP(64);
      write(serout,'0 [$');
      for i := 0 to 63 do
        write(serout,bytetohex(gettable(BlockTable,i)));
      endfor;
      write(serout,']');
      SerCRLF;
      |
}
    9998: // Parameter neu an FPGA senden
      LoadLeslieDefaults;
      SendLeslieDefaults;
      DefaultChangedFlag:=true;
      PresetUpperChangedFlag := true;
      PresetLowerChangedFlag:=true;
      WriteChPrefix;
      write(serout, '0 [Param Reset]');
      SerCRLF;
      |
    9999: // SysReset
      System_Reset;
      |
  else
    serprompt(ParamErr);
  endcase;
end;


procedure ParseSetParam;
var myByte:byte;
    myIndex:Byte;
    myBranch:boolean;

begin
  myIndex:=byte(SubCh mod 10);  // angespr. Register 0..9 errechnen aus SubCh-Rest
  case SubCh of
    0..249: // FPGA-Schreibregister Langwort, auch Default-Auto-Increment
      SendWordToFPGA(word(ParamInt), byte(SubCh));
      |
    250:
      |
    253: // SerTest, gibt Input-String komplett und unverändert wieder aus
      write(serout, SerInpStr);
      SerCRLF;
      return;
      |
    300..331: // HOAX-Parameter Upper und Lower direkt
      myIndex := byte(SubCh-300);
      settable(ParamTable,myIndex,ParamByte);
      DefaultChangedFlag:=true;
      |
    399: // Local Off, Lockout, wenn <> 0 -> eigene Controller abgeschaltet
      Local_Lockout:= (ParamByte<>0);
      if EEunLocked then
        EEDefaultsArray[21]:= ParamByte and 1;
      endif;
      |
    500..531: // HOAX-Parameter Defaults
      myIndex := byte(SubCh-500);
      settable(ParamTable,myIndex+32,ParamByte);
      if EEunLocked then
        EEDefaultsArray[myIndex]:=ParamByte;
      endif;
      DefaultChangedFlag:=true;
      |
    600..631: // Leslie-Delay-Parameter-Tabelle
      myIndex := byte(SubCh-600);
      settable(LeslieDelayTable,myIndex,ParamByte);
      if EEunLocked then
        EELeslieDelayArray[myIndex]:=ParamByte;
      endif;
      LeslieChangedFlag:=true;
      |
    640..655: // Leslie-Default-Parameter-Tabelle
      myIndex := byte(SubCh-640);
      settable(LeslieDefaultsTable,myIndex,ParamByte);
      if EEunLocked then
        EELeslieDefaultsArray[myIndex]:=ParamByte;
      endif;
      |
    660..691: // Leslie-Equalizer-Parameter-Tabelle
      myIndex:= byte(SubCh - 660);
      settable(LeslieEqualizerTable,myIndex,word(ParamLong));
      if EEunLocked then
        EELeslieEqualizerArray[myIndex]:=word(ParamLong);
      endif;
      LeslieChangedFlag:=true;
      |
    700..719: // Button/LED state, dekodieren, aber nichts machen
      |

    1000..1255:
      if EEunLocked then
        myIndex:= byte(SubCh - 1000);
        EEUpperDumpArray[myIndex]:=ParamByte;
      endif;
      |
    1256..1511:
      if EEunLocked then
        myIndex:= byte(SubCh - 1256);
        EELowerDumpArray[myIndex]:=ParamByte;
      endif;
      |
    2000: // Program Change Upper
      pt_PresetUpper:=ParamByte;
      PresetUpperChangedFlag:= true;
      LoadUpper(ParamByte);
      |
    2001: // Program Change Lower
      pt_PresetLower:=ParamByte;
      PresetLowerChangedFlag:= true;
      LoadLower(ParamByte);
      |
    2002: // Store Upper to EEPROM
      if EEunLocked then
        SaveUpper(ParamByte);
      else
        serprompt(LockedErr);
        return;
      endif;
      |
    2003: // Store Lower to EEPROM
      if EEunLocked then
        SaveLower(ParamByte);
      else
        serprompt(LockedErr);
        return;
      endif;
      |

    9900..9909: // DFP xx=1
      if ParamByte <> 0 then
        PBcoreConfDF(myIndex+PB_block_offset, true);  // mit debug-Ausgabe
      else
        PBcoreConfDF(myIndex+PB_block_offset, false);
      endif;
      |
    9920: // DFS=0/1 DataFlash Command (un)protect
      if ParamByte = 0 then
        DF_unprotect;
      else
        DF_protect;
      endif;
      |
    9930: // DFX=0 Dataflash XMODEM Receive (Configuration)
          // mit x: Blocknummer absolut, je 4096 Bytes
      if not DF_checkprotected then
        ParamLong:=ParamLong shl 12; // x 4096
        XModemRxToDF(ParamLong);
        if ParamLong<0 then
          ConfErr:=true;
        else
          mdelay(500);
          WriteParamLongSerHex;
          FPGAconfDF;
        endif;
      endif;
      |
    9931: // DFX 1=x Dataflash XMODEM Receive
          // mit x: Blocknummer hinter Konfigurationsdaten
      if not DF_checkprotected then
        ParamLong:= ParamLong+PB_block_offset;
        ParamLong:=ParamLong shl 12; // x 4096
        XModemRxToDF(ParamLong);
        if ParamLong<0 then
          serprompt(FPGAconfErr);
          ConfErr:=true;
        else
          mdelay(500);
          WriteParamLongSerHex;
        endif;
      endif;
      |
    9940: // DFE 0=x DataFlash Command Block Erase, absolute Blocknummer
      if not DF_checkprotected then
        ParamLong:=ParamLong shl 12; // x 4086
        if (not DFeraseblock(ParamLong)) then
          WriteChPrefix;
          writeln(SerOut, '-4 [DF BlockErase Error]');
          return;
        else
          WriteParamLongSerHex;
        endif;
      endif;
      |
    9941: // DFE 1=x DataFlash Command Block Erase
          // mit x: Blocknummer hinter Konfigurationsdaten
      if not DF_checkprotected then
        ParamLong:= ParamLong+PB_block_offset;
        ParamLong:=ParamLong shl 12; // x 4086
        if (not DFeraseblock(ParamLong)) then
          WriteChPrefix;
          writeln(SerOut, '-4 [DF BlockErase Error]');
          return;
        else
          WriteParamLongSerHex;
        endif;
      endif;
      |
    9942: // DFE 2=0 DataFlash Command Chip Erase
      if not DF_checkprotected then
        if (not DF_erase) then
          WriteChPrefix;
          writeln(SerOut, '-3 [DF FullErase Error]');
          return;
        else
          ParamLong:= 0; //
          WriteParamLongSerHex;
        endif;
      endif;
      |
{
    9925: // DFN="security string"
      if EEunLocked and ParamAlpha then
        for i:=0 to 255 do
          settable(BlockTable,i,0);
        endfor;
        BlockStr:=ParamStr;  // max. 64 Zeichen
        if (not DFwriteOTP) then
          serprompt(DFconfErr);
          return;
        endif;
      else
        serprompt(LockedErr);
        return;
      endif;
      |
}
   else
    serprompt(ParamErr);
    return;
  endcase;
  EEunLocked:=false;
  if SubCh=250 then  // EEPROM Write Enable
    EEunLocked:=true;
  endif;
  if verbose then
    serprompt(NoErr);
  endif;
end;

{###########################################################################}
// Neuer Alpha-Parser, nimmt in ParamStr auch Strings nach "=" entgegen
{###########################################################################}

// allgemeiner Parser-Teil

function Cmd2Index : byte;
// Umsetzen eines Text-Befehls in Index-Eintrag der Befehlstabelle
var myCmdIndex: byte;
begin
  ParamStr:= uppercase(ParamStr);
  for myCmdIndex := 0 to CmdAnzahl do
    if ParamStr = CmdStrArr[ord(myCmdIndex)] then
      return(myCmdIndex);
    endif;
  endfor;
  return(cmderr);
end;

function ParseExtract(nachGleich:boolean):boolean;
//extrahiert ParamStr oder CmdStr aus SerInpStr,
//liefert true, wenn Parameter, sonst false, wenn Command
//akzeptiert auch alphanumerische Parameter als String nach "="
var myChar: char; myBool:boolean;
begin
  ParamStr:='';
  ParamAlpha:=false;
  myBool:=false;
  while SerInpStr[ParsePtr] =' ' do // Leerzeichen überspringen
    inc(ParsePtr);
  endwhile;
  if SerInpStr[ParsePtr] in ['*'..'9'] then // Zahlen oder Wildcard, es wird ein Parameter
    myBool:=true;
    for i:=ParsePtr to length(SerInpStr) do
      mychar:=SerInpStr[i];
      if myChar in ['*'..'9'] then
        append(mychar,ParamStr);
      else // Buchstabe oder sonstirgendwas, abbrechen
        ParsePtr:=i;
        return(mybool);
      endif;
    endfor;
  else
    for i:=ParsePtr to length(SerInpStr) do
      mychar:=SerInpStr[i];
      if mychar='"' then
        ParamAlpha:=true;
      else
        if (mychar>='A') or ParamAlpha then
          if (myChar in ['!','?','$']) then
            ParsePtr:=i;
            return(mybool);
          else
            append(mychar,ParamStr);
          endif;
          if nachGleich then
            ParamAlpha:=true;
          endif;
        else // Ziffer oder sonstirgendwas, abbrechen
          ParsePtr:=i;
          return(mybool);
        endif;
      endif;
    endfor;
  endif;
  return(mybool);
end;

procedure ParamStr2Param;
var DecPointPos:byte;
begin
  ParamLong:=StrToInt(ParamStr);
  ParamInt:=integer(ParamLong);
  ParamByte:=byte(ParamInt);
end;


procedure ParseSubCh;
//Überprüfen, ob Befehl oder Daten eingegangen und für uns, Parser-Vorbehandlung,

var
  GleichPos,
  CheckSpos, myCheckSum,CheckSumIn:byte;
  SubChOffset:integer;

  myChar:char;
  hasMainCh, hasCRC, isResult, isOmni, isRequest: Boolean;

begin
  if SerInpStr='' then
    serprompt(NoErr);
    return;
  endif;
  verbose:=(pos('!',SerInpStr)>0); // OK erwünscht
  hasMainCh:=(pos(':',SerInpStr)>0); // Kanaltrenner-':'
  gleichPos:=pos('=',SerInpStr); // Set-'='
  isRequest:=(GleichPos=0); // Abfrage
  myChar:=SerInpStr[1];
  isOmni:=(myChar='*');    // Omni-Flag
  isResult:=(myChar='#');  // Ergebnis-'#'
  ParsePtr:=1;
  if isResult then
    ParsePtr:=2;
  endif;
  if hasMainCh then
    ParseExtract(false);
    inc(ParsePtr);
    if isOmni then // Omni-Befehl
      WriteSerInp; // weiterleiten
    else
      CurrentCh:=StrToInt(ParamStr);
    endif;
  endif;
  if (not isOmni) and (CurrentCh<>MainCh) and hasMainCh then // nicht für uns
    WriteSerInp;
    return;
  endif;

// Befehl/Parameter ist für uns, ab hier eigentliche Behandlung
// Wenn vorhanden, XOR-Prüfsumme checken, Präfix-"$" zählt nicht mit!
  CheckSpos:=pos('$',SerInpStr);
  hasCRC:=CheckSpos>0; // CheckSumIn-'$'

  if hasCRC then
    ParamStr:=copy(SerInpStr,CheckSpos+1, 2);
    CheckSumIn:=HexToInt(ParamStr); // erhaltene XOR-Checksumme
    myCheckSum:=0;
    for i:= 1 to CheckSpos-1 do
      myChar:=SerInpStr[i];
      myCheckSum:=myCheckSum xor ord(myChar);
    endfor;
    if myCheckSum <> CheckSumIn then
      serprompt(CheckSumErr);
      return;
    endif;
  endif;
//  SerInpStr:=trim(SerInpStr);

//Parse einzelnen Befehl
  if ParseExtract(false) then
    SubChOffset:=0; // direkter SubCh-Aufruf
  else
    CmdWhich:=Cmd2Index; // Klartext übersetzen
    if CmdWhich = cmderr then
      serprompt(SyntaxErr);
      return;
    endif;
    SubChOffset:=Cmd2SubChArr[ord(CmdWhich)];
    ParseExtract(false); // SubCh-Parameter holen
  endif;
  SubCh:=StrToInt(ParamStr)+SubChOffset; //auf neuen SubCh umrechnen
  if isRequest then
    ParseGetParam;
  else
    ParsePtr:=gleichPos+1; // Set-'='
    if ParseExtract(true) then
      ParamStr2Param;
    else
      ParamLong:=0;
      ParamInt:=0;
      ParamByte:=0;
    endif;
    ParseSetParam;
  endif;
end;

