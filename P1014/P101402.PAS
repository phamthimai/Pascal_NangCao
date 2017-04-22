Program P101402;   {so ten pascal chuan}
Uses  Crt;
Const p=10; m=26;
Var   n,i: integer;
      s: real;

BEGIN
 Clrscr;
 n:=m+p; s:=1;
 For i:=1 to 8 do s:=s*n;
 s:=m*(s-1)/(n-1);
 Write('Tong so ten bien: S = ',S:0:0);
 Readln;
END.