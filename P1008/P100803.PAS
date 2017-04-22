Program P100803;  {To mau oto}
Uses Crt,Graph;
Var  GraphDriver,GraphMode: Integer;
     Pattern : FillPatternType;

BEGIN
 GraphDriver:=Detect;
 InitGraph(GraphDriver,GraphMode,' ');
 OutTextXY(200,20,'To mau oto:');
 GetFillPattern(Pattern);
 SetFillPattern(Pattern,12);
 Bar(120,180,300,90);
 SetFillPattern(Pattern,6);
 Bar(40,40,120,180);
 SetFillPattern(Pattern,7);
 Bar(60,60,105,105);
 Setcolor(yellow);
 Circle(75,205,20);
 Circle(250,205,20);
 SetFillPattern(Pattern,8);
 Floodfill(75,205,yellow);
 Floodfill(250,205,yellow);
 Readln;
 CloseGraph;
END.
