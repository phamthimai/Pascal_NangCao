Program P101411;          {To hop phan tu cua ma tran}
Uses  Crt;
Const inp='P101413.TXT';
      out='P101411.out';
Type  mang=array[1..20] of byte;
Var   f: text;
      i,n: byte;
      a,b: mang;
      c: array [1..20,1..20] of real;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,c[i,j]); Readln(f);
 end;
 Close(f);
End;

Function Khac(a,b: mang): boolean;
Var k: boolean; i: byte;
Begin
 k:=false;
 For i:=1 to n do If a[i]<>b[i] then k:=true;
 Khac:=k;
End;

Function Sign(a: mang):integer;
Var i,j,c: byte;
Begin
 c:=0;
 For i:=1 to n-1 do
   For j:=i+1 to n do If a[i]>a[j] then inc(c);
 If (c mod 2=0) then Sign:=1 Else Sign:=-1;
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
 For i:=1 to n do Write(f,c[i,a[i]]:8:2,' '); Writeln(f,Sign(a):3);
End;

BEGIN
 Nhap;
 For i:=1 to n do  a[i]:=i;                {Dau}
 For i:=1 to n do  b[i]:=n+1-i;           {Cuoi}
 Assign(f,out); Rewrite(f);
 For i:=1 to n do Write(f,c[i,a[i]]:8:2,' '); Writeln(f,Sign(a):3);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.
