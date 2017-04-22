Program  P110405;   {Tao ma tran ke cua do thi}
Uses  Crt;
Const gn='P110405.TXT';
      MN=64;
      huong: array [1..8,1..2] of integer =
      ((-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1));
Type  mang2=array [1..MN,1..MN] of byte;
Var   a: mang2;
      g: text;

Procedure Tinh(m,n: integer);
Var i: integer;
Begin
 For i:=1 to 8 do
   If (m+huong[i,1]>0)and(m+huong[i,1]<=8) then
     If (n+huong[i,2]>0)and(n+huong[i,2]<=8) then
       a[(m-1)*8+n,(m+huong[i,1]-1)*8+n+huong[i,2]]:=1;
End;

Procedure Xuly;
Var i,j: integer;
Begin
 Assign(g,gn); Rewrite(g);
 FillChar(a,Sizeof(a),0);
 For i:=1 to 8 do
   For j:=1 to 8 do Tinh(i,j);
 For i:=1 to 64 do
 begin
   For j:=1 to 64 do Write(g,a[i,j]:2); Writeln(g);
 end;
 Readln;
 Close(g);
End;

BEGIN
 Clrscr;
 Xuly;
END.