Program P100715;  {Vong tron kich thuoc dieu khien duoc}
Uses Crt, Graph;
Var  Gd,Gm,r: Integer;
     c: char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 r:=100;
 SetColor(15);
 Circle(GetMaxX div 2,GetMaxY div 2,r);
 Repeat
   OutTextXY(0,0,'Press Esc to Exit...');
   Repeat c:=ReadKey; Until c in [#27,'+','-'];
   SetColor(0);
   Circle(GetMaxX div 2,GetMaxY div 2,r);
   If (c='+')and(r<GetMaxY div 2) then Inc(r)
   Else If (c='-')and(r>0) then Dec(r);
   SetColor(15);
   Circle(GetMaxX div 2,GetMaxY div 2,r);
 Until c=#27;
 CloseGraph;
END.