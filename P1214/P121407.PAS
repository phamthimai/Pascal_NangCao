Program P121407;  {Doi cho N nguoi quanh ban tron}
Uses  Crt;
Const Out = 'P121407.out';
      Nmax= 1000;
Var   f: text;
      n,Tong: integer;
      cs,a  : array [1..Nmax] of integer;

Procedure Nhap;
Begin
 Write('N = '); Readln(n);
End;

Procedure ChuanBi;
Var i: integer;
Begin
 For i:=1 to n do cs[i]:=i;
 a:=cs;
 Tong:=0;
End;

Procedure Doi(Var a,b: integer);
Var t: integer;
Begin
 t:=a; a:=b; b:=t
End;

Procedure TimViTri(i: integer; Var j: integer);
Var ii: integer;
Begin
 For ii:=1 to n do
   If cs[ii]=i then
   begin
     j:=ii;
     exit;
   end;
End;

Procedure DoiTrai(i: integer);
Var j: integer;
Begin
 j:=i-1;
 If j=0 then j:=n;
 Writeln(f,a[j],' ',a[i]);
 Doi(a[i],a[j]);
 Doi(cs[i],cs[j]);
End;

Procedure DoiSangTrai(vt,k: integer);
Var i: integer;
Begin
 For i:=1 to k do
 begin
   DoiTrai(vt);
   dec(vt);
   If vt=0 then vt:=n;
 end;
End;

Procedure DoiPhai(i: integer);
Var j: integer;
Begin
 j:=i+1;
 If j=n+1 then j:=1;
 Writeln(f,a[i],' ',a[j]);
 Doi(a[i],a[j]);
 Doi(cs[i],cs[j]);
End;

Procedure DoiSangPhai(vt,k: integer);
Var i: integer;
Begin
 For i:=1 to k do
 begin
   DoiPhai(vt);
   Inc(vt);
   If vt=n+1 then vt:=1;
 end;
End;

Procedure TimCachDoi(i: integer);
Var j: integer;
Begin
 TimViTri(i,j);
 If i-1<n-i then DoiSangTrai(j,i-1)
 Else DoiSangPhai(j,n-i);
End;

Function Min(a,b: integer): integer;
Begin
 If a<b then Min:=a Else Min:=b
End;

Procedure SapXep;
Var i: integer;
Begin
 Assign(f,Out); Rewrite(f);
 For i:=2 to n-1 do Inc(Tong,Min(i-1,n-i));
 Writeln(f,Tong);
 For i:=2 to n-1 do TimCachDoi(i);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 ChuanBi;
 SapXep;
END.