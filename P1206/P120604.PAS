Program P120604;   {Tinh luy thua logic bac r}
Uses  Crt;
Const max=100;
      fi='P12\Loigiai\P1206\mt4.inp';
      fo='P12\Loigiai\P1206\mt4.out';
Var   A,B,C: Array [1..max,1..max] of byte;
      n,r  : byte;
      f    : Text;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,n,r);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,A[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuly;
Var i,j,k,t,p: byte;
Begin
 B:=A; C:=A;
 For k:=1 to r-1 do
 begin
   For i:=1 to n do
     For j:=1 to n do
     begin
       p:=A[i,1] and B[1,j];
       For t:=2 to n do p:=p or (A[i,t] and B[t,j]);
       C[i,j]:=P;
     end;
   A:=C;
 end;
End;

Procedure Ketqua;
Var i,j: byte;
Begin
 Assign(f,fo); Rewrite(f);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,C[i,j],' '); Writeln(f);
 end;
 Readln;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 If r>0 then Xuly
 Else begin
        Assign(F,fo); Rewrite(f);
        Write(f,'E');
        Close(f);
      end;
 Ketqua;
END.

input:
    3 4
    0 0 1
    1 0 0
    1 1 0
output:
    0 0 1
    1 0 0
    1 1 0
