{###########################################################################}

// DataFlash-Funktionen

procedure DF_sr;
// Sende/empfange ein Byte über SPI an DF (F_DataFlash muss entspr. gesetzt sein)
begin
  asm;
    lds    _ACCA, NoisePlayer.DF_send
    out    SPDR, _ACCA    ; SPI von FAT16-Treiber eingeschaltet!
  DF_waitReg:
    in     _ACCA, SPSR    ; Flag hier über Akku - andere Adresse als mega8/16/32!
    sbrs   _ACCA, 7
    rjmp   DF_waitReg     ; auf Ende des SPI-Transfer warten
    in     _ACCA, SPDR
    sts    NoisePlayer.DF_receive, _ACCA  ; Lesewert zurück ins Datenbyte
  endasm;
end;

function DF_status: byte;
// Lese DF Status; normal $1C = 28 dez. = %0001 1100
begin
  F_DataFlash:= low;
  DF_send:=$05; // Read Status
  DF_sr;
  DF_sr;
  F_DataFlash:= high;
  return(DF_receive);
end;

procedure DF_busy;
// Warte, bis DF nicht mehr beschäftigt ist
begin
  F_DataFlash:= low;
  DF_send:=$05; // Read Status
  DF_sr;
  repeat
    DF_sr;
  until (DF_receive AND $01) = 0;
  F_DataFlash:= high;
end;

procedure DF_wen;
// Setze DF Write Enable
begin
  F_DataFlash:= low;
  DF_send:=$06; // Write Enable
  DF_sr;
  F_DataFlash:= high;
end;

procedure DF_unprotect;
// DataFlash freigeben, Global unprotect
begin
  DF_wen;
  F_DataFlash:= low;
  DF_send:=$01; // Write Status
  DF_sr;
  DF_send:=$00; // Write 0, Global Unprotect
  DF_sr;
  F_DataFlash:= high;
  DF_busy;
end;

procedure DF_protect;
// DataFlash sperren
begin
  DF_wen;
  F_DataFlash:= low;
  DF_send:=$01; // Write Status
  DF_sr;
  DF_send:=$3F; // Write $3F, Global Protect
  DF_sr;
  F_DataFlash:= high;
  DF_busy;
end;

function DFeraseBlock(df_adr: LongInt): boolean;
// Lösche 4-KByte-Block bzw. 64-KByte-Sektor im DF
// liefert TRUE wenn erfolgreich
begin
  DF_wen;
  F_DataFlash:= low;
  DF_long := df_adr;
{$IFDEF GODIL}
  DF_send:=$D8; // Erase 64 KByte Sector
{$ELSE}
  DF_send:=$20; // Erase 4 KByte Block
{$ENDIF}
  DF_sr;
  DF_send:=DF_long2; // Adr Bits 23..16
  DF_sr;
  DF_send:=DF_long1; // Adr Bits 15..8
  DF_sr;
  DF_send:=DF_long0; // Adr Bits 7..0
  DF_sr;
  F_DataFlash:= high;
  DF_busy;
  ConfErr := (DF_receive AND $20) <> 0;
  return (not ConfErr);
end;

function DF_erase: boolean;
// DataFlash löschen, warten bis Ende
// liefert TRUE wenn erfolgreich
begin
  DF_wen;
  F_DataFlash:= low;
  DF_send:= $C7; // Chip/Bulk Erase
  DF_sr;
  F_DataFlash:= high;
  DF_busy;
  ConfErr := (DF_receive AND $20) <> 0;
  return (not ConfErr);
end;

function DFwriteblock(df_adr: LongInt; df_count: word): boolean;
// Sende BlockArray mit (df_count) Bytes an DataFlash
// liefert TRUE wenn erfolgreich
var mycount: byte;
begin
  mycount:=byte(df_count-1);
  DF_wen;
  F_DataFlash:= low;
  DF_long := df_adr;
  DF_send:=$02; // Write Page
  DF_sr;
  DF_send:=DF_long2; // Adr Bits 23..16
  DF_sr;
  DF_send:=DF_long1; // Adr Bits 15..8
  DF_sr;
  DF_send:=DF_long0; // Adr Bits 7..0
  DF_sr;
  for h := 0 to (mycount) do
    DF_send:=gettable(BlockTable,h); // Data Byte h
    DF_sr;
  endfor;
  F_DataFlash:= high;
  DF_busy;
  ConfErr := (DF_receive AND $20) <> 0;
  return (not ConfErr);
end;

procedure DFreadblock(df_adr: LongInt; df_count: word; to_verify: Boolean);
var mycount: byte;
//Lese BlockArray aus DataFlash
begin
  DF_busy;
  mycount:=byte(df_count-1);
  DF_long := df_adr;
  F_DataFlash:= low;
  DF_send:=$0B; // Read Page
  DF_sr;
  DF_send:=DF_long2; // Adr Bits 23..16
  DF_sr;
  DF_send:=DF_long1; // Adr Bits 15..8
  DF_sr;
  DF_send:=DF_long0; // Adr Bits 7..0
  DF_sr;
  DF_send:=0; // dummy für $0B read mode
  DF_sr;
  for h := 0 to mycount do
    DF_sr;
    if to_verify then
      settable(VerifyTable,h,DF_receive); // Data Byte h
    else
      settable(BlockTable,h,DF_receive); // Data Byte h
    endif;
  endfor;
  F_DataFlash:= high;
end;

procedure DFsetReadAddr;
//Setze Lese-Adresse in DF_long, DF-/CS bleibt enabled
begin
  F_DataFlash:= high;
  nop;
  F_DataFlash:= low;
  DF_send:=$03; // Read Array slow
  DF_sr;
  DF_send:=DF_long2; // Adr Bits 23..16
  DF_sr;
  DF_send:=DF_long1; // Adr Bits 15..8
  DF_sr;
  DF_send:=DF_long0; // Adr Bits 7..0
  DF_sr;
end;



{###########################################################################}


