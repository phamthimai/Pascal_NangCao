Program P100806;  {Nut day}
Uses  Crt,Graph;
Var   Gd,Gm,m,n: Integer;
      c: Char;

Procedure P(m,n: integer);
Begin
  SetColor(m);
  Line(280,200, 360,200);
  Line(280,200, 280,230);
  SetColor(n);
  Line(280,230, 360,230);
  Line(360,200, 360,230);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 ClrScr;
 OutTextXY(200,210,'Nut day:');
 m:=15; n:=0; p(m,n);
 Repeat
   Repeat c:=ReadKey; Until c in [#27,#32,#13];
   If (c=#32) then
   begin
   m:=m+n; n:=m-n; m:=m-n; P(m,n);
   end;
 Until (c=#27)or(c=#13);
 CloseGraph;
END.