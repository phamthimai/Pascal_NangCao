{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
Program P120610;   {Giai he phuong trinh bac nhat n an}
Uses  Crt;
Const max=10;
      fi='hept.Inp';
      fo='hept.out';
Type  mang=array [1..max,1..max] of real;
Var   A,B,C: mang;
      hs,D : Array [1..max] of real;
      N    : Byte;
      f    : Text;
      gt   : real;

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
 For i:=1 to n do Read(f,hs[i]);
End;

Procedure Bo(kt: byte; Var x: mang; z,y: byte);
Var i,j: byte;
Begin
 For i:=1 to kt do
   For j:=y to kt-1 do X[i,j]:=X[i,j+1];
 For i:=z to kt-1 do
   For j:=1 to kt-1 do X[i,j]:=X[i+1,j];
End;

Function det(x: byte; bt: mang; p,q: byte): real;
Var i: byte; gt1,gt2: real;
Begin
 If (p<>0) then bo(x+1,bt,p,q);
 If x=1 then
 begin
   det:= bt[1,1];
   exit;
 end;
 For i:=1 to x do
 begin
   gt1:= 0; gt2:= 0;
   If i mod 2=1 then gt1:= Bt[1,i]*det(x-1,Bt,1,i)
   Else gt2:= -Bt[1,i]*det(x-1,Bt,1,i);
   gt:= gt+gt1+gt2;
 end;
 det:= gt;
End;

Procedure Lam;
Var i,j: byte; g,t: real;
Begin
 Assign(f,fo); Rewrite(f);
 C:= A;
 gt:= 0;
 g:= det(n,C,0,0);
 If g= 0 then
 begin
   Writeln(f,'Khong Co nghiem');
   Close(f);
   Halt;
 end;
 For i:= 1 to n do
   For j:= 1 to n do
   begin
     C:=a;
     gt:=0;
     t:=det(n-1,C,j,i);
     If i+j mod 2=0 then B[i,j]:=t/g
     Else B[i,j]:=-1*t/g;
   end;
 Close(f);
End;

Procedure Nhan;
Var i,j,t: byte;
Begin
 Assign(f,fo); Rewrite(f);
 For i:=1 to n do
 begin
   gt:=0;
   For t:=1 to n do gt:=gt+B[i,t]*hs[t];
   D[i]:=gt;
 end;
 For i:=1 to n do
 begin
   For j:=1 to 1 do Write(f,D[i],' '); Writeln(f);
 end;
 Close(f);
End;

Procedure Xuly;
Begin
 Lam;
 Nhan;
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
END.