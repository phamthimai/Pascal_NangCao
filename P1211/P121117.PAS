Program P121117;   {chon thoi gian}
Uses crt;
Var  n,t,n1,t1: integer;
     ch       : char;

Begin
 Repeat
   Write(' Ban cho ngay '); Readln(n);
 Until (n>0)and(n<32);
 t:=0;
 Write(' Ban choi truoc C/K'); Readln(ch);
 Repeat
   if upcase(ch)='C' then
   Begin
     Writeln(' Ngay ',n,' thang ',t);
     if (n=31)and(t=21) then
     Begin
       Writeln(' Ban da thua'); Readln;
       exit;
     End;
     Repeat
       Write(' Nhap ngay moi '); Readln(n1);
       Write(' Nhap thang moi'); Readln(t1);
     Until (n1<32)and(t1<13)and(n1>=n)and(t1>=t)and((n1<>n)or(t1<>t));
     n:=n1; t:=t1;
   End
   else
   Begin
     Writeln(' Ngay ',n,' thang ',t);
     if (n=31)and(t=21) then
     Begin
       Writeln(' May da thua'); Readln;
       exit;
     End;
   End;
 Until false;
End.