Program P100905;  {May tinh}
Uses  Crt,Graph;
Const H=30; N=5; X=100; Y=200; L=5;
      W: array [1..N] of integer =(3,1,3,1,4);
Var   Gd,Gm,PO,PN,i: Integer;
      D: array [0..N] of integer;


Procedure Contro(PO,PN: integer);
Var i,j: integer;
Begin
  SetTextStyle(2,0,9);
  SetColor(3);
  i:=X+(PO-1)*H+5;
  j:=Y-33;
  OutTextXY(i,j,'I');
  SetColor(15);
  i:=X+(PN-1)*H+5;
  OutTextXY(i,j,'I');
End;

Procedure Ve;
Var i,j: Byte;
Begin
 SetFillStyle(1,7);
 Bar(X-50,Y-H-50,X+D[N]+50,Y+50);
 SetColor(0);
 Line(X-30,Y+30,X+D[N]+30,Y+30);
 Line(X+D[N]+30,Y-H-30,X+D[N]+30,Y+30);
 SetColor(15);
 Line(X-30,Y-H-30,X+D[N]+30,Y-H-30);
 Line(X-30,Y-H-30,X-30,Y+30);
 For i:=1 to N do
 begin
   SetColor(0);
   Rectangle(X+D[i-1],Y,X+D[i-1]+W[i]*H-L,Y-H);
   SetColor(15);
   Line(X+D[i-1]+W[i]*H-L,Y,X+D[i-1]+W[i]*H-L,Y-H);
   Line(X+D[i-1],Y,X+D[i-1]+W[i]*H-L,Y);
   SetFillStyle(1,3);
   Bar(X+D[i-1]+1,Y-1,X+D[i-1]+W[i]*H-L-1,Y-H+1);
 end;
 PN:=1;
 Contro(PN,PN);
End;

Procedure Xuli;
Var c: Char;
Begin
 Repeat
   Repeat
     c:=ReadKey; If c=#0 then c:=ReadKey;
   Until c in [#27,#13,#75,#77];
   PO:=PN;
   If (c=#77)  then
   Case PN of
     1..3: PN:=4;
     4:    PN:=5;
     5..7: PN:=1;
   End;
   If (c=#75)  then
   Case PN of
     1..3: PN:=5;
     4:    PN:=1;
     5..7: PN:=4;
   End;
   Contro(PO,PN);
 Until (c=#27)or(c=#13);
End;

BEGIN
 For i:=1 to N do D[i]:=D[i-1]+W[i]*H;
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Ve;
 Xuli;
 CloseGraph;
END.