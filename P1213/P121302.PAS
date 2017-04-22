Program P121302;   {Tim vi tri cua A[i]}
Uses  Crt;
Const Inp='P1213\P121302.inp';
      Nmax=1000;
Var   F: text;
      N,i,Vt: integer;
      A: array [1..Nmax] of real;

BEGIN
 Clrscr;
 Assign(F,Inp); Reset(F);
 Readln(F,N);
 For i:=1 to N do Readln(F,A[i]);
 Close(F);

 Vt:=1;
 For i:=2 to N do
   If A[i]>A[1] then inc(Vt);
 Writeln('Vi tri cua A[1]: ',Vt);
 Readln;
END.