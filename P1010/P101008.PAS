Program P101008;   {Dong ho dien tu voi Mau chu so 7 doan}
Uses Crt,Dos,Graph;
Const inp='P10\Bai10\P101008.TXT';
      W=30; H=25; D=2; X0=140; Y0=200;
Var   Gd,Gm,i,j,k,X,Y: Integer;
      f: text;
      a: array [1..5] of 0..9;
      cs: array [0..9] of string[7];
      hr,m,s,hund: Word;
      St: String;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 For i:=0 to 9 do Readln(f,cs[i]);
 Close(f);
End;

Function LeadingZero(w: Word): String;
Var  s: String;
Begin
  Str(w:0,s);
  if Length(s)=1 then s:='0'+s;
  LeadingZero:=s;
End;

Procedure So(x,y,So,C,B: integer);
Var i,M: integer;
Begin
 SetFillStyle(1, B);
 Bar(x-D,y-D,x+W+D,y+2*H+D);
 SetColor(C);
 For i:=1 to 7 do If cs[So,i]='1' then
   Case i of
     1: Line(x,y,x+W,y);
     2: Line(x,y,x,y+H);
     3: Line(x+W,y,x+W,y+H);
     4: Line(x,y+H,x+W,y+H);
     5: Line(x,y+H,x,y+2*H);
     6: Line(x+W,y+H,x+W,y+2*H);
     7: Line(x,y+2*H,x+W,y+2*H);
   End;
End;

BEGIN
 Nhap;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 Y:=Y0;
 Repeat
   GetTime(hr,m,s,hund);
   St:=LeadingZero(hr)+':'+LeadingZero(m)+':'+LeadingZero(s);
   For i:=1 to Length(St) do
     If St[i] in ['0'..'9'] then
     begin
       Val(St[i],j,k);
       X:=X0+i*(W+2*D+2);
       So(x,y,j,4,3);
      end;
   Delay(1000);
 Until KeyPressed;
 CloseGraph;
END.