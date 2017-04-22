Program P110606;  {Tao file so nguyen to nho hon 10000}
Uses  Crt;
Const N=10000;
Var   i,j: Integer;
      f: File of Integer;
      a: Array[2..N] of boolean;

BEGIN
 For i:=2 to N do a[i]:=true;
 i:=2;
 Repeat
   For j:=2 to (N div i) do a[i*j]:=false;
   Repeat Inc(i) Until a[i] or(i>N);
 Until i>N;
 Assign(F,'Thu.dat'); Rewrite(F);
 For i:=1 to N do If a[i] then  Write(F,i);
 Close(F);
END.