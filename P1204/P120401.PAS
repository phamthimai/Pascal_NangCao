Program P120401;  {Tam giac dac deu quay quanh tam voi van toc deu}
Uses  Crt,Graph;
Const lech=0.06;
      kc=120;
      xt=320; yt=240;
      mau=1;
      tre=80;
Var   Gd,Gm: integer;
      d: real;

Procedure Ve;
Var x1,x2,x3,y1,y2,y3: integer;
Begin
 x1:=xt+round(kc*sin(d));        y1:=yt+round(kc*cos(d));
 x2:=xt+round(kc*sin(d+2*pi/3)); y2:=yt+round(kc*cos(d+2*pi/3));
 x3:=xt+round(kc*sin(d+4*pi/3)); y3:=yt+round(kc*cos(d+4*pi/3));
 Line(x1,y1,x2,y2);
 Line(x2,y2,x3,y3);
 Line(x3,y3,x1,y1);
 FloodFill(xt,yt,mau);
End;

Begin
 Gd:=Detect;
 InitGraph(Gd,Gm,'C:\turbo\graph');
 SetColor(mau);
 SetFillStyle(1,mau);
 d:=0;
 Repeat
   Delay(tre);
   d:=d+lech;
   ClearDevice;
   Ve;
 Until KeyPressed;
 CloseGraph;
End.