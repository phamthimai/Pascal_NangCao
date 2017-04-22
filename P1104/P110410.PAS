Program P110410;   {Tao danh sach ke cua do thi}
Uses  Crt;
Const MN=100;
      fn='P110410.INP';
      gn='P110410.OUT';
Type  mang2=array [1..MN,1..MN] of byte;
Var   a: mang2;
      n: integer;
      f,g: text;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do
   For j:=1 to n do Read(f,a[i,j]);
 Close(f);
End;

Procedure Viet;
Var i,j: integer;
Begin
 Assign(g,gn); Rewrite(g);
 Writeln(g,n,' : ');
 For i:=1 to n do
 begin
   For j:=1 to n do
     If a[i,j]=1 then Write(g,j,' ');
   Writeln(g);
 end;
 Close(g);
End;

BEGIN
 ClrScr;
 Nhap;
 Viet;
END.