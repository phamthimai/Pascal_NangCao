Program P120912;  {Mo phong chyen dong cua qua cau}
Uses  Crt,Graph;
Const r=10;
Var   x,y,x1,y1,x2,y2,vx,vy,Gd,Gm: integer;

BEGIN
 Write('Nhap vi tri qua cau (x0,y0)      : '); Readln(x,y);
 Write('Nhap van toc qua cau (x0,y0)     : '); Readln(vx,vy);
 Write('Nhap kich thuoc HCN (x1,y1,x2,y2): '); Readln(x1,y1,x2,y2);
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 Rectangle(x1,y1,x2,y2);
 Repeat
   Setcolor(15);
   Circle(x,y,r);
   Delay(10);
   SetColor(0);
   Circle(x,y,r);
   x:=x+vx; y:=y+vy;
   If (x-x1<=r+2)or(x2-x<=r+2) then vx:=-vx;
   If (y-y1<=r+2)or(y2-y<=r+2) then vy:=-vy;
 Until KeyPressed;
 CloseGraph;
END.