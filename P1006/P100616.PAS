Program P100616;  {Tim 4 phan tu lon nhat cua day so}
Uses  Crt;
Const nmax=1000;
      k=4;
      inp='P10\P100610.TXT';
      out='P10\P100610.OUT';
Var   f: text;
      i,n,l,d,c: integer;
      a: array [1..nmax] of integer;
      id: array [1..nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do begin Read(f,a[i]); id[i]:=i; end;
 Close(f);
End;

Procedure Sap_xep;
Var i,j,t,tid: integer;
Begin
 t:=a[d]; tid:=id[d];
 l:=d; i:=d+1;
 While (i<=c)and(a[i]<=t) do Inc(i);
 While i<=c do
 begin
   a[l]:=a[i]; id[l]:=id[i];
   For j:=i downto l+2 do begin a[j]:=a[j-1]; id[j]:=id[j-1]; end;
   Inc(i); Inc(l);
   While (i<=c)and(a[i]<=t) do Inc(i);
 end;
 a[l]:=t; id[l]:=tid;
End;

BEGIN
 Clrscr;
 Nhap;
 d:=1; c:=n; l:=1;
 Repeat
   Sap_xep;
   If l<>k then
   begin
     If l>k then c:=l-1;
     If l<k then d:=l+1;
   end;
 Until l=k;
 Writeln(k,' van dong vien co thanh tich cao nhat la cac VDV: ');
 For i:=1 to k do  Writeln(id[i]:3,'. thanh tich la: ',a[i]);
 Readln;
END.