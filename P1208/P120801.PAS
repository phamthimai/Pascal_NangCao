{Chuong trinh chay voi file inp nho hon 55000 byte}
Program P120801;
Uses  Crt;
Const MN = 60000;
      fn = 'P1208\P120801.inp';
      gn = 'P120801.out';
Type  mang1 = array[1..MN] of char;
Var   a  : mang1;
      sa : word;
      f,g: text;

Procedure Doc;
Var c: char;
Begin
 Assign(f,fn); Reset(f);
 sa:=0;
 While not Eof(f) do
 begin
   While not Eoln(f) do
   begin
     Read(f,c);
     If (c='#')and(sa>0) then Dec(sa)
     Else If c<>'#' then begin Inc(sa); a[sa]:=c; end;
   end;
   Readln(f);
 end;
 Close(f);
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 For i:=1 to sa do
 begin
   Write(g,a[i]);
   If i mod 60=0 then Writeln(g);
 end;
 Readln;
 Close(g);
End;

BEGIN
 ClrScr;
 Doc;
 Viet;
END.
