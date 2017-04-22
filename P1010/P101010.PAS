Program P101010;  {Form nhap du lieu}
Uses  Crt,Graph;
Const N=2;D=110;X=260;Y=150;M=2;L=80;X1=80;Y1=280;D1=110;H1=25;
Var   Gd,Gm: Integer;
      Pattern:FillPatternType;

Procedure Ve;
Var i,j: Byte; T,H:integer;
Begin
 SetFillPattern(Pattern,7);
 Bar(50,50,500,350);
 SetColor(15);
 Line(130,90,420,90);
 Line(130,90,130,300);
 SetColor(0);
 Line(420,90,420,300);
 Line(130,300,420,300);
 T:=0;H:=10;
 For i:=1 to N do
 begin
   SetColor(0);
   SetFillPattern(Pattern,14);
   Bar(X,Y+T+H,X+D,Y-H+t);
   SetColor(0);
   Line(X,Y+T-H,X+D,Y-H+T);
   Line(X ,Y-H+T,X,Y+H+T);
   t:=t+50;
 end;
 For j:=1 to M do
 begin
   SetColor(0);
   Rectangle(X1+D*j,Y1,X1+D1*j+L,Y1-H1);
   SetColor(15);
   Line(X1+j*D1,Y1-H1,X1+j*D1+L,Y1-H1);
   Line(X1+j*D1,Y1,X1+j*D1,Y1-H1);
 end;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 GetFillPattern(Pattern);
 Ve;
 SetColor(0);
 SetFillPattern(Pattern,8);
 Bar(131,91,418,115);
 SetColor(Blue);
 OutTextXY(140,98,'     Nhap Du lieu');
 OutTextXY(145,150,'Ho va Ten:');
 OutTextXY(155,200,'Tuoi:');
 OutTextXY(205,265,'Nhap');
 OutTextXY(310,265,'Thoat');
 SetColor(8);
 SetLineStyle(DottedLn,8,0);
 Rectangle(305,260,375,277);
 Repeat     Until KeyPressed;
 CloseGraph;
END.