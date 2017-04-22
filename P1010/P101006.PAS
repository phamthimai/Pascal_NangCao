Program P101006;       {Ve Ban co vua}
Uses  Crt,Graph;
Const N=8; W=40; X=150; Y=400;
Var   Gd,Gm,i: Integer;
      j: char;
      c: String;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to N do
 begin
   Str(i,c);
   OutTextXY(X-15,Y-i*W+W div 2,c);
   For j:='a' to chr(Ord('a')+N-1) do
   begin
     If Odd(i+Ord(j)) then SetFillStyle(SolidFill,5)
     Else SetFillStyle(SolidFill,15);
     Bar(X+(Ord(j)-Ord('a'))*W,Y-(i-1)*W,X+(Ord(j)-Ord('a')+1)*W,Y-i*W);
     If i=1 then OutTextXY(X+(Ord(j)-Ord('a'))*W+W div 2,Y+10,j);
   end;
 end;
 SetTextStyle(0,0,3);
 OutTextXY(X,Y+50,'Ban co vua');
 Readln;
 CloseGraph;
END.