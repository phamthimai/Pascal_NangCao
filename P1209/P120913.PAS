Program P120913;  {Mo phong chyen dong cua N qua cau}
Uses  Crt,Graph;
Const r=10;
Var   n,i,x1,y1,x2,y2,Gd,Gm: integer;
      x,y,vx,vy: array [1..100] of integer;


Procedure Nhap;
Var f: text; i: integer;
Begin
 Assign(f,'P120913.inp'); Reset(f);
 Readln(f,x1,y1,x2,y2);
 Readln(f,n);
 For i:=1 to n do Readln(f,x[i],y[i]);
 For i:=1 to n do Readln(f,vx[i],vy[i]);
 Close(f);
End;

BEGIN
 Nhap;
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 Rectangle(x1,y1,x2,y2);
 Repeat
   Setcolor(9); For i:=1 to n do Circle(x[i],y[i],r);
   Delay(10);
   SetColor(0);  For i:=1 to n do Circle(x[i],y[i],r);
   For i:=1 to n do
   begin
     x[i]:=x[i]+vx[i]; y[i]:=y[i]+vy[i];
     If (x[i]-x1<=r+2)or(x2-x[i]<=r+2) then vx[i]:=-vx[i];
     If (y[i]-y1<=r+2)or(y2-y[i]<=r+2) then vy[i]:=-vy[i];
   end;
 Until KeyPressed;
 CloseGraph;
END.