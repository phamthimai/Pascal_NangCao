Program P121305;        {Sap xep chen don}
Uses  Crt;
Const Inp='P121303.Inp';
      Out='P121305.Out';
      Nmax=1000;
Var   F: text;
      N: integer;
      A: array [0..Nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(F,Inp); Reset(F);
 Readln(F,N);
 For i:=1 to N do Readln(F,A[i]);
 Close(F);
End;

Procedure SapXep;
Var i,j,t: integer;
Begin
 For i:=2 to N do
 begin
   t:=A[i];
   A[0]:=A[i];
   j:=i-1;
   While t<A[j] do
   begin
     A[j+1]:=A[j];
     j:=j-1;
   end;
   A[j+1]:=t;
 end;
End;

Procedure InKq;
Var i: integer;
Begin
 Assign(F,Out); Rewrite(F);
 For i:=1 to N do Writeln(F,A[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 SapXep;
 InKq;
END.