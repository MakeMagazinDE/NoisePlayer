
                        .FILE     E:\DROPBOX\NOISEPLAYER\AVR\NoisePlayer.pas

                        ; Compiled by E-LAB AVRco PASCAL Compiler Rev 4.99.63
                        ; Version     : Profi
                        ;
                        ; Licenced to : Redaktion CT
                        ;
                        ; (c)E-LAB Computers, Grombacherstr. 27  e-mail info@e-lab.de
                        ; D-74906 Bad Rappenau  Tel. 07268/9124-0 Fax. 07268/9124-24
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Source File : NoisePlayer.pas
                        ; Compiled    : 24. Januar 2012  10:26:53
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .LINE     16
                        .OPTI_QUICK
                        .MEDIUM
                        .ROMEND         03FFFh;

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Constants and Variables definition
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


                        ; === Internal used memory and constants ===

FALSE                   .EQU    000h            ; const 
TRUE                    .EQU    0FFh            ; const 
NIL                     .EQU    000h            ; const 
PI                      .EQU    000h            ; const 
COMPILERREV             .EQU    1F3h            ; const 
COMPILERBUILD_Y         .EQU    00Bh            ; const 
COMPILERBUILD_M         .EQU    00Bh            ; const 
COMPILERBUILD_D         .EQU    01Bh            ; const 
COMPILEYEAR             .EQU    00Ch            ; const 
COMPILEMONTH            .EQU    001h            ; const 
COMPILEDAY              .EQU    018h            ; const 
COMPILEHOUR             .EQU    00Ah            ; const 
COMPILEMINUTE           .EQU    01Ah            ; const 
PROJECTBUILD            .EQU    001h            ; const 
OPTIMISERREV            .EQU    000h            ; const 
OPTIMISERBUILD          .EQU    000h            ; const 
INTFLAG                 .EQU    007h            ; const 
_EEPROM                 .EQU    006h            ; const 
_SIGN                   .EQU    005h            ; const 
_WAITLCD                .EQU    004h            ; const 
_STRCONST               .EQU    004h            ; const 
_DEVICE                 .EQU    003h            ; const 
_NEGATIVE               .EQU    002h            ; const 
_ERRFLAG                .EQU    001h            ; const 
_I2C2BYTE               .EQU    000h            ; const 
_TOGGLE300              .EQU    000h            ; const 
_LCDLOWER               .EQU    001h            ; const 
_DSP7RFR                .EQU    002h            ; const 
_PWRSAVFLG              .EQU    003h            ; const 
_STEPCW                 .EQU    004h            ; const 
_F64StrInt              .EQU    004h            ; const 
_STEPDEST               .EQU    005h            ; const 
_F64StrFrac             .EQU    005h            ; const 
_FREQCNTFLAG            .EQU    006h            ; const 
_AUTOACK                .EQU    007h            ; const 
_ACCGLO                 .EQU    000h            ; var Data   byte
_ACCGHI                 .EQU    001h            ; var Data   byte
_ACCHLO                 .EQU    002h            ; var Data   byte
_ACCHHI                 .EQU    003h            ; var Data   byte
_ACCB                   .EQU    010h            ; var Data   byte
_ACCA                   .EQU    011h            ; var Data   byte
_ACCALO                 .EQU    012h            ; var Data   byte
_ACCAHI                 .EQU    013h            ; var Data   byte
_ACCDLO                 .EQU    014h            ; var Data   byte
_ACCDHI                 .EQU    015h            ; var Data   byte
_ACCELO                 .EQU    016h            ; var Data   byte
_ACCEHI                 .EQU    017h            ; var Data   byte
_ACCFLO                 .EQU    018h            ; var Data   byte
_ACCFHI                 .EQU    019h            ; var Data   byte
_ACCBLO                 .EQU    01Ah            ; var Data   byte
_ACCBHI                 .EQU    01Bh            ; var Data   byte
_FRAMEPTR               .EQU    01Ch            ; var Data   byte
_FPTRHI                 .EQU    01Dh            ; var Data   byte
_ACCCLO                 .EQU    01Eh            ; var Data   byte
_ACCCHI                 .EQU    01Fh            ; var Data   byte
FLAGS                   .EQU    004h            ; var Data   byte
FLAGS2                  .EQU    005h            ; var Data   byte
_SYSTFLAGS              .EQU    006h            ; var Data   byte
SYSTICK                 .EQU    002h            ; const 
PROCCLOCK               .EQU    0F42400h        ; const 
DECIMALSEP              .EQU    02Eh            ; const 
CPU_ID                  .EQU    1E9406h         ; const 
Flash_Page_Size         .EQU    080h            ; const 
ROMconstPage            .EQU    0FFFFFFFFFFFFFFFFh          ; const 
STACKSIZE               .EQU    040h            ; const 
FRAMESIZE               .EQU    040h            ; const 
PWMPORT1A               .EQU    088h            ; var iData  word
SERPORT                 .EQU    0E100h          ; const 
UDR1                    .EQU    0C6h            ; var iData  byte
UBRR1H                  .EQU    0C5h            ; var iData  byte
UBRRH                   .EQU    0C5h            ; var iData  byte
UBRR1                   .EQU    0C4h            ; var iData  byte
UBRRL                   .EQU    0C4h            ; var iData  byte
UCSRC                   .EQU    0C2h            ; var iData  byte
UCSR0C                  .EQU    0C2h            ; var iData  byte
UCR1                    .EQU    0C1h            ; var iData  byte
UCSRB                   .EQU    0C1h            ; var iData  byte
UCSR0B                  .EQU    0C1h            ; var iData  byte
USR1                    .EQU    0C0h            ; var iData  byte
UCSRA                   .EQU    0C0h            ; var iData  byte
UCSR0A                  .EQU    0C0h            ; var iData  byte
TWAMR                   .EQU    0BDh            ; var iData  byte
TWCR                    .EQU    0BCh            ; var iData  byte
TWDR                    .EQU    0BBh            ; var iData  byte
TWAR                    .EQU    0BAh            ; var iData  byte
TWSR                    .EQU    0B9h            ; var iData  byte
TWBR                    .EQU    0B8h            ; var iData  byte
ASSR                    .EQU    0B6h            ; var iData  byte
OCR2B                   .EQU    0B4h            ; var iData  byte
OCR2A                   .EQU    0B3h            ; var iData  byte
OCR2                    .EQU    0B3h            ; var iData  byte
TCNT2                   .EQU    0B2h            ; var iData  byte
TCCR2B                  .EQU    0B1h            ; var iData  byte
TCCR2A                  .EQU    0B0h            ; var iData  byte
TCCR2                   .EQU    0B1h            ; var iData  byte
OCR1BH                  .EQU    08Bh            ; var iData  byte
OCR1BL                  .EQU    08Ah            ; var iData  byte
OCR1AH                  .EQU    089h            ; var iData  byte
OCR1AL                  .EQU    088h            ; var iData  byte
ICR1H                   .EQU    087h            ; var iData  byte
ICR1L                   .EQU    086h            ; var iData  byte
TCNT1H                  .EQU    085h            ; var iData  byte
TCNT1L                  .EQU    084h            ; var iData  byte
TCCR1C                  .EQU    082h            ; var iData  byte
TCCR1B                  .EQU    081h            ; var iData  byte
TCCR1A                  .EQU    080h            ; var iData  byte
DIDR1                   .EQU    07Fh            ; var iData  byte
DIDR0                   .EQU    07Eh            ; var iData  byte
ADMUX                   .EQU    07Ch            ; var iData  byte
ADCSR                   .EQU    07Ah            ; var iData  byte
ADCSRB                  .EQU    07Bh            ; var iData  byte
ADCSRA                  .EQU    07Ah            ; var iData  byte
ADCH                    .EQU    079h            ; var iData  byte
ADCL                    .EQU    078h            ; var iData  byte
TIMSK2                  .EQU    070h            ; var iData  byte
TIMSK1                  .EQU    06Fh            ; var iData  byte
TIMSK0                  .EQU    06Eh            ; var iData  byte
PCMSK2                  .EQU    06Dh            ; var iData  byte
PCMSK1                  .EQU    06Ch            ; var iData  byte
PCMSK0                  .EQU    06Bh            ; var iData  byte
EICRA                   .EQU    069h            ; var iData  byte
PCICR                   .EQU    068h            ; var iData  byte
OSCCAL                  .EQU    066h            ; var iData  byte
PRR                     .EQU    064h            ; var iData  byte
CLKPR                   .EQU    061h            ; var iData  byte
WDTCR                   .EQU    060h            ; var iData  byte
SREG                    .EQU    05Fh            ; var pData  byte
SPH                     .EQU    05Eh            ; var pData  byte
SPL                     .EQU    05Dh            ; var pData  byte
SPMCR                   .EQU    057h            ; var pData  byte
SPMCSR                  .EQU    057h            ; var pData  byte
MCUCR                   .EQU    055h            ; var pData  byte
MCUCSR                  .EQU    054h            ; var pData  byte
MCUSR                   .EQU    054h            ; var pData  byte
SMCR                    .EQU    053h            ; var pData  byte
MONDR                   .EQU    051h            ; var pData  byte
ACSR                    .EQU    050h            ; var pData  byte
SPDR                    .EQU    04Eh            ; var pData  byte
SPSR                    .EQU    04Dh            ; var pData  byte
SPCR                    .EQU    04Ch            ; var pData  byte
GPIOR2                  .EQU    04Bh            ; var pData  byte
GPIOR1                  .EQU    04Ah            ; var pData  byte
OCR0B                   .EQU    048h            ; var pData  byte
OCR0A                   .EQU    047h            ; var pData  byte
TCNT0                   .EQU    046h            ; var pData  byte
TCCR0B                  .EQU    045h            ; var pData  byte
TCCR0A                  .EQU    044h            ; var pData  byte
TCCR0                   .EQU    045h            ; var pData  byte
GTCCR                   .EQU    043h            ; var pData  byte
EEARH                   .EQU    042h            ; var pData  byte
EEARL                   .EQU    041h            ; var pData  byte
EEDR                    .EQU    040h            ; var pData  byte
EECR                    .EQU    03Fh            ; var pData  byte
GPIOR0                  .EQU    03Eh            ; var pData  byte
GIMSK                   .EQU    03Dh            ; var pData  byte
EIMSK                   .EQU    03Dh            ; var pData  byte
GIFR                    .EQU    03Ch            ; var pData  byte
EIFR                    .EQU    03Ch            ; var pData  byte
PCIFR                   .EQU    03Bh            ; var pData  byte
TIFR2                   .EQU    037h            ; var pData  byte
TIFR1                   .EQU    036h            ; var pData  byte
TIFR0                   .EQU    035h            ; var pData  byte
PORTD                   .EQU    02Bh            ; var pData  byte
DDRD                    .EQU    02Ah            ; var pData  byte
PIND                    .EQU    029h            ; var pData  byte
PORTC                   .EQU    028h            ; var pData  byte
DDRC                    .EQU    027h            ; var pData  byte
PINC                    .EQU    026h            ; var pData  byte
PORTB                   .EQU    025h            ; var pData  byte
DDRB                    .EQU    024h            ; var pData  byte
PINB                    .EQU    023h            ; var pData  byte
OCR1B                   .EQU    08Ah            ; var iData  word
OCR1A                   .EQU    088h            ; var iData  word
ICR1                    .EQU    086h            ; var iData  word
TCNT1                   .EQU    084h            ; var iData  word
ADC                     .EQU    078h            ; var iData  word
EEAR                    .EQU    041h            ; var pData  word
_iDataStart             .EQU    100h            ; const 
_iDataEnd               .EQU    4FFh            ; const 
_EEpromStart            .EQU    000h            ; const 
_EEpromEnd              .EQU    1FFh            ; const 
_FlashStart             .EQU    000h            ; const 
_FlashEnd               .EQU    3FFFh           ; const 
parNone                 .EQU    000h            ; const 
parEven                 .EQU    001h            ; const 
parOdd                  .EQU    002h            ; const 
DataBit5                .EQU    000h            ; const 
DataBit6                .EQU    001h            ; const 
DataBit7                .EQU    002h            ; const 
DataBit8                .EQU    003h            ; const 
StopBit1                .EQU    000h            ; const 
StopBit2                .EQU    001h            ; const 
_RXTIMEOUT              .EQU    101h            ; var iData  byte
_RXINP                  .EQU    102h            ; var iData  byte
_RXOUTP                 .EQU    103h            ; var iData  byte
_RXCOUNT                .EQU    104h            ; var iData  byte
_RXBUFF                 .EQU    105h            ; var iData  byte
_TXINP                  .EQU    125h            ; var iData  byte
_TXOUTP                 .EQU    126h            ; var iData  byte
_TXCOUNT                .EQU    127h            ; var iData  byte
_TXBUFF                 .EQU    128h            ; var iData  byte
SysTickTime             .EQU    100h            ; var iData  byte
EEPROM                  .EQU    000h            ; var EEprom array



                        .RESET     000000h
                        .ORG       000000h, CODE_START
                        .STARTCODE 000068h

                        .UNIT     NoisePlayer

                        .XDATASTART -1


                        ; ============ user definitions module: NoisePlayer ============

NoisePlayer.LEDoutPort  .EQU    02Bh            ; const byte     43
NoisePlayer.DFport      .EQU    025h            ; const byte     37
NoisePlayer.PWMport     .EQU    023h            ; const byte     35
NoisePlayer.b_SCK       .EQU    005h            ; const byte     5
NoisePlayer.b_MISO      .EQU    004h            ; const byte     4
NoisePlayer.b_MOSI      .EQU    003h            ; const byte     3
NoisePlayer.b_SS        .EQU    002h            ; const byte     2
NoisePlayer.b_DataFlash .EQU    000h            ; const byte     0
;ErrStrArr               .EQU    ; const Array
NoisePlayer.ErrSubCh    .EQU    0FFh            ; const integer  255
;Vers1Str                .EQU    '1.00 [NOISEPLAY '; const String
;CmdStrArr               .EQU    ; const Array
;Cmd2SubChArr            .EQU    ; const Array
NoisePlayer.cmdAnzahl   .EQU    00Eh            ; const byte     14
NoisePlayer.cmdErr      .EQU    00Fh            ; const byte     15
NoisePlayer.high        .EQU    0FFh            ; const boolean  true
NoisePlayer.low         .EQU    000h            ; const boolean  false
NoisePlayer.EEWaveStartArray  .EQU              00000h      ; var EEprom array
                        .SYM      EEWaveStartArray, 00000h, 04035h, 3
NoisePlayer.EEWaveLoopArray   .EQU              00020h      ; var EEprom array
                        .SYM      EEWaveLoopArray, 00020h, 04035h, 3
NoisePlayer.EEWaveEndArray    .EQU              00040h      ; var EEprom array
                        .SYM      EEWaveEndArray, 00040h, 04035h, 3
                        .SYM      h, 00007h, 0000Dh, 3
NoisePlayer.h           .EQU    007h            ; var Data   byte
                        .SYM      i, 00008h, 0000Dh, 3
NoisePlayer.i           .EQU    008h            ; var Data   byte
                        .SYM      m, 00009h, 0000Dh, 3
NoisePlayer.m           .EQU    009h            ; var Data   byte
                        .SYM      sw_debounce, 0000Ah, 0000Dh, 3
NoisePlayer.sw_debounce .EQU    00Ah            ; var Data   byte
                        .SYM      DF_send, 0000Bh, 0000Dh, 3
NoisePlayer.DF_send     .EQU    00Bh            ; var Data   byte
                        .SYM      DF_receive, 0000Ch, 0000Dh, 3
NoisePlayer.DF_receive  .EQU    00Ch            ; var Data   byte
                        .SYM      Switchport, 00148h, 0000Dh, 3
NoisePlayer.Switchport  .EQU    148h            ; var iData  byte
                        .SYM      oldSwitchport, 00149h, 0000Dh, 3
NoisePlayer.oldSwitchport     .EQU              149h        ; var iData  byte
                        .SYM      wavesel, 0014Ah, 0000Dh, 3
NoisePlayer.wavesel     .EQU    14Ah            ; var iData  byte
                        .SYM      startcomplete, 0014Bh, 00003h, 3
NoisePlayer.startcomplete     .EQU              14Bh        ; var iData  boolean
                        .SYM      PWMenabled, 0014Ch, 00003h, 3
NoisePlayer.PWMenabled  .EQU    14Ch            ; var iData  boolean
                        .SYM      PWMslower, 0014Dh, 00003h, 3
NoisePlayer.PWMslower   .EQU    14Dh            ; var iData  boolean
                        .SYM      wasrunning, 0014Eh, 00003h, 3
NoisePlayer.wasrunning  .EQU    14Eh            ; var iData  boolean
                        .SYM      CmdWhich, 0014Fh, 0000Dh, 3
NoisePlayer.CmdWhich    .EQU    14Fh            ; var iData  byte
NoisePlayer.CmdStr      .EQU    150h            ; var iData  string
                        .SYM      CmdStr, 00150h, 0303Ch, 3
                        .SYM      SubCh, 00154h, 00004h, 3
NoisePlayer.SubCh       .EQU    154h            ; var iData  integer
                        .SYM      CurrentCh, 00156h, 0000Dh, 3
NoisePlayer.CurrentCh   .EQU    156h            ; var iData  byte
                        .SYM      OmniFlag, 00157h, 00003h, 3
NoisePlayer.OmniFlag    .EQU    157h            ; var iData  boolean
                        .SYM      verbose, 00158h, 00003h, 3
NoisePlayer.verbose     .EQU    158h            ; var iData  boolean
                        .SYM      ParamInt, 00159h, 00004h, 3
NoisePlayer.ParamInt    .EQU    159h            ; var iData  integer
                        .SYM      ParamAlpha, 0015Bh, 00003h, 3
NoisePlayer.ParamAlpha  .EQU    15Bh            ; var iData  boolean
                        .SYM      ParamLong, 0015Ch, 00005h, 3
NoisePlayer.ParamLong   .EQU    15Ch            ; var iData  longint
                        .SYM      ParamLong0, 0015Ch, 0000Dh, 3
NoisePlayer.ParamLong0  .EQU    15Ch            ; var iData  byte
                        .SYM      ParamLong1, 0015Dh, 0000Dh, 3
NoisePlayer.ParamLong1  .EQU    15Dh            ; var iData  byte
                        .SYM      ParamLong2, 0015Eh, 0000Dh, 3
NoisePlayer.ParamLong2  .EQU    15Eh            ; var iData  byte
                        .SYM      ParamLong3, 0015Fh, 0000Dh, 3
NoisePlayer.ParamLong3  .EQU    15Fh            ; var iData  byte
                        .SYM      Paramword, 00160h, 0000Eh, 3
NoisePlayer.Paramword   .EQU    160h            ; var iData  word
                        .SYM      Parambyte, 00162h, 0000Dh, 3
NoisePlayer.Parambyte   .EQU    162h            ; var iData  byte
                        .SYM      BinaryMode, 00163h, 00003h, 3
NoisePlayer.BinaryMode  .EQU    163h            ; var iData  boolean
                        .SYM      MainCh, 00164h, 0000Dh, 3
NoisePlayer.MainCh      .EQU    164h            ; var iData  byte
NoisePlayer.SerInpStr   .EQU    165h            ; var iData  string
                        .SYM      SerInpStr, 00165h, 0303Ch, 3
                        .SYM      SerInpPtr, 00185h, 0000Dh, 3
NoisePlayer.SerInpPtr   .EQU    185h            ; var iData  byte
                        .SYM      ParsePtr, 00186h, 0000Dh, 3
NoisePlayer.ParsePtr    .EQU    186h            ; var iData  byte
                        .SYM      DF_long, 00187h, 00005h, 3
NoisePlayer.DF_long     .EQU    187h            ; var iData  longint
                        .SYM      DF_long0, 00187h, 0000Dh, 3
NoisePlayer.DF_long0    .EQU    187h            ; var iData  byte
                        .SYM      DF_long1, 00188h, 0000Dh, 3
NoisePlayer.DF_long1    .EQU    188h            ; var iData  byte
                        .SYM      DF_long2, 00189h, 0000Dh, 3
NoisePlayer.DF_long2    .EQU    189h            ; var iData  byte
                        .SYM      DF_long3, 0018Ah, 0000Dh, 3
NoisePlayer.DF_long3    .EQU    18Ah            ; var iData  byte
                        .SYM      PWMbit, 0018Bh, 00003h, 3
NoisePlayer.PWMbit      .EQU    18Bh            ; var iData  boolean
NoisePlayer.ParamStr    .EQU    18Ch            ; var iData  string
                        .SYM      ParamStr, 0018Ch, 0303Ch, 3
                        .SYM      isInteger, 001B5h, 00003h, 3
NoisePlayer.isInteger   .EQU    1B5h            ; var iData  boolean
                        .SYM      Request, 001B6h, 00003h, 3
NoisePlayer.Request     .EQU    1B6h            ; var iData  boolean
                        .SYM      Status, 001B7h, 0000Dh, 3
NoisePlayer.Status      .EQU    1B7h            ; var iData  byte
                        .SYM      FaultFlags, 001B8h, 0000Dh, 3
NoisePlayer.FaultFlags  .EQU    1B8h            ; var iData  byte
                        .SYM      ErrCount, 001B9h, 00004h, 3
NoisePlayer.ErrCount    .EQU    1B9h            ; var iData  integer
                        .SYM      ErrFlag, 001BBh, 00003h, 3
NoisePlayer.ErrFlag     .EQU    1BBh            ; var iData  boolean
                        .SYM      byteCount, 001BCh, 00005h, 3
NoisePlayer.byteCount   .EQU    1BCh            ; var iData  longint
                        .SYM      SoundStart, 001C0h, 00005h, 3
NoisePlayer.SoundStart  .EQU    1C0h            ; var iData  longint
                        .SYM      WaveEnd, 001C4h, 00005h, 3
NoisePlayer.WaveEnd     .EQU    1C4h            ; var iData  longint
                        .SYM      WaveLoop, 001C8h, 00005h, 3
NoisePlayer.WaveLoop    .EQU    1C8h            ; var iData  longint
                        .SYM      WaveStartArray, 001CCh, 00035h, 3
NoisePlayer.WaveStartArray    .EQU              1CCh        ; var iData  array
                        .SYM      WaveLoopArray, 001ECh, 00035h, 3
NoisePlayer.WaveLoopArray     .EQU              1ECh        ; var iData  array
                        .SYM      WaveEndArray, 0020Ch, 00035h, 3
NoisePlayer.WaveEndArray      .EQU              20Ch        ; var iData  array
                        .SYM      VerifyTable, 0022Ch, 0003Dh, 3
NoisePlayer.VerifyTable .EQU    22Ch            ; var iData  array
                        .SYM      BlockTable, 0032Ch, 0003Dh, 3
NoisePlayer.BlockTable  .EQU    32Ch            ; var iData  array
                        .SYM      Blockarray2, 0032Ch, 0003Eh, 3
NoisePlayer.Blockarray2 .EQU    32Ch            ; var iData  array
                        .SYM      Blockarray4, 0032Ch, 00035h, 3
NoisePlayer.Blockarray4 .EQU    32Ch            ; var iData  array
NoisePlayer.BlockStr    .EQU    32Ch            ; var iData  string
                        .SYM      BlockStr, 0032Ch, 0303Ch, 3
                        .FUNC     InitPorts, 000D8h, 00020h
NoisePlayer.InitPorts:
                        .RETURNS   0
                        .BLOCK    217
                        .LINE     218
                        LDI       _ACCA, 000h
                        OUT       PORTD, _ACCA
                        .LINE     219
                        LDI       _ACCA, 01Ch
                        OUT       DDRD, _ACCA
                        .LINE     220
                        LDI       _ACCA, 02Fh
                        OUT       PORTB, _ACCA
                        .LINE     221
                        LDI       _ACCA, 03Fh
                        OUT       DDRB, _ACCA
                        .LINE     222
                        LDI       _ACCA, 03Fh
                        OUT       PORTC, _ACCA
                        .LINE     223
                        LDI       _ACCA, 000h
                        OUT       DDRC, _ACCA
                        .LINE     225
                        LDI       _ACCA, 05Ch
                        OUT       SPCR, _ACCA
                        .LINE     226
                        LDI       _ACCA, 000h
                        OUT       SPSR, _ACCA
                        .ENDBLOCK 227
NoisePlayer.InitPorts_X:
                        .LINE     227
                        .BRANCH   19
                        RET
                        .ENDFUNC  227


                        .FILE     NP_hwasm.pas
                        .FUNC     DF_sr, 00005h, 00020h
NoisePlayer.DF_sr:
                        .RETURNS   0
                        .BLOCK    7
                        .ASM
                        .LINE     9
                        lds    _ACCA, NoisePlayer.DF_send
                        .LINE     10
                        out    SPDR, _ACCA    ; SPI von FAT16-Treiber eingeschaltet!
                        DF_waitReg:
                        .LINE     12
                        in     _ACCA, SPSR    ; Flag hier über Akku - andere Adresse als mega8/16/32!
                        .LINE     13
                        sbrs   _ACCA, 7
                        .LINE     14
                        rjmp   DF_waitReg     ; auf Ende des SPI-Transfer warten
                        .LINE     15
                        in     _ACCA, SPDR
                        .LINE     16
                        sts    NoisePlayer.DF_receive, _ACCA  ; Lesewert zurück ins Datenbyte
                        .endasm
                        .ENDBLOCK 18
NoisePlayer.DF_sr_X:
                        .LINE     18
                        .BRANCH   19
                        RET
                        .ENDFUNC  18

                        .FUNC     DF_status, 00014h, 00020h
NoisePlayer.DF_status:
                        .RETURNS   1
                        .BLOCK    22
                        .LINE     23
                        CBI       00025h, 000h
                        .LINE     24
                        LDI       _ACCA, 005h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     25
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     26
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     27
                        SBI       00025h, 000h
                        .LINE     28
                        MOV       _ACCA, NoisePlayer.DF_receive
                        .ENDBLOCK 29
NoisePlayer.DF_status_X:
                        .LINE     29
                        .BRANCH   19
                        RET
                        .ENDFUNC  29

                        .FUNC     DF_busy, 0001Fh, 00020h
NoisePlayer.DF_busy:
                        .RETURNS   0
                        .BLOCK    33
                        .LINE     34
                        CBI       00025h, 000h
                        .LINE     35
                        LDI       _ACCA, 005h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     36
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

NoisePlayer._L0000:
                        .BLOCK    37
                        .LINE     38
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .ENDBLOCK 39
                        .LINE     39
