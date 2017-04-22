Program P100707;  {Ve hinh chu nhat.}
Uses Crt,Graph;
Var  Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Rectangle(80,90,300,200);
 Readln;
 CloseGraph;
END.