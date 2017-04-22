Program P100714;  {Hinh chu nhat kich thuoc dieu khien duoc}
Uses Crt, Graph;
Var  Gd,Gm,x,y: Integer;
     tl: real;
     c: char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 tl:=GetMaxY/GetMaxX;
 x:=GetMaxX div 2;
 y:=round(x*tl);
 SetFillStyle(1,4);
 Bar((GetMaxX-x) div 2,(GetMaxY-y) div 2,
     (GetMaxX+x) div 2,(GetMaxY+y) div 2);
 Repeat
   OutTextXY(0,0,'Press Esc to Exit...');
   Repeat
     c:=ReadKey;
   Until c in [#27,'+','-'];
   SetFillStyle(1,0);
   Bar((GetMaxX-x) div 2,(GetMaxY-y) div 2,
       (GetMaxX+x) div 2,(GetMaxY+y) div 2);
   If (c='+')and(x<GetMaxX) then Inc(x)
   Else If (c='-')and(y>0) then Dec(x);
   y:=round(x*tl);
   SetFillStyle(1,4);
   Bar((GetMaxX-x) div 2,(GetMaxY-y) div 2,
       (GetMaxX+x) div 2,(GetMaxY+y) div 2);
 Until c=#27;
 CloseGraph;
END.