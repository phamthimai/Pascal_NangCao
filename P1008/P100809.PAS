Program P100809;    {To mau Tam giac}
Uses  Graph,Crt;
Const Triangle: array[1..4] of PointType
      =((X: 50; Y: 50), (X: 200; Y:10),(X: 100; Y: 100), (X:  50; Y: 50));
Var   Gd,Gm,i: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(100,150,'To mau Tam giac');
 SetFillStyle(SolidFill,Green);
 FillPoly(4,Triangle);
 Readln;
 CloseGraph;
END.











