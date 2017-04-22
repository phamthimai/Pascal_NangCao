Program P121314; {Tim day cuc dai thoa man tinh chat cho truoc}
Uses  Crt;
Const Inp='P121314.inp';
      Out='P121314.out';
      Nmax=1000;
Var   f: text;
      n,vt1,vt2,k: integer;
      a,b,c: array [1..Nmax] of real;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,Inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,a[i],b[i],c[i]);
 Close(f);
End;

Function Ok(i,j: integer): boolean;
Var t: integer;
Begin
 Ok:=false;
 For t:=i+1 to j do
   If (a[t]<a[t-1])or(b[t]<b[t-1])or(c[t]<c[t-1]) then exit;
 Ok:=true;
End;

Procedure TimDay;
Var i,j: integer;
Begin
 k:=0;
 For i:=1 to n-1 do
   For j:=n downto i+1 do
     If (Ok(i,j))and(k<j-i+1) then
     begin
       k:=j-i+1;
       vt1:=i;
       vt2:=j;
     end;
End;

Procedure InKq;
Var i: integer;
Begin
 Assign(f,Out); Rewrite(f);
 If k=0 then Writeln(f,'No solution')
 Else
 begin
   Writeln(f,k);
   For i:=vt1 to vt2 do Writeln(f,a[i]:0:2,' ',b[i]:0:2,' ',c[i]:0:2);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 TimDay;
 InKq;
END.