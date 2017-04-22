Program P121403; {Tim tong con co gia tri nho nhat}
Uses  Crt;
Const Inp ='P121403.inp';
      Out ='P121403.out';
      Nmax=1000;
Var   F: text;
      N: integer;
      A,Tong: array [1..Nmax] of real;
      Dau,Cuoi: integer;
      Min: real;

Procedure Nhap;
Var i: integer;
Begin
 Assign(F,Inp); Reset(F);
 Readln(F,N);
 For i:=1 to N do Read(f,A[i]);
 Close(F);
End;

Procedure TimDay;
Var i,j: integer;
Begin
 Tong[1]:=A[1];
 For i:=2 to N do Tong[i]:=Tong[i-1]+A[i];
 Min:=Maxint;
 For i:=1 to N do
   For j:=i to N do
     If Tong[j]-Tong[i]+A[i]<Min then
     begin
       Min:=Tong[j]-Tong[i]+A[i];
       Dau:=i; Cuoi:=j;
     end;
End;

Procedure InKq;
Var i: integer;
Begin
 Assign(f,Out); Rewrite(f);
 Writeln(f,Min:0:2);
 For i:=Dau to Cuoi do Write(f,A[i]:0:2,' ');
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 TimDay;
 InKq;
END.