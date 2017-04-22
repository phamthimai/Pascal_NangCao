Program P101515;   {Hinh vuong long nhau}
Uses  Crt,Graph;
Const f=0.05;
Var   gd,gm: integer;

Procedure Square(x1,y1,x2,y2,x3,y3,x4,y4,sb:integer);
Var x21,x22,x23,x24,y21,y22,y23,y24:integer;
Begin
 Setcolor(sb mod 14+1);
 Line(x1,y1,x2,y2); line(x2,y2,x3,y3);
 Line(x3,y3,x4,y4); line(x4,y4,x1,y1);
 x21:=round(f*(x2-x1)+x1);  y21:=round(f*(y2-y1)+y1);
 x22:=round(f*(x3-x2)+x2);  y22:=round(f*(y3-y2)+y2);
 x23:=round(f*(x4-x3)+x3);  y23:=round(f*(y4-y3)+y3);
 x24:=round(f*(x1-x4)+x4);  y24:=round(f*(y1-y4)+y4);
 If sb>0 then square(x21,y21,x22,y22,x23,y23,x24,y24,sb-1);
End;

BEGIN
 Clrscr;
 Randomize;
 gd:=detect;
 Initgraph(gd,gm,'');
 Setcolor(1);
 Square(170,90,170,410,470,410,470,90,50);
 Readln;
 Closegraph;
END.