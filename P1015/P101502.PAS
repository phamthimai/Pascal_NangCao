Program P101502; {so Fibonaci}
Uses Crt;
Var  n:integer;

Function Fibo(k: integer): longint;
Begin
 If (k=1)or(k=2) then Fibo:=1
 Else Fibo:=Fibo(k-2)+Fibo(k-1);
End;

BEGIN
 ClrScr;
 Writeln('Chuong trinh tim so Fibonaci thu N (N khong qua 30).');
 Write('N = '); Readln(n);
 Writeln('So Fibonaci thu ',n,' : ',Fibo(n));
 Readln;
END.