Program P100109;  {Tinh dinh thuc cap 3}
Uses Crt;
Var  a,b,c,d,e,f,g,h,i,s: integer;
BEGIN
 Clrscr;
 Writeln('Nhap mot ma tran cap ba:');
 Readln(a,b,c);
 Readln(d,e,f);
 Readln(g,h,i);
 s:=a*e*i+b*f*g+c*h*d-g*e*c-d*b*i-a*h*f;
 Writeln('Dinh thuc cua ma tran bang: ',s);
 Readln;
END.