NoisePlayer._L0001:
                        MOV       _ACCA, NoisePlayer.DF_receive
                        ANDI      _ACCA, 001h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0003
                        SER       _ACCA
NoisePlayer._L0003:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0004
                        BRNE      NoisePlayer._L0004
                        .BRANCH   20,NoisePlayer._L0000
                        JMP       NoisePlayer._L0000
NoisePlayer._L0004:
NoisePlayer._L0002:
                        .LINE     40
                        SBI       00025h, 000h
                        .ENDBLOCK 41
NoisePlayer.DF_busy_X:
                        .LINE     41
                        .BRANCH   19
                        RET
                        .ENDFUNC  41

                        .FUNC     DF_wen, 0002Bh, 00020h
NoisePlayer.DF_wen:
                        .RETURNS   0
                        .BLOCK    45
                        .LINE     46
                        CBI       00025h, 000h
                        .LINE     47
                        LDI       _ACCA, 006h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     48
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     49
                        SBI       00025h, 000h
                        .ENDBLOCK 50
NoisePlayer.DF_wen_X:
                        .LINE     50
                        .BRANCH   19
                        RET
                        .ENDFUNC  50

                        .FUNC     DF_unprotect, 00034h, 00020h
NoisePlayer.DF_unprotect:
                        .RETURNS   0
                        .BLOCK    54
                        .LINE     55
                        .BRANCH   17,NoisePlayer.DF_WEN
                        CALL      NoisePlayer.DF_WEN

                        .LINE     56
                        CBI       00025h, 000h
                        .LINE     57
                        LDI       _ACCA, 001h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     58
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     59
                        LDI       _ACCA, 000h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     60
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     61
                        SBI       00025h, 000h
                        .LINE     62
                        .BRANCH   17,NoisePlayer.DF_BUSY
                        CALL      NoisePlayer.DF_BUSY

                        .ENDBLOCK 63
NoisePlayer.DF_unprotect_X:
                        .LINE     63
                        .BRANCH   19
                        RET
                        .ENDFUNC  63

                        .FUNC     DF_protect, 00041h, 00020h
NoisePlayer.DF_protect:
                        .RETURNS   0
                        .BLOCK    67
                        .LINE     68
                        .BRANCH   17,NoisePlayer.DF_WEN
                        CALL      NoisePlayer.DF_WEN

                        .LINE     69
                        CBI       00025h, 000h
                        .LINE     70
                        LDI       _ACCA, 001h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     71
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     72
                        LDI       _ACCA, 03Fh
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     73
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     74
                        SBI       00025h, 000h
                        .LINE     75
                        .BRANCH   17,NoisePlayer.DF_BUSY
                        CALL      NoisePlayer.DF_BUSY

                        .ENDBLOCK 76
NoisePlayer.DF_protect_X:
                        .LINE     76
                        .BRANCH   19
                        RET
                        .ENDFUNC  76

                        .FUNC     DFeraseBlock, 0004Eh, 00020h
NoisePlayer.DFeraseBlock:
                        .RETURNS   1
                        .BLOCK    81
                        .LINE     82
                        .BRANCH   17,NoisePlayer.DF_WEN
                        CALL      NoisePlayer.DF_WEN

                        .LINE     83
                        CBI       00025h, 000h
                        .LINE     84
                        LDD       _ACCAHI, Y+003h
                        LDD       _ACCALO, Y+002h
                        LDD       _ACCA, Y+001h
                        LDD       _ACCB, Y+000h
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .LINE     88
                        LDI       _ACCA, 020h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     90
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     91
                        LDS       _ACCA, NoisePlayer.DF_long2
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     92
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     93
                        LDS       _ACCA, NoisePlayer.DF_long1
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     94
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     95
                        LDS       _ACCA, NoisePlayer.DF_long0
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     96
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     97
                        SBI       00025h, 000h
                        .LINE     98
                        .BRANCH   17,NoisePlayer.DF_BUSY
                        CALL      NoisePlayer.DF_BUSY

                        .LINE     99
                        MOV       _ACCA, NoisePlayer.DF_receive
                        ANDI      _ACCA, 020h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0005
                        SER       _ACCA
NoisePlayer._L0005:
                        CLT
                        TST       _ACCA
                        BREQ      NoisePlayer._L0006
                        SET
NoisePlayer._L0006:
                        LDS       _ACCA, 001B8h
                        BLD       _ACCA, 002h
                        STS       001B8h, _ACCA
                        .LINE     100
                        LDS       _ACCB, 001B8h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        COM       _ACCA
                        .ENDBLOCK 101
NoisePlayer.DFeraseBlock_X:
                        .LINE     101
                        .BRANCH   19
                        RET
                        .ENDFUNC  101

                        .FUNC     DF_erase, 00067h, 00020h
NoisePlayer.DF_erase:
                        .RETURNS   1
                        .BLOCK    106
                        .LINE     107
                        .BRANCH   17,NoisePlayer.DF_WEN
                        CALL      NoisePlayer.DF_WEN

                        .LINE     108
                        CBI       00025h, 000h
                        .LINE     109
                        LDI       _ACCA, 0C7h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     110
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     111
                        SBI       00025h, 000h
                        .LINE     112
                        .BRANCH   17,NoisePlayer.DF_BUSY
                        CALL      NoisePlayer.DF_BUSY

                        .LINE     113
                        MOV       _ACCA, NoisePlayer.DF_receive
                        ANDI      _ACCA, 020h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0008
                        SER       _ACCA
NoisePlayer._L0008:
                        CLT
                        TST       _ACCA
                        BREQ      NoisePlayer._L0009
                        SET
NoisePlayer._L0009:
                        LDS       _ACCA, 001B8h
                        BLD       _ACCA, 002h
                        STS       001B8h, _ACCA
                        .LINE     114
                        LDS       _ACCB, 001B8h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        COM       _ACCA
                        .ENDBLOCK 115
NoisePlayer.DF_erase_X:
                        .LINE     115
                        .BRANCH   19
                        RET
                        .ENDFUNC  115

                        .FUNC     DFwriteblock, 00075h, 00020h
NoisePlayer.DFwriteblock:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    121
                        .LINE     122
                        LDD       _ACCB, Y+001h
                        LDD       _ACCA, Y+002h
                        SUBI      _ACCB, 00001h AND 0FFh
                        SBCI      _ACCA, 00001h SHRB 8
                        MOV       _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     123
                        .BRANCH   17,NoisePlayer.DF_WEN
                        CALL      NoisePlayer.DF_WEN

                        .LINE     124
                        CBI       00025h, 000h
                        .LINE     125
                        LDD       _ACCAHI, Y+006h
                        LDD       _ACCALO, Y+005h
                        LDD       _ACCA, Y+004h
                        LDD       _ACCB, Y+003h
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .LINE     126
                        LDI       _ACCA, 002h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     127
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     128
                        LDS       _ACCA, NoisePlayer.DF_long2
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     129
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     130
                        LDS       _ACCA, NoisePlayer.DF_long1
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     131
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     132
                        LDS       _ACCA, NoisePlayer.DF_long0
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     133
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     134
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.h AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.h SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+002h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0013:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0014
                        CLR       _ACCA
NoisePlayer._L0014:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0015
                        BREQ      NoisePlayer._L0015
                        .BRANCH   20,NoisePlayer._L0012
                        JMP       NoisePlayer._L0012
NoisePlayer._L0015:
                        .BLOCK    135
                        .LINE     135
                        MOV       _ACCA, NoisePlayer.h
                        LDI       _ACCCLO, NoisePlayer.BlockTable AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.BlockTable SHRB 8
                        ANDI      _ACCA, 255
                        CLR       _ACCB
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        LD        _ACCA, Z
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     136
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .ENDBLOCK 137
NoisePlayer._L0011:
                        .LINE     137
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0012
                        BREQ      NoisePlayer._L0012
                        .BRANCH   20,NoisePlayer._L0013
                        JMP       NoisePlayer._L0013
NoisePlayer._L0012:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     138
                        SBI       00025h, 000h
                        .LINE     139
                        .BRANCH   17,NoisePlayer.DF_BUSY
                        CALL      NoisePlayer.DF_BUSY

                        .LINE     140
                        MOV       _ACCA, NoisePlayer.DF_receive
                        ANDI      _ACCA, 020h
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0016
                        SER       _ACCA
NoisePlayer._L0016:
                        CLT
                        TST       _ACCA
                        BREQ      NoisePlayer._L0017
                        SET
NoisePlayer._L0017:
                        LDS       _ACCA, 001B8h
                        BLD       _ACCA, 002h
                        STS       001B8h, _ACCA
                        .LINE     141
                        LDS       _ACCB, 001B8h
                        CLR       _ACCA
                        SBRC      _ACCB, 002h
                        SER       _ACCA
                        COM       _ACCA
                        .ENDBLOCK 142
NoisePlayer.DFwriteblock_X:
                        .LINE     142
                        .BRANCH   19
                        RET
                        .ENDFUNC  142

                        .FUNC     DFreadblock, 00090h, 00020h
NoisePlayer.DFreadblock:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    147
                        .LINE     148
                        .BRANCH   17,NoisePlayer.DF_BUSY
                        CALL      NoisePlayer.DF_BUSY

                        .LINE     149
                        LDD       _ACCB, Y+002h
                        LDD       _ACCA, Y+003h
                        SUBI      _ACCB, 00001h AND 0FFh
                        SBCI      _ACCA, 00001h SHRB 8
                        MOV       _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     150
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .LINE     151
                        CBI       00025h, 000h
                        .LINE     152
                        LDI       _ACCA, 00Bh
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     153
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     154
                        LDS       _ACCA, NoisePlayer.DF_long2
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     155
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     156
                        LDS       _ACCA, NoisePlayer.DF_long1
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     157
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     158
                        LDS       _ACCA, NoisePlayer.DF_long0
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     159
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     160
                        LDI       _ACCA, 000h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     161
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     162
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.h AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.h SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+002h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0021:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0022
                        CLR       _ACCA
NoisePlayer._L0022:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0023
                        BREQ      NoisePlayer._L0023
                        .BRANCH   20,NoisePlayer._L0020
                        JMP       NoisePlayer._L0020
NoisePlayer._L0023:
                        .BLOCK    163
                        .LINE     163
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     164
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0026
                        BRNE      NoisePlayer._L0026
                        .BRANCH   20,NoisePlayer._L0024
                        JMP       NoisePlayer._L0024
NoisePlayer._L0026:
                        .BLOCK    164
                        .LINE     165
                        MOV       _ACCA, NoisePlayer.h
                        PUSH      _ACCA
                        MOV       _ACCA, NoisePlayer.DF_receive
                        LDI       _ACCCLO, NoisePlayer.VerifyTable AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.VerifyTable SHRB 8
                        POP       _ACCBLO
                        ANDI      _ACCBLO, 255
                        CLR       _ACCBHI
                        ADD       _ACCCLO, _ACCBLO
                        ADC       _ACCCHI, _ACCBHI
                        ST        Z, _ACCA
                        .ENDBLOCK 166
                        .BRANCH   20,NoisePlayer._L0025
                        JMP       NoisePlayer._L0025
NoisePlayer._L0024:
                        .BLOCK    166
                        .LINE     167
                        MOV       _ACCA, NoisePlayer.h
                        PUSH      _ACCA
                        MOV       _ACCA, NoisePlayer.DF_receive
                        LDI       _ACCCLO, NoisePlayer.BlockTable AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.BlockTable SHRB 8
                        POP       _ACCBLO
                        ANDI      _ACCBLO, 255
                        CLR       _ACCBHI
                        ADD       _ACCCLO, _ACCBLO
                        ADC       _ACCCHI, _ACCBHI
                        ST        Z, _ACCA
                        .ENDBLOCK 168
NoisePlayer._L0025:
                        .ENDBLOCK 169
NoisePlayer._L0019:
                        .LINE     169
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0020
                        BREQ      NoisePlayer._L0020
                        .BRANCH   20,NoisePlayer._L0021
                        JMP       NoisePlayer._L0021
NoisePlayer._L0020:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     170
                        SBI       00025h, 000h
                        .ENDBLOCK 171
NoisePlayer.DFreadblock_X:
                        .LINE     171
                        .BRANCH   19
                        RET
                        .ENDFUNC  171

                        .FUNC     DFsetReadAddr, 000ADh, 00020h
NoisePlayer.DFsetReadAddr:
                        .RETURNS   0
                        .BLOCK    175
                        .LINE     176
                        SBI       00025h, 000h
                        .LINE     177
                        NOP
                        .LINE     178
                        CBI       00025h, 000h
                        .LINE     179
                        LDI       _ACCA, 003h
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     180
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     181
                        LDS       _ACCA, NoisePlayer.DF_long2
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     182
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     183
                        LDS       _ACCA, NoisePlayer.DF_long1
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     184
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .LINE     185
                        LDS       _ACCA, NoisePlayer.DF_long0
                        MOV       NOISEPLAYER.DF_SEND, _ACCA
                        .LINE     186
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .ENDBLOCK 187
NoisePlayer.DFsetReadAddr_X:
                        .LINE     187
                        .BRANCH   19
                        RET
                        .ENDFUNC  187


                        .FILE     E:\DROPBOX\NOISEPLAYER\AVR\NoisePlayer.pas

                        .FILE     NP_com.pas
                        .FUNC     SerCRLF, 00008h, 00020h
NoisePlayer.SerCRLF:
                        .RETURNS   0
                        .BLOCK    9
                        .LINE     10
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     11
                        LDI       _ACCA, 00Ah
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .ENDBLOCK 12
NoisePlayer.SerCRLF_X:
                        .LINE     12
                        .BRANCH   19
                        RET
                        .ENDFUNC  12

                        .FUNC     WriteChPrefix, 0000Fh, 00020h
NoisePlayer.WriteChPrefix:
                        .RETURNS   0
                        .BLOCK    16
                        .LINE     17
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String2 AND 0FFh
                        LDI       _ACCCHI, $St_String2 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0027:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     18
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDS       _ACCB, NoisePlayer.SubCh
                        LDS       _ACCA, NoisePlayer.SubCh+1
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  7
                        SET
                        BLD       Flags, _DEVICE
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags2, _F64StrInt
                        BLD       Flags2, _F64StrFrac
                        CALL      SYSTEM.Int2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     19
                        LDI       _ACCA, 03Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .ENDBLOCK 20
NoisePlayer.WriteChPrefix_X:
                        .LINE     20
                        .BRANCH   19
                        RET
                        .ENDFUNC  20

                        .FUNC     WriteSerInp, 00016h, 00020h
NoisePlayer.WriteSerInp:
                        .RETURNS   0
                        .BLOCK    23
                        .LINE     24
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     25
                        .BRANCH   17,NoisePlayer.SERCRLF
                        CALL      NoisePlayer.SERCRLF

                        .ENDBLOCK 26
NoisePlayer.WriteSerInp_X:
                        .LINE     26
                        .BRANCH   19
                        RET
                        .ENDFUNC  26

                        .FUNC     SerPrompt, 0001Ch, 00020h
NoisePlayer.SerPrompt:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    32
                        .LINE     33
                        LDI       _ACCA, 000FFh SHRB 8
                        LDI       _ACCB, 000FFh AND 0FFh
                        STS       NOISEPLAYER.SUBCH, _ACCB
                        STS       NOISEPLAYER.SUBCH+1, _ACCA
                        .LINE     34
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     35
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCA, Y+004h
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  6
                        SET
                        BLD       Flags, _DEVICE
                        CALL      SYSTEM.Byte2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     36
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     37
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.ErrStrArr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ErrStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+004h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 00009h AND 0FFh
                        LDI       _ACCBHI, 00009h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0028:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     38
                        .BRANCH   17,NoisePlayer.SERCRLF
                        CALL      NoisePlayer.SERCRLF

                        .ENDBLOCK 39
NoisePlayer.SerPrompt_X:
                        .LINE     39
                        .BRANCH   19
                        RET
                        .ENDFUNC  39

                        .FUNC     WriteParamStrSer, 0002Dh, 00020h
NoisePlayer.WriteParamStrSer:
                        .RETURNS   0
                        .BLOCK    46
                        .LINE     47
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     48
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     49
                        .BRANCH   17,NoisePlayer.SERCRLF
                        CALL      NoisePlayer.SERCRLF

                        .ENDBLOCK 50
NoisePlayer.WriteParamStrSer_X:
                        .LINE     50
                        .BRANCH   19
                        RET
                        .ENDFUNC  50

                        .FUNC     WriteParamLongSer, 00034h, 00020h
NoisePlayer.WriteParamLongSer:
                        .RETURNS   0
                        .BLOCK    53
                        .LINE     54
                        LDS       _ACCA, NoisePlayer.BinaryMode
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0031
                        BRNE      NoisePlayer._L0031
                        .BRANCH   20,NoisePlayer._L0029
                        JMP       NoisePlayer._L0029
NoisePlayer._L0031:
                        .BLOCK    54
                        .LINE     55
                        LDI       _ACCA, 006h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     56
                        LDI       _ACCA, 000h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     57
                        LDS       _ACCB, NoisePlayer.ParamInt
                        LDS       _ACCA, NoisePlayer.ParamInt+1
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     58
                        LDS       _ACCB, NoisePlayer.ParamInt
                        LDS       _ACCA, NoisePlayer.ParamInt+1
                        MOV       _ACCA, _ACCB
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .ENDBLOCK 59
                        .BRANCH   20,NoisePlayer._L0030
                        JMP       NoisePlayer._L0030
NoisePlayer._L0029:
                        .BLOCK    59
                        .LINE     60
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  10
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags2, _F64StrInt
                        BLD       Flags2, _F64StrFrac
                        BLD       Flags, _Negative
                        CALL      SYSTEM.Long2Str
                        .FRAME  3
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     61
                        .BRANCH   17,NoisePlayer.WRITEPARAMSTRSER
                        CALL      NoisePlayer.WRITEPARAMSTRSER

                        .ENDBLOCK 62
NoisePlayer._L0030:
                        .ENDBLOCK 63
NoisePlayer.WriteParamLongSer_X:
                        .LINE     63
                        .BRANCH   19
                        RET
                        .ENDFUNC  63

                        .FUNC     WriteParamIntSer, 00041h, 00020h
NoisePlayer.WriteParamIntSer:
                        .RETURNS   0
                        .BLOCK    66
                        .LINE     67
                        LDS       _ACCB, NoisePlayer.ParamInt
                        LDS       _ACCA, NoisePlayer.ParamInt+1
                        SBRS      _ACCA, 7
                        RJMP      NoisePlayer._L0032
                        LDI       _ACCAHI, 0FFh
                        LDI       _ACCALO, 0FFh
                        RJMP      NoisePlayer._L0033
NoisePlayer._L0032:
                        CLR       _ACCAHI
                        CLR       _ACCALO
NoisePlayer._L0033:
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     68
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSER
                        CALL      NoisePlayer.WRITEPARAMLONGSER

                        .ENDBLOCK 69
NoisePlayer.WriteParamIntSer_X:
                        .LINE     69
                        .BRANCH   19
                        RET
                        .ENDFUNC  69

                        .FUNC     WriteParamByteSer, 00047h, 00020h
NoisePlayer.WriteParamByteSer:
                        .RETURNS   0
                        .BLOCK    72
                        .LINE     73
                        LDS       _ACCA, NoisePlayer.Parambyte
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        STS       NOISEPLAYER.PARAMINT, _ACCB
                        STS       NOISEPLAYER.PARAMINT+1, _ACCA
                        .LINE     74
                        .BRANCH   17,NoisePlayer.WRITEPARAMINTSER
                        CALL      NoisePlayer.WRITEPARAMINTSER

                        .ENDBLOCK 75
NoisePlayer.WriteParamByteSer_X:
                        .LINE     75
                        .BRANCH   19
                        RET
                        .ENDFUNC  75

                        .FUNC     WriteParamLongSerHex, 0004Dh, 00020h
NoisePlayer.WriteParamLongSerHex:
                        .RETURNS   0
                        .BLOCK    78
                        .LINE     79
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     80
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  7
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  10
                        SET
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags2, _F64StrInt
                        BLD       Flags2, _F64StrFrac
                        BLD       Flags, _Negative
                        CALL      SYSTEM.Long2Str
                        .FRAME  3
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     81
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     82
                        LDI       _ACCA, 020h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     83
                        LDI       _ACCA, 05Bh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     84
                        LDI       _ACCA, 024h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     85
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        MOVW      _ACCELO, _ACCB
                        MOVW      _ACCFLO, _ACCALO
                        MOV       _ACCDLO, _ACCFHI
                        CALL      SYSTEM.Hex2Str8
                        MOV       _ACCDLO, _ACCFLO
                        CALL      SYSTEM.Hex2Str8
                        MOV       _ACCDLO, _ACCEHI
                        CALL      SYSTEM.Hex2Str8
                        MOV       _ACCDLO, _ACCELO
                        CALL      SYSTEM.Hex2Str8
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     86
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     87
                        LDI       _ACCA, 05Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     88
                        .BRANCH   17,NoisePlayer.SERCRLF
                        CALL      NoisePlayer.SERCRLF

                        .ENDBLOCK 89
NoisePlayer.WriteParamLongSerHex_X:
                        .LINE     89
                        .BRANCH   19
                        RET
                        .ENDFUNC  89

                        .FUNC     XModemRxToDF, 0006Eh, 00020h
NoisePlayer.XModemRxToDF:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 20
                        .BLOCK    119
                        .LINE     120
NoisePlayer._L0035:
                        LDI       _ACCCLO, _RXINP AND 0FFh
                        LDI       _ACCCHI, _RXINP SHRB 8
                        CLR       _ACCA
                        CLI
                        ST        Z+, _ACCA
                        ST        Z+, _ACCA
                        ST        Z, _ACCA
                        SBRC      Flags, IntFlag
                        SEI

                        .LINE     121
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     123
                        LDI       _ACCA, 000h
                        STD       Y+013h, _ACCA
                        .LINE     124
                        LDI       _ACCA, 000h
                        STD       Y+010h, _ACCA
                        .LINE     125
                        LDI       _ACCA, 0FFh
                        STD       Y+00Fh, _ACCA
                        .LINE     126
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       NOISEPLAYER.BYTECOUNT, _ACCB
                        STS       NOISEPLAYER.BYTECOUNT+1, _ACCA
                        STS       NOISEPLAYER.BYTECOUNT+2, _ACCALO
                        STS       NOISEPLAYER.BYTECOUNT+3, _ACCAHI
                        .LINE     127
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STD       Y+00Bh, _ACCA
                        STD       Y+00Ah, _ACCB
                        .LINE     128
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STD       Y+001h, _ACCA
                        STD       Y+000h, _ACCB
                        .LINE     129
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STD       Y+003h, _ACCA
                        STD       Y+002h, _ACCB
                        .LINE     130
                        LDD       _ACCAHI, Y+017h
                        LDD       _ACCALO, Y+016h
                        LDD       _ACCA, Y+015h
                        LDD       _ACCB, Y+014h
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
NoisePlayer._L0040:
                        .BLOCK    131
                        .LINE     132
                        LDD       _ACCA, Y+009h
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0045
                        BRNE      NoisePlayer._L0045
                        .BRANCH   20,NoisePlayer._L0043
                        JMP       NoisePlayer._L0043
NoisePlayer._L0045:
                        .BLOCK    132
                        .LINE     133
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STD       Y+00Bh, _ACCA
                        STD       Y+00Ah, _ACCB
NoisePlayer._L0046:
                        .BLOCK    134
                        .LINE     135
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000013h
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 032h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STD       Y+009h, _ACCA
                        .LINE     136
                        LDD       _ACCA, Y+009h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0051
                        BRNE      NoisePlayer._L0051
                        .BRANCH   20,NoisePlayer._L0049
                        JMP       NoisePlayer._L0049
NoisePlayer._L0051:
                        .BLOCK    136
                        .LINE     137
                        LDD       _ACCA, Y+013h
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0052
                        SER       _ACCA
NoisePlayer._L0052:
                        PUSH      _ACCA
                        LDD       _ACCA, Y+013h
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0053
                        SER       _ACCA
NoisePlayer._L0053:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0056
                        BRNE      NoisePlayer._L0056
                        .BRANCH   20,NoisePlayer._L0054
                        JMP       NoisePlayer._L0054
NoisePlayer._L0056:
                        .BLOCK    137
                        .LINE     138
                        LDI       _ACCA, 00015h SHRB 8
                        LDI       _ACCB, 00015h AND 0FFh
                        STD       Y+00Bh, _ACCA
                        STD       Y+00Ah, _ACCB
                        .ENDBLOCK 139
NoisePlayer._L0054:
NoisePlayer._L0055:
                        .ENDBLOCK 140
                        .BRANCH   20,NoisePlayer._L0050
                        JMP       NoisePlayer._L0050
NoisePlayer._L0049:
                        .BLOCK    140
                        .LINE     141
                        LDI       _ACCA, 015h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     142
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 00000Ah
                        LD        _ACCBLO, Z
                        LDD       _ACCBHI, Z+1
                        ADIW      _ACCBLO, 1
                        ST        Z, _ACCBLO
                        STD       Z+1, _ACCBHI
                        .ENDBLOCK 143
NoisePlayer._L0050:
                        .ENDBLOCK 144
                        .LINE     144
NoisePlayer._L0047:
                        LDD       _ACCB, Y+00Ah
                        LDD       _ACCA, Y+00Bh
                        CPI       _ACCA, 000h
                        BRNE      NoisePlayer._L0057
                        CPI       _ACCB, 014h
NoisePlayer._L0057:
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0058
                        BRLO      NoisePlayer._L0058
                        SER       _ACCA
NoisePlayer._L0058:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0059
                        BRNE      NoisePlayer._L0059
                        .BRANCH   20,NoisePlayer._L0046
                        JMP       NoisePlayer._L0046
NoisePlayer._L0059:
NoisePlayer._L0048:
                        .ENDBLOCK 145
NoisePlayer._L0043:
NoisePlayer._L0044:
                        .LINE     146
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STD       Y+00Bh, _ACCA
                        STD       Y+00Ah, _ACCB
                        .LINE     147
                        LDD       _ACCA, Y+013h
                        CPI       _ACCA, 001h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0060
                        SER       _ACCA
NoisePlayer._L0060:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0063
                        BRNE      NoisePlayer._L0063
                        .BRANCH   20,NoisePlayer._L0061
                        JMP       NoisePlayer._L0061
