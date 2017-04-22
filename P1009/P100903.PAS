Program P100903;  {Day Nut Radio}
Uses  Crt,Graph;
Const D=100;  N=4; X=100; Y=250;
Var   Gd,Gm,P: Integer;
      c: Char;
      Pattern: FillPatternType;

Procedure Ve(P: Byte);
Var i: Byte;
Begin
 For i:=1 to N do
 begin
   SetColor(0);
   Circle(X+i*D,Y,15);
   Circle(X+i*D,Y,8);
   SetFillPattern(Pattern,White);
   Circle(X+i*D,Y,15);
   Circle(X+i*D,Y,8);
   FloodFill(X+i*D,Y,Black);
   If i=P then SetFillPattern(Pattern,Blue)
   Else SetFillPattern(Pattern,White);
   FloodFill(X+i*D,Y,Black);
 end;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 GetFillPattern(Pattern);
 ClrScr;
 P:=1; Ve(P);
 Repeat
   Repeat
     c:=ReadKey;
     If c=#0 then c:=ReadKey;
   Until c in [#27,#13,#75,#77];
   If (c=#75) then If (P>1) then Dec(P) Else P:=N;
   If (c=#77) then If (P<N) then Inc(P) Else P:=1;
   Ve(P);
 Until (c=#27)or(c=#13);
 CloseGraph;
END.
