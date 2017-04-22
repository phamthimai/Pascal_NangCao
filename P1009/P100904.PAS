Program P100904;  {Day Nut CheckBox}
Uses  Crt,Graph;
Const W=30; H=30; D=50; N=4; X=150; Y=300;
Var   Gd,Gm,P: Integer;
      A: array [1..N] of 0..1;
      c: Char;
      Pattern: FillPatternType;

Procedure Ve(P: Byte);
Var i: Byte;
Begin
 SetColor(0);
 For i:=1 to N do
 begin
   If i=P then SetFillPattern(Pattern,Cyan)
   Else SetFillPattern(Pattern,White);
   Bar(X+i*D,Y,X+i*D+W,Y-H);
   Rectangle(X+i*D,Y,X+i*D+W,Y-H);
   If A[i]=1 then
   begin
     Line(X+i*D,Y,X+i*D+W,Y-H);
     Line(X+i*D+W,Y,X+i*D,Y-H);
   end;
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
   Until c in [#27,#13,#75,#77,#32];
   If (c=#75) then If (P>1) then Dec(P) Else P:=N;
   If (c=#77) then If (P<N) then Inc(P) Else P:=1;
   If (c=#32) then If (A[P]=1) then A[P]:=0 Else A[P]:=1;
   Ve(P);
 Until (c=#27)or(c=#13);
 CloseGraph;
END.