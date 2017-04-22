Program P120613;        {Tinh A^2}
Uses  Crt;
Const max=50;
      fi='nhanMT.Inp';
      fo='NhanMt.Out';
Var   A,B,C: Array [1..Max,1..max] of Longint;
      N,Mu : Byte;
      f    : Text;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,N,Mu);
 For i:=1 to N do
 begin
   For j:=1 to N do Read(f,A[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuly;
Var bac,i,j,k: byte; gt: longint;
Begin
 bac:=1; C:=a;
 While 2*bac<mu do
 begin
   B:=A;
   For i:=1 to n do
     For j:=1 to n do
     begin
       Gt:=0;
       For k:=1 to n do gt:=gt+B[i,k]*b[k,j];
       A[i,j]:=gt;
     end;
   bac:=2*bac;
 end;
 While bac<mu do
 begin
   B:=A;
   For i:=1 to n do
     For j:=1 to n do
     begin
       Gt:=0;
       For k:=1 to n do gt:=gt+B[i,k]*C[k,j];
       A[i,j]:=gt;
     end;
   bac:=bac+1;
 end;
End;

Procedure Ketqua;
Var i,j: byte;
Begin
 Assign(f,fo); Rewrite(f);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,A[i,j],' '); Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
 Ketqua;
END.

Sample Input:
3 7
1 2 3
2 3 1
3 1 2
Sample Output:
93285 93312 93339
93312 93339 93285
93339 93285 93312
