Program P120402;  {Tam giac thuong quay quanh tam voi van toc deu}
Uses  Crt,Graph;
Const incarc: real=pi/180;
      cl: integer=4;
Var   Gd,Gm: integer;
      x0,y0: array [1..3] of integer;
      x,y: array [1..3] of integer;
      mx,my: integer;
      arc: real;

Procedure DrawT(cl: integer);
Var i: integer;
Begin
 If cl=0 then
 begin
   ClearDevice; Exit;
 end;
 SetColor(cl);
 For i:=1 to 2 do Line(x[i],y[i],x[i+1],y[i+1]);
 Line(x[1],y[1],x[i+1],y[i+1]);
 SetFillStyle(1,cl);
 FloodFill(mx,my,cl);
 SetColor(1);
 Circle(mx,my,2);
End;

Procedure Rotate;
Var i: integer;
Begin
 For i:=1 to 3 do
 begin
   x[i]:=mx+round(x0[i]*cos(arc)-y0[i]*sin(arc));
   y[i]:=my+round(y0[i]*cos(arc)+x0[i]*sin(arc));
 end;
End;

Function Goc(x1,y1,x2,y2: integer): real;
Begin
 x1:=x2-x1; y1:=y2-y1;
 If x1=0 then
   If y1<0 then Goc:=pi/2 Else Goc:=3*pi/2
 Else Goc:=arctan(y1/x1);
End;

Procedure Generate;
Var i: integer;
Begin
 Randomize;
 For i:=1 to 3 do
   begin x0[i]:=100+random(400);y0[i]:=100+random(300)+1;end;
 mx:=0; my:=0;
 For i:=1 to 3 do
   begin mx:=mx+x0[i]; my:=my+y0[i]; end;
 mx:=mx div 3; my:=my div 3;
 arc:=goc(mx,my,x0[1],y0[1]);
 For i:=1 to 3 do
   begin x0[i]:=x0[i]-mx; y0[i]:=y0[i]-my; end;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'c:\turbo\graph');
 Generate;
 Rotate;
 DrawT(cl);
 Repeat
   Drawt(0);
   arc:=arc+incarc;
   Rotate;
   Drawt(cl);
   Delay(30);
 Until KeyPressed;
 CloseGraph;
END.