Program P100807;  {To mau Ngoi nha}
Uses  Crt,Graph;
Var   Gd,Gm: Integer;
      Pattern : FillPatternType;
      c: Char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 GetFillPattern(Pattern);
 OutTextXY(120,50,'To mau Ngoi nha:');
 Rectangle(220,200,420,330);
 Rectangle(250,230,300,330);
 Rectangle(330,230,390,280);
 MoveTo(220,200);
 Lineto(180,200);
 Lineto(220,140);
 Lineto(420,140);
 Lineto(460,200);
 Lineto(420,200);
 SetFillPattern(Pattern,Blue);
 Floodfill(0,0,White);
 SetFillPattern(Pattern,4);
 Floodfill(320,190,White);
 SetFillPattern(Pattern,8);
 Floodfill(320,220,White);
 Repeat
   Repeat c:=ReadKey; Until c in [#27,'+','-'];
   If (c='+') then SetFillPattern(Pattern,14)
   Else If (c='-') then SetFillPattern(Pattern,0);;
   Floodfill(270,300,White);
   Floodfill(370,270,White);
 Until c=#27;
 CloseGraph;
END.