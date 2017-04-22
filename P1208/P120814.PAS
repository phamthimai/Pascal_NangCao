Program P120814;
{Xoa mot so trong tap hop so de no thanh so tot}
Uses  Crt;
Const MN = 5002;
      fn = 'P1208\P120814.inp';
      gn = 'P120814.out';
Type  mang1  = array [-1..MN] of byte;
      mang1i = array [-1..MN] of integer;
Var   so         : mang1;
      tl,pl,tc,pc: mang1i;
      soxoa,sl   : integer;
      f,g        : text;

Procedure Nhap;
Var s: string; i: integer;
Begin
 Assign(f,fn); Reset(f);
 sl:=0;
 While not Eof(f) do
 begin
   Readln(f,s);
   For i:=1 to length(s) do
   begin
     Inc(sl); so[sl]:=ord(s[i])-ord('0');
   end;
 end;
 Close(f);
End;

Procedure Init;
Begin
 FillChar(tl,SizeOf(tl),0);
 tc:=tl; pc:=tl; pl:=tl;
End;

Procedure Traiphai;
Var i: integer;
Begin
 For i:=1 to sl do
 begin
   tl[i]:=tl[i-2]; tc[i]:=tc[i-2];
   If so[i] mod 2=1 then Inc(tl[i]) Else Inc(tc[i]);
 end;
End;

Procedure Phaitrai;
Var i: integer;
Begin
 For i:=sl downto 1 do
 begin
   pl[i]:=pl[i+2]; pc[i]:=pc[i+2];
   If so[i] mod 2=1 then Inc(pl[i]) Else Inc(pc[i]);
 end;
End;

Procedure Tim;
Var  i: integer;
Begin
 soxoa:=0;
 For i:=1 to sl do
   If tc[i-1]+pc[i+2]=tc[i-2]+pc[i+1] then
     If tl[i-1]+pl[i+2]=tl[i-2]+pl[i+1] then
       begin soxoa:=i; exit; end;
End;

Procedure Xuly;
Begin
 Traiphai;
 Phaitrai;
 Tim;
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 If Soxoa=0 then Write(g,'vo nghiem')
 Else
 begin
   For i:=1 to sl do
   begin
     Write(g,so[i]);
     If i mod 60=0 then Writeln(g);
   end;
   Writeln(g);
   Writeln(g,'So xoa : ',soxoa);
   For i:=1 to soxoa-1 do
   begin
     Write(g,so[i]);
     If i mod 60=0 then Writeln(g);
   end;
   For i:=Soxoa+1 to sl do
   begin
     Write(g,so[i]);
     If i mod 60=0 then Writeln(g);
   end;
 end;
 Close(g);
End;

BEGIN
 Clrscr;
 Nhap;
 Init;
 Xuly;
 Viet;
END.
