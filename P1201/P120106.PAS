Program P120106;   {Tinh ham F(n)}
Uses Crt;
Var  N: Word;

Function F(N: Word): Word;
Begin
 If (N=0)or(N=1) then F:=N
 Else If (N mod 2=0) then F:=F(N div 2)
      Else F:=F(N div 2)+F(N div 2+1);
End;

BEGIN
 Clrscr;
 Write('Nhap so tu nhien N: '); Readln(N);
 Write('F(N) = ',F(N));
 Readln;
END.