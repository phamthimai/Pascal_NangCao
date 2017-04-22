Program P121310;   {Thuat toan ghep noi}
Uses  Crt;
Const Inp ='P121310.inp';
      Out ='P121310.out';
      MNmax=1000;
Var   f: text;
      n,m: integer;
      c,d: array [1..MNmax+1]of integer;
      e  : array [1..2*MNmax]of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,Inp); Reset(f);
 Readln(f,n,m);
 For i:=1 to n do Read(f,c[i]);
 For i:=1 to m do Read(f,d[i]);
 Close(f);
End;

Procedure GhepMang;
Var i,j,k: integer;
Begin
 c[n+1]:=maxint; d[m+1]:=maxint;
 i:=1; j:=1;
 For k:=1 to m+n do
   If c[i]<=d[j] then
   begin
     e[k]:=c[i];
     Inc(i);
   end
   Else
   begin
     e[k]:=d[j];
     Inc(j);
   end;
End;

Procedure InKq;
Var i: integer;
Begin
 Assign(f,Out); Rewrite(f);
 Writeln(f,m+n);
 For i:=1 to m+n do Writeln(f,e[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 GhepMang;
 InKq;
END.