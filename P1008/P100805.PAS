Program P100805;       {Pham vi kiem soat cua Con hau}
Uses  Crt,Graph;
Const N=8; W=40; X=150; Y=400;
Var   Gd,Gm,i,Hi: Integer;
      j,Hj,H: char;
      S: String;
      Pattern : FillPatternType;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 OutTextXY(270,430,'Ban co vua');
 For i:=1 to N do
   For j:='a' to chr(Ord('a')+N-1) do
   begin
     If Odd(i+Ord(j)) then SetFillStyle(SolidFill,14)
     Else SetFillStyle(SolidFill,15);
     Bar(X+(i-1)*W,Y-(Ord(j)-Ord('a'))*W,X+i*W,Y-(Ord(j)-Ord('a')+1)*W);
   end;
 OutTextXY(200,20,'Nhap vi tri con hau:');
 Hj:=ReadKey; OutTextXY(370,20,Hj);
 H:=ReadKey; Hi:=Ord(H)-Ord('0'); OutTextXY(380,20,H);
 SetColor(4);
 Circle(X+(Hi-1)*W+W div 2,Y-(Ord(Hj)-Ord('a'))*W-W div 2,W div 2-5);
 GetFillPattern(Pattern);
 SetFillPattern(Pattern,4);
 FloodFill(X+(Hi-1)*W+W div 2,Y-(Ord(Hj)-Ord('a'))*W-W div 2,4);
 SetFillStyle(SolidFill,13);
 For i:=1 to N do
   For j:='a' to chr(Ord('a')+N-1) do
     If ((i<>Hi)or(j<>Hj))
     and((Abs(i-Hi)=Abs(Ord(j)-Ord(Hj)))or(i=Hi)or(j=Hj)) then
       Bar(X+(i-1)*W,Y-(Ord(j)-Ord('a'))*W,X+i*W,Y-(Ord(j)-Ord('a')+1)*W);
 Readln;
 CloseGraph;
END.