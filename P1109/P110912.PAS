Program P110912;      {hinh vuong tu quay}
Uses  Crt, Graph;
Const w=150; v=10; x0=200; y0=200; t=0.01; b=pi/2;
Var   Gd,Gm,x1,y1,x2,y2,x3,y3,x4,y4,l: Integer;
      a: real;        {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 a:=0; l:=Round(w/Sqrt(2));
 Repeat
   Bar(x0-1,y0-1,x0+1,y0+1);
   x1:=x0+Round(l*cos(a));     y1:=y0+Round(l*sin(a));
   x2:=x0+Round(l*cos(a+b));   y2:=y0+Round(l*sin(a+b));
   x3:=x0+Round(l*cos(a+2*b)); y3:=y0+Round(l*sin(a+2*b));
   x4:=x0+Round(l*cos(a+3*b)); y4:=y0+Round(l*sin(a+3*b));
   SetColor(15);
   Line(x1,y1,x2,y2); Line(x2,y2,x3,y3);
   Line(x3,y3,x4,y4); Line(x1,y1,x4,y4);
   Delay(v);
   SetColor(0);
   Line(x1,y1,x2,y2); Line(x2,y2,x3,y3);
   Line(x3,y3,x4,y4); Line(x1,y1,x4,y4);
   a:=a+t;
 Until KeyPressed;
 CloseGraph;
END.
