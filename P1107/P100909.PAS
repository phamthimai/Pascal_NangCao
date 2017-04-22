Program P100909;  {Ve xe tang}
Uses  Crt,Graph;
Const X=400; Y=200; W=100; H=20; G=15;
Var   GraphDriver, GraphMode: Integer;

BEGIN
 GraphDriver := Detect;
 InitGraph(GraphDriver, GraphMode, ' ');
 SetBkColor(0);
 SetFillStyle (1,7);
 Bar(X,Y,X+W,Y+W);
 SetColor(8);
 Line(X,Y+H,X+W,Y+H);
 Line(X,Y+W-H,X+W,Y+W-H);
 Circle(X+W div 2-5,Y+W div 2,W div 2-H-5);
 Circle(X+W div 2-5,Y+W div 2,W div 2-H-13);
 SetFillStyle (1,8);
 Bar(X,Y+H,X+G,Y+W-H);
 FloodFill(X+W div 2-5,Y+H+10,8);
 SetFillStyle (1,7);
 Bar(X-5,Y+W div 2-2,X+H+3,Y+W div 2+2);
 Readln;
 CloseGraph;
END.