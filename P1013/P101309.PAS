Program P101309;    {sinh tap hop con k ki tu tu n ki tu}
Uses  Crt;
Const out='P101309.txt';
Type  mang=array[1..10] of char;
Var   f: text;
      i,k,n,d: byte;
      a,b: mang;

Function Khac(a,b: mang): boolean;
Var kh: boolean; i: byte;
Begin
 kh:=false;
 For i:=1 to k do If a[i]<>b[i] then kh:=true;
 Khac:=kh;
End;

Procedure Tiep(Var a: mang);
Var i,j: byte;
Begin
 i:=k; While a[i]=chr(n+i-k+64) do dec(i);
 inc(a[i]);
 For j:=i+1 to k do a[j]:=succ(a[j-1]);
 For i:=1 to k do Write(f,a[i]); Write(f,' ');
 Inc(d);
 If (d+1)*(k+1)>1024 then
 begin
   d:=0;
   Writeln(f);
 end;
End;

BEGIN
 Clrscr;
 Assign(f,out); Rewrite(f);
 Write('Hay nhap so n<=26: '); Readln(n);
 Write('Hay nhap so  k<=n: '); Readln(k);
 For i:=1 to k do  a[i]:=chr(i+64);                {Dau}
 For i:=1 to k do  b[i]:=chr(n+i-k+64);           {Cuoi}
 For i:=1 to k do Write(f,a[i]); Write(f,' '); d:=1;
 While Khac(a,b) do Tiep(a);
 Close(f);
END.
