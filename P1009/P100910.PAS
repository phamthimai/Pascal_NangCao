Program P100910;  {Ve con tot}
Uses  Crt, Graph;
Const De: array[1..7] of PointType
      =((X:182; Y:244),(X:218; Y:244),(X:223; Y:252),(X:218; Y:260),
        (X:182; Y:260),(X:175; Y:252),(X:182; Y:244));
Var   GraphDriver,GraphMode: Integer;

BEGIN
 GraphDriver:=Detect;
 InitGraph(GraphDriver,GraphMode,' ');
 SetBkColor(Getmaxcolor);
 SetColor(Blue);
 Circle(200,185,15);
 SetFillStyle(SolidFill,14);
 FloodFill(200,179,Blue);
 FillPoly(7,De);
 Bar(190,200,210,244);
 Bar(174,261,226,285);
 Rectangle(190,200,210,244);
 Rectangle(174,260,226,285);
 Repeat   Until KeyPressed;
 CloseGraph;
END.