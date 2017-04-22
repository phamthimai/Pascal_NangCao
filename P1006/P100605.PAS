Program P100605;   {Sap xep danh sach theo thu tu Bang chu cai}
Uses  Crt;
Const nmax=20;
      inp='P10\P100610.TXT';
      out='P10\P100610.OUT';
Type  str20 = string[20];
Var   f: text;
      n: integer;
      a: array [1..nmax] of str20;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,a[i]);
 Close(f);
End;

Procedure Sap_xep;
Var i,j,k: integer; t: str20;
Begin
 For i:=1 to n-1 do
 begin
   k:=i;
   For j:=i+1 to n do
     If a[j]<a[k] then k:=j;
   If k<>i then
   begin
     t:=a[i];
     a[i]:=a[k];
     a[k]:=t;
   end;
 end;
End;

Procedure In_kq;
Var i:integer;
Begin
 Assign(f,out);
 Rewrite(f);
 For i:=1 to n do Writeln(f,a[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Sap_xep;
 In_kq;
END.