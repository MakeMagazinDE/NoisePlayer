{###########################################################################}

// gerätespezifischer Parser-Teil
procedure ParseGetParam;
var
    myByte:byte;
    myIndex:Byte;

begin
  myIndex:=byte(SubCh mod 10);  // angespr. Register 0..9 errechnen aus SubCh-Rest
  case SubCh of
    0..7: // Wavestart
      ParamLong:= WaveStartArray[myIndex];
      WriteParamLongSerHex;
      |
    10..17: // LoopStart
      ParamLong:= WaveLoopArray[myIndex];
      WriteParamLongSerHex;
      |
    20..27: // LoopEnd
      ParamLong:= WaveEndArray[myIndex];
      WriteParamLongSerHex;
      |
    30: // Params
      ParamLong:= DF_long;
      WriteParamLongSerHex;
      |
    31: // Params
      ParamLong:= WaveLoop;
      WriteParamLongSerHex;
      |
    32: // Params
      ParamLong:= WaveEnd;
      WriteParamLongSerHex;
      |
    33: // Params
      Parambyte:= wavesel;
      WriteParamByteSer;
      |
    34: // Params
      Parambyte:= PinC;
      WriteParamByteSer;
      |
    251: // Fehlerzähler auslesen
      ParamInt:= Errcount;
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
      SerCRLF;
      |
    255: // Status
      serprompt(NoErr);
      |
    9920: // DFS? DataFlash Command Status Read
      Parambyte:=DF_status;
      WriteParamByteSer;
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
    0..7:
      WaveStartArray[myIndex]:= ParamLong;
      EEWaveStartArray[myIndex]:= ParamLong;
      DF_long:=ParamLong;
      |
    10..17:
      WaveLoopArray[myIndex]:= ParamLong;
      EEWaveLoopArray[myIndex]:= ParamLong;
      WaveLoop:=ParamLong;
      DF_long:=WaveLoop;
      |
    20..27:
      WaveEndArray[myIndex]:= ParamLong;
      EEWaveEndArray[myIndex]:= ParamLong;
      WaveEnd:=ParamLong;
      DF_long:=WaveEnd;
      |
    9920: // DFS=0/1 DataFlash Command (un)protect
      if ParamByte = 0 then
        DF_unprotect;
      else
        DF_protect;
      endif;
      |
    9930, 9931: // DFX=0 Dataflash XMODEM Receive (Configuration)
          // mit x: Blocknummer absolut, je 4096 Bytes
      if not DF_checkprotected then
        ParamLong:=ParamLong shl 12; // x 4096
        XModemRxToDF(ParamLong);
        if ParamLong<0 then
          ConfErr:=true;
        else
          mdelay(100);
          WriteParamLongSerHex;
        endif;
      endif;
      |
    9940, 9941: // DFE 0=x DataFlash Command Block Erase, absolute Blocknummer
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

