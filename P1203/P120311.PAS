Program P120311;    {Giai pt nguyen ax+by=d voi d=USCLN(a,b)}
Uses Crt;                    {thuat toan Euclide}
Var  a,aa,b,bb,p,q,r,s,pp,qq,tg: integer;

BEGIN
 Clrscr;
 Write(' Nhap a: '); Readln(a);
 Write(' Nhap b: '); Readln(b);
 aa:=a; bb:=b;
 p:=0; q:=1; pp:=1; qq:=0; r:=a mod b;
 While r<>0 do
 begin
   s:=a div b;
   a:=b; b:=r;
   tg:=pp; pp:=p; p:=tg-s*p;
   tg:=qq; qq:=q; q:=tg-s*q;
   r:=a mod b;
 end;
 Write(p,'*',aa,'+',q,'*',bb,' = ',b);
 Readln;
END.