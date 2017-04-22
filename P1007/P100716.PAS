Program P100716;  {Tam giac deu kich thuoc dieu khien duoc}
Uses Crt, Graph;
Var  Gd,Gm,r,x1,y1,x2,y2,x3: Integer;
     c: char;

Procedure Tamgiac(r,mau: integer);
Begin
 y1:=GetMaxY div 2-r;
 y2:=(GetMaxY+r) div 2;
 x2:=Round((GetMaxX-r*sqrt(3))/2);
 x3:=Round((GetMaxX+r*sqrt(3))/2);
 SetColor(mau);
 Line(x1,y1,x2,y2);
 Line(x2,y2,x3,y2);
 Line(x1,y1,x3,y2);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 x1:=GetMaxX div 2;
 r:=100;
 Tamgiac(r,15);
 OutTextXY(0,0,'Press Esc to Exit...');
 Repeat
   Repeat c:=ReadKey; Until c in [#27,'+','-'];
   Tamgiac(r,0);
   If (c='+')and(r<GetMaxY div 2) then Inc(r)
   Else If (c='-')and(r>0) then Dec(r);
   Tamgiac(r,15);
 Until c=#27;
 CloseGraph;
END.