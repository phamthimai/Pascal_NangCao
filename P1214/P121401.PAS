Program P121401;   {Tim day don dieu tang cuc dai}
Uses  Crt;
Const Nmax=5000;
      Inp='P121401.inp';
      Out='P121401.out';
Var   F: text;
      N,Max,DanhDau: integer;
      A,Pre,L: array [1..NMax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(F,inp); Reset(F);
 Readln(F,N);
 For i:=1 to N do Read(F,A[i]);
 Close(f);
End;

Procedure XuLy;
Var i,j: integer;
Begin
 { Xay dung do dai cac day don dieu tang }
 Fillchar(Pre,sizeof(Pre),0);
 For i:=1 to N do L[i]:=1;
 For i:=2 to N do
   For j:=1 to i-1 do
     If (A[j]<=A[i])and(L[i]<L[j]+1) then
     begin
       Pre[i]:=j;
       L[i]:=L[j]+1;
     end;
 { Xac dinh day don dieu tang nhieu phan tu nhat }
 Max:=0;
 For i:=1 to N do
   If L[i]>Max then
   begin
     Max:=L[i];
     DanhDau:=i;
   end;
 { Danh dau cac phan tu thuoc day da xac dinh }
 Fillchar(L,sizeof(L),0);
 While DanhDau<>0 do
 begin
   L[DanhDau]:=1;
   DanhDau:=Pre[DanhDau];
 end;
End;

Procedure InKq;
Var i,k: integer;
Begin
 Assign(F,Out); Rewrite(F);
 Writeln(F,Max);
 For i:=1 to N do
   If L[i]=1 then Writeln(F,A[i],' ');
 Close(F);
End;

BEGIN
 Clrscr;
 Nhap;
 XuLy;
 InKq;
END.