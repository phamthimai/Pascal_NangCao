Program P110914;      {hinh chu nhat dac tu quay}
Uses  Crt, Graph;
Const w=150; h=100; v=0; x0=200; y0=200; t=0.05;
Var   Gd,Gm,x1,y1,x2,y2,x3,y3,x4,y4,l: Integer;
      a,b: real;      {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 SetColor(4);
 a:=0; l:=Round(Sqrt(Sqr(w)+Sqr(h))/2); b:=2*arctan(h/w);
 Repeat
   x1:=x0+Round(l*cos(a));      y1:=y0+Round(l*sin(a));
   x2:=x0+Round(l*cos(a+b));    y2:=y0+Round(l*sin(a+b));
   x3:=x0+Round(l*cos(a+pi));   y3:=y0+Round(l*sin(a+pi));
   x4:=x0+Round(l*cos(a+pi+b)); y4:=y0+Round(l*sin(a+pi+b));
   Line(x1,y1,x2,y2); Line(x2,y2,x3,y3);
   Line(x3,y3,x4,y4); Line(x1,y1,x4,y4);
   SetFillStyle(1,4); FloodFill(x0,y0,4);
   Delay(v);
   SetFillStyle(1,0); FloodFill(x0,y0,0);
   a:=a+t;
 Until KeyPressed;
 CloseGraph;
END.