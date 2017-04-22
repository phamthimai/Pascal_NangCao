Program P100706;   {Ve oto}
Uses Crt,Graph;
Var  Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(120,20,'Ve oto:');
 Rectangle(120,180,300,90);
 Rectangle(60,60,105,105);
 Rectangle(40,40,120,180);
 Circle(75,205,20);
 Circle(250,205,20);




 Readln;
 CloseGraph;
END.