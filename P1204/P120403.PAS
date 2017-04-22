Program P120403;  {Dao dong dieu hoa tren mot doan nam ngang}
Uses  Crt,Graph;
Const c=300; w=10; tg=0.001; r=2; tre=4; y=240;
Var   Gd,Gm,x: integer;
      t: real;
      p: pointer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'C:\turbo\graph');
 x:=320-(c div 2)+Round(c*(1+cos(w*t))/2);
 SetColor(1);
 Circle(x,y,r);
 SetFillStyle(1,1);
 FloodFill(x,y,1);
 Getmem(p,ImageSize(x-r-5,y-r,x+r+5,y+r));
 Getimage(x-r-5,y-r,x+r+5,y+r,p^);
 t:=0;
 Repeat
   Putimage(x-r-5,y-r,p^,normalput);
   Delay(tre);
   x:=320-(c div 2)+Round(c*(1+cos(w*t))/2);
   t:=t+tg;
 Until KeyPressed;
 Closegraph;
END.