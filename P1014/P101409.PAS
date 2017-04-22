Program P101409;   {sinh to hop k so tu n so}
Uses  Crt;
Const N=10; k=5;
      out='P101409.txt';
Type  mang=array[1..10] of byte;
Var   f: text;
      i: byte;
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
 i:=k; While a[i]=n+i-k do dec(i);
 inc(a[i]);
 For j:=i+1 to k do a[j]:=a[j-1]+1;
 For i:=1 to k do Write(f,a[i],' '); Writeln(f);
End;

BEGIN
 Clrscr;
 Assign(f,out); Rewrite(f);
 For i:=1 to k do  a[i]:=i;                {Dau}
 For i:=1 to k do  b[i]:=n+i-k;           {Cuoi}
 For i:=1 to k do Write(f,a[i],' '); Writeln(f);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.