
{###########################################################################}
// gemeinsame Prozeduren für alle HOAX-Versionen
// Seriell, XMODEM, AutoInc
{###########################################################################}

//allg. Menü-Prozeduren
procedure SerCRLF;
begin
  serout(#$0D);
  serout(#$0A);
end;

{$IFDEF ATMEGA168}
procedure WriteChPrefix;
begin
  write(serout,'#0:');
  write(serout, IntToStr(SubCh));
  serout('=');
end;

procedure WriteSerInp;
begin
  write(serout, SerInpStr);   // Befehl weiterreichen
  SerCRLF;
end;

procedure SerPrompt(myErr : tError);
var myFault, myStatus: byte;
//Error-Meldung und Status-Request-Antwort,
//Status Bit 7=Busy, 6=UserSRQ, 5=OverLoad, 4=WriteEnable, 3..0=Fault/Error
begin
  SubCh:= ErrSubCh; // Fehler-Kanal
  WriteChPrefix;
  write(serout, ByteToStr(myErr));
  serout(#32);
  write(serout, ErrStrArr[ord(myErr)]);
  SerCRLF;
end;


{###########################################################################}
//Ausgabe-Prozeduren

procedure WriteParamStrSer;
begin
  WriteChPrefix;
  write(serout, ParamStr);
  SerCRLF;
end;

procedure WriteParamLongSer;
begin
  if BinaryMode then
    serout(#6);  // ACK
    serout(#0);  // ERROR
    serout(hi(ParamInt));  // MSB
    serout(lo(ParamInt));  // LSB
  else
    ParamStr:= LongToStr(ParamLong);
    WriteParamStrSer;
  endif;
end;

procedure WriteParamIntSer;
begin
  ParamLong:= LongInt(ParamInt);
  WriteParamLongSer;
end;

procedure WriteParamByteSer;
begin
  ParamInt:= Integer(Parambyte);
  WriteParamIntSer;
end;

procedure WriteParamLongSerHex;    // für verbose-Anfrage
begin
  WriteChPrefix;
  ParamStr:= LongToStr(ParamLong);
  write(serout, ParamStr);
  serout(#32);
  serout('[');
  serout('$');
  ParamStr:= LongToHex(ParamLong);
  write(serout, ParamStr);
  serout(']');
  SerCRLF;
end;

{$ELSE}

// Simpelst-Parser
procedure SerPrompt;
begin
  serout(#$0D);
  serout(#$0A);
  serout('>');
end;

procedure WriteChPrefix;
begin
  serout(#$0D);
  serout(#$0A);
end;

{$ENDIF}

{###########################################################################}
procedure XModemRxToDF(my_start : LongInt);
// Empfang von Daten über vereinfachtes XMODEM-Chksum-Protokoll 128 Bytes
// Speichert XMODEM-blockweise (128 Bytes Nutzdaten) in DataFlash
// DataFlash muss leer und unprotected sein!

var hdrstart, blk, nblk, chk, chkx, chkv: byte; mytimeout, mytry : word;
  gotSOH, serok    : boolean;
  df_adr         : LongInt;
  WriteErrCount, VerifyErrCount: word;
begin
  FlushBuffer(RxBuffer);
  gotSOH:= false;

  hdrstart:= 0;
  chk:= 0;
  chkx:= 255;
  byteCount:= 0;
  mytry:= 0;
  VerifyErrCount:= 0;
  WriteErrCount:= 0;
  df_adr:= my_start;
  repeat
    if not gotSOH then
      mytry:= 0;
      repeat
        gotSOH:= serinp_to(hdrstart, 50); // auf Block-SOH oder EOT warten
        if gotSOH then
          if (hdrstart = 1) or (hdrstart = 4) then
            mytry:= 21;
          endif;
        else
          serout($15);  // NAK senden
          inc(mytry);
        endif;
      until mytry > 20;
    endif;
    mytry:= 0;
    if (hdrstart = 1) then // SOH Start of Header
      serok:= serinp_to(blk, 100);
      serok:= serinp_to(nblk, 50);
      if (255 - blk = nblk) then         //  (255 - blk = nblk)
        chk:= 0;
        for i:= 0 to 127 do
          serok:= serinp_to(m, 50);
          chk:= chk + m;
          settable(BlockTable, i, m);
        endfor;
        serok:= serinp_to(chkx, 50);


        if not DFwriteblock(df_adr, 128) then  // hier wg. XMODEM nur ein halber Block
          inc(WriteErrCount);
        endif;

// verify Block
        DFreadblock(df_adr, 128, true);  // to VerifyBlock
        for i:= 0 to 127 do
          if gettable(VerifyTable, i) <> gettable(BlockTable, i) then
            inc(VerifyErrCount);
          endif;
        endfor;

        df_adr:= df_adr + 128;
        byteCount:= byteCount + 128;


        if chk = chkx then
          serout(#$06); // ACK
        else
          inc(mytry);
          serout(#$15); // NAK
        endif;
      endif;
      hdrstart:= 0;
    endif;
    gotSOH:= false;
  until (hdrstart = $04) or (mytry > 5);
  serout(#$0D);  // CR
  serok:= serinp_to(hdrstart, 50);
  serout(#$06);  // ACK
  ParamLong:= byteCount;
  if mytry > 5 then
    ParamLong:= - 1;
    WriteChPrefix;
    writeln(serout, '-1 [XMODEM Timeout]');
  endif;
  if  chkx <> chk then
    ParamLong:= - 1;
    WriteChPrefix;
    writeln(serout, '-1 [XMODEM Checksum Error]');
  endif;
  if VerifyErrCount <> 0 then
    ParamLong:= - 1;
    WriteChPrefix;
    write(serout, '-7 [DF Verify Error: ');
    write(serout, IntToStr(VerifyErrCount));
    writeln(serout, ' Errors occured]');
  endif;
  if WriteErrCount <> 0 then
    ParamLong:= - 1;
    WriteChPrefix;
    write(serout, '-7 [DF Write Error: ');
    write(serout, IntToStr(WriteErrCount));
    writeln(serout, ' Errors occured]');
  endif;
end;

{###########################################################################}


