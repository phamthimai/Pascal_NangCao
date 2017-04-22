Program P101414;   {sinh duong di tren HCN M*N}
Uses  Crt;
Const M=4; N=4;
      out='P101414.txt';
Type  mang=array[1..2,0..M+N] of byte;
Var   f: text;
      k,i: byte;
      a,b: mang;

Function Khac(a,b: mang): boolean;
Var kh: boolean; i: byte;
Begin
 kh:=false;
 For i:=1 to k do If (a[1,i]<>b[1,i])or(a[2,i]<>b[2,i]) then kh:=true;
 Khac:=kh;
End;

Procedure Tiep(Var a: mang);
Var i,j: byte;
Begin
 i:=k;
 While a[1,i]=a[1,i-1] do dec(i);
 While a[2,i]=a[2,i-1] do dec(i);
 Inc(a[1,i]); Dec(a[2,i]);
 For j:=i+1 to k do
   If a[2,j-1]<N then begin a[2,j]:=a[2,j-1]+1; a[1,j]:=a[1,i]; end
   Else               begin a[2,j]:=N;      a[1,j]:=a[1,j-1]+1; end;
 For i:=0 to k do Write(f,'(',a[1,i],',',a[2,i],') '); Writeln(f);
End;

BEGIN
 k:=M+N;
 Assign(f,out); Rewrite(f);
 For i:=0 to N do   begin a[1,i]:=0;   a[2,i]:=i; end;
 For i:=N+1 to k do begin a[1,i]:=i-N; a[2,i]:=N; end;      {Dau}
 For i:=0 to M do   begin b[1,i]:=i;   b[2,i]:=0; end;
 For i:=M+1 to k do begin b[1,i]:=M; b[2,i]:=i-M; end;      {Cuoi}
 For i:=0 to k do Write(f,'(',a[1,i],',',a[2,i],') '); Writeln(f);
 While Khac(a,b) do Tiep(a);
 Close(f);
END.