NoisePlayer._L0063:
                        .BLOCK    148
                        .LINE     148
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000012h
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 064h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STD       Y+008h, _ACCA
                        .LINE     149
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000011h
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 032h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STD       Y+008h, _ACCA
                        .LINE     150
                        LDD       _ACCA, Y+012h
                        LDI       _ACCB, 0FFh AND 0FFh
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+011h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0064
                        SER       _ACCA
NoisePlayer._L0064:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0067
                        BRNE      NoisePlayer._L0067
                        .BRANCH   20,NoisePlayer._L0065
                        JMP       NoisePlayer._L0065
NoisePlayer._L0067:
                        .BLOCK    151
                        .LINE     151
                        LDI       _ACCA, 000h
                        STD       Y+010h, _ACCA
                        .LINE     152
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.i AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 07Fh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0070:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0071
                        CLR       _ACCA
NoisePlayer._L0071:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0072
                        BREQ      NoisePlayer._L0072
                        .BRANCH   20,NoisePlayer._L0069
                        JMP       NoisePlayer._L0069
NoisePlayer._L0072:
                        .BLOCK    153
                        .LINE     153
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCCLO, NoisePlayer.m AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.m SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  5
                        LDI       _ACCA, 032h
                        ST        -Y, _ACCA
                        .FRAME  6
                        .FRAME  3
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STD       Y+00Bh, _ACCA
                        .LINE     154
                        LDD       _ACCA, Y+013h
                        PUSH      _ACCA
                        MOV       _ACCA, NoisePlayer.m
                        POP       _ACCB
                        ADD       _ACCA, _ACCB
                        STD       Y+013h, _ACCA
                        .LINE     155
                        MOV       _ACCA, NoisePlayer.i
                        PUSH      _ACCA
                        MOV       _ACCA, NoisePlayer.m
                        LDI       _ACCCLO, NoisePlayer.BlockTable AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.BlockTable SHRB 8
                        POP       _ACCBLO
                        ANDI      _ACCBLO, 255
                        CLR       _ACCBHI
                        ADD       _ACCCLO, _ACCBLO
                        ADC       _ACCCHI, _ACCBHI
                        ST        Z, _ACCA
                        .ENDBLOCK 156
NoisePlayer._L0068:
                        .LINE     156
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0069
                        BREQ      NoisePlayer._L0069
                        .BRANCH   20,NoisePlayer._L0070
                        JMP       NoisePlayer._L0070
NoisePlayer._L0069:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     157
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 00000Fh
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 032h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STD       Y+008h, _ACCA
                        .LINE     160
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 00080h SHRB 8
                        LDI       _ACCB, 00080h AND 0FFh
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  6
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.DFWRITEBLOCK
                        CALL       NoisePlayer.DFWRITEBLOCK
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0075
                        BRNE      NoisePlayer._L0075
                        .BRANCH   20,NoisePlayer._L0073
                        JMP       NoisePlayer._L0073
NoisePlayer._L0075:
                        .BLOCK    161
                        .LINE     161
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000002h
                        LD        _ACCBLO, Z
                        LDD       _ACCBHI, Z+1
                        ADIW      _ACCBLO, 1
                        ST        Z, _ACCBLO
                        STD       Z+1, _ACCBHI
                        .ENDBLOCK 162
NoisePlayer._L0073:
NoisePlayer._L0074:
                        .LINE     165
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 00080h SHRB 8
                        LDI       _ACCB, 00080h AND 0FFh
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  6
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  7
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.DFREADBLOCK
                        CALL      NoisePlayer.DFREADBLOCK
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     166
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.i AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 07Fh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0078:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0079
                        CLR       _ACCA
NoisePlayer._L0079:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0080
                        BREQ      NoisePlayer._L0080
                        .BRANCH   20,NoisePlayer._L0077
                        JMP       NoisePlayer._L0077
NoisePlayer._L0080:
                        .BLOCK    167
                        .LINE     167
                        MOV       _ACCA, NoisePlayer.i
                        LDI       _ACCCLO, NoisePlayer.VerifyTable AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.VerifyTable SHRB 8
                        ANDI      _ACCA, 255
                        CLR       _ACCB
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        LD        _ACCA, Z
                        PUSH      _ACCA
                        MOV       _ACCA, NoisePlayer.i
                        LDI       _ACCCLO, NoisePlayer.BlockTable AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.BlockTable SHRB 8
                        ANDI      _ACCA, 255
                        CLR       _ACCB
                        ADD       _ACCCLO, _ACCA
                        ADC       _ACCCHI, _ACCB
                        LD        _ACCA, Z
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0081
                        SER       _ACCA
NoisePlayer._L0081:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0084
                        BRNE      NoisePlayer._L0084
                        .BRANCH   20,NoisePlayer._L0082
                        JMP       NoisePlayer._L0082
NoisePlayer._L0084:
                        .BLOCK    167
                        .LINE     168
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000003h
                        LD        _ACCBLO, Z
                        LDD       _ACCBHI, Z+1
                        ADIW      _ACCBLO, 1
                        ST        Z, _ACCBLO
                        STD       Z+1, _ACCBHI
                        .ENDBLOCK 169
NoisePlayer._L0082:
NoisePlayer._L0083:
                        .ENDBLOCK 170
NoisePlayer._L0076:
                        .LINE     170
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0077
                        BREQ      NoisePlayer._L0077
                        .BRANCH   20,NoisePlayer._L0078
                        JMP       NoisePlayer._L0078
NoisePlayer._L0077:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     172
                        LDD       _ACCAHI, Y+007h
                        LDD       _ACCALO, Y+006h
                        LDD       _ACCA, Y+005h
                        LDD       _ACCB, Y+004h
                        SUBI      _ACCB, -000000080h AND 0FFh
                        SBCI      _ACCA, -000000080h SHRB 8
                        SBCI      _ACCALO, -000000080h SHRB 16
                        SBCI      _ACCAHI, -000000080h SHRB 24
                        STD       Y+007h, _ACCAHI
                        STD       Y+006h, _ACCALO
                        STD       Y+005h, _ACCA
                        STD       Y+004h, _ACCB
                        .LINE     173
                        LDS       _ACCB, NoisePlayer.byteCount
                        LDS       _ACCA, NoisePlayer.byteCount+1
                        LDS       _ACCALO, NoisePlayer.byteCount+2
                        LDS       _ACCAHI, NoisePlayer.byteCount+3
                        SUBI      _ACCB, -000000080h AND 0FFh
                        SBCI      _ACCA, -000000080h SHRB 8
                        SBCI      _ACCALO, -000000080h SHRB 16
                        SBCI      _ACCAHI, -000000080h SHRB 24
                        STS       NOISEPLAYER.BYTECOUNT, _ACCB
                        STS       NOISEPLAYER.BYTECOUNT+1, _ACCA
                        STS       NOISEPLAYER.BYTECOUNT+2, _ACCALO
                        STS       NOISEPLAYER.BYTECOUNT+3, _ACCAHI
                        .LINE     176
                        LDD       _ACCA, Y+010h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+00Fh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0085
                        SER       _ACCA
NoisePlayer._L0085:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0088
                        BRNE      NoisePlayer._L0088
                        .BRANCH   20,NoisePlayer._L0086
                        JMP       NoisePlayer._L0086
NoisePlayer._L0088:
                        .BLOCK    176
                        .LINE     177
                        LDI       _ACCA, 006h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .ENDBLOCK 178
                        .BRANCH   20,NoisePlayer._L0087
                        JMP       NoisePlayer._L0087
NoisePlayer._L0086:
                        .BLOCK    178
                        .LINE     179
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 00000Ah
                        LD        _ACCBLO, Z
                        LDD       _ACCBHI, Z+1
                        ADIW      _ACCBLO, 1
                        ST        Z, _ACCBLO
                        STD       Z+1, _ACCBHI
                        .LINE     180
                        LDI       _ACCA, 015h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .ENDBLOCK 181
NoisePlayer._L0087:
                        .ENDBLOCK 182
NoisePlayer._L0065:
NoisePlayer._L0066:
                        .LINE     183
                        LDI       _ACCA, 000h
                        STD       Y+013h, _ACCA
                        .ENDBLOCK 184
NoisePlayer._L0061:
NoisePlayer._L0062:
                        .LINE     185
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .ENDBLOCK 186
                        .LINE     186
NoisePlayer._L0041:
                        LDD       _ACCA, Y+013h
                        CPI       _ACCA, 004h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0089
                        SER       _ACCA
NoisePlayer._L0089:
                        PUSH      _ACCA
                        LDD       _ACCB, Y+00Ah
                        LDD       _ACCA, Y+00Bh
                        CPI       _ACCA, 000h
                        BRNE      NoisePlayer._L0090
                        CPI       _ACCB, 005h
NoisePlayer._L0090:
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0091
                        BRLO      NoisePlayer._L0091
                        SER       _ACCA
NoisePlayer._L0091:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0092
                        BRNE      NoisePlayer._L0092
                        .BRANCH   20,NoisePlayer._L0040
                        JMP       NoisePlayer._L0040
NoisePlayer._L0092:
NoisePlayer._L0042:
                        .LINE     187
                        LDI       _ACCA, 00Dh
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     188
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      _ACCCLO, 000013h
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 032h
                        ST        -Y, _ACCA
                        .FRAME  3
                        .FRAME  0
                        CALL       SYSTEM.SERINP_TO
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STD       Y+008h, _ACCA
                        .LINE     189
                        LDI       _ACCA, 006h
                        .FRAME  0
                        CALL      SYSTEM.SEROUT

                        .LINE     190
                        LDS       _ACCB, NoisePlayer.byteCount
                        LDS       _ACCA, NoisePlayer.byteCount+1
                        LDS       _ACCALO, NoisePlayer.byteCount+2
                        LDS       _ACCAHI, NoisePlayer.byteCount+3
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     191
                        LDD       _ACCB, Y+00Ah
                        LDD       _ACCA, Y+00Bh
                        CPI       _ACCA, 000h
                        BRNE      NoisePlayer._L0093
                        CPI       _ACCB, 005h
NoisePlayer._L0093:
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0094
                        BRLO      NoisePlayer._L0094
                        SER       _ACCA
NoisePlayer._L0094:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0097
                        BRNE      NoisePlayer._L0097
                        .BRANCH   20,NoisePlayer._L0095
                        JMP       NoisePlayer._L0095
NoisePlayer._L0097:
                        .BLOCK    191
                        .LINE     192
                        LDI       _ACCB, 0FFFFFFFFh AND 0FFh
                        LDI       _ACCA, 0FFFFFFFFh SHRB 8
                        LDI       _ACCALO, 0FFFFFFFFh SHRB 16
                        LDI       _ACCAHI, 0FFFFFFFFh SHRB 24
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     193
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     194
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String3 AND 0FFh
                        LDI       _ACCCHI, $St_String3 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0098:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 195
NoisePlayer._L0095:
NoisePlayer._L0096:
                        .LINE     196
                        LDD       _ACCA, Y+00Fh
                        PUSH      _ACCA
                        LDD       _ACCA, Y+010h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0099
                        SER       _ACCA
NoisePlayer._L0099:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0102
                        BRNE      NoisePlayer._L0102
                        .BRANCH   20,NoisePlayer._L0100
                        JMP       NoisePlayer._L0100
NoisePlayer._L0102:
                        .BLOCK    196
                        .LINE     197
                        LDI       _ACCB, 0FFFFFFFFh AND 0FFh
                        LDI       _ACCA, 0FFFFFFFFh SHRB 8
                        LDI       _ACCALO, 0FFFFFFFFh SHRB 16
                        LDI       _ACCAHI, 0FFFFFFFFh SHRB 24
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     198
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     199
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String4 AND 0FFh
                        LDI       _ACCCHI, $St_String4 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0103:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 200
NoisePlayer._L0100:
NoisePlayer._L0101:
                        .LINE     201
                        LDD       _ACCB, Y+000h
                        LDD       _ACCA, Y+001h
                        CPI       _ACCA, 000h
                        BRNE      NoisePlayer._L0104
                        CPI       _ACCB, 000h
NoisePlayer._L0104:
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0105
                        SER       _ACCA
NoisePlayer._L0105:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0108
                        BRNE      NoisePlayer._L0108
                        .BRANCH   20,NoisePlayer._L0106
                        JMP       NoisePlayer._L0106
NoisePlayer._L0108:
                        .BLOCK    201
                        .LINE     202
                        LDI       _ACCB, 0FFFFFFFFh AND 0FFh
                        LDI       _ACCA, 0FFFFFFFFh SHRB 8
                        LDI       _ACCALO, 0FFFFFFFFh SHRB 16
                        LDI       _ACCAHI, 0FFFFFFFFh SHRB 24
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     203
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     204
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String5 AND 0FFh
                        LDI       _ACCCHI, $St_String5 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0109:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     205
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCB, Y+002h
                        LDD       _ACCA, Y+003h
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  7
                        SET
                        BLD       Flags, _DEVICE
                        CLT
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags2, _F64StrInt
                        BLD       Flags2, _F64StrFrac
                        CALL      SYSTEM.Int2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     206
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String6 AND 0FFh
                        LDI       _ACCCHI, $St_String6 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0110:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 207
NoisePlayer._L0106:
NoisePlayer._L0107:
                        .LINE     208
                        LDD       _ACCB, Y+002h
                        LDD       _ACCA, Y+003h
                        CPI       _ACCA, 000h
                        BRNE      NoisePlayer._L0111
                        CPI       _ACCB, 000h
NoisePlayer._L0111:
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0112
                        SER       _ACCA
NoisePlayer._L0112:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0115
                        BRNE      NoisePlayer._L0115
                        .BRANCH   20,NoisePlayer._L0113
                        JMP       NoisePlayer._L0113
NoisePlayer._L0115:
                        .BLOCK    208
                        .LINE     209
                        LDI       _ACCB, 0FFFFFFFFh AND 0FFh
                        LDI       _ACCA, 0FFFFFFFFh SHRB 8
                        LDI       _ACCALO, 0FFFFFFFFh SHRB 16
                        LDI       _ACCAHI, 0FFFFFFFFh SHRB 24
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     210
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     211
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String7 AND 0FFh
                        LDI       _ACCCHI, $St_String7 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0116:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     212
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDD       _ACCB, Y+004h
                        LDD       _ACCA, Y+005h
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 020h
                        ST        -Y, _ACCA
                        .FRAME  7
                        SET
                        BLD       Flags, _DEVICE
                        CLT
                        BLD       Flags, _SIGN
                        CLT
                        BLD       Flags2, _F64StrInt
                        BLD       Flags2, _F64StrFrac
                        CALL      SYSTEM.Int2Str
                        .FRAME  2
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     213
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String6 AND 0FFh
                        LDI       _ACCCHI, $St_String6 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0117:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .ENDBLOCK 214
NoisePlayer._L0113:
NoisePlayer._L0114:
                        .ENDBLOCK 215
NoisePlayer.XModemRxToDF_X:
                        .LINE     215
                        .BRANCH   19
                        RET
                        .ENDFUNC  215


                        .FILE     E:\DROPBOX\NOISEPLAYER\AVR\NoisePlayer.pas
                        .FUNC     DF_checkprotected, 000E8h, 00020h
NoisePlayer.DF_checkprotected:
                        .RETURNS   1
                        .BLOCK    233
                        .LINE     234
                        .BRANCH   17,NoisePlayer.DF_STATUS
                        CALL       NoisePlayer.DF_STATUS

                        ANDI      _ACCA, 0EFh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0118
                        SER       _ACCA
NoisePlayer._L0118:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0121
                        BRNE      NoisePlayer._L0121
                        .BRANCH   20,NoisePlayer._L0119
                        JMP       NoisePlayer._L0119
NoisePlayer._L0121:
                        .BLOCK    234
                        .LINE     235
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     236
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.SerOut SHRB 1
                        LDI       _ACCA, SYSTEM.SerOut SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String8 AND 0FFh
                        LDI       _ACCCHI, $St_String8 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0122:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     237
                        LDI       _ACCA, 0FFh
                        .BRANCH   20,NoisePlayer.DF_checkprotected_X
                        JMP       NoisePlayer.DF_checkprotected_X
                        .ENDBLOCK 238
                        .BRANCH   20,NoisePlayer._L0120
                        JMP       NoisePlayer._L0120
NoisePlayer._L0119:
                        .BLOCK    238
                        .LINE     239
                        LDI       _ACCA, 000h
                        .BRANCH   20,NoisePlayer.DF_checkprotected_X
                        JMP       NoisePlayer.DF_checkprotected_X
                        .ENDBLOCK 240
NoisePlayer._L0120:
                        .ENDBLOCK 241
NoisePlayer.DF_checkprotected_X:
                        .LINE     241
                        .BRANCH   19
                        RET
                        .ENDFUNC  241


                        .FILE     NP_parser.pas
                        .FUNC     ParseGetParam, 00004h, 00020h
NoisePlayer.ParseGetParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    9
                        .LINE     10
                        LDS       _ACCB, NoisePlayer.SubCh
                        LDS       _ACCA, NoisePlayer.SubCh+1
                        MOVW      _ACCBLO, _ACCB
                        LDI       _ACCALO, 0000Ah AND 0FFh
                        LDI       _ACCAHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        MOVW      _ACCB, _ACCCLO
                        ANDI      _ACCDHI, 80h
                        BREQ      NoisePlayer._L0123
                        NEG       _ACCB
                        BRNE      NoisePlayer._L0124
                        DEC       _ACCA
NoisePlayer._L0124:
                        COM       _ACCA
NoisePlayer._L0123:
                        MOV       _ACCA, _ACCB
                        STD       Y+000h, _ACCA
                        .LINE     11
                        LDS       _ACCB, NoisePlayer.SubCh
                        LDS       _ACCA, NoisePlayer.SubCh+1
                        .LINE     12
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 0 AND 0FFh
                        LDI       _ACCBHI, 0 SHRB 8
                        SER       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0128
                        BRPL      NoisePlayer._L0128
                        LDI       _ACCBLO, 7 AND 0FFh
                        LDI       _ACCBHI, 7 SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0129
                        BRPL      NoisePlayer._L0129
NoisePlayer._L0128:
                        .BRANCH   20,NoisePlayer._L0127
                        RJMP      NoisePlayer._L0127
NoisePlayer._L0129:
NoisePlayer._L0126:
                        .BLOCK    13
                        .LINE     13
                        LDI       _ACCCLO, NoisePlayer.WaveStartArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveStartArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     14
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 15
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0127:
                        .LINE     16
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 10 AND 0FFh
                        LDI       _ACCBHI, 10 SHRB 8
                        SER       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0132
                        BRPL      NoisePlayer._L0132
                        LDI       _ACCBLO, 17 AND 0FFh
                        LDI       _ACCBHI, 17 SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0133
                        BRPL      NoisePlayer._L0133
NoisePlayer._L0132:
                        .BRANCH   20,NoisePlayer._L0131
                        RJMP      NoisePlayer._L0131
NoisePlayer._L0133:
NoisePlayer._L0130:
                        .BLOCK    17
                        .LINE     17
                        LDI       _ACCCLO, NoisePlayer.WaveLoopArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveLoopArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     18
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 19
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0131:
                        .LINE     20
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 20 AND 0FFh
                        LDI       _ACCBHI, 20 SHRB 8
                        SER       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0136
                        BRPL      NoisePlayer._L0136
                        LDI       _ACCBLO, 27 AND 0FFh
                        LDI       _ACCBHI, 27 SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0137
                        BRPL      NoisePlayer._L0137
NoisePlayer._L0136:
                        .BRANCH   20,NoisePlayer._L0135
                        RJMP      NoisePlayer._L0135
NoisePlayer._L0137:
NoisePlayer._L0134:
                        .BLOCK    21
                        .LINE     21
                        LDI       _ACCCLO, NoisePlayer.WaveEndArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveEndArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+000h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     22
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 23
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0135:
                        .LINE     24
                        CPI       _ACCA, 30 SHRB 8
                        .BRANCH   3,NoisePlayer._L0140
                        BREQ      NoisePlayer._L0140
                        .BRANCH   20,NoisePlayer._L0139
                        JMP       NoisePlayer._L0139
NoisePlayer._L0140:
                        CPI       _ACCB, 30 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0141
                        BREQ      NoisePlayer._L0141
                        .BRANCH   20,NoisePlayer._L0139
                        JMP       NoisePlayer._L0139
NoisePlayer._L0141:
NoisePlayer._L0138:
                        .BLOCK    25
                        .LINE     25
                        LDS       _ACCB, NoisePlayer.DF_long
                        LDS       _ACCA, NoisePlayer.DF_long+1
                        LDS       _ACCALO, NoisePlayer.DF_long+2
                        LDS       _ACCAHI, NoisePlayer.DF_long+3
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     26
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 27
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0139:
                        .LINE     28
                        CPI       _ACCA, 31 SHRB 8
                        .BRANCH   3,NoisePlayer._L0144
                        BREQ      NoisePlayer._L0144
                        .BRANCH   20,NoisePlayer._L0143
                        JMP       NoisePlayer._L0143
NoisePlayer._L0144:
                        CPI       _ACCB, 31 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0145
                        BREQ      NoisePlayer._L0145
                        .BRANCH   20,NoisePlayer._L0143
                        JMP       NoisePlayer._L0143
NoisePlayer._L0145:
NoisePlayer._L0142:
                        .BLOCK    29
                        .LINE     29
                        LDS       _ACCB, NoisePlayer.WaveLoop
                        LDS       _ACCA, NoisePlayer.WaveLoop+1
                        LDS       _ACCALO, NoisePlayer.WaveLoop+2
                        LDS       _ACCAHI, NoisePlayer.WaveLoop+3
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     30
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 31
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0143:
                        .LINE     32
                        CPI       _ACCA, 32 SHRB 8
                        .BRANCH   3,NoisePlayer._L0148
                        BREQ      NoisePlayer._L0148
                        .BRANCH   20,NoisePlayer._L0147
                        JMP       NoisePlayer._L0147
NoisePlayer._L0148:
                        CPI       _ACCB, 32 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0149
                        BREQ      NoisePlayer._L0149
                        .BRANCH   20,NoisePlayer._L0147
                        JMP       NoisePlayer._L0147
NoisePlayer._L0149:
NoisePlayer._L0146:
                        .BLOCK    33
                        .LINE     33
                        LDS       _ACCB, NoisePlayer.WaveEnd
                        LDS       _ACCA, NoisePlayer.WaveEnd+1
                        LDS       _ACCALO, NoisePlayer.WaveEnd+2
                        LDS       _ACCAHI, NoisePlayer.WaveEnd+3
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     34
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 35
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0147:
                        .LINE     36
                        CPI       _ACCA, 33 SHRB 8
                        .BRANCH   3,NoisePlayer._L0152
                        BREQ      NoisePlayer._L0152
                        .BRANCH   20,NoisePlayer._L0151
                        JMP       NoisePlayer._L0151
NoisePlayer._L0152:
                        CPI       _ACCB, 33 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0153
                        BREQ      NoisePlayer._L0153
                        .BRANCH   20,NoisePlayer._L0151
                        JMP       NoisePlayer._L0151
NoisePlayer._L0153:
NoisePlayer._L0150:
                        .BLOCK    37
                        .LINE     37
                        LDS       _ACCA, NoisePlayer.wavesel
                        STS       NOISEPLAYER.PARAMBYTE, _ACCA
                        .LINE     38
                        .BRANCH   17,NoisePlayer.WRITEPARAMBYTESER
                        CALL      NoisePlayer.WRITEPARAMBYTESER

                        .ENDBLOCK 39
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0151:
                        .LINE     40
                        CPI       _ACCA, 34 SHRB 8
                        .BRANCH   3,NoisePlayer._L0156
                        BREQ      NoisePlayer._L0156
                        .BRANCH   20,NoisePlayer._L0155
                        JMP       NoisePlayer._L0155
NoisePlayer._L0156:
                        CPI       _ACCB, 34 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0157
                        BREQ      NoisePlayer._L0157
                        .BRANCH   20,NoisePlayer._L0155
                        JMP       NoisePlayer._L0155
NoisePlayer._L0157:
NoisePlayer._L0154:
                        .BLOCK    41
                        .LINE     41
                        IN        _ACCA, PinC
                        STS       NOISEPLAYER.PARAMBYTE, _ACCA
                        .LINE     42
                        .BRANCH   17,NoisePlayer.WRITEPARAMBYTESER
                        CALL      NoisePlayer.WRITEPARAMBYTESER

                        .ENDBLOCK 43
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0155:
                        .LINE     44
                        CPI       _ACCA, 251 SHRB 8
                        .BRANCH   3,NoisePlayer._L0160
                        BREQ      NoisePlayer._L0160
                        .BRANCH   20,NoisePlayer._L0159
                        JMP       NoisePlayer._L0159
NoisePlayer._L0160:
                        CPI       _ACCB, 251 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0161
                        BREQ      NoisePlayer._L0161
                        .BRANCH   20,NoisePlayer._L0159
                        JMP       NoisePlayer._L0159
NoisePlayer._L0161:
NoisePlayer._L0158:
                        .BLOCK    45
                        .LINE     45
                        LDS       _ACCB, NoisePlayer.Errcount
                        LDS       _ACCA, NoisePlayer.Errcount+1
                        STS       NOISEPLAYER.PARAMINT, _ACCB
                        STS       NOISEPLAYER.PARAMINT+1, _ACCA
                        .LINE     46
                        .BRANCH   17,NoisePlayer.WRITEPARAMINTSER
                        CALL      NoisePlayer.WRITEPARAMINTSER

                        .ENDBLOCK 47
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0159:
                        .LINE     48
                        CPI       _ACCA, 253 SHRB 8
                        .BRANCH   3,NoisePlayer._L0164
                        BREQ      NoisePlayer._L0164
                        .BRANCH   20,NoisePlayer._L0163
                        JMP       NoisePlayer._L0163
NoisePlayer._L0164:
                        CPI       _ACCB, 253 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0165
                        BREQ      NoisePlayer._L0165
                        .BRANCH   20,NoisePlayer._L0163
                        JMP       NoisePlayer._L0163
NoisePlayer._L0165:
NoisePlayer._L0162:
                        .BLOCK    49
                        .LINE     49
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        CALL      SYSTEM.StrVar2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     50
                        .BRANCH   17,NoisePlayer.SERCRLF
                        CALL      NoisePlayer.SERCRLF

                        .LINE     51
                        .BRANCH   20,NoisePlayer.ParseGetParam_X
                        JMP       NoisePlayer.ParseGetParam_X
                        .ENDBLOCK 52
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0163:
                        .LINE     53
                        CPI       _ACCA, 254 SHRB 8
                        .BRANCH   3,NoisePlayer._L0168
                        BREQ      NoisePlayer._L0168
                        .BRANCH   20,NoisePlayer._L0167
                        JMP       NoisePlayer._L0167
