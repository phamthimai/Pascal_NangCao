{$i P12\Loigiai\P1203\P120312.pas}
{Program P120315;   {Doi so thap phan lon thanh nhi phan}
Var s,s1,s3: solon;
    d: Array [1..maxint] of byte;
    n,i: integer;

BEGIN
 Clrscr;
 Write(' Nhap so lon N = '); Nhap(s);
 s1[0]:=1; s1[1]:=2; n:=0;
 Repeat
   chia(s,s1,s3);
   Inc(n);
   d[n]:=s3[1];
 Until s[0]=0;
 For i:=n downto 1 do Write(d[i]);
 Readln;
END.