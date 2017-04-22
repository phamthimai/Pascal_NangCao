Program P101004;   {Dong ho dien tu}
Uses Crt,Dos,Graph;
Var  h,m,s,hund: Word;
     GD,GM: Integer;
     St: String;

Function LeadingZero(w: Word): String;
Var  s: String;
Begin
  Str(w:0,s);
  if Length(s)=1 then s:='0'+s;
  LeadingZero:=s;
End;

BEGIN
 GD:=Detect;
 InitGraph(GD,GM,' ');
 SetTextStyle(DefaultFont,HorizDir,5);
 Repeat
   GetTime(h,m,s,hund);
   St:=LeadingZero(h)+':'+LeadingZero(m)+':'+LeadingZero(s);
   SetColor(15);
   OutTextXY(150,200,St);
   Delay(1000);
   SetColor(0);
   OutTextXY(150,200,St);
 Until KeyPressed;
 CloseGraph;
END.
