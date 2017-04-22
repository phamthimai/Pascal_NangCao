Program P101507;  {Tinh Uoc so chung lon nhat}
Uses Crt;
Var  m,n: longint;

Function USC(a,b: longint): longint;
Begin
 If b=0 then USC:=a
 Else USC:=USC(b,a mod b);
End;

BEGIN
 Clrscr;
 Write('Cho M = '); Readln(m);
 Write('Cho N = '); Readln(n);
 Writeln('USCLN cua ',m,' va ',n,' : ',USC(m,n));
 Readln;
END.