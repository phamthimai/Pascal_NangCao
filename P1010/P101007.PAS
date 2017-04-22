Program P101007;  {Day nut day}
Uses  Crt,Graph;
Const W=80; H=30; D=100; N=4; X=150; Y=300;
      a: array [0..3] of String=('Edit','View','Imagin','Help');
Var   Gd,Gm,PO,PN: Integer;
      c: Char;

Procedure Doi(PO,PN: Byte);
Var i: Byte;
Begin
 SetColor(15);
 Line(X+(PO-1)*D,Y-H,X+(PO-1)*D+W,Y-H);
 Line(X+(PO-1)*D,Y,X+(PO-1)*D,Y-H);
 SetColor(0);
 Line(X+(PO-1)*D,Y,X+(PO-1)*D+W,Y);
 Line(X+(PO-1)*D+W,Y,X+(PO-1)*D+W,Y-H);
 SetColor(9);
 SetTextStyle(3,0,1);
 OutTextXY(X+(PO-1)*D+10,Y-25,a[PO-1]);
 SetColor(0);
 Line(X+(PN-1)*D,Y-H,X+(PN-1)*D+W,Y-H);
 Line(X+(PN-1)*D,Y,X+(PN-1)*D,Y-H);
 SetColor(15);
 Line(X+(PN-1)*D,Y,X+(PN-1)*D+W,Y);
 Line(X+(PN-1)*D+W,Y,X+(PN-1)*D+W,Y-H);
 SetColor(10);
 SetTextStyle(3,0,1);
 OutTextXY(X+(PN-1)*D+10,Y-25,a[PN-1]);
End;

Procedure Ve;
Var i: Byte;
Begin
 SetFillStyle(1,7);
 Bar(0,0,GetMaxX,GetMaxY);
 For i:=0 to N-1 do
 begin
   SetColor(15);
   Line(X+i*D,Y-H,X+i*D+W,Y-H);
   Line(X+i*D,Y,X+i*D,Y-H);
   SetColor(0);
   Line(X+i*D,Y,X+i*D+W,Y);
   Line(X+i*D+W,Y,X+i*D+W,Y-H);
   SetColor(9);
   SetTextStyle(3,0,1);
   OutTextXY(X+i*D+10,Y-25,a[i]);
 end;
 PN:=1;
 Doi(PN,PN);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Ve;
 Repeat
   Repeat
     c:=ReadKey;
     If c=#0 then c:=ReadKey;
   Until c in [#27,#13,#75,#77,#101,#104,#105,#118];
   PO:=PN;
   Case c of
     #75:  If (PN>1) then Dec(PN) Else PN:=N;
     #77:  If (PN<N) then Inc(PN) Else PN:=1;
     #104: PN:=4;
     #101: PN:=1;
     #118: PN:=2;
     #105: PN:=3;
   End;
   Doi(PO,PN);
 Until (c=#27)or(c=#13);
 CloseGraph;
END.