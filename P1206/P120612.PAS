{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program P120612;
{Giai he phuong trinh bac nhat n an bang phuong phap cong dai so}
Uses  Crt;
Const max=100;
      Fi='Gauss.Inp';
      Fo='Gauss.Out';
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
   For j:=1 to n+1 do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Ketthuc;
Begin
 Assign(f,fo); Rewrite(f);
 Writeln(f,'he da cho vo nghiem hoac vo so nghiem');
 Close(f);
End;

Function Tim(x: byte): byte;
Var i: byte;
Begin
 Tim:=0;
 For i:=x+1 to n do
   If a[i,x]<>0 then
   begin
     Tim:=i;
     exit;
   end;
End;

Procedure Doi(j,y: byte);
Var i: byte; tg: real;
Begin
 For i:=1 to n+1 do
 begin
   tg:=a[j,i];
   a[j,i]:=a[y,i];
   a[y,i]:=tg;
 end;
End;

Procedure Tru(y,j : byte);
Var i: byte; nho: real;
Begin
 nho:=a[y,j];
 For i:=1 to N+1 do A[y,i]:=a[y,i]-nho*a[j,i];
End;

Procedure Khu_bien;
Var i,j: byte; nho:real;
Begin
 For i:=1 to n do
 begin
   If a[i,i]=0 then
   begin
     j:=tim(i);
     If j<>0 then doi(i,j)
     Else begin Ketthuc; Halt; end;
   end;
   nho:=a[i,i];
   For j:=1 to n+1 do A[i,j]:=a[i,j]/nho;
   For j:=i+1 to n do tru(j,i);
 end;
End;

Procedure Tinh(j: byte);
Var i: byte;
Begin
 For i:=n downto j+1 do a[j,n+1]:=a[j,n+1]-a[j,i]*X[i];
End;

Procedure Tinh_an;
Var i: byte;
Begin
 For i:=n downto 1 do
 begin
   X[i]:=a[i,n+1];
   If i>1 then Tinh(i-1);
 end;
End;

Procedure Xuly;
Begin
 Khu_bien;
 Tinh_an;
End;

Procedure Ketqua;
Var i: byte;
Begin
 Assign(f,fo); Rewrite(f);
 For i:=1 to n do Writeln(f,x[i]:10:5,' ');
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
 Ketqua;
END.

3
3 6 -9 -9
1 2 2 2
-1 4 6 0