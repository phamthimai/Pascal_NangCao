Program P100613;  {Sap xep, Loai bo cac gia tri trung}
Uses  Crt;
Const nmax=1000;
      inp='P10\P100610.TXT';
      out='P10\P100613.OUT';
Var   f: text;
      n: integer;
      a: array [1..nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Xep;
Var i,j,k,tg: integer;
Begin
 For i:=1 to n-1 do
 begin
   k:=i;
   For j:=i+1 to n do
     If a[k]>a[j] then k:=j;
   If k<>i then
   begin
     tg:=a[k];
     a[k]:=a[i];
     a[i]:=tg;
   end;
 end;
End;

Procedure Inkq;
Var l: integer;
Begin
 Assign(f,out);
 Rewrite(f);
 Write(f,a[1],' ');
 For l:=2 to n do
   If a[l]<>a[l-1] then Write(f,a[l],' ');
 Close(f);
end;

BEGIN
 ClrScr;
 Nhap;
 Xep;
 Inkq;
END.