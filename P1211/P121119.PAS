Program P121119;   {Tro choi Nim}
Uses crt;
Var  n: byte;
     a: array [1..100] of word;

Procedure input;
Var i: byte;
Begin
 Writeln;
 Write(' Nhap so dong soi N= '); Readln(n);
 For i:=1 to n do
 Begin
   Write(' Nhap so soi cua dong ',i,' = '); Readln(a[i]);
 End;
End;

Procedure nguoichoi;
Var c,b: integer;
Begin
 Repeat
   Write(' Ban boc dong nao '); Readln(c);
   If a[c]=0 then Writeln(' Dong do khong con soi');
 Until a[c]<>0;
 Repeat
   Write(' Ban boc may vien ');Readln(b);
   If b>a[c] then Writeln(' Khong the boc nhieu hon so soi ');
 Until b<=a[c];
 a[c]:=a[c]-b;
End;

function over: boolean;
Var i: byte;
Begin
 over:=false;
 For i:=1 to n do If a[i]<>0 then exit;
 over:=true;
End;

Procedure maychoi;
Var i,t: byte; d,d1,max: word;
Begin
 max:=0;
 For i:=1 to n do
   If a[i]>max then
   Begin
     max:=a[i];
     t:=i;
   End;
 d:=0;
 For i:=1 to n do If i<>t then d:=d xor a[i];
 For d1:=1 to a[t] do If d1 xor d = 0 then break;
 d1:=a[t]-d1;
 If d1=0 then d1:=1;
 a[t]:=a[t]-d1;
 Writeln(' May boc dong ',t,' voi so soi la ',d1,' vien');
End;

Procedure play;
Var ch: char; i: byte;
Begin
 Write('Ban di truoc C/K');Readln(ch);
 Repeat
   If upcase(ch)='C' then
   Begin
     For i:=1 to n do Write(' ',a[i]);
     Writeln;
     If over then
     Begin
       Writeln(' Ban da thua'); Readln;
       halt;
     End;
     nguoichoi;
     ch:='K';
   End
   else
   Begin
     For i:=1 to n do Write(' ',a[i]);
     Writeln;
     If over then
     Begin
       Writeln(' May da thua'); Readln;
       halt;
     End;
     maychoi;
     ch:='C';
   End;
 Until false;
End;

Begin
 input;
 play;
End.
