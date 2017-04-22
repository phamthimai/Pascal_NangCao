Program P101113;  {kiem tra xem Hinh chu nhat co bi che lap khong}
Uses  Crt,Graph;
Const inp='P1011\P101113.INP';
Var   f: text;
      gd,gm: integer;
      ok: boolean;
      xMin,xMax,yMin,yMax,n: integer;

Procedure Ve;
Var i,x1,x2,y1,y2: integer;
Begin
 xMin:=maxint; yMin:=maxint;
 xMax:=-maxint; yMax:=-maxint;
 Assign(f,inp); Reset(f);
 Readln(f,n);
 Readln(f,x1,y1,x2,y2);
 If x1<xMin then xMin:=x1;
 If y1<yMin then yMin:=y1;
 If x2>xMax then xMax:=x2;
 If y2>yMax then yMax:=y2;
 SetColor(1);
 Rectangle(x1,y1,x2,y2);
 SetFillStyle(1,1);
 FloodFill(x1+1,y1+1,1);
 SetColor(13);
 SetFillStyle(1,4);
 For i:=1 to n do
 begin
   Readln(f,x1,y1,x2,y2);
   If x1<xMin then xMin:=x1;
   If y1<yMin then yMin:=y1;
   If x2>xMax then xMax:=x2;
   If y2>yMax then yMax:=y2;
   SetColor(i mod 13+2);
   SetFillStyle(1,i mod 13+2);
   Rectangle(x1,y1,x2,y2);
   FloodFill(x1+1,y1+1,i mod 13+2);
 end;
 Close(f);
End;

Procedure kiem_tra;
Var i,j: integer;
Begin
 Ok:=true;
 For i:=xMin to xMax do
   For j:=yMin to yMax do
     If GetPixel(i,j)=1 then exit;
 Ok:=false;
End;

BEGIN
 gd:=Detect;
 InitGraph(gd,gm,'');
 Ve;
 Kiem_tra;
 SetColor(14);
 If Ok then OutTextXY(10,10,'Aø khong bi che lap hoan toan')
 Else OutTextXY(10,10,'Aø bi che lap hoan toan');
 Repeat Until KeyPressed;
 CloseGraph;
END.