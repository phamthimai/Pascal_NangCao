Program P121121;
{Tro choi Keylesa}
Uses crt;
Var  n,i: byte;
     ch : char;
     a  : array [1..200] of byte;

Function doixung: boolean;
Var i: byte;
Begin
 doixung:=false;
 For i:=1 to n div 2 do If a[i]<>a[n-i+1] then exit;
 doixung:=true;
End;

Procedure hien;
Var i: byte;
Begin
 clrscr;
 For i:=1 to n do
 Begin
   gotoxy(i*6,3);
   textcolor(15);
   If a[i]=1 then textcolor(4);
   write('ллллл');
 End;
 writeln;
End;

Function over: boolean;
Var i: byte;
Begin
 over:=false;
 For i:=1 to n do If a[i]=1 then exit;
 over:=true;
End;

Procedure nguoidi;
Var c,b:byte;
Begin
 hien;
 Repeat
   write(' Ban boc vien thu may '); readln(c);
   write(' Ban boc may vien '); readln(b);
   b:=b-1;
 Until (a[c]=1)and(b<2)and(a[c+b]=1);
 a[c]:=0;
 a[c+b]:=0;
End;

Procedure maydi;
Var i: byte;
Begin
 i:=n div 2;
 If (n mod 2=0)and(a[i]=1)and(a[i+1]=1) then
 Begin
   a[i]:=0;
   a[i+1]:=0;
   exit;
 End;
 If (n mod 2<>0)and(a[i+1]=1) then
 Begin
   a[i+1]:=0;
   exit;
 End;
 For i:=1 to n do
 If a[i]=1 then
   Begin
     a[i]:=0;
     If doixung then exit;
     a[i]:=1;
   End;
 For i:=1 to n-1 do
   If (a[i]=1) and (a[i+1]=1) then
   Begin
     a[i]:=0; a[i+1]:=0;
     If doixung then exit;
     a[i]:=1; a[i+1]:=1;
   End;
 For i:=1 to n do If a[i]=1 then
 Begin
   a[i]:=0;
   exit;
 End;
End;

Begin
 textbackground(0);
 clrscr;
 write(' Nhap so vien soi N= '); readln(n);
 write(' Ban di truoc C/K '); readln(ch);
 For i:=1 to n do a[i]:=1;
 a[n+1]:=0;
 Repeat
   If upcase(ch)='C' then
   Begin
     If over then
     Begin
       write(' Ban da thua');
       readln;
       exit;
     End;
     nguoidi;
     ch:='0';
   End
   else
   Begin
     If over then
     Begin
       write(' May da thua');
       readln;
       exit;
     End;
     maydi;
     hien;
     ch:='C';
   End;
 Until false;
End.