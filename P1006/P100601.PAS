Program P100601; {Sap xep tang dan}
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