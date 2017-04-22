Program P101501; {giai thua}
Var  n: byte;

Function Factorial(m: byte): longint;
Begin
 If (m<=1) then Factorial:=1
 Else Factorial:=m*Factorial(m-1);
End;

BEGIN
 Write('Nhap so n: '); Readln(n);
 Write('   n! = ',Factorial(n));
 Readln;
END.