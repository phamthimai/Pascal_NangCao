Program P100712;   {Ve Con ca}
Uses Graph;
Var Gd, Gm: Integer;

BEGIN
 Gd := Detect;
 InitGraph(Gd, Gm, ' ');
 OutTextXY(100,100,'Ve Con ca:');
 Ellipse(getmaxX div 2,GetmaxY div 2,0,360,160,40); {than}
 Circle(190,230,7);                 {mat}
 Moveto(185,250); Lineto(165,250);  {mieng}
 Arc(165,269,0,50,80);              {mang}
 Moveto(255,200); Lineto(265,190);  {vay lung}
 Lineto(400,180); Lineto(390,200);
 Moveto(470,227); Lineto(550,220);  {duoi}
 Lineto(520,240); Lineto(555,255);
 Lineto(470,250);
 Moveto(247,278); Lineto(256,295);  {vay bung}
 Lineto(265,290); Lineto(250,277);
 Moveto(350,277); Lineto(362,292);
 Lineto(370,285); Lineto(358,277);  {vay bung}
 Readln;
 CloseGraph;
END.