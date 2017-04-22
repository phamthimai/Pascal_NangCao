Program P121120;
{tro choi hai quan Trang Den}
Uses crt;
Var  n    : byte;
     h,m,a: array [1..100] of byte;
     i    : byte;
     fx,fy: byte;
     ch   : char;

Procedure hien;
Var i,j: byte;
Begin
 For i:=1 to n do
   For j:=1 to n do
   Begin
     gotoxy(j*2,i);
     textcolor(1);
     If j=h[i] then textcolor(15);
     If j=m[i] then textcolor(0);
     If (i=fy) and (j=fx) then Write('**') else Write('лл');
   End;
End;

Procedure nguoidi;
label 1;
Var ch1: char; i: byte;
Begin
 hien;
 For i:=1 to n do
   If (h[i]<>1)or(m[i]<>2) then goto 1;
 Writeln;
 Writeln(' Ban da thua');
 Readln;
 halt;
1:
 repeat
   ch1:=Readkey;
   If ch1=#0 then ch1:=Readkey;
   case ch1 of
     #72: If fy>1 then
          Begin
            dec(fy);
            If fx>=m[fy] then fx:=m[fy]-1;
          End;
     #80: If fy<n then
          Begin
            inc(fy);
            If fx>=m[fy] then fx:=m[fy]-1;
          End;
     #75: If fx>1 then dec(fx);
     #77: If (fx<n)and(fx+1<m[fy]) then inc(fx);
   End;
   hien;
 until (ch1=#13)and(h[fy]<>fx);
 h[fy]:=fx;
 hien;
End;

Procedure maydi;
label 1;
Var i,max,t,d,d1: byte;
Begin
 For i:=1 to n do
 If (h[i]<>n-1)or(m[i]<>n) then goto 1;
 Writeln;
 Writeln(' May da thua');
 Readln;
 halt;
1:
 max:=0;
 For i:=1 to n do a[i]:=m[i]-h[i]-1;
 For i:=1 to n do
   If a[i]>max then Begin t:=i; max:=m[i]-h[i]; End;
 If max=0 then
   For i:=1 to n do
     If m[i]<n then Begin inc(m[i]); exit; End;
 d:=0;
 For i:=1 to n do If i<>t then d:=d xor a[i];
 For d1:=1 to a[t] do If d xor d1 = 0 then break;
 d1:=a[t]-d1;
 If d1=0 then d1:=1;
 m[t]:=m[t]-d1;
End;

Procedure play;
Begin
 Repeat
   If upcase(ch)='C' then Begin nguoidi; ch:='K'; End
   else                   Begin   maydi; ch:='C'; End;
 Until false;
End;

Begin
 textbackground(0);
 clrscr;
 Write(' Nhap so N = '); Readln(n);
 Write(' Ban di truoc C/K '); Readln(ch);
 textbackground(15);
 clrscr;
 fx:=1; fy:=1;
 fillchar(h,sizeof(h),0);
 fillchar(m,sizeof(m),0);
 For i:=1 to n do
 Begin
   h[i]:=1; m[i]:=n;
 End;
 hien;
 play;
End.