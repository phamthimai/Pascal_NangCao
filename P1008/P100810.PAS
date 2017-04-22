Program P100810;   {To mau ngu giac}
Uses  Crt, Graph;
Const T: array[1..6] of PointType = ((X: 100; Y: 100),(X: 150; Y:100),
      (X: 170; Y: 200),(X:150;Y:140),(X:100;Y:140),( X :100; Y : 100));
Var   Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(50,50,'To mau hinh ngu giac:');
 SetFillStyle(SolidFill,Magenta);
 FillPoly(6,T);
 Readln;
 CloseGraph;
END.
