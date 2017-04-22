Program P110906;      {diem chuyen dong tron deu}
Uses  Crt, Graph;
Const r=150; v=5;
Var   Gd,Gm,x0,y0,x,y: Integer;
      a: real;        {goc}

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 x0:=GetMaxX div 2; y0:=GetMaxY div 2;
 PutPixel(x0,y0,4);
 a:=0;
 Repeat
   x:=x0+Round(r*cos(a)); y:=y0+Round(r*sin(a));
   PutPixel(x,y,15);
   Delay(v);
   PutPixel(x,y,0);
   a:=a+0.01;
 Until KeyPressed;
 CloseGraph;
END.
