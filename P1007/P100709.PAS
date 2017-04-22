Program P100709;  {Ve hinh Elip}
Uses  Crt,Graph;
Var   Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(122,50,'Ve hinh Elip:');
 Ellipse(GetMaxX div 2,GetMaxY div 2,0,360,200,120);
 Readln;
 CloseGraph;
END.