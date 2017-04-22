Program P120303;  {Chuyen tu he nhi phan sang he thap phan}
Uses Crt;
Var  s: string;
     t: longint;
     i: byte;

BEGIN
 Clrscr;
 Write('Nhap so nhi phan T: '); Readln(s);
 t:=0;
 For i:=1 to length(s) do
   If s[i]='1' then t:=t Shl 1+1 Else t:=t Shl 1;
 Writeln('So T trong he thap phan la: ',t);
 Readln;
END.