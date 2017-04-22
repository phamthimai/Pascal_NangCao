Program P101408;   {sinh chinh hop chap k phan tu tu n phan tu}
Uses  Crt;
Const out='P101408.out';
Type  mang=array[1..10] of byte;
Var   f: text;
      i,k,n: byte;
      a,b: mang;

Function Khac(a,b: mang): boolean;
Var kh: boolean; i: byte;
Begin
 kh:=false;
 For i:=1 to k do If a[i]<>b[i] then kh:=true;
 Khac:=kh;
End;

Function Trung(l,j: integer): boolean;
Var t: boolean; i: byte;
Begin
 t:=false;
 For i:=1 to j-1 do If a[i]=l then t:=true;
 Trung:=t;
End;

Procedure Tiep(Var a: mang);
Var i,j,l,m: byte;
Begin
 i:=k;
 Repeat Inc(a[i]) Until not Trung(a[i],i);
 While a[i]>n do
 begin
   Dec(i);
   Repeat Inc(a[i]) Until not Trung(a[i],i);
 end;
 For j:=i+1 to k do
 begin
   l:=1; While Trung(l,j) do Inc(l); a[j]:=l;
 end;
 For i:=1 to k do Write(f,a[i],' '); Writeln(f);
End;

BEGIN
 Clrscr;
 Assign(f,out); Rewrite(f);
 Write('Hay nhap so n<=10: '); Readln(n);
 Write('Hay nhap so  k<=n: '); Readln(k);
 For i:=1 to k do  a[i]:=i;                {Dau}
 For i:=1 to k do  b[i]:=n-i+1;           {Cuoi}
 For i:=1 to k do Write(f,a[i],' '); Writeln(f);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.
