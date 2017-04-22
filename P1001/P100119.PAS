Program P100119;  {Tinh Bieu thuc}
Uses Crt;
Var  s,t: real;

Function g(a,b: real): real;
Begin
 g:=(sqr(a)+sqr(b))/(sqr(a)+2*a*b+3*sqr(b)+4);
End;

BEGIN
 Clrscr;
 Write('Nhap hai so thuc s,t: '); Readln(s,t);
 Write(g(1.2,s)+g(t,s)-g(2*s-1,s*t):0:5);
 Readln;
END.