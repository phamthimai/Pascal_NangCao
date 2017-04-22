Program P100710;  {Ve Cay thong}
Uses  Crt,Graph;
Const Caythong: array[1..16] of PointType
     = ((X: 300; Y: 100),(X: 270; Y: 140),(X: 295; Y: 140),(X: 260; Y: 180),
        (X: 293; Y: 180),(X: 240; Y: 230),(X: 290; Y: 230),(X: 285; Y: 280),
        (X: 315; Y: 280),(X: 310; Y: 230),(X: 360; Y: 230),(X: 307; Y: 180),
        (X: 340; Y: 180),(X: 305; Y: 140),(X: 330; Y: 140),(X: 300; Y: 100));
Var   Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(122,50,'Ve Cay thong:');
 DrawPoly(16,Caythong);
 Readln;
 CloseGraph;
END.