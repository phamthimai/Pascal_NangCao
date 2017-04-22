Program P101510;    {quay lui: liet ke so}
Var n: byte;
    b: array [1..10] of byte;

Procedure In_Ketqua;
Var i: byte;
Begin
  For i:=1 to n do Write(b[i]); Writeln;
End;

Procedure Vong_For(i: integer);
Var j: byte;
Begin
  For j:=1 to 4 do
  begin
    b[i]:=j;
    If i<n then Vong_For(i+1) else In_Ketqua ;
  end;
End;

BEGIN
 Write('Nhap n: '); Readln(n);
 Vong_For(1);
 Readln;
END.
