Program P100711;  {Ve Ngoi nha}
Uses  Crt,Graph;
Var   Gd,Gm: Integer;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 OutTextXY(120,50,'Ve Ngoi nha:');
 Rectangle(220,200,420,330);
 Rectangle(250,230,300,330);
 Rectangle(330,230,390,280);
 MoveTo(220,200);
 Lineto(180,200);
 Lineto(220,140);
 Lineto(420,140);
 Lineto(460,200);
 Lineto(420,200);
 Readln;
 CloseGraph;
END.