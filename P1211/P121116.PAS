Program P121116;  {boc diem}
Uses crt;
Var  n : byte;
     ch: char;

Function bandi: integer;
Var a: integer;
Begin
 Repeat
   write('Ban boc may que 1-6: '); readln(a);
 Until (a>0)and(a<7)and(a<=n);
 bandi:=a;
End;

Function maydi: integer;
Var a: integer;
Begin
 a:=n mod 7;
 if a=0 then a:=1;
 maydi:=a;
 writeln('May boc ',a,' que ');
End;

Begin
 n:=100;
 write(' Ban di truoc C/K  '); readln(ch);
 Repeat
   if upcase(ch)='C' then
   Begin
     if n=0 then
     Begin
       write(' Ban da thua'); readln;
       halt;
     End;
     n:=n-bandi;
     writeln('   Dong soi con ',n,' vien');
     ch:='K';
   End
   else
   Begin
     if n=0 then
     Begin
       write(' May da thua'); readln;
       halt;
     End;
     n:=n-maydi;
     writeln('   Dong soi con ',n,' vien');
     ch:='C';
   End;
 Until false;
End.