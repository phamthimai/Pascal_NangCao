Program P121218;  {Chi ra cac hinh chu nhat long nhau}
Uses  Crt;
Const fn = 'P1212\LONGNHAU.INP';
      fg = 'LONGNHAU.OUT';
      max= 100;
Var   x1,y1,x2,y2: array [1..max] of integer;
      n : integer;
      dt: array [1..max] of longint;
      cs: array [1..max] of integer;
      con,cha,chung: array [1..max] of integer;
      longmax: integer;

Procedure Nhap;
Var f: text; i: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,x1[i],y1[i],x2[i],y2[i]);
 (* Dieu kien : x2[i] >= x1[i] ,y2[i] >= y1[i] ,i = 1..n *)
 Close(f);
End;

Procedure Chuanbi;
Var i: integer;
Begin
 For i:=1 to n do
 begin
   cs[i]:=i;
   dt[i]:=x2[i]-x1[i];
   dt[i]:=dt[i]*(y2[i]-y1[i]);
 end;
End;

Procedure Doil(Var a,b: longint);
Var h: longint;
Begin
 h:=a; a:=b; b:=h;
End;

Procedure Doii(Var a,b: integer);
Var h: integer;
Begin
 h:=a; a:=b; b:=h;
End;

Procedure Sort;
Var i,j: integer;
Begin
 For i:=1 to n-1 do
   For j:=i+1 to n do
     If dt[i]>dt[j] then
     begin
       Doil(dt[i],dt[j]); Doii(cs[i],cs[j]);
       Doii(x1[i],x1[j]); Doii(y1[i],y1[j]);
       Doii(x2[i],x2[j]); Doii(y2[i],y2[j]);
     end;
End;

Function Trong(i,j: integer): boolean;
Begin
 Trong:=(x1[i]>=x1[j])and(y1[i]>=y1[j])and
   (x2[i]<=x2[j])and(y2[i]<=y2[j]);
End;

Function Longconmax(i: integer): integer;
Var ii,max: integer;
Begin
 max:=0;
 For ii:=1 to i-1 do
   If trong(ii,i)and(max<con[ii]) then max:=con[ii];
 longconmax:=max;
End;

Procedure Tinhlongcon;
Var i: integer;
Begin
 For i:=1 to n do con[i]:=longconmax(i)+1;
End;

Function Longchamax(i: integer): integer;
Var ii,max: integer;
Begin
 max:=0;
 For ii:=i+1 to n do
   If trong(i,ii)and(max<cha[ii]) then max:=cha[ii];
 longchamax:=max;
End;

Procedure Tinhlongcha;
Var i: integer;
Begin
 For i:=n downto 1 do cha[i]:=longchamax(i)+1;
End;

Procedure Tinhlongchung;
Var i: integer;
Begin
 For i:=1 to n do chung[i]:=con[i]+cha[i]-1;
End;

Procedure Tinhmax;
Var i: integer;
Begin
 longmax:=0;
 For i:=1 to n do
   If longmax<chung[i] then longmax:=chung[i];
End;

Function Chiso(i: integer): integer;
Var ii: integer;
Begin
 For ii:=1 to n do
   If cs[ii]=i then begin chiso:=ii; exit; end;
End;

Procedure Ghinhan;
Var f: text; i: integer;
Begin
 Assign(f,fg); Rewrite(f);
 Writeln(f,longmax);
 For i:=1 to n do Write(f,chung[chiso(i)],' ');
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Chuanbi;
 Sort;
 Tinhlongcon;
 Tinhlongcha;
 Tinhlongchung;
 Tinhmax;
 Ghinhan;
END.