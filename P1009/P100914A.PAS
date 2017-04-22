Program P100914a;  {Hinh chieu cua thanh pho tu tren xuong}
Uses  Crt,Graph;
Const inp='P10\Bai9\P100914.TXT';
Var   Gd,Gm,n,d,X0,Y0: Integer;
      a: array [1..100,1..5] of integer;
      f: text;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,a[i,1],a[i,2],a[i,3],a[i,4],a[i,5]);
 Close(f);
End;

Procedure Ve;
Var  i: integer;
Begin
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 For i:=1 to n do
 begin
   SetFillStyle(1,i mod 14 +1);
   Bar(a[i,1],a[i,2],a[i,3],a[i,4]);
 end;
 Readln;
 CloseGraph;
End;

BEGIN
 Nhap;
 Ve;
END.