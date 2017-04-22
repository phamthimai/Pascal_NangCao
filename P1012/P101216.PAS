Program P101216;  {Sinh hoan vi cua n chu cai}
Uses Crt;
Type mang=array[1..26] of char;
Var  i,n: byte;
     a,b: mang;

Function Khac(a,b: mang): boolean;
Var k: boolean; i: byte;
Begin
 k:=false;
 For i:=1 to n do If a[i]<>b[i] then k:=true;
 Khac:=k;
End;

Procedure Doicho(i,j: byte);
Var tg: char;
Begin tg:=a[j]; a[j]:=a[i]; a[i]:=tg; End;

Procedure Tiep(Var a: mang);
Var i,j,m: byte;
Begin
 i:=n; While a[i]<a[i-1] do dec(i);
 m:=i; For j:=i to n do If ((a[j]<a[m])and(a[j]>a[i-1])) then m:=j;
 Doicho(i-1,m);
 For j:=i to ((n+i-1) div 2) do Doicho(j,n+i-j);
 For i:=1 to n do Write(a[i],' '); Writeln;
End;

BEGIN
 Clrscr;
 Write('Hay nhap so n<=26: '); Readln(n);
 For i:=1 to n do  a[i]:=chr(i+64);                {Dau}
 For i:=1 to n do  b[i]:=chr(n+1-i+64);           {Cuoi}
 For i:=1 to n do Write(a[i],' '); Writeln;
 While Khac(a,b) do Tiep(a);
 Readln;
END.
