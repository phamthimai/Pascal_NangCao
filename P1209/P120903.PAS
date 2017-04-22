Program P120903;  {Qui dao cua con cho khi duoi con meo}
Uses  Crt,Graph;
Const vc=10; vm=5; AO=100; xOA=3*pi/4;
      X0=280; Y0=400; W=3;
Var   xc,xm,yc,ym,T,dx,dy,ds: real;
      Gd,Gm,X,Y             : integer;

BEGIN
 Clrscr;
 Write(' T = '); Readln(T);
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 xm:=0; ym:=0;
 xc:=AO*cos(xOA); yc:=AO*sin(xOA);
 X:=Round(xm*W+X0); Y:=Round(Y0-ym*W); PutPixel(X,Y,5);
 X:=Round(xc*W+X0); Y:=Round(Y0-yc*W); PutPixel(X,Y,4);
 Repeat
   dx:=xm-xc; dy:=ym-yc; ds:=Sqrt(Sqr(dx)+Sqr(dy));
   xc:=xc+vc*T*dx/ds; yc:=yc+vc*T*dy/ds; xm:=xm+vm*t;
   Delay(Round(1000*T));
   X:=Round(xm*W+X0); Y:=Round(Y0-ym*W); PutPixel(X,Y,5);
   X:=Round(xc*W+X0); Y:=Round(Y0-yc*W); PutPixel(X,Y,4);
 Until (xc>=xm)or KeyPressed;
 Readln;
 CloseGraph;
END.