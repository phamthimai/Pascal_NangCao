Program P121209;
Uses  Crt;
Const fn  = 'P1212\THUOCTHO.INP';
      fg  = 'THUOCTHO.OUT';
      max = 100;
      chuan: array [1..3] of integer = (1,1,1);
Var   m,n: integer;
      a  : array [1..max,1..max] of integer;
      sl : integer;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,m,n);
 Close(f);
End;

Procedure Chuanbi;
Begin
 FillChar(a,SizeOf(a),0);
 sl:=0;
End;

Procedure Pathinhngang(i,j,c: integer);
Var ii: integer;
Begin
 For ii:=1 to 3 do a[i,j+ii-1]:=chuan[ii]+c;
End;

Procedure Dathinhdoc(i,j,c: integer);
Var ii: integer;
Begin
 For ii:=1 to 3 do a[i+ii-1,j]:=chuan[ii]+c;
End;

Procedure Datngang(i1,j1,i2,j2: integer);
Var i,j: integer;
Begin
 For i:=i1 to i2 do
   For j:=j1 to j2 do
     If a[i,j]=0 then
     begin
       Pathinhngang(i,j,sl);
       Inc(sl);
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
       Inc(sl);
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
   For j:=1 to n do Write(f,a[i,j]:6); Writeln(f);
 end;
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Datvaohcn(1,1,m,n);
 Ghinhan
END.