NoisePlayer._L0168:
                        CPI       _ACCB, 254 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0169
                        BREQ      NoisePlayer._L0169
                        .BRANCH   20,NoisePlayer._L0167
                        JMP       NoisePlayer._L0167
NoisePlayer._L0169:
NoisePlayer._L0166:
                        .BLOCK    54
                        .LINE     54
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     55
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.Vers1Str AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0170:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     56
                        .BRANCH   17,NoisePlayer.SERCRLF
                        CALL      NoisePlayer.SERCRLF

                        .ENDBLOCK 57
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0167:
                        .LINE     58
                        CPI       _ACCA, 255 SHRB 8
                        .BRANCH   3,NoisePlayer._L0173
                        BREQ      NoisePlayer._L0173
                        .BRANCH   20,NoisePlayer._L0172
                        JMP       NoisePlayer._L0172
NoisePlayer._L0173:
                        CPI       _ACCB, 255 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0174
                        BREQ      NoisePlayer._L0174
                        .BRANCH   20,NoisePlayer._L0172
                        JMP       NoisePlayer._L0172
NoisePlayer._L0174:
NoisePlayer._L0171:
                        .BLOCK    59
                        .LINE     59
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 60
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0172:
                        .LINE     61
                        CPI       _ACCA, 9920 SHRB 8
                        .BRANCH   3,NoisePlayer._L0177
                        BREQ      NoisePlayer._L0177
                        .BRANCH   20,NoisePlayer._L0176
                        JMP       NoisePlayer._L0176
NoisePlayer._L0177:
                        CPI       _ACCB, 9920 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0178
                        BREQ      NoisePlayer._L0178
                        .BRANCH   20,NoisePlayer._L0176
                        JMP       NoisePlayer._L0176
NoisePlayer._L0178:
NoisePlayer._L0175:
                        .BLOCK    62
                        .LINE     62
                        .BRANCH   17,NoisePlayer.DF_STATUS
                        CALL       NoisePlayer.DF_STATUS

                        STS       NOISEPLAYER.PARAMBYTE, _ACCA
                        .LINE     63
                        .BRANCH   17,NoisePlayer.WRITEPARAMBYTESER
                        CALL      NoisePlayer.WRITEPARAMBYTESER

                        .ENDBLOCK 64
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0176:
                        .LINE     65
                        CPI       _ACCA, 9999 SHRB 8
                        .BRANCH   3,NoisePlayer._L0181
                        BREQ      NoisePlayer._L0181
                        .BRANCH   20,NoisePlayer._L0180
                        JMP       NoisePlayer._L0180
NoisePlayer._L0181:
                        CPI       _ACCB, 9999 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0182
                        BREQ      NoisePlayer._L0182
                        .BRANCH   20,NoisePlayer._L0180
                        JMP       NoisePlayer._L0180
NoisePlayer._L0182:
NoisePlayer._L0179:
                        .BLOCK    66
                        .LINE     66
                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        IN        _ACCB, mcusr
                        ANDI      _ACCB, 0F3h
                        OUT       mcusr, _ACCB
                        JMP       SYSTEM.Reset
                        .ENDBLOCK 67
                        .BRANCH   20,NoisePlayer._L0125
                        JMP       NoisePlayer._L0125
NoisePlayer._L0180:
                        .BLOCK    68
                        .LINE     69
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 70
NoisePlayer._L0125:
                        .ENDBLOCK 71
NoisePlayer.ParseGetParam_X:
                        .LINE     71
                        .BRANCH   19
                        RET
                        .ENDFUNC  71

                        .FUNC     ParseSetParam, 0004Ah, 00020h
NoisePlayer.ParseSetParam:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 3
                        .BLOCK    79
                        .LINE     80
                        LDS       _ACCB, NoisePlayer.SubCh
                        LDS       _ACCA, NoisePlayer.SubCh+1
                        MOVW      _ACCBLO, _ACCB
                        LDI       _ACCALO, 0000Ah AND 0FFh
                        LDI       _ACCAHI, 0000Ah SHRB 8
                        SET
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.DIV16_R
                        MOVW      _ACCB, _ACCCLO
                        ANDI      _ACCDHI, 80h
                        BREQ      NoisePlayer._L0183
                        NEG       _ACCB
                        BRNE      NoisePlayer._L0184
                        DEC       _ACCA
NoisePlayer._L0184:
                        COM       _ACCA
NoisePlayer._L0183:
                        MOV       _ACCA, _ACCB
                        STD       Y+001h, _ACCA
                        .LINE     81
                        LDS       _ACCB, NoisePlayer.SubCh
                        LDS       _ACCA, NoisePlayer.SubCh+1
                        .LINE     82
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 0 AND 0FFh
                        LDI       _ACCBHI, 0 SHRB 8
                        SER       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0188
                        BRPL      NoisePlayer._L0188
                        LDI       _ACCBLO, 7 AND 0FFh
                        LDI       _ACCBHI, 7 SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0189
                        BRPL      NoisePlayer._L0189
NoisePlayer._L0188:
                        .BRANCH   20,NoisePlayer._L0187
                        RJMP      NoisePlayer._L0187
NoisePlayer._L0189:
NoisePlayer._L0186:
                        .BLOCK    83
                        .LINE     83
                        LDI       _ACCCLO, NoisePlayer.WaveStartArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveStartArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     84
                        LDI       _ACCCLO, NoisePlayer.EEWaveStartArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.EEWaveStartArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     85
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .ENDBLOCK 86
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0187:
                        .LINE     87
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 10 AND 0FFh
                        LDI       _ACCBHI, 10 SHRB 8
                        SER       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0192
                        BRPL      NoisePlayer._L0192
                        LDI       _ACCBLO, 17 AND 0FFh
                        LDI       _ACCBHI, 17 SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0193
                        BRPL      NoisePlayer._L0193
NoisePlayer._L0192:
                        .BRANCH   20,NoisePlayer._L0191
                        RJMP      NoisePlayer._L0191
NoisePlayer._L0193:
NoisePlayer._L0190:
                        .BLOCK    88
                        .LINE     88
                        LDI       _ACCCLO, NoisePlayer.WaveLoopArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveLoopArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     89
                        LDI       _ACCCLO, NoisePlayer.EEWaveLoopArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.EEWaveLoopArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     90
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        STS       NOISEPLAYER.WAVELOOP, _ACCB
                        STS       NOISEPLAYER.WAVELOOP+1, _ACCA
                        STS       NOISEPLAYER.WAVELOOP+2, _ACCALO
                        STS       NOISEPLAYER.WAVELOOP+3, _ACCAHI
                        .LINE     91
                        LDS       _ACCB, NoisePlayer.WaveLoop
                        LDS       _ACCA, NoisePlayer.WaveLoop+1
                        LDS       _ACCALO, NoisePlayer.WaveLoop+2
                        LDS       _ACCAHI, NoisePlayer.WaveLoop+3
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .ENDBLOCK 92
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0191:
                        .LINE     93
                        SET
                        BLD       Flags, _NEGATIVE
                        LDI       _ACCBLO, 20 AND 0FFh
                        LDI       _ACCBHI, 20 SHRB 8
                        SER       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0196
                        BRPL      NoisePlayer._L0196
                        LDI       _ACCBLO, 27 AND 0FFh
                        LDI       _ACCBHI, 27 SHRB 8
                        CLR       _ACCDHI
                        CALL      SYSTEM.High16i
                        TST       _ACCDHI
                        .BRANCH   6,NoisePlayer._L0197
                        BRPL      NoisePlayer._L0197
NoisePlayer._L0196:
                        .BRANCH   20,NoisePlayer._L0195
                        RJMP      NoisePlayer._L0195
NoisePlayer._L0197:
NoisePlayer._L0194:
                        .BLOCK    94
                        .LINE     94
                        LDI       _ACCCLO, NoisePlayer.WaveEndArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveEndArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     95
                        LDI       _ACCCLO, NoisePlayer.EEWaveEndArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.EEWaveEndArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+001h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        POP       _ACCCHI
                        POP       _ACCCLO
                        MOVW      _ACCBLO, _ACCB
                        CALL      SYSTEM._WriteEEp32
                        .LINE     96
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        STS       NOISEPLAYER.WAVEEND, _ACCB
                        STS       NOISEPLAYER.WAVEEND+1, _ACCA
                        STS       NOISEPLAYER.WAVEEND+2, _ACCALO
                        STS       NOISEPLAYER.WAVEEND+3, _ACCAHI
                        .LINE     97
                        LDS       _ACCB, NoisePlayer.WaveEnd
                        LDS       _ACCA, NoisePlayer.WaveEnd+1
                        LDS       _ACCALO, NoisePlayer.WaveEnd+2
                        LDS       _ACCAHI, NoisePlayer.WaveEnd+3
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .ENDBLOCK 98
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0195:
                        .LINE     99
                        CPI       _ACCA, 9920 SHRB 8
                        .BRANCH   3,NoisePlayer._L0200
                        BREQ      NoisePlayer._L0200
                        .BRANCH   20,NoisePlayer._L0199
                        JMP       NoisePlayer._L0199
NoisePlayer._L0200:
                        CPI       _ACCB, 9920 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0201
                        BREQ      NoisePlayer._L0201
                        .BRANCH   20,NoisePlayer._L0199
                        JMP       NoisePlayer._L0199
NoisePlayer._L0201:
NoisePlayer._L0198:
                        .BLOCK    100
                        .LINE     100
                        LDS       _ACCA, NoisePlayer.ParamByte
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0202
                        SER       _ACCA
NoisePlayer._L0202:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0205
                        BRNE      NoisePlayer._L0205
                        .BRANCH   20,NoisePlayer._L0203
                        JMP       NoisePlayer._L0203
NoisePlayer._L0205:
                        .BLOCK    100
                        .LINE     101
                        .BRANCH   17,NoisePlayer.DF_UNPROTECT
                        CALL      NoisePlayer.DF_UNPROTECT

                        .ENDBLOCK 102
                        .BRANCH   20,NoisePlayer._L0204
                        JMP       NoisePlayer._L0204
NoisePlayer._L0203:
                        .BLOCK    102
                        .LINE     103
                        .BRANCH   17,NoisePlayer.DF_PROTECT
                        CALL      NoisePlayer.DF_PROTECT

                        .ENDBLOCK 104
NoisePlayer._L0204:
                        .ENDBLOCK 105
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0199:
                        .LINE     106
                        CPI       _ACCA, 9930 SHRB 8
                        .BRANCH   3,NoisePlayer._L0208
                        BREQ      NoisePlayer._L0208
                        .BRANCH   20,NoisePlayer._L0207
                        JMP       NoisePlayer._L0207
NoisePlayer._L0208:
                        CPI       _ACCB, 9930 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0209
                        BREQ      NoisePlayer._L0209
                        .BRANCH   20,NoisePlayer._L0207
                        JMP       NoisePlayer._L0207
NoisePlayer._L0209:
                        .BRANCH   20,NoisePlayer._L0206
                        JMP       NoisePlayer._L0206
NoisePlayer._L0207:
                        CPI       _ACCA, 9931 SHRB 8
                        .BRANCH   3,NoisePlayer._L0211
                        BREQ      NoisePlayer._L0211
                        .BRANCH   20,NoisePlayer._L0210
                        JMP       NoisePlayer._L0210
NoisePlayer._L0211:
                        CPI       _ACCB, 9931 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0212
                        BREQ      NoisePlayer._L0212
                        .BRANCH   20,NoisePlayer._L0210
                        JMP       NoisePlayer._L0210
NoisePlayer._L0212:
NoisePlayer._L0206:
                        .BLOCK    108
                        .LINE     108
                        .BRANCH   17,NoisePlayer.DF_CHECKPROTECTED
                        CALL       NoisePlayer.DF_CHECKPROTECTED

                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0215
                        BRNE      NoisePlayer._L0215
                        .BRANCH   20,NoisePlayer._L0213
                        JMP       NoisePlayer._L0213
NoisePlayer._L0215:
                        .BLOCK    108
                        .LINE     109
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        LDI       _ACCCLO, 00Ch
                        CALL      SYSTEM.SHL32
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     110
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.XMODEMRXTODF
                        CALL      NoisePlayer.XMODEMRXTODF
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     111
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        LDI       _ACCDLO, 080h
                        EOR       _ACCAHI, _ACCDLO
                        CPI       _ACCAHI, 080h
                        BRNE      NoisePlayer._L0216
                        CPI       _ACCALO, 000h
                        BRNE      NoisePlayer._L0216
                        CPI       _ACCA, 000h
                        BRNE      NoisePlayer._L0216
                        CPI       _ACCB, 000h
NoisePlayer._L0216:
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0217
                        CLR       _ACCA
NoisePlayer._L0217:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0220
                        BRNE      NoisePlayer._L0220
                        .BRANCH   20,NoisePlayer._L0218
                        JMP       NoisePlayer._L0218
NoisePlayer._L0220:
                        .BLOCK    111
                        .LINE     112
                        LDS       _ACCA, 001B8h
                        SBR       _ACCA, 004h
                        STS       001B8h, _ACCA
                        .ENDBLOCK 113
                        .BRANCH   20,NoisePlayer._L0219
                        JMP       NoisePlayer._L0219
NoisePlayer._L0218:
                        .BLOCK    113
                        .LINE     114
                        LDI       _ACCA, 00064h SHRB 8
                        LDI       _ACCB, 00064h AND 0FFh
                        .FRAME  0
                        CALL      SYSTEM.MDELAY

                        .LINE     115
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 116
NoisePlayer._L0219:
                        .ENDBLOCK 117
NoisePlayer._L0213:
NoisePlayer._L0214:
                        .ENDBLOCK 118
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0210:
                        .LINE     119
                        CPI       _ACCA, 9940 SHRB 8
                        .BRANCH   3,NoisePlayer._L0223
                        BREQ      NoisePlayer._L0223
                        .BRANCH   20,NoisePlayer._L0222
                        JMP       NoisePlayer._L0222
NoisePlayer._L0223:
                        CPI       _ACCB, 9940 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0224
                        BREQ      NoisePlayer._L0224
                        .BRANCH   20,NoisePlayer._L0222
                        JMP       NoisePlayer._L0222
NoisePlayer._L0224:
                        .BRANCH   20,NoisePlayer._L0221
                        JMP       NoisePlayer._L0221
NoisePlayer._L0222:
                        CPI       _ACCA, 9941 SHRB 8
                        .BRANCH   3,NoisePlayer._L0226
                        BREQ      NoisePlayer._L0226
                        .BRANCH   20,NoisePlayer._L0225
                        JMP       NoisePlayer._L0225
NoisePlayer._L0226:
                        CPI       _ACCB, 9941 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0227
                        BREQ      NoisePlayer._L0227
                        .BRANCH   20,NoisePlayer._L0225
                        JMP       NoisePlayer._L0225
NoisePlayer._L0227:
NoisePlayer._L0221:
                        .BLOCK    120
                        .LINE     120
                        .BRANCH   17,NoisePlayer.DF_CHECKPROTECTED
                        CALL       NoisePlayer.DF_CHECKPROTECTED

                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0230
                        BRNE      NoisePlayer._L0230
                        .BRANCH   20,NoisePlayer._L0228
                        JMP       NoisePlayer._L0228
NoisePlayer._L0230:
                        .BLOCK    120
                        .LINE     121
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        LDI       _ACCCLO, 00Ch
                        CALL      SYSTEM.SHL32
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     122
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        ST        -Y, _ACCAHI
                        ST        -Y, _ACCALO
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  4
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.DFERASEBLOCK
                        CALL       NoisePlayer.DFERASEBLOCK
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0233
                        BRNE      NoisePlayer._L0233
                        .BRANCH   20,NoisePlayer._L0231
                        JMP       NoisePlayer._L0231
NoisePlayer._L0233:
                        .BLOCK    122
                        .LINE     123
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     124
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.SerOut SHRB 1
                        LDI       _ACCA, SYSTEM.SerOut SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String9 AND 0FFh
                        LDI       _ACCCHI, $St_String9 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0234:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     125
                        .BRANCH   20,NoisePlayer.ParseSetParam_X
                        JMP       NoisePlayer.ParseSetParam_X
                        .ENDBLOCK 126
                        .BRANCH   20,NoisePlayer._L0232
                        JMP       NoisePlayer._L0232
NoisePlayer._L0231:
                        .BLOCK    126
                        .LINE     127
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 128
NoisePlayer._L0232:
                        .ENDBLOCK 129
NoisePlayer._L0228:
NoisePlayer._L0229:
                        .ENDBLOCK 130
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0225:
                        .LINE     131
                        CPI       _ACCA, 9942 SHRB 8
                        .BRANCH   3,NoisePlayer._L0237
                        BREQ      NoisePlayer._L0237
                        .BRANCH   20,NoisePlayer._L0236
                        JMP       NoisePlayer._L0236
NoisePlayer._L0237:
                        CPI       _ACCB, 9942 AND 0FFh
                        .BRANCH   3,NoisePlayer._L0238
                        BREQ      NoisePlayer._L0238
                        .BRANCH   20,NoisePlayer._L0236
                        JMP       NoisePlayer._L0236
NoisePlayer._L0238:
NoisePlayer._L0235:
                        .BLOCK    132
                        .LINE     132
                        .BRANCH   17,NoisePlayer.DF_CHECKPROTECTED
                        CALL       NoisePlayer.DF_CHECKPROTECTED

                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0241
                        BRNE      NoisePlayer._L0241
                        .BRANCH   20,NoisePlayer._L0239
                        JMP       NoisePlayer._L0239
NoisePlayer._L0241:
                        .BLOCK    132
                        .LINE     133
                        .BRANCH   17,NoisePlayer.DF_ERASE
                        CALL       NoisePlayer.DF_ERASE

                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0244
                        BRNE      NoisePlayer._L0244
                        .BRANCH   20,NoisePlayer._L0242
                        JMP       NoisePlayer._L0242
NoisePlayer._L0244:
                        .BLOCK    133
                        .LINE     134
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     135
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.SerOut SHRB 1
                        LDI       _ACCA, SYSTEM.SerOut SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, $St_String10 AND 0FFh
                        LDI       _ACCCHI, $St_String10 SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0245:
                        LDI       _ACCA, 00Dh
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 00Ah
                        CALL      SYSTEM.Char2Str
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     136
                        .BRANCH   20,NoisePlayer.ParseSetParam_X
                        JMP       NoisePlayer.ParseSetParam_X
                        .ENDBLOCK 137
                        .BRANCH   20,NoisePlayer._L0243
                        JMP       NoisePlayer._L0243
NoisePlayer._L0242:
                        .BLOCK    137
                        .LINE     138
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     139
                        .BRANCH   17,NoisePlayer.WRITEPARAMLONGSERHEX
                        CALL      NoisePlayer.WRITEPARAMLONGSERHEX

                        .ENDBLOCK 140
NoisePlayer._L0243:
                        .ENDBLOCK 141
NoisePlayer._L0239:
NoisePlayer._L0240:
                        .ENDBLOCK 142
                        .BRANCH   20,NoisePlayer._L0185
                        JMP       NoisePlayer._L0185
NoisePlayer._L0236:
                        .BLOCK    143
                        .LINE     144
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 005h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     145
                        .BRANCH   20,NoisePlayer.ParseSetParam_X
                        JMP       NoisePlayer.ParseSetParam_X
                        .ENDBLOCK 146
NoisePlayer._L0185:
                        .LINE     147
                        LDS       _ACCA, 001B7h
                        CBR       _ACCA, 010h
                        STS       001B7h, _ACCA
                        .LINE     148
                        LDS       _ACCB, NoisePlayer.SubCh
                        LDS       _ACCA, NoisePlayer.SubCh+1
                        LDI       _ACCBLO, 080h
                        EOR       _ACCA, _ACCBLO
                        CPI       _ACCA, 080h
                        BRNE      NoisePlayer._L0246
                        CPI       _ACCB, 0FAh
NoisePlayer._L0246:
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0247
                        SER       _ACCA
NoisePlayer._L0247:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0250
                        BRNE      NoisePlayer._L0250
                        .BRANCH   20,NoisePlayer._L0248
                        JMP       NoisePlayer._L0248
NoisePlayer._L0250:
                        .BLOCK    149
                        .LINE     149
                        LDS       _ACCA, 001B7h
                        SBR       _ACCA, 010h
                        STS       001B7h, _ACCA
                        .ENDBLOCK 150
NoisePlayer._L0248:
NoisePlayer._L0249:
                        .LINE     151
                        LDS       _ACCA, NoisePlayer.verbose
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0253
                        BRNE      NoisePlayer._L0253
                        .BRANCH   20,NoisePlayer._L0251
                        JMP       NoisePlayer._L0251
NoisePlayer._L0253:
                        .BLOCK    151
                        .LINE     152
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 153
NoisePlayer._L0251:
NoisePlayer._L0252:
                        .ENDBLOCK 154
NoisePlayer.ParseSetParam_X:
                        .LINE     154
                        .BRANCH   19
                        RET
                        .ENDFUNC  154

                        .FUNC     Cmd2Index, 000A2h, 00020h
NoisePlayer.Cmd2Index:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    165
                        .LINE     166
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        CALL      SYSTEM.UpperCaseStr
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     167
                        .LOOP
                        MOVW      _ACCCLO, _FRAMEPTR
                        .LOOP_B
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 00Eh
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0256:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0257
                        CLR       _ACCA
NoisePlayer._L0257:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0258
                        BREQ      NoisePlayer._L0258
                        .BRANCH   20,NoisePlayer._L0255
                        JMP       NoisePlayer._L0255
NoisePlayer._L0258:
                        .BLOCK    168
                        .LINE     168
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.CmdStrArr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.CmdStrArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+003h
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LDI       _ACCBLO, 00004h AND 0FFh
                        LDI       _ACCBHI, 00004h SHRB 8
                        CLT
                        BLD       Flags, _SIGN
                        CALL      SYSTEM.MUL16
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0259
                        SER       _ACCA
NoisePlayer._L0259:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0262
                        BRNE      NoisePlayer._L0262
                        .BRANCH   20,NoisePlayer._L0260
                        JMP       NoisePlayer._L0260
NoisePlayer._L0262:
                        .BLOCK    168
                        .LINE     169
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,NoisePlayer.Cmd2Index_X
                        JMP       NoisePlayer.Cmd2Index_X
                        .ENDBLOCK 170
NoisePlayer._L0260:
NoisePlayer._L0261:
                        .ENDBLOCK 171
NoisePlayer._L0254:
                        .LINE     171
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0255
                        BREQ      NoisePlayer._L0255
                        .BRANCH   20,NoisePlayer._L0256
                        JMP       NoisePlayer._L0256
NoisePlayer._L0255:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     172
                        LDI       _ACCA, 00Fh
                        .ENDBLOCK 173
NoisePlayer.Cmd2Index_X:
                        .LINE     173
                        .BRANCH   19
                        RET
                        .ENDFUNC  173

                        .FUNC     ParseExtract, 000AFh, 00020h
NoisePlayer.ParseExtract:
                        .RETURNS   1
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    180
                        .LINE     181
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     182
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.PARAMALPHA, _ACCA
                        .LINE     183
                        LDI       _ACCA, 000h
                        STD       Y+000h, _ACCA
                        .LINE     184
NoisePlayer._L0263:
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        LDS       _ACCA, NoisePlayer.ParsePtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 020h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0265
                        SER       _ACCA
NoisePlayer._L0265:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0266
                        BRNE      NoisePlayer._L0266
                        .BRANCH   20,NoisePlayer._L0264
                        JMP       NoisePlayer._L0264
NoisePlayer._L0266:
                        .BLOCK    185
                        .LINE     185
                        LDS       _ACCA, NoisePlayer.ParsePtr
                        INC       _ACCA
                        STS       NoisePlayer.ParsePtr, _ACCA
                        .ENDBLOCK 186
                        .LINE     186
                        .BRANCH   20,NoisePlayer._L0263
                        JMP       NoisePlayer._L0263
NoisePlayer._L0264:
                        .LINE     187
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        LDS       _ACCA, NoisePlayer.ParsePtr
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        CPI       _ACCA, 039h
                        .BRANCH   3,NoisePlayer._L0267
                        BREQ      NoisePlayer._L0267
                        .BRANCH   1,NoisePlayer._L0268
                        BRSH      NoisePlayer._L0268
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,NoisePlayer._L0268
                        BRLO      NoisePlayer._L0268
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,NoisePlayer._L0267
                        RJMP      NoisePlayer._L0267
NoisePlayer._L0268:
                        LDI       _ACCDLO, 001h
NoisePlayer._L0267:
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0269
                        SER       _ACCA
NoisePlayer._L0269:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0272
                        BRNE      NoisePlayer._L0272
                        .BRANCH   20,NoisePlayer._L0270
                        JMP       NoisePlayer._L0270
NoisePlayer._L0272:
                        .BLOCK    188
                        .LINE     188
                        LDI       _ACCA, 0FFh
                        STD       Y+000h, _ACCA
                        .LINE     189
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.i AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, NoisePlayer.ParsePtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0275:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0276
                        CLR       _ACCA
NoisePlayer._L0276:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0277
                        BREQ      NoisePlayer._L0277
                        .BRANCH   20,NoisePlayer._L0274
                        JMP       NoisePlayer._L0274
NoisePlayer._L0277:
                        .BLOCK    190
                        .LINE     190
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     191
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 039h
                        .BRANCH   3,NoisePlayer._L0278
                        BREQ      NoisePlayer._L0278
                        .BRANCH   1,NoisePlayer._L0279
                        BRSH      NoisePlayer._L0279
                        CPI       _ACCA, 02Ah
                        .BRANCH   1,NoisePlayer._L0279
                        BRLO      NoisePlayer._L0279
                        LDI       _ACCDLO, 0
                        SEZ
                        .BRANCH   20,NoisePlayer._L0278
                        RJMP      NoisePlayer._L0278
NoisePlayer._L0279:
                        LDI       _ACCDLO, 001h
NoisePlayer._L0278:
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0280
                        SER       _ACCA
NoisePlayer._L0280:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0283
                        BRNE      NoisePlayer._L0283
                        .BRANCH   20,NoisePlayer._L0281
                        JMP       NoisePlayer._L0281
NoisePlayer._L0283:
                        .BLOCK    191
                        .LINE     192
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 194
                        .BRANCH   20,NoisePlayer._L0282
                        JMP       NoisePlayer._L0282
