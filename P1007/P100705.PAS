Program P100705;   {Ve hinh tron}
Uses Crt,Graph;
Var  Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Circle(GetMaxX div 2,GetMaxY div 2,100);
 Readln;
 CloseGraph;
END.