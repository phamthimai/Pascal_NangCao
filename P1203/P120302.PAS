Program P120302;  {chuyen he thap phan sang he nhi phan}
Uses Crt;
Var  t: longint;
     s: String;

BEGIN
 ClrScr;
 Write('Nhap so T: '); Readln(t);
 s:='';
 Repeat
   If t mod 2=0 then s:='0'+s Else s:='1'+s;
   t:=t div 2;
 Until t=0;
 Writeln('So T trong he nhi phan la: ',s);
 Readln;
END.