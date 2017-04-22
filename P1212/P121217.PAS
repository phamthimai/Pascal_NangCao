Program P121217;  {To mau luoi cac o}
Uses  Crt;
Const fn = 'P1212\XANHDO.INP';
      fg = 'XANHDO.OUT';
      max= 100; blue=2; red=3;
Var   m,n: integer;
      a  : array [1..max,1..max] of byte;
      tongh,tongc: array [1..max] of integer;

Procedure Nhap;
Var f: text; i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]);
 end;
 Close(f);
End;

Procedure Chuanbi;
Begin
 FillChar(tongh,SizeOf(tongh),0);
 FillChar(tongc,SizeOf(tongc),0);
End;

Procedure Tinhtong;
Var i,j: integer;
Begin
 For i:=1 to m do
   For j:=1 to n do
   begin
     Inc(tongh[i],a[i,j]);
     Inc(tongc[j],a[i,j]);
   end;
End;

Procedure Tomauhang(i: integer); forward;
Procedure Tomaucot(j: integer);
Var i: integer;
Begin
 If tongc[j]=0 then exit;
 For i:=1 to m do
   If a[i,j]=1 then
   begin
     a[i,j]:=red;
     Dec(tongh[i]);
     Dec(tongc[j]);
     tomauhang(i);
     exit;
   end;
End;

Procedure Tomauhang(i: integer);
Var j: integer;
Begin
 If tongh[i]=0 then exit;
 For j:=1 to n do
   If a[i,j]=1 then
   begin
     a[i,j]:=blue;
     Dec(tongh[i]);
     Dec(tongc[j]);
     tomaucot(j);
     exit;
   end;
End;

Procedure Tomaucacdinhle;
Var i,j: integer;
Begin
 For i:=1 to m do
   If tongh[i] mod 2=1 then tomauhang(i);
 For j:=1 to n do
   If tongc[j] mod 2=1 then tomaucot(j);
End;

Procedure Tomaucaccanhnot;
Var i: integer;
Begin
 For i:=1 to m do
   While tongh[i]<>0 do tomauhang(i);
End;

Procedure Ghinhan;
Var f: text; i,j: integer;
Begin
 Assign(f,fg); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do
     Case a[i,j] of
       0  : Write(f,0,' ');
       2,3: Write(f,a[i,j]-1,' ');
     End;
   Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Tinhtong;
 Tomaucacdinhle;
 Tomaucaccanhnot;
 Ghinhan;
END.