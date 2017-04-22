Program P111505; {Chuyen hon bi tu o S den o T}
Uses Crt;
Const
      inp='P11\P1115\P111505.inp';
      d:array[1..4]of shortint=(-1,0,1,0);
      c:array[1..4]of shortint=(0,-1,0,1);
Var
      f:text;
      ds,cs,dt,ct :byte;
      a :array[0..9,0..9]of char;
      b,pre :array[0..9,0..9]of byte;
      qd,qc :array[1..65]of byte;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,inp);Reset(f);
 For i:=1 to 8 do
  begin
    For j:=1 to 8 do Read(f,a[i,j]);
    Readln(f);
  end;
 Close(f);
 Write('Nhap toa do S (dong-cot): '); Readln(ds,cs);
 Write('Nhap toa do T (dong-cot): '); Readln(dt,ct);
End;

Procedure Chuan_bi;
Var i,j : byte;
Begin
  For i:=0 to 9 do
  begin
    a[i,0]:='1';
    a[i,9]:='1';
    a[0,i]:='1';
    a[9,i]:='1';
  end;
  FillChar(b,Sizeof(b),0);
  pre[ds,cs]:=0;
End;

Procedure BFS;
Var i,j,dau,cuoi,dong,cot:byte;
Begin
  dau:=1; cuoi:=1;
  qd[1]:=ds; qc[1]:=cs;
  While dau<=cuoi do
  begin
    dong:=qd[dau];
    cot:=qc[dau];
    Inc(dau);
    If (dong=dt)and(cot=ct) then exit;
    For i:=1 to 4 do
    If (a[dong+d[i],cot+c[i]]='0')and(b[dong+d[i],cot+c[i]]=0) then
    begin
      b[dong+d[i],cot+c[i]]:=1;
      pre[dong+d[i],cot+c[i]]:=i;
      Inc(cuoi);
      qd[cuoi]:=dong+d[i];
      qc[cuoi]:=cot+c[i];
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
    Write('[',i,',',j,'] ');
    Readln;
End;

Procedure Xu_ly;
Begin
  If (a[ds,cs]='1')and(a[dt,ct]='0') then
   begin
   Chuan_bi;
   BFS;
   If b[dt,ct]=1 then
     begin
     Writeln('Trinh tu duong di:');
     Tim_duong(dt,ct);Readln;
     exit;
     end;
     Readln;
   end;
   Writeln('Khong the thuc hien di chuyen');Readln;
End;

BEGIN
 Clrscr;
 Nhap;
  Readln;
END.
10000000
01100000
01000000
00000000
00000000
00000000
00000000
00000000
