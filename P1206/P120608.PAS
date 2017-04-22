{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
Program P120608;   {Tinh dinh thuc cua ma tran cho truoc}
Uses  Crt;
Const max=10;
      fi='dtmt.Inp';
      fo='dtmt.Out';
Type  mang=array [1..max,1..max] of integer;
Var   A: mang;
      N: Byte;
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

Procedure Bo(kt: byte; Var x: mang; y,z: byte);
Var i,j: byte;
Begin
 For i:=1 to kt do
   For j:=z to kt-1 do A[i,j]:=a[i,j+1];
 For i:=y to kt-1 do
   For j:=1 to kt-1 do A[i,j]:=a[i+1,j];
End;

Function Tinh(x: byte; b: mang; p,q: byte): integer;
Var i: byte; gt: longint;
Begin
 gt:=0;
 If (p<>0) then bo(x+1,b,p,q);
 If x=1 then
 begin
   Tinh:=B[1,1];
   exit;
 end;
 For i:=1 to x do
   If i mod 2=1 then gt:=gt+B[1,i]*tinh(x-1,B,i,1)
   Else gt:=gt-B[1,i]*tinh(x-1,B,i,1);
 tinh:=gt;
End;

Procedure Xuly;
Begin
 Assign(f,fo); Rewrite(f);
 Writeln(f,Tinh(N,A,0,0));
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
END.

Input:
  2
     1 2
     3 4
Output:
-1