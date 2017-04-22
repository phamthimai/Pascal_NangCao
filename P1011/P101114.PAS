Program  P101114; {Ve Ga}
Uses Crt,Graph;
Var  gd,gm: integer;

BEGIN
 gd:=detect;
 InitGraph(gd,gm,'');
 SetColor(15);
 Circle(180,150,30);
 Circle(170,145,10);
 Line(135,190,154,164);
 Line(135,190,164,175);
 Line(190,180,220,240);
 Line(210,160,260,200);
 Line(300,290,280,360);
 Line(340,290,360,360);
 Ellipse(320,240,0,360,100,50);
 Ellipse(420,240,0,161,90,160);
 Ellipse(450,240,0,160,60,100);
 Repeat Until KeyPressed;
 CloseGraph;
END.