NoisePlayer._L0281:
                        .BLOCK    194
                        .LINE     194
                        MOV       _ACCA, NoisePlayer.i
                        STS       NOISEPLAYER.PARSEPTR, _ACCA
                        .LINE     195
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,NoisePlayer.ParseExtract_X
                        JMP       NoisePlayer.ParseExtract_X
                        .ENDBLOCK 196
NoisePlayer._L0282:
                        .ENDBLOCK 197
NoisePlayer._L0273:
                        .LINE     197
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0274
                        BREQ      NoisePlayer._L0274
                        .BRANCH   20,NoisePlayer._L0275
                        JMP       NoisePlayer._L0275
NoisePlayer._L0274:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 198
                        .BRANCH   20,NoisePlayer._L0271
                        JMP       NoisePlayer._L0271
NoisePlayer._L0270:
                        .BLOCK    198
                        .LINE     199
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.i AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDS       _ACCA, NoisePlayer.ParsePtr
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0286:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0287
                        CLR       _ACCA
NoisePlayer._L0287:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0288
                        BREQ      NoisePlayer._L0288
                        .BRANCH   20,NoisePlayer._L0285
                        JMP       NoisePlayer._L0285
NoisePlayer._L0288:
                        .BLOCK    200
                        .LINE     200
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+004h, _ACCA
                        .LINE     201
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 022h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0289
                        SER       _ACCA
NoisePlayer._L0289:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0292
                        BRNE      NoisePlayer._L0292
                        .BRANCH   20,NoisePlayer._L0290
                        JMP       NoisePlayer._L0290
NoisePlayer._L0292:
                        .BLOCK    201
                        .LINE     202
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.PARAMALPHA, _ACCA
                        .ENDBLOCK 203
                        .BRANCH   20,NoisePlayer._L0291
                        JMP       NoisePlayer._L0291
NoisePlayer._L0290:
                        .BLOCK    203
                        .LINE     204
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 041h
                        LDI       _ACCA, 0
                        BRLO      NoisePlayer._L0293
                        LDI       _ACCA, 0FFh
NoisePlayer._L0293:
                        PUSH      _ACCA
                        LDS       _ACCA, NoisePlayer.ParamAlpha
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0296
                        BRNE      NoisePlayer._L0296
                        .BRANCH   20,NoisePlayer._L0294
                        JMP       NoisePlayer._L0294
NoisePlayer._L0296:
                        .BLOCK    204
                        .LINE     205
                        LDD       _ACCA, Y+004h
                        CPI       _ACCA, 021h
                        .BRANCH   3,NoisePlayer._L0297
                        BREQ      NoisePlayer._L0297
                        CPI       _ACCA, 03Fh
                        .BRANCH   3,NoisePlayer._L0297
                        BREQ      NoisePlayer._L0297
                        CPI       _ACCA, 024h
                        .BRANCH   3,NoisePlayer._L0297
                        BREQ      NoisePlayer._L0297
NoisePlayer._L0297:
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0298
                        SER       _ACCA
NoisePlayer._L0298:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0301
                        BRNE      NoisePlayer._L0301
                        .BRANCH   20,NoisePlayer._L0299
                        JMP       NoisePlayer._L0299
NoisePlayer._L0301:
                        .BLOCK    205
                        .LINE     206
                        MOV       _ACCA, NoisePlayer.i
                        STS       NOISEPLAYER.PARSEPTR, _ACCA
                        .LINE     207
                        LDD       _ACCA, Y+003h
                        ADIW      _FRAMEPTR, 3
                        .BRANCH   20,NoisePlayer.ParseExtract_X
                        JMP       NoisePlayer.ParseExtract_X
                        .ENDBLOCK 208
                        .BRANCH   20,NoisePlayer._L0300
                        JMP       NoisePlayer._L0300
NoisePlayer._L0299:
                        .BLOCK    208
                        .LINE     209
                        LDD       _ACCA, Y+004h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 210
NoisePlayer._L0300:
                        .LINE     211
                        LDD       _ACCA, Y+005h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0304
                        BRNE      NoisePlayer._L0304
                        .BRANCH   20,NoisePlayer._L0302
                        JMP       NoisePlayer._L0302
NoisePlayer._L0304:
                        .BLOCK    211
                        .LINE     212
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.PARAMALPHA, _ACCA
                        .ENDBLOCK 213
NoisePlayer._L0302:
NoisePlayer._L0303:
                        .ENDBLOCK 215
                        .BRANCH   20,NoisePlayer._L0295
                        JMP       NoisePlayer._L0295
NoisePlayer._L0294:
                        .BLOCK    215
                        .LINE     215
                        MOV       _ACCA, NoisePlayer.i
                        STS       NOISEPLAYER.PARSEPTR, _ACCA
                        .LINE     216
                        LDD       _ACCA, Y+003h
                        .BRANCH   20,NoisePlayer.ParseExtract_X
                        JMP       NoisePlayer.ParseExtract_X
                        .ENDBLOCK 217
NoisePlayer._L0295:
                        .ENDBLOCK 218
NoisePlayer._L0291:
                        .ENDBLOCK 219
NoisePlayer._L0284:
                        .LINE     219
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0285
                        BREQ      NoisePlayer._L0285
                        .BRANCH   20,NoisePlayer._L0286
                        JMP       NoisePlayer._L0286
NoisePlayer._L0285:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .ENDBLOCK 220
NoisePlayer._L0271:
                        .LINE     221
                        LDD       _ACCA, Y+000h
                        .ENDBLOCK 222
NoisePlayer.ParseExtract_X:
                        .LINE     222
                        .BRANCH   19
                        RET
                        .ENDFUNC  222

                        .FUNC     ParamStr2Param, 000E0h, 00020h
NoisePlayer.ParamStr2Param:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 1
                        .BLOCK    226
                        .LINE     227
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     228
                        LDS       _ACCB, NoisePlayer.ParamLong
                        LDS       _ACCA, NoisePlayer.ParamLong+1
                        LDS       _ACCALO, NoisePlayer.ParamLong+2
                        LDS       _ACCAHI, NoisePlayer.ParamLong+3
                        STS       NOISEPLAYER.PARAMINT, _ACCB
                        STS       NOISEPLAYER.PARAMINT+1, _ACCA
                        .LINE     229
                        LDS       _ACCB, NoisePlayer.ParamInt
                        LDS       _ACCA, NoisePlayer.ParamInt+1
                        MOV       _ACCA, _ACCB
                        STS       NOISEPLAYER.PARAMBYTE, _ACCA
                        .ENDBLOCK 230
NoisePlayer.ParamStr2Param_X:
                        .LINE     230
                        .BRANCH   19
                        RET
                        .ENDFUNC  230

                        .FUNC     ParseSubCh, 000E9h, 00020h
NoisePlayer.ParseSubCh:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 12
                        .BLOCK    244
                        .LINE     245
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, $St_String11 AND 0FFh
                        LDI       _ACCCHI, $St_String11 SHRB 8
                        POP       _ACCBHI
                        POP       _ACCBLO
                        SET
                        BLD       Flags, _STRCONST
                        CALL      SYSTEM.StringComp
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0305
                        SER       _ACCA
NoisePlayer._L0305:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0308
                        BRNE      NoisePlayer._L0308
                        .BRANCH   20,NoisePlayer._L0306
                        JMP       NoisePlayer._L0306
NoisePlayer._L0308:
                        .BLOCK    245
                        .LINE     246
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     247
                        .BRANCH   20,NoisePlayer.ParseSubCh_X
                        JMP       NoisePlayer.ParseSubCh_X
                        .ENDBLOCK 248
NoisePlayer._L0306:
NoisePlayer._L0307:
                        .LINE     249
                        LDI       _ACCA, 021h
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0309
                        BRLO      NoisePlayer._L0309
                        SER       _ACCA
NoisePlayer._L0309:
                        STS       NOISEPLAYER.VERBOSE, _ACCA
                        .LINE     250
                        LDI       _ACCA, 03Ah
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0310
                        BRLO      NoisePlayer._L0310
                        SER       _ACCA
NoisePlayer._L0310:
                        STD       Y+004h, _ACCA
                        .LINE     251
                        LDI       _ACCA, 03Dh
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Bh, _ACCA
                        .LINE     252
                        LDD       _ACCA, Y+00Bh
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0311
                        SER       _ACCA
NoisePlayer._L0311:
                        STD       Y+000h, _ACCA
                        .LINE     253
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        ADIW      _ACCCLO, 00001h
                        LD        _ACCA, Z+
                        STD       Y+005h, _ACCA
                        .LINE     254
                        LDD       _ACCA, Y+005h
                        CPI       _ACCA, 02Ah
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0312
                        SER       _ACCA
NoisePlayer._L0312:
                        STD       Y+001h, _ACCA
                        .LINE     255
                        LDD       _ACCA, Y+005h
                        CPI       _ACCA, 023h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0313
                        SER       _ACCA
NoisePlayer._L0313:
                        STD       Y+002h, _ACCA
                        .LINE     256
                        LDI       _ACCA, 001h
                        STS       NOISEPLAYER.PARSEPTR, _ACCA
                        .LINE     257
                        LDD       _ACCA, Y+002h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0316
                        BRNE      NoisePlayer._L0316
                        .BRANCH   20,NoisePlayer._L0314
                        JMP       NoisePlayer._L0314
NoisePlayer._L0316:
                        .BLOCK    257
                        .LINE     258
                        LDI       _ACCA, 002h
                        STS       NOISEPLAYER.PARSEPTR, _ACCA
                        .ENDBLOCK 259
NoisePlayer._L0314:
NoisePlayer._L0315:
                        .LINE     260
                        LDD       _ACCA, Y+004h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0319
                        BRNE      NoisePlayer._L0319
                        .BRANCH   20,NoisePlayer._L0317
                        JMP       NoisePlayer._L0317
NoisePlayer._L0319:
                        .BLOCK    260
                        .LINE     261
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.PARSEEXTRACT
                        CALL       NoisePlayer.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     262
                        LDS       _ACCA, NoisePlayer.ParsePtr
                        INC       _ACCA
                        STS       NoisePlayer.ParsePtr, _ACCA
                        .LINE     263
                        LDD       _ACCA, Y+001h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0322
                        BRNE      NoisePlayer._L0322
                        .BRANCH   20,NoisePlayer._L0320
                        JMP       NoisePlayer._L0320
NoisePlayer._L0322:
                        .BLOCK    264
                        .LINE     264
                        .BRANCH   17,NoisePlayer.WRITESERINP
                        CALL      NoisePlayer.WRITESERINP

                        .ENDBLOCK 265
                        .BRANCH   20,NoisePlayer._L0321
                        JMP       NoisePlayer._L0321
NoisePlayer._L0320:
                        .BLOCK    265
                        .LINE     266
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STS       NOISEPLAYER.CURRENTCH, _ACCA
                        .ENDBLOCK 267
NoisePlayer._L0321:
                        .ENDBLOCK 268
NoisePlayer._L0317:
NoisePlayer._L0318:
                        .LINE     269
                        LDD       _ACCA, Y+001h
                        COM       _ACCA
                        PUSH      _ACCA
                        LDS       _ACCA, NoisePlayer.CurrentCh
                        PUSH      _ACCA
                        LDS       _ACCA, NoisePlayer.MainCh
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0323
                        SER       _ACCA
NoisePlayer._L0323:
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        PUSH      _ACCA
                        LDD       _ACCA, Y+004h
                        POP       _ACCB
                        AND       _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0326
                        BRNE      NoisePlayer._L0326
                        .BRANCH   20,NoisePlayer._L0324
                        JMP       NoisePlayer._L0324
NoisePlayer._L0326:
                        .BLOCK    270
                        .LINE     270
                        .BRANCH   17,NoisePlayer.WRITESERINP
                        CALL      NoisePlayer.WRITESERINP

                        .LINE     271
                        .BRANCH   20,NoisePlayer.ParseSubCh_X
                        JMP       NoisePlayer.ParseSubCh_X
                        .ENDBLOCK 272
NoisePlayer._L0324:
NoisePlayer._L0325:
                        .LINE     276
                        LDI       _ACCA, 024h
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCELO, 001h
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCB
                        CALL      SYSTEM.PosChInVarStr
                        STD       Y+00Ah, _ACCA
                        .LINE     277
                        LDD       _ACCA, Y+00Ah
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0327
                        BRLO      NoisePlayer._L0327
                        SER       _ACCA
NoisePlayer._L0327:
                        STD       Y+003h, _ACCA
                        .LINE     279
                        LDD       _ACCA, Y+003h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0330
                        BRNE      NoisePlayer._L0330
                        .BRANCH   20,NoisePlayer._L0328
                        JMP       NoisePlayer._L0328
NoisePlayer._L0330:
                        .BLOCK    279
                        .LINE     280
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 028h
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+00Dh
                        SUBI      _ACCA, -001h AND 0FFh
                        PUSH      _ACCA
                        LDI       _ACCA, 002h
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CALL      SYSTEM.StrCopyV
                        LDI       _ACCA, 028h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .LINE     281
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 0FFh
                        CALL      SYSTEM.Str2Int
                        MOV       _ACCA, _ACCB
                        STD       Y+008h, _ACCA
                        .LINE     282
                        LDI       _ACCA, 000h
                        STD       Y+009h, _ACCA
                        .LINE     283
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.i AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 001h
                        ST        Z, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDD       _ACCA, Y+00Ch
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0333:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0334
                        CLR       _ACCA
NoisePlayer._L0334:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0335
                        BREQ      NoisePlayer._L0335
                        .BRANCH   20,NoisePlayer._L0332
                        JMP       NoisePlayer._L0332
NoisePlayer._L0335:
                        .BLOCK    284
                        .LINE     284
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z+
                        STD       Y+008h, _ACCA
                        .LINE     285
                        LDD       _ACCA, Y+00Ch
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        EOR       _ACCA, _ACCB
                        STD       Y+00Ch, _ACCA
                        .ENDBLOCK 286
NoisePlayer._L0331:
                        .LINE     286
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0332
                        BREQ      NoisePlayer._L0332
                        .BRANCH   20,NoisePlayer._L0333
                        JMP       NoisePlayer._L0333
NoisePlayer._L0332:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     287
                        LDD       _ACCA, Y+009h
                        PUSH      _ACCA
                        LDD       _ACCA, Y+008h
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0336
                        SER       _ACCA
NoisePlayer._L0336:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0339
                        BRNE      NoisePlayer._L0339
                        .BRANCH   20,NoisePlayer._L0337
                        JMP       NoisePlayer._L0337
NoisePlayer._L0339:
                        .BLOCK    287
                        .LINE     288
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     289
                        .BRANCH   20,NoisePlayer.ParseSubCh_X
                        JMP       NoisePlayer.ParseSubCh_X
                        .ENDBLOCK 290
NoisePlayer._L0337:
NoisePlayer._L0338:
                        .ENDBLOCK 291
NoisePlayer._L0328:
NoisePlayer._L0329:
                        .LINE     295
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.PARSEEXTRACT
                        CALL       NoisePlayer.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0342
                        BRNE      NoisePlayer._L0342
                        .BRANCH   20,NoisePlayer._L0340
                        JMP       NoisePlayer._L0340
NoisePlayer._L0342:
                        .BLOCK    295
                        .LINE     296
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .ENDBLOCK 297
                        .BRANCH   20,NoisePlayer._L0341
                        JMP       NoisePlayer._L0341
NoisePlayer._L0340:
                        .BLOCK    297
                        .LINE     298
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,NoisePlayer.CMD2INDEX
                        CALL       NoisePlayer.CMD2INDEX
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        STS       NOISEPLAYER.CMDWHICH, _ACCA
                        .LINE     299
                        LDS       _ACCA, NoisePlayer.CmdWhich
                        CPI       _ACCA, 00Fh
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0343
                        SER       _ACCA
NoisePlayer._L0343:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0346
                        BRNE      NoisePlayer._L0346
                        .BRANCH   20,NoisePlayer._L0344
                        JMP       NoisePlayer._L0344
NoisePlayer._L0346:
                        .BLOCK    299
                        .LINE     300
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 004h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.SERPROMPT
                        CALL      NoisePlayer.SERPROMPT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     301
                        .BRANCH   20,NoisePlayer.ParseSubCh_X
                        JMP       NoisePlayer.ParseSubCh_X
                        .ENDBLOCK 302
NoisePlayer._L0344:
NoisePlayer._L0345:
                        .LINE     303
                        LDI       _ACCCLO, NoisePlayer.Cmd2SubChArr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.Cmd2SubChArr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, NoisePlayer.CmdWhich
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LPM       _ACCB, Z+
                        LPM       _ACCA, Z
                        STD       Y+007h, _ACCA
                        STD       Y+006h, _ACCB
                        .LINE     304
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 000h
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.PARSEEXTRACT
                        CALL       NoisePlayer.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 305
NoisePlayer._L0341:
                        .LINE     306
                        LDI       _ACCCLO, NoisePlayer.ParamStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.ParamStr SHRB 8
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        CLT
                        BLD       Flags, _ERRFLAG
                        LDI       _ACCB, 000h
                        CALL      SYSTEM.Str2Int
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDD       _ACCB, Y+006h
                        LDD       _ACCA, Y+007h
                        POP       _ACCAHI
                        POP       _ACCALO
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        STS       NOISEPLAYER.SUBCH, _ACCB
                        STS       NOISEPLAYER.SUBCH+1, _ACCA
                        .LINE     307
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0349
                        BRNE      NoisePlayer._L0349
                        .BRANCH   20,NoisePlayer._L0347
                        JMP       NoisePlayer._L0347
NoisePlayer._L0349:
                        .BLOCK    307
                        .LINE     308
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,NoisePlayer.PARSEGETPARAM
                        CALL      NoisePlayer.PARSEGETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 309
                        .BRANCH   20,NoisePlayer._L0348
                        JMP       NoisePlayer._L0348
NoisePlayer._L0347:
                        .BLOCK    309
                        .LINE     310
                        LDD       _ACCA, Y+00Bh
                        SUBI      _ACCA, -001h AND 0FFh
                        STS       NOISEPLAYER.PARSEPTR, _ACCA
                        .LINE     311
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 0FFh
                        ST        -Y, _ACCA
                        .FRAME  1
                        .FRAME  0
                        .BRANCH   17,NoisePlayer.PARSEEXTRACT
                        CALL       NoisePlayer.PARSEEXTRACT
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0352
                        BRNE      NoisePlayer._L0352
                        .BRANCH   20,NoisePlayer._L0350
                        JMP       NoisePlayer._L0350
NoisePlayer._L0352:
                        .BLOCK    311
                        .LINE     312
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,NoisePlayer.PARAMSTR2PARAM
                        CALL      NoisePlayer.PARAMSTR2PARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 313
                        .BRANCH   20,NoisePlayer._L0351
                        JMP       NoisePlayer._L0351
NoisePlayer._L0350:
                        .BLOCK    313
                        .LINE     314
                        LDI       _ACCB, 000000000h AND 0FFh
                        LDI       _ACCA, 000000000h SHRB 8
                        LDI       _ACCALO, 000000000h SHRB 16
                        LDI       _ACCAHI, 000000000h SHRB 24
                        STS       NOISEPLAYER.PARAMLONG, _ACCB
                        STS       NOISEPLAYER.PARAMLONG+1, _ACCA
                        STS       NOISEPLAYER.PARAMLONG+2, _ACCALO
                        STS       NOISEPLAYER.PARAMLONG+3, _ACCAHI
                        .LINE     315
                        LDI       _ACCA, 00000h SHRB 8
                        LDI       _ACCB, 00000h AND 0FFh
                        STS       NOISEPLAYER.PARAMINT, _ACCB
                        STS       NOISEPLAYER.PARAMINT+1, _ACCA
                        .LINE     316
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.PARAMBYTE, _ACCA
                        .ENDBLOCK 317
NoisePlayer._L0351:
                        .LINE     318
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,NoisePlayer.PARSESETPARAM
                        CALL      NoisePlayer.PARSESETPARAM
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 319
NoisePlayer._L0348:
                        .ENDBLOCK 320
NoisePlayer.ParseSubCh_X:
                        .LINE     320
                        .BRANCH   19
                        RET
                        .ENDFUNC  320


                        .FILE     E:\DROPBOX\NOISEPLAYER\AVR\NoisePlayer.pas
                        .FUNC     CheckSer, 000F7h, 00020h
NoisePlayer.CheckSer:
                        .RETURNS   0
                        SBIW      _FRAMEPTR, 2
                        .BLOCK    250
                        .LINE     251
                        CALL       SYSTEM.SERINP

                        STD       Y+001h, _ACCA
                        .LINE     253
                        LDD       _ACCA, Y+001h
                        .LINE     254
                        CPI       _ACCA, 8
                        .BRANCH   3,NoisePlayer._L0356
                        BREQ      NoisePlayer._L0356
                        .BRANCH   20,NoisePlayer._L0355
                        JMP       NoisePlayer._L0355
NoisePlayer._L0356:
NoisePlayer._L0354:
                        .BLOCK    255
                        .LINE     255
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0357
                        BRLO      NoisePlayer._L0357
                        SER       _ACCA
NoisePlayer._L0357:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0360
                        BRNE      NoisePlayer._L0360
                        .BRANCH   20,NoisePlayer._L0358
                        JMP       NoisePlayer._L0358
NoisePlayer._L0360:
                        .BLOCK    255
                        .LINE     256
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        LD        _ACCA, Z
                        SUBI      _ACCA, 001h AND 0FFh
                        POP       _ACCCHI
                        POP       _ACCCLO
                        CPI       _ACCA, 31
                        BRCS      NoisePlayer._L0361
                        LDI       _ACCA, 31
NoisePlayer._L0361:
                        ST        Z+, _ACCA
                        .ENDBLOCK 257
NoisePlayer._L0358:
NoisePlayer._L0359:
                        .ENDBLOCK 258
                        .BRANCH   20,NoisePlayer._L0353
                        JMP       NoisePlayer._L0353
NoisePlayer._L0355:
                        .LINE     259
                        CPI       _ACCA, 13
                        .BRANCH   3,NoisePlayer._L0364
                        BREQ      NoisePlayer._L0364
                        .BRANCH   20,NoisePlayer._L0363
                        JMP       NoisePlayer._L0363
NoisePlayer._L0364:
NoisePlayer._L0362:
                        .BLOCK    260
                        .LINE     260
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.BINARYMODE, _ACCA
                        .LINE     261
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,NoisePlayer.PARSESUBCH
                        CALL      NoisePlayer.PARSESUBCH
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .LINE     262
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        ADIW      _ACCCLO, 1
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        LDI       _ACCA, 01Fh
                        ST        -Y, _ACCA
                        LDI       _ACCA, 0FEH ROLB _DEVICE
                        AND       Flags, _ACCA
                        LDI       _ACCA, 0FEH ROLB _EEPROM
                        AND       Flags, _ACCA
                        .FRAME  3
                        LDI       _ACCA, 01Fh
                        PUSH      _ACCA
                        LDD       _ACCA, Y+000h
                        POP       _ACCB
                        SUB       _ACCB, _ACCA
                        MOV       _ACCA, _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z, _ACCA
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDBLOCK 263
                        .BRANCH   20,NoisePlayer._L0353
                        JMP       NoisePlayer._L0353
NoisePlayer._L0363:
                        .LINE     264
                        CPI       _ACCA, 32
                        .BRANCH   2,NoisePlayer._L0367
                        BRCC      NoisePlayer._L0367
                        .BRANCH   20,NoisePlayer._L0366
                        JMP       NoisePlayer._L0366
NoisePlayer._L0367:
                        CPI       _ACCA, 127
                        .BRANCH   3,NoisePlayer._L0368
                        BREQ      NoisePlayer._L0368
                        .BRANCH   1,NoisePlayer._L0366
                        BRCS      NoisePlayer._L0368
                        .BRANCH   20,NoisePlayer._L0366
                        JMP       NoisePlayer._L0366
NoisePlayer._L0368:
NoisePlayer._L0365:
                        .BLOCK    265
                        .LINE     265
                        LDD       _ACCA, Y+001h
                        MOV       _ACCEHI, _ACCA
                        LDI       _ACCELO, 001h
                        LDI       _ACCA, _ACCELO SHRB 8
                        LDI       _ACCB, _ACCELO AND 0FFh
                        PUSH      _ACCB
                        PUSH      _ACCA
                        LDI       _ACCCLO, NoisePlayer.SerInpStr AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.SerInpStr SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCA, 01Fh
                        PUSH      _ACCA
                        LDI       _ACCFHI, 000h
                        CALL      SYSTEM.StringAppend
                        .ENDBLOCK 266
                        .BRANCH   20,NoisePlayer._L0353
                        JMP       NoisePlayer._L0353
NoisePlayer._L0366:
NoisePlayer._L0353:
                        .ENDBLOCK 299
NoisePlayer.CheckSer_X:
                        .LINE     299
                        .BRANCH   19
                        RET
                        .ENDFUNC  299

                        .FUNC     GetWaveParams, 0012Dh, 00020h
NoisePlayer.GetWaveParams:
                        .RETURNS   0
                        .BLOCK    302
                        .LINE     303
                        LDI       _ACCCLO, NoisePlayer.WaveStartArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveStartArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, NoisePlayer.wavesel
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .LINE     304
                        LDI       _ACCCLO, NoisePlayer.WaveLoopArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveLoopArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, NoisePlayer.wavesel
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        STS       NOISEPLAYER.WAVELOOP, _ACCB
                        STS       NOISEPLAYER.WAVELOOP+1, _ACCA
                        STS       NOISEPLAYER.WAVELOOP+2, _ACCALO
                        STS       NOISEPLAYER.WAVELOOP+3, _ACCAHI
                        .LINE     305
                        LDI       _ACCCLO, NoisePlayer.WaveEndArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveEndArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDS       _ACCA, NoisePlayer.wavesel
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCB, Z+
                        LD        _ACCA, Z+
                        LD        _ACCALO, Z+
                        LD        _ACCAHI, Z+
                        STS       NOISEPLAYER.WAVEEND, _ACCB
                        STS       NOISEPLAYER.WAVEEND+1, _ACCA
                        STS       NOISEPLAYER.WAVEEND+2, _ACCALO
                        STS       NOISEPLAYER.WAVEEND+3, _ACCAHI
                        .ENDBLOCK 306
NoisePlayer.GetWaveParams_X:
                        .LINE     306
                        .BRANCH   19
                        RET
                        .ENDFUNC  306



                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Program body
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .FUNC     $_Main, 00138h, 00020h
                        .ENTRYMAIN $
