Program P111517;
Uses crt;
Var n:byte;
    a,b:array[1..100,1..100] of byte;
    d,c:array[1..100] of byte;
    count:word;

Procedure input;
Begin
 Write(' Nhap n = ');Readln(n);
 n:=2*n;
End;

Function dc(x:byte):byte;
Var i,d:byte;
Begin
 d:=0;
 For i:=1 to n do
 If a[i,x]=1 then inc(d);
 dc:=d;
End;

Function dd(y:byte):byte;
Var d,i:byte;
Begin
 d:=0;
 For i:=1 to n do
 If a[y,i]=1 then inc(d);
 dd:=d;
End;

Procedure output;
Var x,y:byte;
Begin
 For y:=1 to n do If dd(y)=1 then break;
 For x:=1 to n do If dc(x)=1 then break;
 b:=a;
 b[y,x]:=1;
 For y:=1 to n do
 For x:=1 to n do
 Begin
   Gotoxy(x*2,y);
   Write(b[y,x]);
 End;
 delay(100);
End;

Procedure hien;
Var i,j:byte;
Begin
 If count=2*n - 1 then output;
End;

Procedure timd(y:byte); Forward;

Procedure timc(x:byte);
Var i:byte;
Begin
 hien;
 For i:=1 to n do
 If d[i]=0 then
 Begin
   d[i]:=1;
   a[i,x]:=1;
   c[x]:=1;
   inc(count);
   timd(i);
   dec(count);
   c[x]:=0;
   a[i,x]:=0;
   d[i]:=0;
 End;
End;

Procedure timd(y:byte);
Var i:byte;
Begin
 hien;
 For i:=1 to n do
 If c[i]=0 then
 Begin
   c[i]:=1;
   d[y]:=1;
   a[y,i]:=1;
   inc(count);
   timc(i);
   dec(count);
   a[y,i]:=0;
   d[y]:=0;
   c[i]:=0;
 End;
End;

Procedure work;
Var i:byte;
Begin
 fillchar(a,sizeof(a),0);
 fillchar(c,sizeof(c),0);
 fillchar(d,sizeof(d),0);
 count:=0;
 timd(1);
End;

Begin
 input;
 clrscr;
 work;
End.