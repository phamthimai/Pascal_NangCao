Program P120404;
{Chuyen dong quay deu cua hinh tron quanh duong kinh thang dung}
Uses  Crt,Graph;
Const w=20; tgc=0.005; Rl=80; tre=20; x=320; y=240;
Var   Gd,Gm,rn: integer;
      t: real;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'C:\turbo\graph');
 t:=0;
 Repeat
   rn:=Round(Rl*abs(cos(w*t)));
   SetColor(14);
   Ellipse(x,y,0,360,rn,Rl);
   Delay(tre);
   SetColor(0);
   Ellipse(x,y,0,360,rn,Rl);
   t:=t+tgc;
 Until KeyPressed;
 CloseGraph;
END.