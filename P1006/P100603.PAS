Program P100603;   {Sap xep day 01}
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
Var i,j: integer;
Begin
 i:=1; j:=n;
 Repeat
   While a[i]=0 do Inc(i);
   While a[j]=1 do Dec(j);
   If i<j then
   begin
     a[i]:=0;
     a[j]:=1;
   end;
 Until j<=i;
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