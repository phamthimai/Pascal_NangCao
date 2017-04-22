Program P101001;  {Hien thi dong chu}
Uses Graph;
Var  Gd, Gm: Integer;
BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(100,100,'Day la man hinh do hoa');
 Readln;
 CloseGraph;
END.
