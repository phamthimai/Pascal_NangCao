Program P101504;  {so lan chuyen dia trong Thap Hanoi}
Uses Crt;
Var  n:byte;
     s_nam,s_chuyen: real;

Function Thap(n: byte): real;
Begin
 If n=1 then thap:=1
 Else thap:=2*thap(n-1)+1;
End;

BEGIN
 Clrscr;
 Write('Cho so dia (khong qua 64) trong bai toan Thap Ha Noi: ');
 Readln(n);
 s_chuyen:=thap(n);
 Writeln('So lan chuyen dia: ',s_chuyen:0:0);
 s_nam:=s_chuyen/60/60/24/365;
 Writeln('So nam can de chuyen ',n,' dia: ',s_nam:0:2);
 Readln;
END.