Program P121210;
Uses  Crt;
Const fn  = 'P1212\THUOCTHO.INP';
      fg  = 'THUOCTHO.OUT';
      max = 50;
      ngang: array [1..2,1..3] of integer = ((1,1,2),(1,2,2));
      doc  : array [1..3,1..2] of integer = ((1,1),(1,2),(2,2));
      phan : array [1..4,1..2,1..2] of integer = (((0,1),(1,1)),
                                                 ((1,0),(1,1)),
                                                 ((1,1),(0,1)),
                                                 ((1,1),(1,0)));

Var   n          : integer;
      a          : array [1..max*2,1..max*2] of integer;
      i1,j1,i2,j2: integer;
      li,lj      : integer;
      sl         : integer;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 Readln(f,li,lj);
 Close(f);
End;

Procedure Chuanbi;
Var canh: integer;
Begin
 FillChar(a,SizeOf(a),0);
 a[li,lj]:=-1;
 n:=n*2;
 i1:=li; j1:=lj;
 While (i1 mod 3<>1)or(i1 mod 2=0) do Dec(i1);
 While (j1 mod 3<>1)or(j1 mod 2=0) do Dec(j1);
 canh:=n mod 6;
 If (canh=2)and(n<>2) then canh:=8;
 i2:=i1+canh-1; j2:=j1+canh-1;
 sl:=0;
End;

Procedure Dathinhngang(i,j,c: integer);
Var ii,jj :integer;
Begin
 For ii:=1 to 2 do
   For jj:=1 to 3 do a[i+ii-1,j+jj-1]:=ngang[ii,jj]+c;
End;

Procedure Dathinhdoc(i,j,c: integer);
Var ii,jj: integer;
Begin
 For ii:=1 to 3 do
   For jj:=1 to 2 do a[i+ii-1,j+jj-1]:=doc[ii,jj]+c;
End;

Procedure Datngang(i1,j1,i2,j2: integer);
Var i,j: integer;
Begin
 For i:=i1 to i2 do
   For j:=j1 to j2 do
     If a[i,j]=0 then
     begin
       dathinhngang(i,j,sl);
       Inc(sl,2);
     end;
End;

Procedure Datdoc(i1,j1,i2,j2: integer);
Var i,j: integer;
Begin
 For i:=i1 to i2 do
   For j:=j1 to j2 do
     If a[i,j]=0 then
     begin
       dathinhdoc(i,j,sl);
       Inc(sl,2);
     end;
End;

Procedure Datvaohcn(i1,j1,i2,j2: integer);
Begin
 If (i2-i1+1) mod 3=0 then datdoc(i1,j1,i2,j2)
 Else datngang(i1,j1,i2,j2);
End;

Procedure Ghinhan;
Var f: text; i,j: integer;
Begin
 Assign(f,fg); Rewrite(f);
 For i:=1 to n do
 begin
   For j:=1 to n do
     If a[i,j]<>-1 then Write(f,a[i,j]:6)
     Else Write(f,'X':6);
   Writeln(f);
 end;
 Close(f);
End;

Procedure Ghivao(c,i,j: integer);
Var ii,jj: integer;
Begin
 For ii:=1 to 2 do
   For jj:=1 to 2 do
     If phan[c,ii,jj]=1 then a[i+ii-1,j+jj-1]:=sl+1;
 Inc(sl);
End;

Procedure Tinh(i1,j1,i2,j2: integer; Var li,lj: integer);
Var ii,jj: integer;
Begin
 For ii:=i1 to i2 do
   For jj:=j1 to j2 do
     If a[ii,jj]<>0 then
     begin
       li:=ii; lj:=jj;
       exit
     end;
End;

Procedure Dathinh(i1,j1,i2,j2: integer);
Var i3,j3: integer; li,lj: integer;
Begin
 If (i1>=i2)or(j1>=j2) then exit;
 i3:=(i1+i2) div 2; j3:=(j1+j2) div 2;
 tinh(i1,j1,i2,j2,li,lj);
 If li<=i3 then If lj<=j3 then ghivao(1,i3,j3 )
                Else ghivao(2,i3,j3)
 Else           If lj<=j3 then ghivao(3,i3,j3)
                Else ghivao(4,i3,j3);
 dathinh(i1,j1,i3,j3);
 dathinh(i1,j3+1,i3,j2);
 dathinh(i3+1,j1,i2,j3);
 dathinh(i3+1,j3+1,i2,j2);
End;

BEGIN
 ClrScr;
 Nhap;
 Chuanbi;
 datvaohcn(1,1,i2,j1-1);
 datvaohcn(1,j1,i1-1,n);
 datvaohcn(i1,j2+1,n,n);
 datvaohcn(i2+1,1,n,j2);
 dathinh(i1,j1,i2,j2);
 ghinhan
END.
