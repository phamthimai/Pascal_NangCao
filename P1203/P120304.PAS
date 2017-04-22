Program P120304; { Chuyen tu he nhi phan sang he hexa }
Uses  Crt;
Const hex: array[0..15] of char
      =('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
Var   s1,s2: String;
      i: byte;
      t: longint;

BEGIN
 Clrscr;
 Write(' Nhap so nhi phan T: '); Readln(s1);
 t:=0;
 For i:=1 to length(s1) do
   If s1[i]='1' then t:=t Shl 1+1 Else t:=t Shl 1;
 s2:='';
 Repeat
   s2:=hex[t mod 16]+s2;
   t:=t div 16;
 Until t=0;
 Writeln('So T trong he hex la: ',s2);
 Readln;
END.