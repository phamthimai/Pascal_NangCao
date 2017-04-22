Program P121411;   {Sinh ngau nhien cac phan hoach}
Uses  Crt;
Const fg  = 'P12\Loigiai\P1214\PHOACH.OUT';
      max = 100;
Var   n: integer;
      a: array [0..max+1,0..max+1] of byte;
      dtcon: longint;
      sh: integer;

Procedure Nhap;
Begin
 Write('Sinh phan hoach cho hinh vuong canh ??? ');
 Readln(n);
End;

Procedure Chuanbi;
Var i,j: integer;
Begin
 FillChar(a,SizeOf(a),1);
 For i:=1 to n do
   For j:=1 to n do a[i,j]:=0;
 dtcon:=n*n;
 sh:=0;
End;

Procedure Sinhngaunhienchunhat(k,i,j: integer);
Var ii,jj: integer; ngang,doc: integer;
Begin
 ii:=1; jj:=1;
 While a[i+ii-1,j]=0 do Inc(ii);
 Dec(ii);
 While a[i,j+jj-1]=0 do Inc(jj);
 Dec(jj);
 doc:=Random(ii)+1;
 ngang:=Random(jj)+1;
 Dec(dtcon,ngang*doc);
 For ii:=1 to doc do
   For jj:=1 to ngang do a[i+ii-1,j+jj-1]:=k;
End;

Procedure Ghinhan;
Var f: text; i,j: integer;
Begin
 Assign(f,fg); Rewrite(f);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,a[i,j]:4);
   Writeln(f);
 end;
 Close(f);
End;

Procedure Sinh;
Var i,j: integer;
Begin
 For i:=1 to n do
   For j:=1 to n do
     If a[i,j]=0 then
     begin
       Inc(sh);
       Sinhngaunhienchunhat(sh,i,j);
     end;
End;

BEGIN
 Randomize;
 Clrscr;
 Nhap;
 Chuanbi;
 Sinh;
 Ghinhan;
END.