Program P111513;    {quay lui: liet ke to hop lap}
Uses Crt;
Var
 m,n: byte;
 b: array[0..100] of byte;

Procedure Result;
Var i: byte;
Begin
  For i:=1 to m do Write(b[i]:3); Writeln;
End;

Procedure Try(i: integer);
Var j: byte;
Begin
  For j:=b[i-1]+1 to n-m+i do
  begin
    b[i]:=j;
    if i=m then Result Else Try(i+1);
  end;
End;

BEGIN
ClrScr;
 Write('Nhap n,m: '); Readln(n,m);
 Try(1);
 Readln;
END.
