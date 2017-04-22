{$R+,B-}
Program P111215;   {Bai toan xep ba lo (cai tui)}
Uses  Crt;
Const inp='P11\P1112\p111215.inp';
      out='P111215.out';
Var   n,m: integer;
      a,b: array [1..40] of integer;
      c: array [0..40,0..500] of word;
      mang: array [1..40] of boolean;
      f: text;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n,m);
 For i:=1 to n do Readln(f,a[i],b[i]);
 Close(f);
End;

Procedure Khoitao ;
Begin
 FillChar(c,SizeOf(c),0);
End;

Function max(a,b,c: word): word;
Var m: word;
Begin
 m:=a;
 If b>m then m:=b;
 If c>m then m:=c;
 max:=m;
End;

Procedure qhd;
Var i,j: integer;
Begin
 For i:=1 to n do
   For j:=1 to m do
     If j<a[i] then c[i,j]:=max(c[i,j-1],c[i-1,j],0)
     Else c[i,j]:=max(c[i,j-1],c[i-1,j],c[i-1,j-a[i]]+b[i]);
End;

Procedure Inkq;
Var i,j: integer;
Begin
 Clrscr;
 FillChar(mang,SizeOf(mang),0);
 Writeln('Gia tri lan nhat mang duoc ',c[n,m]);
 i:=n; j:=m;
 While i*j>0 do
 begin
   If c[i,j]=c[i,j-1] then Dec(j)
   Else If c[i,j]=c[i-1,j] then Dec(i)
        Else
        begin
          mang[i]:=true;
          Dec(j,a[i]);
          Dec(i);
        end;
 end;
 Writeln('Danh sach cac vat mang di');
 For i:=1 to n do
   If mang[i] then Write(i:4);
 Readln;
End;

BEGIN
 Nhap;
 Khoitao;
 qhd;
 Inkq;
END.