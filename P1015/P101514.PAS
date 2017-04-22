Program P101514;  {ve hinh vuong long nhau}
Uses  Crt,Graph;
Const W=400;
Var   gd,gm: integer;

Procedure Square(x1,y1,x2,y2,x3,y3,x4,y4,sb: integer);
Begin
 Setcolor(sb mod 15+1);
 Line(x1,y1,x2,y2);
 Line(x2,y2,x3,y3);
 Line(x3,y3,x4,y4);
 Line(x4,y4,x1,y1);
 If sb>0 then Square((x1+x2)div 2,(y1+y2)div 2,(x2+x3)div 2,(y2+y3)div 2,
               (x3+x4)div 2,(y3+y4)div 2,(x4+x1)div 2,(y4+y1)div 2,sb-1);
End;

BEGIN
 Clrscr;
 gd:=detect;
 Initgraph(gd,gm,'');
 Square((GetMaxX-W)div 2,(GetMaxY-W)div 2,(GetMaxX-W)div 2,(GetMaxY+W)div 2,
    (GetMaxX+W)div 2,(GetMaxY+W)div 2,(GetMaxX+W)div 2,(GetMaxY-W)div 2,16);
 Readln;
 Closegraph;
END.