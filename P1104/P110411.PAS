Program P110411; {Tao ma tran ke cua do thi}
Uses  Crt;
Const MN=100;
      fn='P110411.INP';
      gn='P110411.OUT';
Type  mang2=array [1..MN,1..MN] of byte;
Var   a: mang2;
      n: integer;
      f,g: text;

Procedure Viet;
Var i,j: integer;
Begin
 Assign(g,gn); Rewrite(g);
 Writeln(g,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(g,a[i,j]:2);
   Writeln(g);
 end;
 Close(g);
End;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 FillChar(a,SizeOf(a),0);
 For i:=1 to n do
 begin
   While not SeekEoln(f) do
   begin
     Read(f,j); a[i,j]:=1;
   end;
   Readln(f);
 end;
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Viet;
END.