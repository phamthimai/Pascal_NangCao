{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
{Program P120314;       Tinh 100!}
{$I P12\Loigiai\P1203\P120312.pas}
Var i: byte;
    s: solon;

BEGIN
 Clrscr;
 Fillchar(s,SizeOf(s),1);
 s[0]:=1;
 For i:=1 to 85 do nhannho(s,i);
 Writeln(' 100! la: ');
 Hien(s);
 Readln;
END.