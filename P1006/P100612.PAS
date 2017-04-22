Program P100612;  {Tron 2 day da sap xep bang 1 vong lap}
Uses  Crt;
Const max=1000;
      inp='P10\P100610.TXT';
      out='P10\P100612.OUT';
Var   f: text;
      m,n: integer;
      a,b: array[1..max]of integer;
      c: array[1..2*max]of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,m,n);
 For i:=1 to m do Read(f,a[i]);
 For i:=1 to n do Read(f,b[i]);
 Close(f);
End;

Procedure Xep;
Var i,j,k: integer;
Begin
 a[m+1]:=maxint;
 b[n+1]:=maxint;
 i:=1; j:=1;
 For k:=1 to m+n do
 begin
   If a[i]<b[j] then
     begin
       c[k]:=a[i];
       inc(i);
     end
   Else
     begin
       c[k]:=b[j];
       inc(j);
     end;
 end;
End;

Procedure Inkq;
Var i: integer;
Begin
 Assign(f,out);
 Rewrite(f);
 For i:=1 to m+n do
 begin
   If i mod 20=0 then writeln(f);
   Write(f,c[i],' ');
 end;
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Xep;
 Inkq;
END.