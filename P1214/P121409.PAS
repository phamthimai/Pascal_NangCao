Program P121409; {Danh so vao luoi o vuong}
Uses  Crt;
Const Out='KQ.txt';
      MNmax=150;
Var   f: text;
      m,n: integer;
      a  : array [0..MNmax,0..MNmax] of integer;

Procedure Nhap;
Begin
 Write('So hang M = '); Readln(m); Dec(m);
 Write('So cot  N = '); Readln(n); Dec(n);
End;

Procedure GhiSo;
Var i,j: integer;
Begin
 For i:=0 to m do
   For j:=0 to n do a[i,j]:=i xor j;
End;

Procedure InKq;
Var i,j: integer;
Begin
 Assign(f,Out); Rewrite(f);
 For i:=m downto 0 do
 begin
   For j:=0 to n do Write(f,a[i,j]:4);
   Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 GhiSo;
 InKq;
END.