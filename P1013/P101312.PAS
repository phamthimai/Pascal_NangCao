Program P101312; {sinh cac tap hop con tw n ki tw}
Uses  Crt;
Const inp='P101312.INP';
      out='P101312.OUT';
Type  mang=array[1..26] of byte;
Var   f: text;
      i,k,n: byte;
      a,b: mang;
      c: array[1..10] of char;

Function Khac(a,b: mang): boolean;
Var kh: boolean; i: byte;
Begin
 kh:=false;
 For i:=1 to k do If a[i]<>b[i] then kh:=true;
 Khac:=kh;
End;

Procedure Nhap;
Var i: integer; S: String;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,S);
 Close(f);
 n:=Length(S);
 For i:=1 to n do  c[i]:=UpCase(S[i]);
End;

Procedure Tiep(Var a: mang);
Var i,j: byte;
Begin
 i:=k; While a[i]=n+i-k do dec(i);
 inc(a[i]);
 For j:=i+1 to k do a[j]:=a[j-1]+1;
 For i:=1 to k do Write(f,c[a[i]],' '); Writeln(f);
End;

BEGIN
 Nhap;
 Assign(f,out); Rewrite(f);
 For k:=0 to n do
 begin
   For i:=1 to k do  a[i]:=i;                {Dau}
   For i:=1 to k do  b[i]:=n+i-k;           {Cuoi}
   For i:=1 to k do Write(f,c[a[i]],' '); Writeln(f);
   While Khac(a,b) do Tiep(a);
 end;
 Close(f);
END.