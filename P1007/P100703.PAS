Program P100703;   {Ve doan thang}
Uses Crt,Graph;
Var  Gd,Gm,i: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Line(100,150,100,350);                    {cach 1}
 SetColor(2);
 MoveTo(200,150); LineTo(200,350);         {cach 2}
 For i:=150 to 350 do PutPixel(300,i,4);   {cach 3}
 Readln;
 CloseGraph;
END.