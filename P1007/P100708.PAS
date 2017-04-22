Program P100708;  {Ve hinh Da giac}
Uses  Crt,Graph;
Const Triangle: array[1..6] of PointType = ((X: 100; Y: 100),
                                            (X: 150; Y: 100),
                                            (X: 170; Y: 200),
                                            (X: 150; Y: 140),
                                            (X: 100; Y: 140),
                                            (X: 100; Y: 100));
Var   Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(122,50,'Ve hinh Ngu giac:');
 DrawPoly(6,Triangle);
 Readln;
 CloseGraph;
END.