Program P110909;   {doan thang tu quay}
Uses  Crt, Graph;
Const l=150; v=5; x0=200; y0=200; t=0.01;
Var   Gd,Gm,x,y: Integer;
      a: real;    {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 a:=0;
 Repeat
   x:=x0+Round(l*cos(a)); y:=y0+Round(l*sin(a));
   SetColor(15);
   Line(x0,y0,x,y);
   Delay(v);
   SetColor(0);
   Line(x0,y0,x,y);
   a:=a+t;
 Until KeyPressed;
 CloseGraph;
END.
