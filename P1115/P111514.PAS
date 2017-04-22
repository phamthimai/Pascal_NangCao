Program P111514;  {Xay dung duong di giua cac thanh pho}
Uses  Crt;
Const nmax=20;
Type  M2=array [1..nmax,1..nmax] of 0..1;
Var   f: text;
      m,n,dmin: byte;
      a,amin: M2;

Procedure Nhap;
Begin
 Write(' N = '); Readln(n);
 m:=n*(n-1) div 2;
End;

Procedure Viet;
Var r,s: integer;
Begin
 Writeln('Ma tran duong di tot nhat la:');
 For r:=1 to n do
   begin For s:=1 to n do Write(amin[r,s]:2); Writeln; end;
 Write('So duong di la ',dmin);
 Readln;
End;

Function OK(a: M2): boolean;
Var i,j,k: integer; Kt1,Kt2: boolean;
Begin
 Kt1:=true;
 For i:=1 to n do For j:=1 to n do
 If i<>j then
 begin
   Kt2:=false;
   For k:=1 to n do
     If (a[i,j]=1)or((a[i,k]=1)and(a[k,j]=1)) then Kt2:=true;
   If Kt2=false then KT1:=false;
 end;
 OK:=Kt1;
End;

Function d(a: M2): integer;
Var i,j,k: integer;
Begin
 k:=0;
 For i:=2 to n do
   For j:=1 to i-1 do If a[i,j]=1 then Inc(k);
 d:=k;
End;

Procedure Sinh(i: integer);
Var j,r,s: integer;
Begin
 For j:=0 to 1 do
 begin
   r:=2; While not(i<=r*(r-1) div 2) do Inc(r);
   s:=i-((r-1)*(r-2)div 2);
   a[r,s]:=j; a[s,r]:=j;
   If (i<m)and(d(a)<dmin) then sinh(i+1)
   Else
     If (i=m)and(dmin>d(a))and OK(a) then
     begin
       dmin:=d(a);
       For r:=1 to n do
         For s:=1 to n do amin[r,s]:=a[r,s];
     end;
 end;
End;

BEGIN
 Nhap;
 dmin:=255;
 Sinh(1);
 Viet;
END.