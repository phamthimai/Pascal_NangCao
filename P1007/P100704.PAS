Program P100704;   {Ve tam giac}
Uses Crt,Graph;
Var  Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Line(100,150,100,100);
 Line(100,100,80,170);
 Line(80,170,100,150);
 Readln;
 CloseGraph;
END.