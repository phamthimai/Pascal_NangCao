Program P101406;   {liet ke cac day nhi phan do dai n}
Uses  Crt;
Const N=10;
      out='P101406.txt';
Type  mang=String[N];
Var   f: text;
      i: byte;
      a,b: mang;

Function Khac(a,b: mang): boolean;
Var kh: boolean; i: byte;
Begin
 kh:=false;
 For i:=1 to n do If a[i]<>b[i] then kh:=true;
 Khac:=kh;
End;

Procedure Tiep(Var a: mang);
Var i: byte;
Begin
 i:=n;
 While (i>0)and(a[i]='1') do
 begin
   a[i]:='0'; dec(i);
 end;
 a[i]:='1';
 Writeln(f,a);
End;

BEGIN
 Clrscr;
 Assign(f,out); Rewrite(f);
 For i:=1 to n do  a:=a+'0';         {Dau}
 For i:=1 to n do  b:=b+'1';         {Cuoi}
 Writeln(f,a);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.