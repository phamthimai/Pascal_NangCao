Program P110915;     {hinh vuong dac tu quay + chuyen dong}
Uses  Crt, Graph;
Const w=150; v=0; t=0.01; b=pi/2;
Var   Gd,Gm,x0,y0,x1,y1,x2,y2,x3,y3,x4,y4,l: Integer;
      a: real;       {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 SetColor(4);
 a:=0; l:=Round(w/Sqrt(2));
 x0:=0; y0:=240;
 Repeat
   x1:=x0+Round(l*cos(a));     y1:=y0+Round(l*sin(a));
   x2:=x0+Round(l*cos(a+b));   y2:=y0+Round(l*sin(a+b));
   x3:=x0+Round(l*cos(a+2*b)); y3:=y0+Round(l*sin(a+2*b));
   x4:=x0+Round(l*cos(a+3*b)); y4:=y0+Round(l*sin(a+3*b));
   Line(x1,y1,x2,y2); Line(x2,y2,x3,y3);
   Line(x3,y3,x4,y4); Line(x1,y1,x4,y4);
   SetFillStyle(1,4); FloodFill(x0,y0,4);
   Delay(v);
   SetFillStyle(1,0); FloodFill(x0,y0,0);
   a:=a+t; x0:=x0+1; If x0=640 then x0:=0;
 Until KeyPressed;
 CloseGraph;
END.