Program P101213;    {Thuat toan sinh hoan vi}
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
 For i:=1 to n do Write(f,'(',i,a[i],')  '); Writeln(f);
End;

BEGIN
 Clrscr;
 Assign(f,'P101213.txt'); Rewrite(f);
 Write('Nhap so n<=7: '); Readln(n);
 For i:=1 to n do  a[i]:=i;                {Dau}
 For i:=1 to n do  b[i]:=n+1-i;           {Cuoi}
 For i:=1 to n do Write(f,'(',i,a[i],')  '); Writeln(f);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.
