Program P100516;   {Day con tang dai nhat}
Uses  Crt;
Const nmax=5000;
      inp='INP.TXT';
      out='b16.out';
Var   f: text;
      n,max,dd: integer;
      a: array [1..nmax] of real;
      pre,l: array [1..nmax] of integer;

Procedure Nhap;
Var i:integer;
Begin
   { Nhap du lieu tu file B1.INP }
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   If EoLn(f) then Readln(f);
   Read(f,a[i]);
 end;
 Close(f);
End;

Procedure Xuly;
Var i,j: integer;
Begin
   { Xay dung do dai cac day don dieu tang }
 FillChar(pre,sizeof(pre),0);
 For i:=1 to n do l[i]:=1;
 For i:=2 to n do
   For j:=1 to i-1 do
     If (a[j]<{= khong giam}a[i])and(l[i]<l[j]+1) then
     begin
       pre[i]:=j;
       l[i]:=l[j]+1;
     end;
   { Xac dinh day don dieu tang nhieu phan tu nhat }
 max:=0;
 For i:=1 to n do
   If l[i]>max then
   begin
     max:=l[i];
     dd:=i;
   end;
   { Danh dau cac phan tu thuoc day da xac dinh }
 FillChar(l,Sizeof(l),0);
 While dd<>0 do
 begin
   l[dd]:=1;
   dd:=pre[dd];
 end;
End;

Procedure Inkq;
Var i,k: integer;
Begin
   { In ket qua ra file B1.OUT }
 Assign(f,out); Rewrite(f);
 Writeln(f,max);
 For i:=1 to n do If l[i]=1 then Writeln(f,a[i],' ');
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Xuly;
 Inkq;
END.