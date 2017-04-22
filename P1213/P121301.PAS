Program P121301; {Sap xep cac qua bong}
Uses  Crt;
Const Nmax=1000;
      Dmax=1000;
      inp='P1213\P121301.inp';
      out='P121301.out';
Var   f: text;
      n,sx,sd,sv,Bd: integer;
      a: array [1..nmax] of char;
      d: array [1..Dmax,1..2] of integer;

Procedure Nhap;
Var i: integer;
Begin
 sx:=0; sd:=0; sv:=0;
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   Readln(f,a[i]);
   Case a[i] of
     'X': inc(sx);
     'D': inc(sd);
     'V': inc(sv);
   End;
 end;
 Close(f);
End;

Procedure FindXD(Var vt: integer);
Var i: integer;
Begin
 vt:=0;
 For i:=sx+1 to sx+sd do
   If a[i]='X' then
   begin
      vt:=i;
      exit;
   end;
End;

Procedure FindXV(Var vt: integer);
Var i: integer;
Begin
 vt:=0;
 For i:=sx+sd+1 to n do
   If a[i]='X' then
   begin
     vt:=i;
     exit;
   end;
End;

Procedure FindDV(Var vt: integer);
Var i:integer;
Begin
 vt:=0;
 For i:=sx+sd+1 to n do
   If a[i]='D' then
   begin
     vt:=i;
     exit;
   end;
End;

Procedure Doi(i,j: integer);
Var c: char;
Begin
 c:=a[i];
 a[i]:=a[j];
 a[j]:=c;
End;

Procedure XuLy;
Var i,vt: integer;
Begin
 Bd:=0;
 For i:=1 to sx do
   If a[i]<>'X' then
   begin
     inc(Bd);
     If a[i]='D' then
     begin
       FindXD(vt);
       If vt=0 then FindXV(vt);
       Doi(i,vt);
       d[Bd,1]:=i;
       d[Bd,2]:=vt;
     end;
     If a[i]='V' then
     begin
       FindXV(vt);
       If vt=0 then findXD(vt);
       Doi(i,vt);
       d[Bd,1]:=i;
       d[Bd,2]:=vt;
     end;
   end;
 For i:=sx+1 to sx+sd do
   If a[i]='V' then
   begin
     inc(Bd);
     FindDV(vt);
     Doi(i,vt);
     d[Bd,1]:=i;
     d[Bd,2]:=vt;
   end;
End;

Procedure InKq;
Var i: integer;
Begin
 Assign(f,out); Rewrite(f);
 Writeln(f,Bd);
 For i:=1 to Bd do writeln(f,d[i,1],' ',d[i,2]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 XuLy;
 InKq;
 Readln;
END.