NoisePlayer.$_Main:

                        .BLOCK    312
                        .LINE     313
                        .BRANCH   17,NoisePlayer.INITPORTS
                        CALL      NoisePlayer.INITPORTS

                        .LINE     314
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        SEI
                        .LINE     315
                        .BRANCH   17,NoisePlayer.WRITECHPREFIX
                        CALL      NoisePlayer.WRITECHPREFIX

                        .LINE     316
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        LDI       _ACCA, 1 SHLB _DEVICE
                        OR        Flags, _ACCA
                        LDI       _ACCB, SYSTEM.serout SHRB 1
                        LDI       _ACCA, SYSTEM.serout SHRB 9
                        ST        -Y, _ACCA
                        ST        -Y, _ACCB
                        .FRAME  2
                        LDI       _ACCCLO, NoisePlayer.Vers1Str AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.Vers1Str SHRB 8
                        CALL      SYSTEM.StrConst2Str
NoisePlayer._L0369:
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        .FRAME  0
                        .LINE     320
                        LDI       _ACCA, 00080h SHRB 8
                        LDI       _ACCB, 00080h AND 0FFh
                        STS       PWMPORT1A+1, _ACCA
                        STS       PWMPORT1A, _ACCB
                        .LINE     321
                        .LOOP
                        LDI       _ACCCLO, NoisePlayer.i AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.i SHRB 8
                        ST        -Y, _ACCCHI
                        ST        -Y, _ACCCLO
                        .FRAME  2
                        LDI       _ACCA, 000h
                        ST        Z, _ACCA
                        LDI       _ACCA, 007h
                        ST        -Y, _ACCA
                        .FRAME  3
                        LD        _ACCA, Z
NoisePlayer._L0372:
                        LDD       _ACCB, Y+000h
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0FFh
                        BRLO      NoisePlayer._L0373
                        CLR       _ACCA
NoisePlayer._L0373:
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0374
                        BREQ      NoisePlayer._L0374
                        .BRANCH   20,NoisePlayer._L0371
                        JMP       NoisePlayer._L0371
NoisePlayer._L0374:
                        .BLOCK    322
                        .LINE     322
                        LDI       _ACCCLO, NoisePlayer.WaveStartArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveStartArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.EEWaveStartArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.EEWaveStartArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     323
                        LDI       _ACCCLO, NoisePlayer.WaveLoopArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveLoopArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.EEWaveLoopArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.EEWaveLoopArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .LINE     324
                        LDI       _ACCCLO, NoisePlayer.WaveEndArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.WaveEndArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        LDI       _ACCCLO, NoisePlayer.EEWaveEndArray AND 0FFh
                        LDI       _ACCCHI, NoisePlayer.EEWaveEndArray SHRB 8
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCA, NoisePlayer.i
                        MOV       _ACCB, _ACCA
                        CLR       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        CALL      SYSTEM._ReadEEp32
                        POP       _ACCCHI
                        POP       _ACCCLO
                        ST        Z+, _ACCB
                        ST        Z+, _ACCA
                        ST        Z+, _ACCALO
                        ST        Z+, _ACCAHI
                        .ENDBLOCK 325
NoisePlayer._L0370:
                        .LINE     325
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LD        _ACCA, Z
                        INC       _ACCA
                        ST        Z, _ACCA
                        TST       _ACCA
                        .BRANCH   3,NoisePlayer._L0371
                        BREQ      NoisePlayer._L0371
                        .BRANCH   20,NoisePlayer._L0372
                        JMP       NoisePlayer._L0372
NoisePlayer._L0371:
                        ADIW      _FRAMEPTR, 3
                        .FRAME  0
                        .ENDLOOP
                        .LINE     326
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.OLDSWITCHPORT, _ACCA
NoisePlayer._L0375:
                        .BLOCK    328
                        .LINE     330
                        CALL       SYSTEM.SERSTAT

                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0379
                        BRNE      NoisePlayer._L0379
                        .BRANCH   20,NoisePlayer._L0377
                        JMP       NoisePlayer._L0377
NoisePlayer._L0379:
                        .BLOCK    330
                        .LINE     331
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        .BRANCH   17,NoisePlayer.CHECKSER
                        CALL      NoisePlayer.CHECKSER
                        POP       _FPTRHI
                        POP       _FRAMEPTR

                        .ENDBLOCK 332
NoisePlayer._L0377:
NoisePlayer._L0378:
                        .LINE     333
                        IN        _ACCA, PinC
                        ANDI      _ACCA, 003h
                        STS       NOISEPLAYER.SWITCHPORT, _ACCA
                        .LINE     334
                        LDS       _ACCA, NoisePlayer.Switchport
                        PUSH      _ACCA
                        LDS       _ACCA, NoisePlayer.oldSwitchPort
                        POP       _ACCB
                        CP        _ACCB, _ACCA
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0380
                        SER       _ACCA
NoisePlayer._L0380:
                        PUSH      _ACCA
                        LDS       _ACCA, NoisePlayer.Switchport
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0381
                        SER       _ACCA
NoisePlayer._L0381:
                        POP       _ACCB
                        OR        _ACCA, _ACCB
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0384
                        BRNE      NoisePlayer._L0384
                        .BRANCH   20,NoisePlayer._L0382
                        JMP       NoisePlayer._L0382
NoisePlayer._L0384:
                        .BLOCK    334
                        .LINE     335
                        LDS       _ACCA, NoisePlayer.Switchport
                        CPI       _ACCA, 003h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0385
                        SER       _ACCA
NoisePlayer._L0385:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0388
                        BRNE      NoisePlayer._L0388
                        .BRANCH   20,NoisePlayer._L0386
                        JMP       NoisePlayer._L0386
NoisePlayer._L0388:
                        .BLOCK    335
                        .LINE     336
                        CLR       _ACCA
                        LDI       _ACCEHI, 000h
                        CP        _ACCEHI, NoisePlayer.sw_debounce
                        BRCC      NoisePlayer._L0389
NoisePlayer._L0390:
                        DEC       NoisePlayer.sw_debounce
                        SER       _ACCA
NoisePlayer._L0389:
                        .LINE     337
                        CBI       0002Bh, 003h
                        .LINE     338
                        LDS       _ACCA, NoisePlayer.wasrunning
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0393
                        BRNE      NoisePlayer._L0393
                        .BRANCH   20,NoisePlayer._L0391
                        JMP       NoisePlayer._L0391
NoisePlayer._L0393:
                        .BLOCK    338
                        .LINE     339
                        LDS       _ACCA, NoisePlayer.startcomplete
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0396
                        BRNE      NoisePlayer._L0396
                        .BRANCH   20,NoisePlayer._L0394
                        JMP       NoisePlayer._L0394
NoisePlayer._L0396:
                        .BLOCK    339
                        .LINE     340
                        LDI       _ACCA, 003h
                        STS       NOISEPLAYER.WAVESEL, _ACCA
                        .ENDBLOCK 341
                        .BRANCH   20,NoisePlayer._L0395
                        JMP       NoisePlayer._L0395
NoisePlayer._L0394:
                        .BLOCK    341
                        .LINE     342
                        LDI       _ACCA, 004h
                        STS       NOISEPLAYER.WAVESEL, _ACCA
                        .ENDBLOCK 343
NoisePlayer._L0395:
                        .LINE     344
                        .BRANCH   17,NoisePlayer.GETWAVEPARAMS
                        CALL      NoisePlayer.GETWAVEPARAMS

                        .LINE     345
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.PWMSLOWER, _ACCA
                        .LINE     346
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.WASRUNNING, _ACCA
                        .LINE     347
                        MOV       _ACCA, NoisePlayer.sw_debounce
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0397
                        SER       _ACCA
NoisePlayer._L0397:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0400
                        BRNE      NoisePlayer._L0400
                        .BRANCH   20,NoisePlayer._L0398
                        JMP       NoisePlayer._L0398
NoisePlayer._L0400:
                        .BLOCK    347
                        .LINE     348
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.STARTCOMPLETE, _ACCA
                        .ENDBLOCK 349
NoisePlayer._L0398:
NoisePlayer._L0399:
                        .ENDBLOCK 350
NoisePlayer._L0391:
NoisePlayer._L0392:
                        .ENDBLOCK 351
NoisePlayer._L0386:
NoisePlayer._L0387:
                        .LINE     352
                        LDS       _ACCB, 00148h
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0403
                        BRNE      NoisePlayer._L0403
                        .BRANCH   20,NoisePlayer._L0401
                        JMP       NoisePlayer._L0401
NoisePlayer._L0403:
                        .BLOCK    353
                        .LINE     353
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.WAVESEL, _ACCA
                        .LINE     354
                        .BRANCH   17,NoisePlayer.GETWAVEPARAMS
                        CALL      NoisePlayer.GETWAVEPARAMS

                        .LINE     355
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.PWMENABLED, _ACCA
                        .LINE     356
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.WASRUNNING, _ACCA
                        .ENDBLOCK 357
NoisePlayer._L0401:
NoisePlayer._L0402:
                        .LINE     358
                        LDS       _ACCB, 00148h
                        CLR       _ACCA
                        SBRC      _ACCB, 001h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0406
                        BRNE      NoisePlayer._L0406
                        .BRANCH   20,NoisePlayer._L0404
                        JMP       NoisePlayer._L0404
NoisePlayer._L0406:
                        .BLOCK    358
                        .LINE     359
                        LDI       _ACCA, 001h
                        STS       NOISEPLAYER.WAVESEL, _ACCA
                        .LINE     360
                        .BRANCH   17,NoisePlayer.GETWAVEPARAMS
                        CALL      NoisePlayer.GETWAVEPARAMS

                        .LINE     361
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.WASRUNNING, _ACCA
                        .LINE     362
                        LDI       _ACCA, 0FFh
                        MOV       NOISEPLAYER.SW_DEBOUNCE, _ACCA
                        .LINE     363
                        LDS       _ACCB, 00148h
                        CLR       _ACCA
                        SBRC      _ACCB, 000h
                        SER       _ACCA
                        COM       _ACCA
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0409
                        BRNE      NoisePlayer._L0409
                        .BRANCH   20,NoisePlayer._L0407
                        JMP       NoisePlayer._L0407
NoisePlayer._L0409:
                        .BLOCK    364
                        .LINE     364
                        LDI       _ACCA, 002h
                        STS       NOISEPLAYER.WAVESEL, _ACCA
                        .LINE     365
                        .BRANCH   17,NoisePlayer.GETWAVEPARAMS
                        CALL      NoisePlayer.GETWAVEPARAMS

                        .ENDBLOCK 366
                        .BRANCH   20,NoisePlayer._L0408
                        JMP       NoisePlayer._L0408
NoisePlayer._L0407:
                        .BLOCK    366
                        .LINE     367
                        LDI       _ACCA, 001h
                        STS       NOISEPLAYER.WAVESEL, _ACCA
                        .LINE     368
                        .BRANCH   17,NoisePlayer.GETWAVEPARAMS
                        CALL      NoisePlayer.GETWAVEPARAMS

                        .ENDBLOCK 369
NoisePlayer._L0408:
                        .LINE     370
                        LDS       _ACCA, NoisePlayer.startcomplete
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0412
                        BRNE      NoisePlayer._L0412
                        .BRANCH   20,NoisePlayer._L0410
                        JMP       NoisePlayer._L0410
NoisePlayer._L0412:
                        .BLOCK    370
                        .LINE     371
                        SBI       0002Bh, 002h
                        .ENDBLOCK 372
                        .BRANCH   20,NoisePlayer._L0411
                        JMP       NoisePlayer._L0411
NoisePlayer._L0410:
                        .BLOCK    372
                        .LINE     373
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.PWMSLOWER, _ACCA
                        .ENDBLOCK 374
NoisePlayer._L0411:
                        .ENDBLOCK 375
                        .BRANCH   20,NoisePlayer._L0405
                        JMP       NoisePlayer._L0405
NoisePlayer._L0404:
                        .BLOCK    375
                        .LINE     376
                        CBI       0002Bh, 002h
                        .ENDBLOCK 377
NoisePlayer._L0405:
                        .LINE     378
                        .BRANCH   17,NoisePlayer.DFSETREADADDR
                        CALL      NoisePlayer.DFSETREADADDR

                        .ENDBLOCK 379
NoisePlayer._L0382:
NoisePlayer._L0383:
                        .LINE     380
                        LDS       _ACCA, NoisePlayer.Switchport
                        STS       NOISEPLAYER.OLDSWITCHPORT, _ACCA
                        .LINE     381
                        LDS       _ACCA, NoisePlayer.PWMslower
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0415
                        BRNE      NoisePlayer._L0415
                        .BRANCH   20,NoisePlayer._L0413
                        JMP       NoisePlayer._L0413
NoisePlayer._L0415:
                        .BLOCK    381
                        .LINE     382
                        LDI       _ACCA, 002h
                        .FRAME  0
                        CALL      SYSTEM.UDELAY

                        .ENDBLOCK 383
NoisePlayer._L0413:
NoisePlayer._L0414:
                        .LINE     386
                        LDS       _ACCA, NoisePlayer.PWMenabled
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0418
                        BRNE      NoisePlayer._L0418
                        .BRANCH   20,NoisePlayer._L0416
                        JMP       NoisePlayer._L0416
NoisePlayer._L0418:
                        .BLOCK    386
                        .LINE     387
                        LDS       _ACCB, NoisePlayer.DF_long
                        LDS       _ACCA, NoisePlayer.DF_long+1
                        LDS       _ACCALO, NoisePlayer.DF_long+2
                        LDS       _ACCAHI, NoisePlayer.DF_long+3
                        PUSH      _ACCB
                        PUSH      _ACCA
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        LDS       _ACCB, NoisePlayer.WaveEnd
                        LDS       _ACCA, NoisePlayer.WaveEnd+1
                        LDS       _ACCALO, NoisePlayer.WaveEnd+2
                        LDS       _ACCAHI, NoisePlayer.WaveEnd+3
                        MOVW      _ACCBLO, _ACCB
                        MOVW      _ACCCLO, _ACCALO
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCA
                        POP       _ACCB
                        LDI       _ACCDLO, 080h
                        EOR       _ACCCHI, _ACCDLO
                        EOR       _ACCAHI, _ACCDLO
                        CP        _ACCAHI, _ACCCHI
                        BRNE      NoisePlayer._L0419
                        CP        _ACCALO, _ACCCLO
                        BRNE      NoisePlayer._L0419
                        CP        _ACCA, _ACCBHI
                        BRNE      NoisePlayer._L0419
                        CP        _ACCB, _ACCBLO
NoisePlayer._L0419:
                        LDI       _ACCA, 0h
                        BREQ      NoisePlayer._L0420
                        BRLO      NoisePlayer._L0420
                        SER       _ACCA
NoisePlayer._L0420:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0423
                        BRNE      NoisePlayer._L0423
                        .BRANCH   20,NoisePlayer._L0421
                        JMP       NoisePlayer._L0421
NoisePlayer._L0423:
                        .BLOCK    387
                        .LINE     388
                        LDS       _ACCB, NoisePlayer.WaveLoop
                        LDS       _ACCA, NoisePlayer.WaveLoop+1
                        LDS       _ACCALO, NoisePlayer.WaveLoop+2
                        LDS       _ACCAHI, NoisePlayer.WaveLoop+3
                        STS       NOISEPLAYER.DF_LONG, _ACCB
                        STS       NOISEPLAYER.DF_LONG+1, _ACCA
                        STS       NOISEPLAYER.DF_LONG+2, _ACCALO
                        STS       NOISEPLAYER.DF_LONG+3, _ACCAHI
                        .LINE     389
                        .BRANCH   17,NoisePlayer.DFSETREADADDR
                        CALL      NoisePlayer.DFSETREADADDR

                        .LINE     390
                        LDS       _ACCA, NoisePlayer.wavesel
                        CPI       _ACCA, 000h
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0424
                        SER       _ACCA
NoisePlayer._L0424:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0427
                        BRNE      NoisePlayer._L0427
                        .BRANCH   20,NoisePlayer._L0425
                        JMP       NoisePlayer._L0425
NoisePlayer._L0427:
                        .BLOCK    391
                        .LINE     391
                        LDI       _ACCA, 0FFh
                        STS       NOISEPLAYER.STARTCOMPLETE, _ACCA
                        .LINE     392
                        SBI       0002Bh, 003h
                        .ENDBLOCK 393
NoisePlayer._L0425:
NoisePlayer._L0426:
                        .ENDBLOCK 394
                        .BRANCH   20,NoisePlayer._L0422
                        JMP       NoisePlayer._L0422
NoisePlayer._L0421:
                        .BLOCK    394
                        .LINE     395
                        LDS       _ACCBLO, NoisePlayer.DF_Long
                        LDS       _ACCBHI, NoisePlayer.DF_Long+1
                        LDS       _ACCCLO, NoisePlayer.DF_Long+2
                        LDS       _ACCCHI, NoisePlayer.DF_Long+3
                        ADIW      _ACCBLO, 1
                        BRCC      NoisePlayer._L0428
                        ADIW      _ACCCLO, 1
NoisePlayer._L0428:
                        STS       NoisePlayer.DF_Long, _ACCBLO
                        STS       NoisePlayer.DF_Long+1, _ACCBHI
                        STS       NoisePlayer.DF_Long+2, _ACCCLO
                        STS       NoisePlayer.DF_Long+3, _ACCCHI
                        .ENDBLOCK 396
NoisePlayer._L0422:
                        .LINE     398
                        LDS       _ACCA, NoisePlayer.DF_long3
                        CPI       _ACCA, 0FFh
                        LDI       _ACCA, 0h
                        BRNE      NoisePlayer._L0429
                        SER       _ACCA
NoisePlayer._L0429:
                        TST       _ACCA
                        .BRANCH   4,NoisePlayer._L0432
                        BRNE      NoisePlayer._L0432
                        .BRANCH   20,NoisePlayer._L0430
                        JMP       NoisePlayer._L0430
NoisePlayer._L0432:
                        .BLOCK    398
                        .LINE     399
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.PWMENABLED, _ACCA
                        .LINE     400
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.PWMSLOWER, _ACCA
                        .LINE     401
                        LDI       _ACCA, 000h
                        STS       NOISEPLAYER.STARTCOMPLETE, _ACCA
                        .LINE     402
                        LDI       _ACCA, 080h
                        MOV       NOISEPLAYER.DF_RECEIVE, _ACCA
                        .LINE     403
                        SBI       00025h, 000h
                        .ENDBLOCK 404
                        .BRANCH   20,NoisePlayer._L0431
                        JMP       NoisePlayer._L0431
NoisePlayer._L0430:
                        .BLOCK    404
                        .LINE     405
                        .BRANCH   17,NoisePlayer.DF_SR
                        CALL      NoisePlayer.DF_SR

                        .ENDBLOCK 406
NoisePlayer._L0431:
                        .ENDBLOCK 407
                        .BRANCH   20,NoisePlayer._L0417
                        JMP       NoisePlayer._L0417
NoisePlayer._L0416:
                        .BLOCK    407
                        .LINE     408
                        LDI       _ACCA, 080h
                        MOV       NOISEPLAYER.DF_RECEIVE, _ACCA
                        .LINE     409
                        SBI       00025h, 000h
                        .ENDBLOCK 410
NoisePlayer._L0417:
                        .ASM
                        PWM_wait1:
                        .LINE     413
                        LDS    _ACCA, TCNT1L ; Portbit PB1
                        .LINE     414
                        ANDI   _ACCA, $80
                        .LINE     415
                        BREQ   PWM_wait1     ; auf Mitte des PWM-pulses warten
                        PWM_wait2:
                        .LINE     417
                        LDS    _ACCA, TCNT1L ; Portbit PB1
                        .LINE     418
                        ANDI   _ACCA, $80
                        .LINE     419
                        BRNE   PWM_wait2
                        .LINE     420
                        STS    OCR1AL, NoisePlayer.DF_receive ; neuer PWM-Wert
                        .endasm
                        .ENDBLOCK 422
                        .LINE     422
                        .BRANCH   20,NoisePlayer._L0375
                        JMP       NoisePlayer._L0375
NoisePlayer._L0376:
                        .ENDBLOCK 423

NoisePlayer.$_MAINEX:
                        .LINE     423
                        NOP
                        .LINE     423
                        .BRANCH   20,NoisePlayer.$_MAINEX
                        RJMP      NoisePlayer.$_MAINEX


                        .ENDFUNC  423

SYSTEM.$Main_stk        .EQU    0042Ch          ; var iData  Process stack area
SYSTEM.$Main_stk_e      .EQU    0046Bh          ; var iData  Process stack area
SYSTEM.$Main_Frame      .EQU    0046Ch          ; var iData  Process stack area
SYSTEM.$Main_Frame_e    .EQU    004ABh          ; var iData  Process stack area

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Initialisation and Library Routines
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                        .ENTRY
SYSTEM.RESET:
                        CLI
                        ; >> Stack Init [main process only] <<
                        LDI       _ACCA, 004h
                        LDI       _ACCB, 06Bh
                        OUT       sph, _ACCA
                        OUT       spl, _ACCB


                        ; >> Memory init <<
                        CLR       _ACCA
                        LDI       _ACCCLO, 16
                        LDI       _ACCCHI, 0
                        LDI       _ACCBLO, 0
                        LDI       _ACCBHI, 0
                        ADIW      _ACCCLO, 1
SYSTEM._L0433:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0435
SYSTEM._L0434:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0433
SYSTEM._L0435:
                        LDI       _ACCBLO, 00100h AND 0FFh
                        LDI       _ACCBHI, 00100h SHRB 8
                        LDI       _ACCCLO, 00400h AND 0FFh
                        LDI       _ACCCHI, 00400h SHRB 8
                        ADIW      _ACCCLO, 1
SYSTEM._L0436:
                        SBIW      _ACCCLO, 001h
                        BREQ      SYSTEM._L0438
SYSTEM._L0437:
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0436
SYSTEM._L0438:
                        LDI       _FRAMEPTR, 004ABh AND 0FFh
                        LDI       _FPTRHI, 004ABh SHRB 8

                        CLI
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA

                        ; ============ init structured constants ============
                        ; >> Hardware Init <<

                        ; >> SysTick init: 2msec <<
                        ; >> real SysTick (exact): 2.000 msec <<
                        LDI       _ACCA, 083h
                        STS       SysTickTime, _ACCA
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 4
                        OUT       tccr0, _ACCA
                        LDI       _ACCA, 001h
                        STS       timsk0, _ACCA

                        ; >> PWMport1 Init <<
                        SBI       DDRB, 1
                        CLR       _ACCA
                        STS       tcnt1h, _ACCA
                        STS       tcnt1l, _ACCA
                        STS       ocr1ah, _ACCA
                        STS       ocr1al, _ACCA
                        LDI       _ACCA, 081h
                        STS       tccr1a, _ACCA
                        LDI       _ACCA, 1
                        STS       tccr1b, _ACCA

                        ; >> SERPORT Init <<
                        ; >> Baudrate 57600Baud <<
                        
                        ; percent Baudrate error : >> 2.080% <<
                        LDI       _ACCA, 018h
                        STS       ucr1, _ACCA
                        LDI       _ACCA, 010h
                        STS       ubrr1, _ACCA
                        LDI       _ACCA, 000h
                        STS       ubrrh, _ACCA
                        LDI       _ACCA, 0
                        STS       _RXINP, _ACCA
                        STS       _RXOUTP, _ACCA
                        STS       _RXCOUNT, _ACCA
                        LDS       _ACCA, ucr1
                        SBR       _ACCA, 80h
                        STS       ucr1, _ACCA
                        LDI       _ACCA, 0
                        STS       _TXINP, _ACCA
                        STS       _TXOUTP, _ACCA
                        STS       _TXCOUNT, _ACCA
                        LDI       _ACCA, 006h
                        STS       ucsrc, _ACCA
                        LDS       _ACCA, UDR1

                        CLR       Flags
                        CLR       Flags2

                        ; ============ Start User Main Program ============

                        .DEB      MAINENTRY
                        JMP       NoisePlayer.$_Main

                        ; ============ Interrupt Service ============

SYSTEM.$INTERRUPT_TIMER0:
                        .DEB      SYSTICKENTRY
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        LDS       _ACCA, SysTickTime
                        IN        _ACCB, tcnt0
                        ADD       _ACCA, _ACCB
                        OUT       tcnt0, _ACCA
                        LDI       _ACCA, 0FEH ROLB IntFlag
                        AND       Flags, _ACCA
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BREQ      SYSTEM._L0439
                        DEC       _ACCA
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0439:
                        LDI       _ACCA, 1 SHLB IntFlag
                        OR        Flags, _ACCA
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        .DEB      SYSTICKEXIT
                        RETI

SYSTEM.$INTERRUPT_TXEMPTY:
SYSTEM.$INTERRUPT_UDRE:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
                        LDS       _ACCA, _TXCOUNT
                        TST       _ACCA
                        BRNE      SYSTEM._L0440
SYSTEM._L0444:
                        LDS       _ACCA, ucr1
                        CBR       _ACCA, 20h
                        STS       ucr1, _ACCA
                        RJMP      SYSTEM._L0442
SYSTEM._L0440:
                        LDS       _ACCB, _TXOUTP
                        CLR       _ACCA
                        LDI       _ACCCLO, _TXBUFF AND 0FFh
                        LDI       _ACCCHI, _TXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z
                        STS       UDR1, _ACCA
                        LDS       _ACCA, _TXCOUNT
                        DEC       _ACCA
                        STS       _TXCOUNT, _ACCA
                        BRNE      SYSTEM._L0443
                        LDS       _ACCA, ucr1
                        CBR       _ACCA, 20h
                        STS       ucr1, _ACCA
SYSTEM._L0443:
                        INC       _ACCB
                        CPI       _ACCB, 32
                        BRNE      SYSTEM._L0441
                        CLR       _ACCB
SYSTEM._L0441:
                        STS       _TXOUTP, _ACCB
SYSTEM._L0442:
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI

SYSTEM.$INTERRUPT_RXRDY:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        PUSH      _ACCB
                        PUSH      _ACCA
                        IN        _ACCA, SREG
                        PUSH      _ACCA
SYSTEM._L0450:
                        LDS       _ACCA, _RXCOUNT
                        CPI       _ACCA, 32
                        BRNE      SYSTEM._L0445
                        LDS       _ACCB, UDR1
                        RJMP      SYSTEM._L0447
