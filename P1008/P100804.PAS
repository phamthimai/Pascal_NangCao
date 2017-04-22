Program P100804;       {Ve Ban co vua}
Uses  Crt,Graph;
Const N=8; W=40; X=150; Y=400;
Var   Gd,Gm,i: Integer;
      j: char;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 OutTextXY(270,430,'Ban co vua');
 For i:=1 to N do
   For j:='a' to chr(Ord('a')+N-1) do
   begin
     If Odd(i+Ord(j)) then SetFillStyle(SolidFill,5)
     Else SetFillStyle(SolidFill,15);
     Bar(X+(i-1)*W,Y-(Ord(j)-Ord('a'))*W,X+i*W,Y-(Ord(j)-Ord('a')+1)*W);
 end;
 Readln;
 CloseGraph;
END.