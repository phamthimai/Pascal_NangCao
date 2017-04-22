Program P110911;   {doan thang tu quay}
Uses  Crt, Graph;
Const l1=100; l2=150; v=5; x0=200; y0=200; t=0.01; b=-0.9;
Var   Gd,Gm,x1,y1,x2,y2: Integer;
      a: real;    {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 a:=0;
 Repeat
   Bar(x0-1,y0-1,x0+1,y0+1);
   x1:=x0+Round(l1*cos(a)); y1:=y0+Round(l1*sin(a));
   x2:=x0+Round(l2*cos(a+b)); y2:=y0+Round(l2*sin(a+b));
   SetColor(15);
   Line(x1,y1,x2,y2);
   Delay(v);
   SetColor(0);
   Line(x1,y1,x2,y2);
   a:=a+t;
 Until KeyPressed;
 CloseGraph;
END.
