Program P100902;  {Day Nut day}
Uses  Crt,Graph;
Const W=80; H=30; D=100; N=4; X=150; Y=300;
Var   Gd,Gm,P: Integer;
      c: Char;

Procedure Ve(P: Byte);
Var i: Byte;
Begin
 For i:=0 to N-1 do
 begin
   SetColor(15);
   Line(X+i*D,Y-H,X+i*D+W,Y-H);
   Line(X+i*D,Y,X+i*D,Y-H);
   SetColor(0);
   Line(X+i*D,Y,X+i*D+W,Y);
   Line(X+i*D+W,Y,X+i*D+W,Y-H);
 end;
 SetColor(0);
 Line(X+(P-1)*D,Y-H,X+(P-1)*D+W,Y-H);
 Line(X+(P-1)*D,Y,X+(P-1)*D,Y-H);
 SetColor(15);
 Line(X+(P-1)*D,Y,X+(P-1)*D+W,Y);
 Line(X+(P-1)*D+W,Y,X+(P-1)*D+W,Y-H);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 ClrScr;
 P:=1; Ve(P);
 Repeat
   Repeat
     c:=ReadKey;
     If c=#0 then c:=ReadKey;
   Until c in [#27,#13,#75,#77];
   If (c=#75) then If (P>1) then Dec(P)
                   Else P:=N;
   If (c=#77) then If (P<N) then Inc(P)
                   Else P:=1;
   Ve(P);
 Until (c=#27)or(c=#13);
 CloseGraph;
END.