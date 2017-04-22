Program P101217; {To hop cac phan tw khac dong va cot cua ma tran}
Uses Crt;
Type mang=array[1..20] of byte;
Var  i,j,n: byte;
     a,b: mang;
     c: array [1..20,1..20] of integer;

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
 For i:=1 to n do Write(c[i,a[i]],' '); Writeln;
 If WhereY=25 then begin Readln; Clrscr; end;
End;

BEGIN
 Clrscr;
 Write('Hay nhap kich thwoc mang n<=20: '); Readln(n);
 Writeln('Nhap mang ',n,'*',n,' phan tw: ');
 For i:=1 to n do
 begin
   For j:=1 to n do Read(c[i,j]); Readln;
 end;
 For i:=1 to n do  a[i]:=i;                {Dau}
 For i:=1 to n do  b[i]:=n+1-i;           {Cuoi}
 For i:=1 to n do Write(c[i,a[i]],' '); Writeln;
 While Khac(a,b) do Tiep(a);
 Readln;
END.
