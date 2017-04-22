Program P111508;    {quay lui: liet ke hoan vi}   {Khong thuocbai 11\15}
Uses Crt;
Var
 n: byte;
 b: array[1..100] of byte;

Procedure Result;
Var i: byte;
Begin
  For i:=1 to n do Write(b[i]:3); Writeln;
End;

Function Trung(i,j:byte): boolean;
Var k: byte;
Begin
  trung:=false;
  For k:=1 to i-1 do If b[k]=j then trung:=true;
End;

Procedure Try(i: integer);
Var j: byte;
Begin
  For j:=1 to n do
    If not trung(i,j) then
    begin
      b[i]:=j;
      If i=n then Result Else Try(i+1);
    end;
End;

BEGIN
ClrScr;
 Write('Nhap n: '); Readln(n);
 Try(1);
 Readln;
END.










