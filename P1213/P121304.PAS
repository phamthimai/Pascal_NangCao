Program P121304;        {Sap xep chon}
Uses  Crt;
Const Inp='P121303.Inp';
      Out='P121304.Out';
      Nmax=1000;
Var   F: text;
      N: integer;
      A: array [1..Nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(F,Inp); Reset(F);
 Readln(F,N);
 For i:=1 to N do Readln(F,A[i]);
 Close(F);
End;

Procedure SapXep;
Var i,j,k,t: integer;
Begin
 For i:=1 to N-1 do
 begin
    k:=i;
    For j:=i+1 to N do
      If A[j]<A[k] then k:=j;
    If k<>i then
    begin
      t:=A[i];
      A[i]:=A[k];
      A[k]:=t;
    end;
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