SYSTEM._L0445:
                        LDS       _ACCA, UDR1
                        PUSH      _ACCA
                        CLR       _ACCA
                        LDS       _ACCB, _RXINP
                        LDI       _ACCCLO, _RXBUFF AND 0FFh
                        LDI       _ACCCHI, _RXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        POP       _ACCA
                        ST        Z, _ACCA
                        LDS       _ACCA, _RXCOUNT
                        INC       _ACCA
                        STS       _RXCOUNT, _ACCA
                        INC       _ACCB
                        CPI       _ACCB, 32
                        BRNE      SYSTEM._L0446
                        CLR       _ACCB
SYSTEM._L0446:
                        STS       _RXINP, _ACCB
                        LDS       _ACCB, usr1
                        SBRC      _ACCB, 7
                        RJMP      SYSTEM._L0450
SYSTEM._L0447:
SYSTEM._L0452:
                        POP       _ACCA
                        OUT       SREG, _ACCA
                        POP       _ACCA
                        POP       _ACCB
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RETI


                        ; ============ Library ============

SYSTEM.SERINP_TO:
SYSTEM.SERINP_TO1:
                        LDD       _ACCA, Y+000h
                        STS       _RXTIMEOUT, _ACCA
SYSTEM._L0453:
                        RCALL     SYSTEM.SERSTAT
                        TST       _ACCA
                        BRNE      SYSTEM._L0454
                        LDS       _ACCA, _RXTIMEOUT
                        TST       _ACCA
                        BRNE      SYSTEM._L0453
                        RET
SYSTEM._L0454:
                        RCALL     SYSTEM.SERINP
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        ST        Z+, _ACCA
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        SER       _ACCA
                        RET

SYSTEM.SERINP:
SYSTEM.SERINP1:
SYSTEM._L0455:
                        LDS       _ACCA, _RXCOUNT
                        TST       _ACCA
                        BREQ      SYSTEM._L0455
                        LDS       _ACCB, _RXOUTP
                        CLR       _ACCA
                        LDI       _ACCCLO, _RXBUFF AND 0FFh
                        LDI       _ACCCHI, _RXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCA
                        LD        _ACCA, Z
                        CLI
                        LDS       _ACCCLO, _RXCOUNT
                        DEC       _ACCCLO
                        STS       _RXCOUNT, _ACCCLO
                        SBRC      Flags, IntFlag
                        SEI
                        LDS       _ACCB, _RXOUTP
                        INC       _ACCB
                        CPI       _ACCB, 32
                        BRNE      SYSTEM._L0456
                        CLR       _ACCB
SYSTEM._L0456:
                        STS       _RXOUTP, _ACCB
                        RET

SYSTEM.SERSTAT:
SYSTEM.SERSTAT1:
                        CLR       _ACCA
                        LDS       _ACCB, _RXCOUNT
                        TST       _ACCB
                        BREQ      SYSTEM._L0461
                        COM       _ACCA
SYSTEM._L0461:
                        RET

SYSTEM.SEROUT:
SYSTEM.SEROUT1:
SYSTEM._L0465:
                        LDS       _ACCB, _TXCOUNT
                        CPI       _ACCB, 32
                        BREQ      SYSTEM._L0465
                        CLI
                        LDS       _ACCB, _TXINP
                        LDI       _ACCCLO, _TXBUFF AND 0FFh
                        LDI       _ACCCHI, _TXBUFF SHRB 8
                        ADD       _ACCCLO, _ACCB
                        CLR       _ACCB
                        ADC       _ACCCHI, _ACCB
                        ST        Z, _ACCA
                        LDS       _ACCB, _TXCOUNT
                        INC       _ACCB
                        STS       _TXCOUNT, _ACCB
                        LDS       _ACCB, _TXINP
                        INC       _ACCB
                        CPI       _ACCB, 32
                        BRNE      SYSTEM._L0466
                        CLR       _ACCB
SYSTEM._L0466:
                        STS       _TXINP, _ACCB
                        LDS       _ACCB, ucr1
                        SBR       _ACCB, 20h
                        STS       ucr1, _ACCB
                        SBRC      Flags, IntFlag
                        SEI
                        RET


SYSTEM.MDELAY:
                        .DEB      DEBdelay
                        MOVW      _ACCDLO, _ACCB
                        CLR       _ACCA
                        CP        _ACCDLO, _ACCA
                        CPC       _ACCDHI, _ACCA
                        BREQ      SYSTEM.MDELAY3
SYSTEM.MDELAY1:
                        LDI       _ACCB, 00C7Ah AND 0FFh
                        LDI       _ACCA, 00C7Ah SHRB 8
SYSTEM.MDELAY2:
                        SUBI      _ACCB, 001h
                        SBCI      _ACCA, 000h
                        NOP
                        BRNE      SYSTEM.MDELAY2
                        SUBI      _ACCDLO, 001h
                        SBCI      _ACCDHI, 000h
                        BRNE      SYSTEM.MDELAY1
SYSTEM.MDELAY3:
                        RET

SYSTEM.UDELAY:
                        TST       _ACCA
                        BREQ      SYSTEM.UDELAY3
SYSTEM.UDELAY1:
                        LDI       _ACCB, 00026h AND 0FFh
SYSTEM.UDELAY2:
                        DEC       _ACCB
                        NOP
                        BRNE      SYSTEM.UDELAY2
                        DEC       _ACCA
                        BRNE      SYSTEM.UDELAY1
SYSTEM.UDELAY3:
                        RET

SYSTEM.BlockCopyC:
SYSTEM._L0470:
                        SUBI      _ACCALO, 001h
                        SBCI      _ACCAHI, 000h
                        BRCS      SYSTEM._L0471
                        LD        _ACCA, Z+
                        ST        X+, _ACCA
                        RJMP      SYSTEM._L0470
SYSTEM._L0471:
                        RET

SYSTEM._EEpWaitReady:
                        SBRC      Flags, IntFlag
                        SEI
                        SBIC      eecr, 1
                        RJMP      SYSTEM._EEpWaitReady

                        CLI
                        SBIC      eecr, 1
                        RJMP      SYSTEM._EEpWaitReady

                        RET

SYSTEM.WriteEEp8:
                        RCALL     SYSTEM._EEpWaitReady
                        PUSH      _ACCDLO
                        OUT       eearl, _ACCCLO
                        OUT       eearh, _ACCCHI
                        SBI       eecr, 0
                        NOP
                        IN        _ACCDLO, eedr
                        CP        _ACCA, _ACCDLO
                        BREQ      SYSTEM._L0472
                        OUT       eedr, _ACCA
                        SBI       eecr, 2
                        SBI       eecr, 1
SYSTEM._L0472:
                        POP       _ACCDLO
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM._WriteEEp32:
                        MOV       _ACCA, _ACCBLO
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCBHI
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCALO
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        MOV       _ACCA, _ACCAHI
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.WriteEEp8
                        RET

SYSTEM.ReadEEp8:
                        RCALL     SYSTEM._EEpWaitReady
                        OUT       eearl, _ACCCLO
                        OUT       eearh, _ACCCHI
                        SBI       eecr, 0
                        NOP
                        IN        _ACCA, eedr
                        SBRC      Flags, IntFlag
                        SEI
                        RET

SYSTEM._ReadEEp32:
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCB, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCBLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCALO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RCALL     SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        MOV       _ACCA, _ACCBLO
                        RET

SYSTEM.StringAppend:
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCB
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0473
SYSTEM._L0473:
                        LD        _ACCA, X
                        INC       _ACCA
                        RJMP      SYSTEM._StrIns

SYSTEM.StringInsert:
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCB
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
SYSTEM._StrIns:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L0474
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0476
                        PUSH      _ACCA
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCAHI, _ACCA
                        POP       _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0475
SYSTEM._L0476:
                        LPM       _ACCAHI, Z+
                        RJMP      SYSTEM._L0475
SYSTEM._L0474:
                        LD        _ACCAHI, Z+
SYSTEM._L0475:
                        TST       _ACCAHI
                        BREQ      SYSTEM._L0483
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0478
SYSTEM._L0478:
                        LD        _ACCALO, X
SYSTEM._L0480:
                        CP        _ACCB, _ACCA
                        BRCC      SYSTEM._L0482
SYSTEM._L0483:
                        RET
SYSTEM._L0482:
                        MOV       _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCA
                        MOV       _ACCDHI, _ACCDLO
                        SUB       _ACCDLO, _ACCAHI
                        BRCS      SYSTEM._L0488
                        CP        _ACCALO, _ACCA
                        BRCC      SYSTEM._L0485
                        MOV       _ACCELO, _ACCAHI
                        ADD       _ACCELO, _ACCALO
                        CP        _ACCB, _ACCELO
                        BRCS      SYSTEM._L0484
                        MOV       _ACCB, _ACCELO
SYSTEM._L0484:
                        RJMP      SYSTEM._L0488
SYSTEM._L0485:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        MOV       _ACCDHI, _ACCALO
                        SUB       _ACCDHI, _ACCA
                        CP        _ACCDHI, _ACCDLO
                        BRCC      SYSTEM._L0486
                        MOV       _ACCDLO, _ACCDHI
SYSTEM._L0486:
                        CLR       _ACCDHI
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCDHI
                        ADD       _ACCBLO, _ACCDLO
                        ADC       _ACCBHI, _ACCDHI
                        ADIW      _ACCBLO, 1
                        MOVW      _ACCCLO, _ACCBLO
                        ADD       _ACCCLO, _ACCAHI
                        ADC       _ACCCHI, _ACCDHI
                        MOV       _ACCDHI, _ACCDLO
                        INC       _ACCDHI
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0487
SYSTEM._L0487:
                        LD        _ACCGLO, -X
                        ST        -Z, _ACCGLO
                        DEC       _ACCDHI
                        BRNE     SYSTEM._L0487
SYSTEM._L0481:
                        POP       _ACCCHI
                        POP       _ACCCLO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        MOV       _ACCB, _ACCA
                        ADD       _ACCB, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        BRNE     SYSTEM._L0492
SYSTEM._L0488:
                        ADD       _ACCAHI, _ACCDLO
                        INC       _ACCAHI
SYSTEM._L0492:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0495
SYSTEM._L0495:
                        ST        X, _ACCB
SYSTEM._L0494:
                        CLR       _ACCALO
                        ADD       _ACCBLO, _ACCA
                        ADC       _ACCBHI, _ACCALO
SYSTEM._L0493:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 3
                        TST       _ACCFLO
                        BREQ      SYSTEM._L0496
                        LSR       _ACCFLO
                        BRNE      SYSTEM._L0498
                        CALL      SYSTEM.ReadEEp8
                        MOV       _ACCGLO, _ACCA
                        ADIW      _ACCCLO, 01h
                        RJMP      SYSTEM._L0497
SYSTEM._L0498:
                        LPM       _ACCGLO, Z+
                        RJMP      SYSTEM._L0497
SYSTEM._L0496:
                        LD        _ACCGLO, Z+
SYSTEM._L0497:
                        MOV       _ACCFLO, _ACCFHI
                        ANDI      _ACCFLO, 10h
                        BREQ      SYSTEM._L0499
SYSTEM._L0499:
                        ST        X+, _ACCGLO
SYSTEM._L0500:
                        DEC       _ACCAHI
                        BRNE     SYSTEM._L0493
SYSTEM._L0491:
                        RET

SYSTEM.Str2Int:
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        CLR       _ACCBHI
                        CLR       _ACCBLO
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0505
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0506
SYSTEM._L0505:
                        LD        _ACCA, Z+
SYSTEM._L0506:
                        TST       _ACCA
                        BRNE      SYSTEM._L0502
SYSTEM._L0501:
                        CLR       _ACCA
                        CLR       _ACCB
                        RET

SYSTEM._L0502:
                        MOV       _ACCDHI, _ACCA
                        TST       _ACCB
                        BREQ      SYSTEM._L0507
                        INC       _ACCDHI
                        RJMP      SYSTEM.Hex2Int
SYSTEM._L0507:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0508
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0509
SYSTEM._L0508:
                        LD        _ACCA, Z+
SYSTEM._L0509:
                        CLT
                        BLD       Flags, _NEGATIVE
                        CPI       _ACCA, 02Dh
                        BRNE      SYSTEM._L0503
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0501
                        SET
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0510
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0511
SYSTEM._L0510:
                        LD        _ACCA, Z+
SYSTEM._L0511:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0503:
                        CPI       _ACCA, 02Bh
                        BRNE      SYSTEM._L0504
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0501
                        CLT
                        BLD       Flags, _NEGATIVE
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0512
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0513
SYSTEM._L0512:
                        LD        _ACCA, Z+
SYSTEM._L0513:
                        RJMP      SYSTEM.Dec2Int
SYSTEM._L0504:
                        CPI       _ACCA, 024h
                        BRNE      SYSTEM.Dec2Int
                        RJMP      SYSTEM.Hex2Int
SYSTEM.Dec2Int:
                        MOV       _ACCB, _ACCDHI
                        DEC       _ACCB
                        BRMI      SYSTEM._L0501
                        CLR       _ACCDHI
                        CLR       _ACCEHI
                        CLR       _ACCFHI
                        CLR       _ACCFLO
                        PUSH      _ACCB
                        RJMP      SYSTEM.Dec2Int1
SYSTEM._L0514:
                        PUSH      _ACCB
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0517
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0518
SYSTEM._L0517:
                        LD        _ACCA, Z+
SYSTEM._L0518:
SYSTEM.Dec2Int1:
                        CPI       _ACCA, 030h
                        BRCS      SYSTEM.Str2Ierr1
                        CPI       _ACCA, 03Ah
                        BRCC      SYSTEM.Str2Ierr1
                        SUBI      _ACCA, 030h
                        MOV       _ACCDLO, _ACCA
                        MOVW      _ACCB, _ACCBLO
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCEHI
                        ROL       _ACCFHI
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCEHI
                        ROL       _ACCFHI
                        ADD       _ACCB, _ACCBLO
                        ADC       _ACCA, _ACCBHI
                        ADC       _ACCEHI, _ACCFLO
                        ADC       _ACCFHI, _ACCFLO
                        ADD       _ACCEHI, _ACCALO
                        ADC       _ACCFHI, _ACCAHI
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCEHI
                        ROL       _ACCFHI
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        ADC       _ACCEHI, _ACCFLO
                        ADC       _ACCFHI, _ACCFLO
                        MOVW      _ACCBLO, _ACCB
                        MOV       _ACCALO, _ACCEHI
                        MOV       _ACCAHI, _ACCFHI
                        POP       _ACCB
                        DEC       _ACCB
                        BRMI      SYSTEM.Str2Iex
                        RJMP      SYSTEM._L0514
SYSTEM.Str2Ierr1:
                        POP       _ACCB
SYSTEM.Str2Ierr:
                        SET
                        BLD       Flags, _ERRFLAG
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCAHI
                        CLR       _ACCALO
                        RET

SYSTEM.Str2Iex:
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _NEGATIVE
                        BRTC      SYSTEM._L0519
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCALO
                        COM       _ACCAHI
                        COM       _ACCA
                        COM       _ACCB
SYSTEM._L0519:
                        RET

SYSTEM.Hex2Int:
                        CLT
                        BLD       Flags, _NEGATIVE
                        DEC       _ACCDHI
                        BREQ      SYSTEM._L0519
                        CPI       _ACCDHI, 009h
                        BRSH      SYSTEM.Str2Ierr
SYSTEM._L0520:
                        BST       Flags, _EEPROM
                        BRTC      SYSTEM._L0524
                        CALL      SYSTEM.ReadEEp8
                        ADIW      _ACCCLO, 01h
                        RJMP     SYSTEM._L0525
SYSTEM._L0524:
                        LD        _ACCA, Z+
SYSTEM._L0525:
                        CPI       _ACCA, 061h
                        BRLO      SYSTEM._L0521
                        SUBI      _ACCA, 020h
SYSTEM._L0521:
                        CPI       _ACCA, 030h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 03Ah
                        BRLO      SYSTEM._L0522
                        CPI       _ACCA, 041h
                        BRLO      SYSTEM.Str2Ierr
                        CPI       _ACCA, 047h
                        BRSH      SYSTEM.Str2Ierr
                        SUBI      _ACCA, -9 AND 0FFh
SYSTEM._L0522:
                        ANDI      _ACCA, 00Fh
                        LDI       _ACCB, 4
SYSTEM._L0523:
                        LSL       _ACCBLO
                        ROL       _ACCBHI
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCB
                        BRNE      SYSTEM._L0523
                        OR        _ACCBLO, _ACCA
                        DEC       _ACCDHI
                        BRNE      SYSTEM._L0520
                        RJMP      SYSTEM.Str2Iex
SYSTEM.PosChInVarStr:
                        CLR       _ACCA
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0527
                        TST       _ACCELO
                        BRNE      SYSTEM._L0526
                        INC       _ACCELO
SYSTEM._L0526:
                        CP        _ACCBHI, _ACCELO
                        BRCS      SYSTEM._L0527
                        ADD       _ACCCLO, _ACCELO
                        ADC       _ACCCHI, _ACCA
                        DEC       _ACCELO
                        SUB       _ACCBHI, _ACCELO
                        MOV       _ACCA, _ACCELO
SYSTEM._L0528:
                        INC       _ACCA
                        LD        _ACCBLO, Z+
                        CP        _ACCB, _ACCBLO
                        BREQ      SYSTEM._L0527
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0528
                        CLR       _ACCA
SYSTEM._L0527:
                        RET


SYSTEM.UpperCaseStr:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0530
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0529:
                        LD        _ACCA, Z+
                        CPI       _ACCA, 061h
                        BRCS      SYSTEM._L0531
                        CPI       _ACCA, 07Bh
                        BRCC      SYSTEM._L0531
                        ANDI      _ACCA, 0DFh
SYSTEM._L0531:
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0529
SYSTEM._L0530:
                        RET


SYSTEM.StrCopyV:
                        TST       _ACCA
                        BREQ      SYSTEM._L0534
                        LD        _ACCBHI, Z
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0534
                        SUB       _ACCBHI, _ACCB
                        BRCS      SYSTEM._L0534
                        INC       _ACCBHI
                        CLR       _ACCBLO
                        ADD       _ACCCLO, _ACCB
                        ADC       _ACCCHI, _ACCBLO
                        CP        _ACCBHI, _ACCA
                        BRCS      SYSTEM._L0533
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0533:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0533
SYSTEM._L0534:
                        RET


SYSTEM.StrConst2Str:
                        LPM       _ACCBHI, Z+
                        TST       _ACCBHI
                        BREQ      SYSTEM._L0536
SYSTEM.StrConst2StrPart:
SYSTEM._L0535:
                        LPM      _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0535
SYSTEM._L0536:
                        RET


SYSTEM.StrVar2Str:
                        LD        _ACCA, Z+
                        TST       _ACCA
                        BREQ      SYSTEM._L0538
                        MOV       _ACCBHI, _ACCA
SYSTEM._L0537:
                        LD        _ACCA, Z+
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0537
SYSTEM._L0538:
                        RET


SYSTEM.Byte2Str:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        SBIW      _FRAMEPTR, 6
                        LDD       _ACCB, Y+9
                        CLR       _ACCA
                        MOVW      _ACCALO, _ACCB
                        ANDI      _ACCB, 0Fh
                        SWAP      _ACCALO
                        ANDI      _ACCALO, 0Fh
                        MOVW      _ACCELO, _ACCALO
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        MOVW      _ACCDLO, _ACCB
                        SUB       _ACCDLO, _ACCELO
                        SBC       _ACCDHI, _ACCEHI
                        SUBI      _ACCDLO, 20 AND 0FFh
                        SBCI      _ACCDHI, 0
                        STD       Y+0, _ACCDLO
                        STD       Y+1, _ACCDHI
                        MOVW      _ACCDLO, _ACCALO
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        SUBI      _ACCDLO, 38 AND 0FFh
                        SBCI      _ACCDHI, 0
                        STD       Y+2, _ACCDLO
                        STD       Y+3, _ACCDHI
                        LDI       _ACCDLO, 4
                        STD       Y+4, _ACCDLO
                        STD       Y+5, _ACCA
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCA, 2
                        LDD       R24, Z+0
                        LDD       R25, Z+1
                        LDD       R26, Z+2
                        LDD       R27, Z+3
SYSTEM._cv8_1:
                        TST       R25
                        BRPL      SYSTEM._cv8_2
                        ADIW      R24, 10
                        SBIW      R26, 1
                        RJMP      SYSTEM._cv8_1
SYSTEM._cv8_2:
                        ST        Z+, R24
                        ST        Z+, R25
                        MOVW      R24, R26
                        DEC       _ACCA
                        BREQ      SYSTEM._cv8_X
                        LDD       R26, Z+2
                        LDD       R27, Z+3
                        RJMP      SYSTEM._cv8_1
SYSTEM._cv8_X:
                        ST        Z+, R24
                        ST        Z+, R25
                        LDD       _ACCALO, Y+8
                        LDD       _ACCAHI, Y+7
                        LDD       _ACCDLO, Y+6
                        LDI       _ACCDHI, 3
                        LDI       _ACCFLO, 0
                        MOVW      _ACCCLO, _FRAMEPTR
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 10
                        RCALL     SYSTEM._B2STR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        RET

SYSTEM.Long2Str:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        SBIW      _FRAMEPTR, 28
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 20
                        MOVW      _ACCCLO, _FRAMEPTR
                        BST       Flags2, _F64StrInt
                        BRTS      SYSTEM._L0539
                        ADIW      ZL, 31
                        RJMP      SYSTEM._L0540
SYSTEM._L0539:
                        ADIW      ZL, 35
SYSTEM._L0540:
                        CLR       _ACCFLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._cv32_0
                        LDD       _ACCAHI, Z+3
                        TST       _ACCAHI
                        BRPL      SYSTEM._cv32_0
                        LDI       _ACCFLO, 2Dh
                        LDD       _ACCALO, Z+2
                        LDD       _ACCA, Z+1
                        LDD       _ACCB, Z+0
                        SUBI      _ACCB, 01h
                        SBCI      _ACCA, 00h
                        SBCI      _ACCALO, 00h
                        SBCI      _ACCAHI, 00h
                        COM       _ACCB
                        COM       _ACCA
                        COM       _ACCALO
                        COM       _ACCAHI
                        STD       Z+0, _ACCB
                        STD       Z+1, _ACCA
                        STD       Z+2, _ACCALO
                        STD       Z+3, _ACCAHI
SYSTEM._cv32_0:
                        BST       Flags, _NEGATIVE
                        BRTC      SYSTEM._L0541
                        LDI       _ACCFLO, 2Dh
SYSTEM._L0541:
                        LDI       _ACCALO, 4
                        PUSH      _ACCFLO
SYSTEM._cv32_LP:
                        LDD       _ACCB, Z+000h
                        ANDI      _ACCB, 0fh
                        ST        X+, _ACCB
                        LD        _ACCB, Z+
                        SWAP      _ACCB
                        ANDI      _ACCB, 0fh
                        ST        X+, _ACCB
                        DEC       _ACCALO
                        BRNE      SYSTEM._cv32_LP
                        LDI       _ACCBHI, 0
                        MOVW      _ACCCLO, _FRAMEPTR
                        ADIW      ZL, 20
                        LDD       _ACCELO, Z+1
                        LDI       _ACCEHI, 0
                        LDD       _ACCDLO, Z+2
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+3
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+4
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+5
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+6
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCDLO, Z+7
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCDLO, Z+0
                        CLR       _ACCDHI
                        SUB       _ACCDLO, _ACCELO
                        SBC       _ACCDHI, _ACCEHI
                        SUBI      _ACCDLO, 20 AND 0FFh
                        SBCI      _ACCDHI, 0
                        STD       Y+0, _ACCDLO
                        STD       Y+1, _ACCDHI
                        LDD       _ACCELO, Z+1
                        CLR       _ACCEHI
                        LDD       _ACCDLO, Z+6
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCALO, Z+2
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCBHI
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCDLO, Z+4
                        CLR       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCDHI
                        LDD       _ACCB, Z+5
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL8
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 428 AND 0FFh
                        SBCI      _ACCEHI, 428 SHRB 8
                        STD       Y+2, _ACCELO
                        STD       Y+3, _ACCEHI
                        LDD       _ACCELO, Z+2
                        CLR       _ACCEHI
                        LDD       _ACCDLO, Z+6
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCDLO, Z+3
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCBHI
                        LDD       _ACCB, Z+4
                        CLR       _ACCA
                        LDD       _ACCDLO, Z+5
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCBHI
                        RCALL     SYSTEM._MUL5
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCDLO, Z+7
                        CLR       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        LSL       _ACCDLO
                        ROL       _ACCDHI
                        ADD       _ACCELO, _ACCDLO
                        ADC       _ACCEHI, _ACCDHI
                        SUBI      _ACCELO, 287 AND 0FFh
                        SBCI      _ACCEHI, 287 SHRB 8
                        STD       Y+4, _ACCELO
                        STD       Y+5, _ACCEHI
                        LDD       _ACCELO, Z+3
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCB, Z+4
                        CLR       _ACCA
                        LDD       _ACCDLO, Z+7
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCBHI
                        RCALL     SYSTEM._MUL5
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+5
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL8
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL7
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 437 AND 0FFh
                        SBCI      _ACCEHI, 437 SHRB 8
                        STD       Y+6, _ACCELO
                        STD       Y+7, _ACCEHI
                        LDD       _ACCELO, Z+5
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCB, Z+4
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL7
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL3
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 303 AND 0FFh
                        SBCI      _ACCEHI, 303 SHRB 8
                        STD       Y+8, _ACCELO
                        STD       Y+9, _ACCEHI
                        LDD       _ACCELO, Z+7
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL7
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 165 AND 0FFh
                        SBCI      _ACCEHI, 165 SHRB 8
                        STD       Y+10, _ACCELO
                        STD       Y+11, _ACCEHI
                        LDD       _ACCELO, Z+5
                        CLR       _ACCEHI
                        LDD       _ACCB, Z+6
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL8
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 230 AND 0FFh
                        SBCI      _ACCEHI, 230 SHRB 8
                        STD       Y+12, _ACCELO
                        STD       Y+13, _ACCEHI
                        LDD       _ACCELO, Z+6
                        CLR       _ACCEHI
                        LDD       _ACCB, Z+7
                        CLR       _ACCA
                        RCALL     SYSTEM._MUL6
                        ADD       _ACCELO, _ACCB
                        ADC       _ACCEHI, _ACCA
                        SUBI      _ACCELO, 105 AND 0FFh
                        SBCI      _ACCEHI, 105 SHRB 8
                        STD       Y+14, _ACCELO
                        STD       Y+15, _ACCEHI
                        LDD       _ACCELO, Z+7
                        CLR       _ACCEHI
                        LSL       _ACCELO
                        ROL       _ACCEHI
                        SUBI      _ACCELO, 37 AND 0FFh
                        SBCI      _ACCEHI, 37 SHRB 8
                        STD       Y+16, _ACCELO
                        STD       Y+17, _ACCEHI
                        LDI       _ACCELO, 5
                        LDI       _ACCEHI, 0
                        STD       Y+18, _ACCELO
                        STD       Y+19, _ACCEHI
                        MOVW      _ACCCLO, _FRAMEPTR
                        LDI       _ACCA, 9
                        LDD       R24, Z+0
                        LDD       R25, Z+1
                        LDD       R26, Z+2
                        LDD       R27, Z+3
