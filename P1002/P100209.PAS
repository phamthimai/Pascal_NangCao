Program P100209; {Tinh luong mua trung binh tai Hanoi}
Uses Crt;
Const n = 50;
Var  A: array[1..n] of real;
     s,x: real;
     i: integer;
     f: text;

BEGIN
 Clrscr;
 Assign(f,'P10/P100209.INP'); Reset(f);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
 x:=0;
 For i:=1 to n do x:=x+a[i];
 x:=x/n;
 s:=0;
 For i:=1 to n do s:=s+sqr(a[i]-x);
 s:=sqrt(s)/(n-1);
 Writeln('Luong mua trung binh hang nam tai Hanoi la: ',x:10:2);
 Writeln('                                 Sai so la: ',s:10:2);
 Readln;
END.