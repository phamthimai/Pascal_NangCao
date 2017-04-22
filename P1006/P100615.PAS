Program P100615;  {Tim phan tu lon thu k cua day so}
Uses  Crt;
Const nmax=1000;
      inp='P10\P100610.TXT';
      out='P10\P100610.OUT';
Var   f: text;
      i,n,k,l,d,c: integer;
      a: array [1..nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n,k);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Sap_xep;
Var i,j,t: integer;
Begin
 t:=a[d];
 l:=d; i:=d+1;
 While (i<=c)and(a[i]<=t) do Inc(i);
 While i<=c do
 begin
   a[l]:=a[i];
   For j:=i downto l+2 do a[j]:=a[j-1];
   Inc(i); Inc(l);
   While (i<=c)and(a[i]<=t) do Inc(i);
 end;
 a[l]:=t;
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
 Write('Phan tu lon thu ',k,' la ',a[k]);
 Readln;
END.