Program P100911;       {To mau cac hinh tron}
Uses  Crt,Graph;
Const inp='P10\Bai9\P100911.TXT';
Var   Gd,Gm,n,i: Integer;
      a: array [0..3,1..100] of LongInt;
      f: text;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,a[1,i],a[2,i],a[3,i]);
 Close(f);
End;

Procedure Danhdau;
Var i,j: integer;
Begin
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If ((a[3,i]+a[3,j])>sqrt(sqr(a[1,i]-a[1,j])+sqr(a[2,i]-a[2,j]))) then
       If a[0,i]<>0 then a[0,j]:=a[0,i]
       Else If a[0,j]<>0 then a[0,i]:=a[0,j]
            Else begin a[0,i]:=i;  a[0,j]:=i; end;
End;

Procedure Tomau(x,y,r,c: integer);
Var i,j: integer;
Begin
 SetColor(c);
 For i:=-r to r do
 begin
   j:=Round(Sqrt(Sqr(r)-Sqr(i)));
   Line(x+i,y-j,x+i,y+j);
 end;
End;

BEGIN
 Clrscr;
 Nhap;
 Danhdau;
 Gd:=Detect;
 InitGraph(Gd,Gm,'');
 For i:=1 to n do Tomau(a[1,i],a[2,i],a[3,i],a[0,i]);
 Readln;
 CloseGraph;
END.