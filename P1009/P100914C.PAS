Program P100914c;  {Hinh chieu cua thanh pho tu huong dong}
Uses  Crt,Graph;
Const inp='P10\Bai9\P100914.TXT';
      H=400;
Var   Gd,Gm,n,d,X0,Y0: Integer;
      a: array [1..100,1..5] of integer;
      T: array [1..100] of integer;
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

Procedure Tinh;
Var i,j,k: integer;
Begin
 For i:=1 to n do T[i]:=i;
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If (a[i,3]>a[j,3]) then
     begin
       k:=T[j]; T[j]:=T[i]; T[i]:=k;
     end;
End;

Procedure Ve;
Var  i,j: integer;
Begin
 Gd:=Detect;
 InitGraph(Gd,Gm,' ');
 For i:=1 to n do
 begin
   j:=T[i];
   SetFillStyle(1,j mod 14 +1);
   Bar(a[j,2],H,a[j,4],H-a[j,5]);
 end;
 Readln;
 CloseGraph;
End;

BEGIN
 Nhap;
 Tinh;
 Ve;
END.