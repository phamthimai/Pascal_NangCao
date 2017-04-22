Program P121303;        {Sap xep noi bot}
Uses  Crt;
Const Inp='P121303.Inp';
      Out='P121303.Out';
      Nmax=1000;
Var   F: text;
      N: integer;
      A: array [1..Nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(F,Inp); Reset(F);
 Readln(F,N);
 For i:=1 to N do Read(F,A[i]);
 Close(F);
End;

Procedure SapXep;
Var i,j,t: integer;
Begin
 For i:=1 to N-1 do
   For j:=1 to N-1 do
     If A[j]>A[j+1] then
     begin
         t:=A[j];
         A[j]:=A[j+1];
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