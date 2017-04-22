Program P110910;   {doan thang tu quay}
Uses  Crt, Graph;
Const l=150; v=5; x0=200; y0=200; t=0.01; k=-1/3;
Var   Gd,Gm,x1,y1,x2,y2,l1,l2: Integer;
      a: real;    {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 a:=0; l1:=Round(l/(1+k)); l2:=Round(k*l/(1+k));
 Repeat
   Bar(x0-1,y0-1,x0+1,y0+1);
   x1:=x0+Round(l1*cos(a)); y1:=y0+Round(l1*sin(a));
   x2:=x0+Round(l2*cos(a)); y2:=y0+Round(l2*sin(a));
   SetColor(15);
   Line(x1,y1,x2,y2);
   Delay(v);
   SetColor(0);
   Line(x1,y1,x2,y2);
   a:=a+t;
 Until KeyPressed;
 CloseGraph;
END.
