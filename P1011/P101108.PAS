Program P101108; {tim mien lien thong lon nhat co cac phan tu =1}
Uses  Crt;
Const nmax=100;
      mmax=100;
      inp='P1011\P101108.INP';
      out='P1011\P101108.OUT';
      d: array [1..4] of shortint=(-1,0,1,0);
      c: array [1..4] of shortint=(0,-1,0,1);
Var   f: text;
      m,n: byte;
      DanhDau,DanhDauMax,DienTich,DienTichMax: integer;
      a: array [0..mmax+1,0..nmax+1] of 0..1;
      b: array [1..mmax,1..nmax] of integer;

Procedure Nhap;
Var i,j: byte;
Begin
 FillChar(a,Sizeof(a),0);
 Assign(f,inp); Reset(f);
 Readln(f,m,n);
 For i:=1 to m do
 begin
   For j:=1 to n do Read(f,a[i,j]);
   Readln(f);
 end;
 Close(f);
End;

Procedure Lan(i,j: byte);
Var qd,qc: array [1..5000] of byte;
    dau,cuoi: integer;
    dong,cot: byte;
Begin
 dau:=1; cuoi:=1;
 qd[1]:=i;
 qc[1]:=j;
 While dau<=cuoi do
 begin
   dong:=qd[dau];
   cot:=qc[dau];
   Inc(dau);
   For i:=1 to 4 do
     If (a[dong+d[i],cot+c[i]]=1)and(b[dong+d[i],cot+c[i]]=0) then
     begin
       Inc(DienTich);
       b[dong+d[i],cot+c[i]]:=DanhDau;
       Inc(cuoi);
       qd[cuoi]:=dong+d[i];
       qc[cuoi]:=cot+c[i];
     end;
 end;
End;

Procedure TimLienThong;
Var i,j: byte;
Begin
 FillChar(b,Sizeof(b),0);
 DienTichMax:=0;
 DanhDau:=0;
 For i:=1 to m do
   For j:=1 to n do
     If (a[i,j]=1)and(b[i,j]=0) then
     begin
       Inc(DanhDau);
       DienTich:=1;
       b[i,j]:=DanhDau;
       Lan(i,j);
       If DienTich>DientichMax then
       begin
         DienTichMax:=Dientich;
         DanhDauMax:=DanhDau;
       end;
     end;
End;

Procedure InKQ;
Var i,j: byte;
Begin
 Writeln('Mien lien thong co dien tich lon nhat la: ',DienTichMax);
 Assign(f,out); Rewrite(f);
 For i:=1 to m do
 begin
   For j:=1 to n do
     If b[i,j]=DanhDauMax then Write(f,1:2)
     Else Write(f,0:2);
     Writeln(f);
 end;
 Readln;
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 TimLienThong;
 InKQ;
END.
4 5
1 1 1 0 0
0 1 0 1 1
0 1 0 1 1
0 0 1 1 0
