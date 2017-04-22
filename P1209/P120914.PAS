{$R+}
Program P120914;   {Tinh dien tro tren mach}
Uses Crt;
Const
 max=1000;   {Toi da co 1000 dien tro trong mach}
Var
 f            : text;
 m,n,i,j,s1,s2: integer;
 a,b,bac      : array [1..max] of integer; {2 dau cua dien tro thu i}
 r            : array [1..max] of real;    {Dien tro thu i}
 found        : boolean;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,'P120914.inp'); Reset(f);
 Readln(f,m);
 n:=0;
 While not EoF(f) do
 begin
   Inc(n);
   Readln(f,a[n],b[n],r[n]);
 end;
 Close(f);
End;

Procedure Remove(i: integer);
{Xoa dien tro thu i trong mach}
Var j: integer;
Begin
 For j:=i to n-1 do
 begin
   a[j]:=a[j+1];b[j]:=b[j+1];r[j]:=r[j+1];
 end;
 Dec(n);
End;

Procedure Remove2(i,j: integer);
{Xoa 2 dien tro i va j trong mach}
Begin
 If i>j then begin remove(i); remove(j); end
 Else        begin remove(j); remove(i); end;
End;

Procedure Add(aa,bb: integer; rr: real);
Begin
 Inc(n);
 a[n]:=aa; b[n]:=bb; r[n]:=rr;
End;

BEGIN
 Nhap;
 {Init}
 Fillchar(bac,Sizeof(bac),0);
 For i:=1 to n do
 begin
   Inc(bac[a[i]]); Inc(bac[b[i]]);
 end;
 Repeat
   {Tim 2 dien tro noi tiep}
   found:=false;
   For i:=2 to m-1 do
     If bac[i]=2 then
     begin
       For j:=1 to n do
       begin
         If b[j]=i then s1:=j; If a[j]=i then s2:=j;
       end;
       Add(a[s1],b[s2],r[s1]+r[s2]);
       Remove2(s1,s2);
       bac[i]:=0;
       found:=true;
       break;
     end;
   If not found then
   {Tim 2 dien tro song song}
     For i:=1 to n-1 do
     begin
       For j:=i+1 to n do
         If (a[i]=a[j])and(b[i]=b[j]) then
         begin
           Add(a[i],b[i],(r[i]*r[j])/(r[i]+r[j]));
           Dec(bac[a[i]]);Dec(bac[b[i]]);
           Remove2(i,j);
           found:=true;
           break;
         end;
       If found then break;
     end;
 Until n=1;
 Writeln('Dien tro toan mach la: ',r[1]:0:3);
 Readln;
END.
