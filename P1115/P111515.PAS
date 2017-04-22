Program P111515;   {Sen bo tren HCN M*N}
Uses  Crt, Graph;
Const M=2; N=10;
Type  mang=array[1..2,0..M+N] of byte;
Var   f: text;
      a,b: mang;
      Gd,Gm,k,i,W,x0,y0,d:integer;
      S: string;

Function Khac(a,b: mang): boolean;
Var kh: boolean; i: byte;
Begin
 kh:=false;
 For i:=1 to k do If (a[1,i]<>b[1,i])or(a[2,i]<>b[2,i]) then kh:=true;
 Khac:=kh;
End;

Procedure Ve(Var a: mang);
Var i,j,x,y: integer;
Begin
 For j:=0 to M do
 For i:=0 to N do
 begin
   x:=i*W+x0; y:=y0-j*W;
   Bar(x-1,y-1,x+1,y+1);
 end;
 OutTextXY(GetMaxX div 2,GetMaxY-10,S);
 SetColor(4);
 Str(d,S); OutTextXY(GetMaxX div 2,GetMaxY-10,S); Inc(d);
 For i:=1 to k do
 begin
   Line(W*a[2,i-1]+x0,y0-a[1,i-1]*W,a[2,i]*W+x0,y0-a[1,i]*W); Delay(20);
 end;
 SetColor(16);
 For i:=1 to k do
 begin
   Line(a[2,i-1]*W+x0,y0-a[1,i-1]*W,a[2,i]*W+x0,y0-a[1,i]*W);
 end;
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
   Ve(a);
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 y0:=GetMaxY-50;
 x0:=100;
 W:=(GetMaxX-2*x0) div N;
 If (GetMaxX-2*x0) div N>(y0-10) div M then W:=(y0-10) div M;
 k:=M+N;
 For i:=0 to N do   begin a[1,i]:=0;   a[2,i]:=i; end;
 For i:=N+1 to k do begin a[1,i]:=i-N; a[2,i]:=N; end;      {Dau}
 For i:=0 to M do   begin b[1,i]:=i;   b[2,i]:=0; end;
 For i:=M+1 to k do begin b[1,i]:=M; b[2,i]:=i-M; end;      {Cuoi}
 d:=1; Ve(a);
 While Khac(a,b) do Tiep(a);
 Readln;
 CloseGraph;
END.