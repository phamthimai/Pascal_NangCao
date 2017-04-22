{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program P120616;
Uses  Crt;
Const max=100;
      Fi='P1206\bdmt.Inp';
Var   A: Array [1..max,1..max+1] of real;
      X: Array [1..max] of real;
      N: byte;
      f: Text;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,N);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuat;
Var i,j: byte;
Begin
 For i:=1 to n do
 begin
   For j:=1 to n do Write(a[i,j]:8:2); Writeln;
 end;
 Readln;
End;

Procedure Ketthuc;
Begin
 Writeln('Khong bien doi duoc');
End;

Function Tim(x: byte): byte;
Var i: byte;
Begin
 Tim:= 0;
 For i:=x+1 to n do
   If a[i,x]<>0 then
   begin
     Tim:= i;
     exit;
   end;
End;

Procedure Bdcs1h(j,y: byte);
Var i: byte; tg: real;
Begin
 For i:=1 to n+1 do
 begin
   tg:=a[j,i];
   a[j,i]:=a[y,i];
   a[y,i]:=tg;
 end;
 Writeln('BDCS1 H ',j,' ',y);
 Xuat;
End;

Procedure Bdcs3h(y,j: byte; nho: real);
Var i: byte;
Begin
 For i:=1 to N+1 do A[y,i]:=a[y,i]-nho*a[j,i];
 Writeln('BDCS3 H ',y,' - ',nho,'*',j);
 Xuat
End;

Procedure Bdcs2h(x: byte; nho: real);
Var i: byte;
Begin
 For i:=1 to n do A[x,i]:=a[x,i]*nho;
 Writeln('BDCS2 H ',X,'*',nho);
 Xuat;
End;

Procedure Khu_lan1;
Var i,j: byte; nho: real;
Begin
 For i:=1 to n do
 begin
   If a[i,i]=0 then
   begin
     j:=tim(i);
     If j<>0 then Bdcs1h(i,j)
     Else begin
            Ketthuc;
            Halt;
          end;
   end;
   Bdcs2H(i,1/a[i,i]);
   For j:=i+1 to n do Bdcs3H(j,i,a[j,i]);
 end;
End;

Procedure Khu_lan2;
Var i,j: byte;
Begin
 For i:=1 to N-1 do
   For j:=i+1 to n do bdcs3h(i,j,a[i,j]);
End;

Procedure Xuly;
Begin
 Khu_lan1;
 Khu_lan2;
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
END.