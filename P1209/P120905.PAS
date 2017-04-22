Program P120905;   {Truyen nhiem}
{Xem P120603, Bai Bien doi Ma tran}
Uses  Crt;
Type  Mang= Array [1..100,1..100] of byte;
Const fia = 'A.TXT';
      fib = 'B.TXT';
      foc = 'C.TXT';
Var   a,b,c: Mang;
      m,n,k: byte;

Procedure Nhap(S: string; Var p,q: byte; Var a: Mang);
Var f: text; i,j: byte;
Begin
 Assign(f,S); Reset(f);
 Readln(f,p,q);
 For i:=1 to p do
 begin
   For j:=1 to q do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuat;
Var f: text; i,j: byte;
Begin
 Assign(f,foc); Rewrite(f);
 Writeln(f,m,' ',n);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,c[i,j],' '); Writeln(f);
 end;
 Close(f);
End;

Procedure Tinh;
Var i,j,t: byte;
Begin
 For i:=1 to m do
   For j:=1 to n do
   begin
     c[i,j]:=0;
     For t:=1 to k do If (a[i,t]*b[t,j]=1) then c[i,j]:=1;
   end;
End;

BEGIN
 Nhap(fia,m,k,a);
 Nhap(fib,k,n,b);
 Tinh;
 Xuat;
END.