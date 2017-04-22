Program P110207;
{Ma hoa xau bang cach tang thu tu tu ma hoa trong bang chu cai len 1}
Uses  Crt;
Const khoa=1;
Var   s1,s2: string;
      i: byte;

BEGIN
 ClrScr;
 Write('Nhap xau ki tu can ma hoa: ');Readln(s1);
 Write('Nhap xau ki tu can giai ma: ');Readln(s2);
 Clrscr;
 Writeln('Ma hoa cua "',s1,'" la :');
 For i:=1 to length(s1) do
   If s1[i] in ['A'..'Z'] then
       s1[i]:=chr((((ord(s1[i])-39)+khoa) mod 26)+65)
   Else If s1[i] in ['a'..'z'] then
        s1[i]:=chr((((ord(s1[i])-71)+khoa) mod 26)+97);
 Writeln(s1);
 Writeln('Giai ma cua "',s2,'" la :');
 For i:=1 to length(s2) do
   If s2[i] in ['A'..'Z'] then
       s2[i]:=chr((((ord(s2[i])-39)-khoa) mod 26)+65)
   Else If s2[i] in ['a'..'z'] then
        s2[i]:=chr((((ord(s2[i])-71)-khoa) mod 26)+97);
 Writeln(s2);
 Readln;
END.