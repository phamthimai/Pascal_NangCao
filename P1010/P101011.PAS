Program P101011;  {May tinh}
Uses  Crt,Graph;
Const H=30; N=5; X=100; Y=200; L=5;
      W: array [0..N] of integer =(0,3,4,7,8,13);
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
   Rectangle(X+D[i-1],Y,X+D[i-1]+(W[i]-W[i-1])*H-L,Y-H);
   SetColor(15);
   Line(X+D[i-1]+(W[i]-W[i-1])*H-L,Y,X+D[i-1]+(W[i]-W[i-1])*H-L,Y-H);
   Line(X+D[i-1],Y,X+D[i-1]+(W[i]-W[i-1])*H-L,Y);
   SetFillStyle(1,3);
   Bar(X+D[i-1]+1,Y-1,X+D[i-1]+(W[i]-W[i-1])*H-L-1,Y-H+1);
 end;
 PN:=1;
 Contro(PN,PN);
End;

Procedure Xuli;
Var c,Pt: Char;
    i,j: integer;
    So: array [1..2] of integer;
    Kq: real;
    S: string;

  Procedure NhapSo(k: integer);
  Begin
    So[k]:=0;
    Repeat
      Repeat
        c:=ReadKey; If c=#0 then c:=ReadKey;
      Until c in [#13,'0'..'9'];
      PO:=PN;
      Case c of
        '0'..'9': Begin
                    Inc(PN);
                    So[k]:=So[k]*10+Ord(c)-Ord('0');
                  End;
        #13:      PN:=W[2*k-1]+1;
      End;
      Contro(PO,PN);
      SetColor(0);
      i:=X+(PO-1)*H+5;
      j:=Y-33;
      OutTextXY(i,j,c);
    Until (c=#27)or(PN>W[2*k-1]);
  End;

Begin  {Xuli}
 Repeat
   Ve;
   NhapSo(1);
   Repeat
     c:=ReadKey; If c=#0 then c:=ReadKey;
   Until c in ['+','-','*','/'];
   PO:=PN;
   Inc(PN);
   Contro(PO,PN);
   SetColor(0);
   i:=X+(PO-1)*H+5;
   OutTextXY(i,j,c);
   Pt:=c;
   NhapSo(2);
   Case Pt of
     '+': Kq:=So[1]+So[2];
     '-': Kq:=So[1]-So[2];
     '*': Kq:=So[1]*So[2];
     '/': If So[2]<>0 then Kq:=So[1]/So[2]
          Else Kq:=0;
   End;
   Bar(X+D[3]+1,Y-1,X+D[3]+(W[4]-W[3])*H-L-1,Y-H+1);
   SetColor(0);
   i:=X+(PN-1)*H+5;
   OutTextXY(i,j,'=');
   Str(Kq:0:1,S);
   SetColor(0);
   i:=X+(PN)*H+5;
   OutTextXY(i,j,S);
   Repeat
     c:=ReadKey; If c=#0 then c:=ReadKey;
   Until c in [#13,#27];
 Until c=#27;
End;   {Xuli}

BEGIN
 For i:=1 to N do D[i]:=W[i]*H;
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 Xuli;
 CloseGraph;
END.