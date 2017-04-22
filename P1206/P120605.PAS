Program P120605;    {Cac phep toan voi ma tran}
Uses  Crt;
Const max=100;
      fi1='P12\chuyenvi.inp';
      fi2='P12\tong.inp';
      fi3='P12\tich.inp';
      fo1='P12\chuyenvi.out';
      fo2='P12\tong.out';
      fo3='P12\tich.out';
Var   A,B,C: Array [1..max,1..max] of integer;
      m,n,k: Byte;
      F    : Text;

Procedure Chuyenvi;
Var i,j: byte;
Begin
 Assign(f,fi1); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
 Assign(f,fo1); Rewrite(f);
 For i:=1 to n do
 begin
   For j:=1 to m do Write(f,a[j,i],' '); Writeln(f);
 end;
 Close(f);
End;

Procedure Tong;
Var i,j: byte;
Begin
 Assign(f,fi2); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,b[i,j]); Readln(f);
 end;
 Close(f);
 Assign(f,fo2); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,a[i,j]+b[i,j],' '); Writeln(f);
 end;
 Close(f);
End;

Procedure Tich;
Var i,j,t: byte; gt: longint;
Begin
 Assign(f,fi3); Reset(f);
 Readln(f,m,k,n);
 For i:=1 to m do
 begin
   For j:=1 to k do Read(f,a[i,j]); Readln(f);
 end;
 For i:=1 to k do
 begin
   For j:=1 to n do Read(f,b[i,j]); Readln(f);
 end;
 Close(f);
 Assign(f,fo3); Rewrite(f);
 For i:=1 to m do
   For j:=1 to n do
   begin
     gt:=0;
     For t:=1 to k do gt:=gt+a[i,t]*b[t,j];
     c[i,j]:=gt;
   end;
 For i:=1 to m do
 begin
   For j:=1 to n do Write(f,c[i,j],' '); Writeln(f);
 end;
 Close(f);
End;

Procedure Xuly;
Begin
 Chuyenvi;
 Tong;
 Tich;
End;

BEGIN
 Clrscr;
 Xuly;
END.
