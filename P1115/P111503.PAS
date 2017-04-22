Program P111503;
Uses Crt;
Const
      inp='P11\1503.inp';
      d:array[1..4]of shortint=(-1,0,1,0);
      c:array[1..4]of shortint=(0,-1,0,1);
Var
      f:text;
      m,n,dxp,cxp,dt,ct:byte;
      a,b,pre :array[0..51,0..51]of byte;
      qd,qc :array[1..2500]of byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp);Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
   begin
   For j:=1 to n do Read(f,a[i,j]);
   Readln(f);
   end;
 Close(f);
 Repeat
   Writeln('Nhap toa do diem xuat phat tu do: ');
   Write('  - Dong: '); Readln(dxp);
   Write('  - Cot : '); Readln(cxp);
 Until a[dxp,cxp]=0;
End;

Procedure Chuan_bi;
Var i,j: byte;
Begin
  For i:=0 to m+1 do
  begin
    a[i,0]:=2;
    a[i,n+1]:=2;
  end;
  For i:=0 to n+1 do
  begin
    a[0,i]:=2;
    a[m+1,i]:=2;
  end;
  FillChar(b,Sizeof(b),0);
  pre[dxp,cxp]:=0;
  b[dxp,cxp]:=1;
  dt:=0;
  ct:=0;
End;

Procedure BFS;
Var  i,j,dau,cuoi,dong,cot: byte;
Begin
  dau:=1; cuoi:=1;
  qd[1]:=dxp; qc[1]:=cxp;
  While dau<=cuoi do
  begin
    dong:=qd[dau];
     cot:=qc[dau];
    Inc(dau);
    For i:=1 to 4 do
    begin
     If (a[dong+d[i],cot+c[i]]=2) then
     begin
       dt:=dong;
       ct:=cot;
       exit;
     end;
    If (a[dong+d[i],cot+c[i]]=0)and(b[dong+d[i],cot+c[i]]=0) then
      begin
       b[dong+d[i],cot+c[i]]:=1;
       pre[dong+d[i],cot+c[i]]:=i;
       Inc(cuoi);
       qd[cuoi]:=dong+d[i];
       qc[cuoi]:=cot+c[i];
      end;
     end;
    end;
End;

Procedure Tim_duong(i,j:byte);
Begin
  If pre[i,j]<>0 then
  Case pre[i,j] of
  1:Tim_duong(i+1,j);
  2:Tim_duong(i,j+1);
  3:Tim_duong(i-1,j);
  4:Tim_duong(i,j-1);
  end;
  Write('[',i,',',j,'] ');Readln;
End;

Procedure Xu_ly;
Begin
  Chuan_bi;
  BFS;
  If dt<>0 then
  begin
    Writeln('Trinh tu duong di:');
    Tim_duong(dt,ct);
    exit;
  end
  Else Writeln('Khong the thuc hien di chuyen ra ngoai');Readln;
End;

BEGIN
 Clrscr;
 Nhap;
 Xu_ly;
END.
8 8
1 1 1 1 1 1 1 1
1 0 0 0 1 0 1 1
1 1 1 0 0 0 1 1
1 1 1 0 0 0 1 1
1 1 1 0 0 0 1 1
1 1 1 1 1 0 1 1
1 1 1 1 1 0 1 1
1 1 1 1 1 0 1 1
