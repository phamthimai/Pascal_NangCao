{$I P12\Loigiai\P1203\P120312.pas}
{Program P120316;   Doi tu nhi phan sang thap phan}
Var i: byte;
    s,s1: solon;
    str: string;

Procedure haimu(n: byte; Var s: solon);
Var i: byte;
Begin
 Fillchar(s,sizeof(s),0);
 s[0]:=1; s[1]:=1;
 For i:=1 to n do nhannho(s,2);
End;

BEGIN
 Fillchar(s,sizeof(s),0);
 s[0]:=1;
 Write('Nhap so nhi phan: '); Readln(str);
 For i:=length(str) downto 1 do
 If str[i]='1' then
 begin
   haimu(length(str)-i,s1);
   cong(s,s1);
 end;
 Write('Chuyen sang thap phan la: ');
 Hien(s);
 Readln;
END.