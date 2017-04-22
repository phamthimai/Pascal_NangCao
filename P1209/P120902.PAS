Program P120902;   {Tinh khoang cach chim cua qua cau}
Uses Crt;
Var  r,d,a,b,fa,fb,fk: real;

Function f(x: real): real;
Begin
 f:=x*x*x-3*r*r*x+2*r*r*r-4*r*r*r*d;
End;

BEGIN
 Clrscr;
 Write('Nhap ban kinh r        : '); Readln(r);
 Write('Nhap khoi luong rieng d: '); Readln(d);
 a:=-r; b:=r;
 Repeat
   fa:=f(a); fb:=f(b);
   fk:=f((a+b)/2);
   If fa*fk<=0 then b:=(a+b)/2;
   If fb*fk<=0 then a:=(a+b)/2;
 Until abs(a-b)<0.000001;
 Write('Khoang cach tu mat nuoc toi tam cau la: ',a);
 Readln;
END.