SYSTEM._cv32_1:
                        TST       R25
                        BRPL      SYSTEM._cv32_2
                        ADIW      R24, 10
                        SBIW      R26, 1
                        RJMP      SYSTEM._cv32_1
SYSTEM._cv32_2:
                        ST        Z+, R24
                        ST        Z+, R25
                        MOVW      R24, R26
                        DEC       _ACCA
                        BREQ      SYSTEM._cv32_X
                        LDD       R26, Z+2
                        LDD       R27, Z+3
                        RJMP      SYSTEM._cv32_1
SYSTEM._cv32_X:
                        ST        Z+, R24
                        ST        Z+, R25
                        POP       _ACCFLO
                        MOVW      _ACCCLO, _FRAMEPTR
                        MOVW      _ACCBLO, _FRAMEPTR
                        BST       Flags2, _F64StrInt
                        BRTC      SYSTEM._L0542
                        LDD       _ACCALO, Y+30
                        LDI       _ACCAHI, 0
                        LDD       _ACCDLO, Y+28
                        LDI       _ACCDHI, 10
                        ADIW      XL, 39
                        RJMP      SYSTEM._L0544
SYSTEM._L0542:
                        BST       Flags2, _F64StrFrac
                        BRTC      SYSTEM._L0543
                        LDI       _ACCALO, 9
                        LDI       _ACCAHI, 0
                        LDI       _ACCDLO, 30h
                        LDI       _ACCDHI, 10
                        ADIW      XL, 39
                        RJMP      SYSTEM._L0544
SYSTEM._L0543:
                        LDD       _ACCALO, Y+30
                        LDD       _ACCAHI, Y+29
                        LDD       _ACCDLO, Y+28
                        LDI       _ACCDHI, 10
                        ADIW      XL, 35
SYSTEM._L0544:
                        RCALL     SYSTEM._B2STR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        RET

SYSTEM._B2STR:
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        LD        _ACCA, X+
                        LD        _ACCB, X+
                        LD        _ACCELO, X+
                        MOVW      _ACCBLO, _ACCCLO
                        ST        -Y, _ACCELO
                        ST        -Y, _ACCB
                        ST        -Y, _ACCA
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_NM
                        TST       _ACCALO
                        BREQ       SYSTEM._B2STR_NM
                        DEC       _ACCALO
SYSTEM._B2STR_NM:
                        MOV       _ACCELO, _ACCDHI
                        MOV       _ACCEHI, _ACCDHI
                        LSL       _ACCEHI
                        DEC       _ACCEHI
                        CLR       _ACCB
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
SYSTEM._B2STR_0:
                        LD        _ACCA, -X
                        TST       _ACCA
                        BRNE       SYSTEM._B2STR_1
                        SBIW      XL, 1
                        DEC       _ACCELO
                        BRNE       SYSTEM._B2STR_0
SYSTEM._B2STR_1:
                        TST       _ACCELO
                        BRNE       SYSTEM._B2STR_2
                        ADIW      XL, 1
                        INC       _ACCELO
SYSTEM._B2STR_2:
                        ADIW      XL, 2
                        TST       _ACCAHI
                        BRNE       SYSTEM._B2STR_PNT
                        TST       _ACCALO
                        BREQ       SYSTEM._B2STR_3
                        RJMP       SYSTEM._B2STR_FILL
SYSTEM._B2STR_3:
                        RJMP       SYSTEM._B2STR_WR
SYSTEM._B2STR_PNT:
                        TST       _ACCALO
                        BREQ       SYSTEM._B2STR_PNTE0
                        DEC       _ACCALO
SYSTEM._B2STR_PNTE0:
                        CLR       _ACCB
                        MOVW      _ACCBLO, _ACCCLO
                        CP        _ACCAHI, _ACCDHI
                        BRCC       SYSTEM._B2STR_PNTGT
                        MOV       _ACCEHI, _ACCAHI
                        LSL       _ACCEHI
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
                        LDI       _ACCA, DECIMALSEP
                        ST        -X, _ACCA
                        CP        _ACCAHI, _ACCELO
                        BRCS       SYSTEM._B2STR_PNTE1
                        MOV       _ACCELO, _ACCAHI
                        INC       _ACCELO
SYSTEM._B2STR_PNTE1:
                        MOV       _ACCEHI, _ACCELO
                        LSL       _ACCEHI
                        MOVW      _ACCBLO, _ACCCLO
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
                        RJMP       SYSTEM._B2STR_FILL
SYSTEM._B2STR_PNTGT:
                        ADD       XL, _ACCEHI
                        ADC       XH, _ACCB
                        ADIW      XL, 1
                        MOV       _ACCEHI, _ACCAHI
                        ADDI      _ACCEHI, 2
                        CP        _ACCALO, _ACCEHI
                        BRCS       SYSTEM._B2STR_PNTG0
                        MOV       _ACCB, _ACCALO
                        SUB       _ACCB, _ACCEHI
                        INC       _ACCB
                        RJMP       SYSTEM._B2STR_PNTG1
SYSTEM._B2STR_PNTG0:
                        CLR       _ACCB
SYSTEM._B2STR_PNTG1:
                        MOV       _ACCALO, _ACCB
SYSTEM._B2STR_PNTG2:
                        TST       _ACCB
                        BREQ       SYSTEM._B2STR_PNTG3
                        MOV       _ACCA, _ACCDLO
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        RJMP       SYSTEM._B2STR_PNTG2
SYSTEM._B2STR_PNTG3:
                        MOV       _ACCEHI, _ACCAHI
                        SUB       _ACCEHI, _ACCDHI
                        MOV       _ACCELO, _ACCDHI
                        ADD       _ACCALO, _ACCEHI
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_PNTG4
                        MOV       _ACCA, _ACCFLO
                        CALL      SYSTEM.Char2Str
                        CLR       _ACCFLO
                        INC       _ACCALO
SYSTEM._B2STR_PNTG4:
                        ADDI      _ACCALO, 2
                        LDI       _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, DECIMALSEP
                        CALL      SYSTEM.Char2Str
                        LDI       _ACCA, 30h
SYSTEM._B2STR_PNTG5:
                        TST       _ACCEHI
                        BREQ       SYSTEM._B2STR_WR
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCEHI
                        RJMP       SYSTEM._B2STR_PNTG5
SYSTEM._B2STR_FILL:
                        CP        _ACCELO, _ACCALO
                        BRCS       SYSTEM._B2STR_F0
                        CLR       _ACCALO
                        RJMP       SYSTEM._B2STR_WR
SYSTEM._B2STR_F0:
                        SUB       _ACCALO, _ACCELO
                        MOV       _ACCB, _ACCALO
                        BST       Flags2, _F64StrFrac
                        BRTC      SYSTEM._B2STR_F1
                        LDD       _ACCELO, Y+32
SYSTEM._B2STR_F3:
                        CP        _ACCELO, _ACCB
                        BRCC      SYSTEM._L0545
                        SUB       _ACCB, _ACCELO
SYSTEM._L0545:
                        SUB       _ACCELO, _ACCB
                        STD       Y+32, _ACCELO
SYSTEM._B2STR_F1:
                        MOV       _ACCA, _ACCDLO
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCB
                        BRNE       SYSTEM._B2STR_F1
SYSTEM._B2STR_WR:
                        BST       Flags2, _F64StrFrac
                        BRTC      SYSTEM._L0546
                        LDD       _ACCELO, Y+32
SYSTEM._B2STR_F2:
                        TST       _ACCELO
                        BREQ       SYSTEM._B2STR_WR2
SYSTEM._L0546:
                        TST       _ACCFLO
                        BREQ       SYSTEM._B2STR_WR0
                        MOV       _ACCA, _ACCFLO
                        CALL      SYSTEM.Char2Str
SYSTEM._B2STR_WR0:
                        LD        _ACCA, -X
                        TST       _ACCA
                        BREQ       SYSTEM._B2STR_WR1
                        CALL      SYSTEM.Char2Str
SYSTEM._B2STR_WR1:
                        LD        _ACCA, -X
                        ORI       _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCELO
                        BRNE       SYSTEM._B2STR_WR0
SYSTEM._B2STR_WR2:
                        BST       Flags2, _F64StrInt
                        BRTC      SYSTEM._L0547
                        LDD       _ACCA, Y+32
SYSTEM._B2STR_F4:
                        TST       _ACCA
                        BREQ       SYSTEM._L0547
                        LDI       _ACCA, DECIMALSEP
                        CALL      SYSTEM.Char2Str
SYSTEM._L0547:
                        POP       _ACCBHI
                        POP       _ACCBLO
                        LDD        _ACCA, Y+0
                        ST         X+, _ACCA
                        LDD        _ACCA, Y+1
                        ST         X+, _ACCA
                        LDD        _ACCA, Y+2
                        ST         X+, _ACCA
                        RET

SYSTEM._MUL3:
                        MOVW      _ACCALO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        RET

SYSTEM._MUL5:
                        MOVW      _ACCALO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        RET

SYSTEM._MUL6:
                        LSL       _ACCB
                        ROL       _ACCA
                        MOVW      _ACCALO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        RET

SYSTEM._MUL7:
                        MOVW      _ACCALO, _ACCB
                        MOVW      _ACCDLO, _ACCB
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCALO
                        ROL       _ACCAHI
                        ADD       _ACCB, _ACCALO
                        ADC       _ACCA, _ACCAHI
                        ADD       _ACCB, _ACCDLO
                        ADC       _ACCA, _ACCDHI
                        RET

SYSTEM._MUL8:
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        LSL       _ACCB
                        ROL       _ACCA
                        RET


SYSTEM.Int2Str:
                        PUSH      _FRAMEPTR
                        PUSH      _FPTRHI
                        SBIW      _FRAMEPTR, 10
                        LDD       XL, Y+13
                        LDD       XH, Y+14
                        CLR       _ACCFLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._cv16_0
                        TST       XH
                        BRPL      SYSTEM._cv16_0
                        LDI       _ACCFLO, 2Dh
                        SUBI      XL, 01h
                        SBCI      XH, 00h
                        COM       XL
                        COM       XH
SYSTEM._cv16_0:
                        PUSH      _ACCFLO
                        mov       r24, XH
                        swap      r24
                        andi      r24, 0Fh
                        subi      r24, -0F0h and 0FFh
                        mov       r19, r24
                        add       r19, r24
                        subi      r24, -0E2h and 0ffh
                        mov       r18, r24
                        subi      r24, -32h and 0ffh
                        mov       r16, r24
                        mov       r24, XH
                        andi      r24, 0Fh
                        add       r18, r24
                        add       r18, r24
                        add       r16, r24
                        subi      r24, -0E9h and $ff
                        mov       r17, r24
                        add       r17, r24
                        add       r17, r24
                        mov       r24, XL
                        swap      r24
                        andi      r24, 0Fh
                        add       r17, r24
                        add       r16, r24
                        rol       r17
                        rol       r16
                        com       r16
                        clc
                        rol       r16
                        mov       r24, XL
                        andi      r24, 0Fh
                        add       r16, r24
                        rol       r19
                        ldi       r24, 07h
                        mov       r20, r24
                        ldi       r24, 0Ah
SYSTEM._cv16_1:
                        add       r16,r24
                        dec       r17
                        brcc      SYSTEM._cv16_1
SYSTEM._cv16_2:
                        add       r17, r24
                        dec       r18
                        brcc      SYSTEM._cv16_2
SYSTEM._cv16_3:
                        add       r18, r24
                        dec       r19
                        brcc      SYSTEM._cv16_3
SYSTEM._cv16_4:
                        add       r19, r24
                        dec       r20
                        brcc      SYSTEM._cv16_4
SYSTEM._cv16_5:
                        MOVW      _ACCBLO, _FRAMEPTR
                        clr       ZH
                        ldi       ZL, 16
                        ldi       r25, 5
                        ldi       r23, 0
SYSTEM._cv16_6:
                        ld        r24, Z+
                        st        X+, r24
                        st        X+, r23
                        dec       r25
                        brne      SYSTEM._cv16_6
                        LDD       _ACCALO, Y+12
                        LDD       _ACCAHI, Y+11
                        LDD       _ACCDLO, Y+10
                        LDI       _ACCDHI, 5
                        POP       _ACCFLO
                        MOVW      _ACCCLO, _FRAMEPTR
                        MOVW      _ACCBLO, _FRAMEPTR
                        ADIW      XL, 15
                        RCALL     SYSTEM._B2STR
                        POP       _FPTRHI
                        POP       _FRAMEPTR
                        RET


SYSTEM.StringComp:
                        LD        _ACCB, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0548
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0549
SYSTEM._L0548:
                        LPM       _ACCGLO, Z+
SYSTEM._L0549:
                        CP        _ACCB, _ACCGLO
                        BREQ      SYSTEM._L0550
                        CLZ
                        RET
SYSTEM._L0550:
                        TST       _ACCB
                        BRNE      SYSTEM._L0551
                        SEZ
                        RET
SYSTEM._L0551:
                        DEC       _ACCB
                        LD        _ACCA, X+
                        SBRC      FLAGS, _STRCONST
                        RJMP      SYSTEM._L0552
                        LD        _ACCGLO, Z+
                        RJMP      SYSTEM._L0553
SYSTEM._L0552:
                        LPM       _ACCGLO, Z+
SYSTEM._L0553:
                        CP        _ACCA, _ACCGLO
                        BREQ      SYSTEM._L0550
                        CLZ
                        RET


SYSTEM.Hex2Str8:
                        LDI       _ACCBHI, 2
SYSTEM._L0554:
                        SWAP      _ACCDLO
                        MOV       _ACCA, _ACCDLO
                        ANDI      _ACCA, 0Fh
                        CPI       _ACCA, 010
                        BRCS      SYSTEM._L0555
                        ADDI      _ACCA, 7
SYSTEM._L0555:
                        ADDI      _ACCA, 30h
                        CALL      SYSTEM.Char2Str
                        DEC       _ACCBHI
                        BRNE      SYSTEM._L0554
                        RET


SYSTEM.Char2Str:
                        PUSH      _ACCCLO
                        PUSH      _ACCCHI
                        BST       Flags, _DEVICE
                        BRTS      SYSTEM._L0560
                        PUSH      _ACCA
                        LDD       _ACCCLO, Y+001h
                        LDD       _ACCCHI, Y+002h
                        LDD       _ACCA, Y+000h
                        TST       _ACCA
                        BRNE      SYSTEM._L0557
                        POP       _ACCA
                        SET
                        BLD       Flags, _ERRFLAG
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0557:
                        DEC       _ACCA
                        STD       Y+000h, _ACCA
                        POP       _ACCA
                        BST       Flags, _EEPROM
                        BRTS      SYSTEM._L0558
                        ST        Z+, _ACCA
                        RJMP      SYSTEM._L0559
SYSTEM._L0558:
                        CALL      SYSTEM.WriteEEp8
                        ADIW      _ACCCLO, 01h
SYSTEM._L0559:
                        STD       Y+002h, _ACCCHI
                        STD       Y+001h, _ACCCLO
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET
SYSTEM._L0560:
                        LDD       _ACCCLO, Y+000h
                        LDD       _ACCCHI, Y+001h
                        PUSH      _ACCA
                        PUSH      _ACCB
                        PUSH      _ACCALO
                        PUSH      _ACCAHI
                        PUSH      _ACCBLO
                        PUSH      _ACCBHI
                        PUSH      _ACCELO
                        PUSH      _ACCEHI
                        PUSH      _ACCDLO
                        PUSH      _ACCDHI
                        PUSH      _ACCFLO
                        PUSH      _ACCFHI
                        ICALL
                        POP       _ACCFHI
                        POP       _ACCFLO
                        POP       _ACCDHI
                        POP       _ACCDLO
                        POP       _ACCEHI
                        POP       _ACCELO
                        POP       _ACCBHI
                        POP       _ACCBLO
                        POP       _ACCAHI
                        POP       _ACCALO
                        POP       _ACCB
                        POP       _ACCA
                        POP       _ACCCHI
                        POP       _ACCCLO
                        RET


SYSTEM.MUL16:
                        MOVW      _ACCALO, _ACCB
                        CLR       _ACCDLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM.MUL16_G
                        MOVW      _ACCELO, _ACCBLO
                        MULS      _ACCAHI, _ACCEHI
                        MOVW      _ACCCLO, _ACCGLO
                        MUL       _ACCALO, _ACCELO
                        MOVW      _ACCB, _ACCGLO
                        MULSU     _ACCAHI, _ACCELO
                        SBC       _ACCCHI, _ACCDLO
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        MULSU     _ACCEHI, _ACCALO
                        SBC       _ACCCHI, _ACCDLO
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        RET

SYSTEM.MUL16_G:
                        MUL       _ACCAHI, _ACCBHI
                        MOVW      _ACCCLO, _ACCGLO
                        MUL       _ACCALO, _ACCBLO
                        MOVW      _ACCB, _ACCGLO
                        MUL       _ACCAHI, _ACCBLO
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        MUL       _ACCALO, _ACCBHI
                        ADD       _ACCA, _ACCGLO
                        ADC       _ACCCLO, _ACCGHI
                        ADC       _ACCCHI, _ACCDLO
                        RET


SYSTEM.DIV16:
                        MOVW      _ACCALO, _ACCB
SYSTEM.DIV16_R:
                        CLR       _ACCDHI
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L0562
                        MOV       _ACCDHI, _ACCBHI
                        MOV       _ACCDLO, _ACCAHI
                        EOR       _ACCDLO, _ACCBHI
                        CLT
                        SBRS      _ACCDLO, 7
                        BLD       Flags, _SIGN
                        SBRS      _ACCAHI, 7
                        RJMP      SYSTEM._L0564
                        NEG       _ACCALO
                        BRNE      SYSTEM._L0565
                        DEC       _ACCAHI
SYSTEM._L0565:
                        COM       _ACCAHI
SYSTEM._L0564:
                        SBRS      _ACCBHI, 7
                        RJMP      SYSTEM._L0562
                        NEG       _ACCBLO
                        BRNE      SYSTEM._L0566
                        DEC       _ACCBHI
SYSTEM._L0566:
                        COM       _ACCBHI
SYSTEM._L0562:
                        CLR       _ACCCLO
                        SUB       _ACCCHI, _ACCCHI
                        LDI       _ACCA, 17
SYSTEM._L0567:
                        ROL       _ACCBLO
                        ROL       _ACCBHI
                        DEC       _ACCA
                        BRNE      SYSTEM._L0568
                        MOVW      _ACCB, _ACCBLO
                        BST       Flags, _SIGN
                        BRTC      SYSTEM._L0563
                        NEG       _ACCB
                        BRNE      SYSTEM._L0570
                        DEC       _ACCA
SYSTEM._L0570:
                        COM       _ACCA
SYSTEM._L0563:
                        RET
SYSTEM._L0568:
                        ROL       _ACCCLO
                        ROL       _ACCCHI
                        SUB       _ACCCLO, _ACCALO
                        SBC       _ACCCHI, _ACCAHI
                        BRCC      SYSTEM._L0569
                        ADD       _ACCCLO, _ACCALO
                        ADC       _ACCCHI, _ACCAHI
                        CLC
                        RJMP      SYSTEM._L0567
SYSTEM._L0569:
                        SEC
                        RJMP      SYSTEM._L0567


SYSTEM.SHL32:
                        TST       _ACCCLO
                        BREQ      SYSTEM._L0572
                        CPI       _ACCCLO, 20h
                        BRCS      SYSTEM._L0571
                        CLR       _ACCA
                        CLR       _ACCB
                        CLR       _ACCALO
                        CLR       _ACCAHI
                        RET
SYSTEM._L0571:
                        LSL       _ACCB
                        ROL       _ACCA
                        ROL       _ACCALO
                        ROL       _ACCAHI
                        DEC       _ACCCLO
                        BRNE      SYSTEM._L0571
SYSTEM._L0572:
                        RET


SYSTEM.High16i:
                        CP        _ACCA, _ACCBHI
                        BRLT      SYSTEM._L0573
                        BRNE      SYSTEM._L0574
                        CP        _ACCB, _ACCBLO
                        BRLO      SYSTEM._L0573
                        BRNE      SYSTEM._L0574
                        RJMP      SYSTEM._L0575
SYSTEM._L0573:
                        INC       _ACCDHI
                        BST       Flags, _NEGATIVE
                        BRTS      SYSTEM._L0576
                        MOVW      _ACCB, _ACCBLO
SYSTEM._L0576:
                        RJMP      SYSTEM._L0575
SYSTEM._L0574:
                        DEC       _ACCDHI
SYSTEM._L0575:
                        RET

SYSTEM.DefIntErr:
                        RETI


                        .ROMCONST $

                        ; ============ String-constant tables ============
                        .SYM      NoisePlayer.Vers1Str
NoisePlayer.Vers1Str:
                        .BYTE     30
                        .ASCII    "1.00 [NOISEPLAY by CM 11/2011]"

$St_String2:
                        .BYTE     3
                        .ASCII    "#0:"

$St_String3:
                        .BYTE     19
                        .ASCII    "-1 [XMODEM Timeout]"

$St_String4:
                        .BYTE     26
                        .ASCII    "-1 [XMODEM Checksum Error]"

$St_String5:
                        .BYTE     21
                        .ASCII    "-7 [DF Verify Error: "

$St_String6:
                        .BYTE     16
                        .ASCII    " Errors occured]"

$St_String7:
                        .BYTE     20
                        .ASCII    "-7 [DF Write Error: "

$St_String8:
                        .BYTE     23
                        .ASCII    "-6 [DF Protected Error]"

$St_String9:
                        .BYTE     24
                        .ASCII    "-4 [DF BlockErase Error]"

$St_String10:
                        .BYTE     23
                        .ASCII    "-3 [DF FullErase Error]"

$St_String11:
                        .BYTE     0


                        ; ============ array-constant tables ============
                        .SYM      NoisePlayer.ErrStrArr
NoisePlayer.ErrStrArr:
                        .BYTE     4
                        .ASCII    "[OK]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     5
                        .ASCII    "[USR]"
                        .BYTE     00h
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     6
                        .ASCII    "[BUSY]"
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     6
                        .ASCII    "[FILE]"
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     8
                        .ASCII    "[CMDERR]"

                        .BYTE     8
                        .ASCII    "[PARERR]"

                        .BYTE     8
                        .ASCII    "[LOCKED]"

                        .BYTE     8
                        .ASCII    "[CHKSUM]"

                        .BYTE     6
                        .ASCII    "[FPGA]"
                        .BYTE     00h
                        .BYTE     00h

                        .BYTE     7
                        .ASCII    "[DFERR]"
                        .BYTE     00h


                        .SYM      NoisePlayer.CmdStrArr
NoisePlayer.CmdStrArr:
                        .BYTE     3
                        .ASCII    "STR"

                        .BYTE     3
                        .ASCII    "IDN"

                        .BYTE     3
                        .ASCII    "SDB"

                        .BYTE     3
                        .ASCII    "SDL"

                        .BYTE     3
                        .ASCII    "SDE"

                        .BYTE     3
                        .ASCII    "PLY"

                        .BYTE     3
                        .ASCII    "STP"

                        .BYTE     3
                        .ASCII    "DFS"

                        .BYTE     3
                        .ASCII    "DFX"

                        .BYTE     3
                        .ASCII    "DFE"

                        .BYTE     3
                        .ASCII    "RST"

                        .BYTE     3
                        .ASCII    "WEN"

                        .BYTE     3
                        .ASCII    "ERC"

                        .BYTE     3
                        .ASCII    "SBD"

                        .BYTE     3
                        .ASCII    "REM"

                        .BYTE     3
                        .ASCII    "NOP"


                        .SYM      NoisePlayer.Cmd2SubChArr
NoisePlayer.Cmd2SubChArr:
                        .WORD     000FFh
                        .WORD     000FEh
                        .WORD     00000h
                        .WORD     0000Ah
                        .WORD     00014h
                        .WORD     0001Eh
                        .WORD     00028h
                        .WORD     026C0h
                        .WORD     026CAh
                        .WORD     026D4h
                        .WORD     0270Fh
                        .WORD     000FAh
                        .WORD     000FBh
                        .WORD     000FCh
                        .WORD     000FDh
                        .WORD     000FDh


                        ; ============ Fixed addr String-constant tables ============

                        ; ============ fixed addr array-constant tables ============

                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                        ; Reset and Interrupt vectors
                        ; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


                        .ENDCODE
SYSTEM.ENDCODE:
                        .ORG       000000h, VECTTAB
                        .VECTTAB
SYSTEM.VectTab:
                        JMP       SYSTEM.RESET
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.$INTERRUPT_TIMER0
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.$INTERRUPT_RXRDY
                        JMP       SYSTEM.$INTERRUPT_TXEMPTY
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr
                        JMP       SYSTEM.DefIntErr

                        .VECTTABE
SYSTEM.ENDPROG:

                        .END

                        ; ============ End of Program ============


                        ; System uses registers
                        ; from bottom     = 00000h
                        ; upto            = 00006h
                        ; and
                        ; from            = 00010h
                        ; upto            = 0001Fh
                        ;
                        ; Stackframe at   = ...0046Bh


                        ; ===== Current top of User Vars in Data is 0000Ch =====

                        ; ===== Current top of User Vars in IData is 004ABh =====

                        ; ===== Current top of User Vars in EEprom is 0005Fh =====


                        ; ===== Imported Library Routines =====

                        ; Multiply     word MUL16
                        ; Divide       word DIV16
                        ; Higher int
                        ; LongWord and LongInt types
                        ; Shift  left  long SHL32
                        ; Convert to hex string HexStr
                        ; Convert byte to string
                        ; Convert int to string
                        ; Convert long to string
                        ; Convert string to int
                        ; String compare
                        ; Copy partial String
                        ; EEprom read
                        ; EEprom write

                        ; Pascal Statements : 485
                        ; Assembler Lines   : 16890
                        ; Optimizer removed : 400 lines = 800Bytes

                        ; >> real SysTick (exact): 2.000 msec <<

