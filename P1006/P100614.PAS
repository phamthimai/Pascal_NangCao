Program P100614;  {Sap xep tai a[1]}
Uses  Crt;
Const nmax=1000;
      inp='P10\P100610.TXT';
      out='P10\P100610.OUT';
Var   f: text;
      n: integer;
      a: array[1..nmax]of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Sap_xep;
Var i,j,k,t: integer;
Begin
 t:=a[1];
 i:=1; j:=2;
 While (j<=n)and(a[j]>=t) do Inc(j);
 While j<=n do
 begin
   a[i]:=a[j];
   For k:=j downto i+2 do a[k]:=a[k-1];
   Inc(i); Inc(j);
   While (j<=n)and(a[j]>=t) do Inc(j);
 end;
 a[i]:=t;
End;

Procedure In_kq;
Var i: integer;
Begin
 Assign(f,out);
 Rewrite(f);
 For i:=1 to n do
 begin
   If i mod 10=0 then Writeln(f);
   Write(f,a[i],' ');
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Sap_xep;
 In_kq;
END.