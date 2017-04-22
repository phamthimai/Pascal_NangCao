{Program P120313;      Tinh 2^200}
{$I P12\Loigiai\P1203\P120312.pas}
Var i: byte;
    s: solon;

BEGIN
 Clrscr;
 FillChar(s,Sizeof(s),1);
 s[0]:=1;
 For i:=1 to 200 do nhannho(s,2);
 Writeln(' 2^200 la: ');
 Hien(s);
 Readln;
END.