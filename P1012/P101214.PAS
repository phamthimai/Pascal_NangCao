Program P101214;    {Thuat toan sinh hoan vi chan}
Uses Crt;
Type mang=array[1..7] of byte;
Var  f: Text;
     i,n: byte;
     a,b: mang;

Function Khac(a,b: mang): boolean;
Var k: boolean; i: byte;
Begin
 k:=false;
 For i:=1 to n do If a[i]<>b[i] then k:=true;
 Khac:=k;
End;

Function Chan(a: mang): boolean;
Var i,j,c: integer;
Begin
 c:=0;
 For i:=1 to n-1 do
   For j:=i+1 to n do If a[i]>a[j] then inc(c);
 If (c mod 2 =0) then chan:=true Else chan:=false;
End;

Procedure Doicho(i,j: byte);
Var tg: byte;
Begin tg:=a[j]; a[j]:=a[i]; a[i]:=tg; End;

Procedure Tiep(Var a: mang);
Var i,j,m: byte;
Begin
 i:=n; While a[i]<a[i-1] do dec(i);
 m:=i; For j:=i to n do If ((a[j]<a[m])and(a[j]>a[i-1])) then m:=j;
 Doicho(i-1,m);
 For j:=i to ((n+i-1) div 2) do Doicho(j,n+i-j);
 If chan(a) then Begin For i:=1 to n do Write(f,a[i],' '); Writeln(f); End;
End;

BEGIN
 Clrscr;
 Assign(f,'..\TINH\P101214.txt'); Rewrite(f);
 Write('Hay nhap so n<=7: '); Readln(n);
 For i:=1 to n do  a[i]:=i;                {Dau}
 For i:=1 to n do  b[i]:=n+1-i;           {Cuoi}
 For i:=1 to n do Write(f,a[i],' '); Writeln(f);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.