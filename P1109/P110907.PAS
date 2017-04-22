Program P110907;   {diem chuyen dong tron co van toc}
Uses  Crt, Graph;
Const r=150;
Var   Gd,Gm,x0,y0,x,y,v: Integer;
      a: real;      {goc}
      c: char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 x0:=GetMaxX div 2; y0:=GetMaxY div 2;
 PutPixel(x0,y0,4);
 v:=10; a:=0;
 Repeat
   Repeat
     x:=x0+Round(r*cos(a)); y:=y0+Round(r*sin(a));
     PutPixel(x,y,15);
     Delay(v);
     PutPixel(x,y,0);
     a:=a+0.01;
   Until KeyPressed;
   c:=ReadKey; If c=#0 then c:=ReadKey;
   If (c=#72)and(v>0) then Dec(v);
   If (c=#80)and(v<100) then Inc(v);
 Until (c=#13)or(c=#27);
 CloseGraph;
END.
