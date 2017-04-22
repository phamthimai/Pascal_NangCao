Program P121206;
{Tinh so mien tren mat phang}
Uses  Crt;
Const fn = 'P1212\DUONG.INP';
      fg = 'DUONG.OUT';
      max = 100;
      exp = 0.0001;
Var   a,b,c: array [1..max] of integer;
      n    : integer;
      smien: integer;

Procedure Nhap;
Var f: text; i: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,a[i],b[i],c[i]); { ax + by = c }
 Close(f);
End;

Procedure Chuanbi;
Begin
 smien:=1;
End;

Function Giaodiem(i,j: integer; Var x,y: real): boolean;
Var d,dx,dy: integer;
Begin
 d:=a[i]*b[j]-a[j]*b[i];
 dx:=c[i]*b[j]-c[j]*b[i];
 dy:=a[i]*c[j]-a[j]*c[i];
 If d<>0 then begin x:=dx/d; y:=dy/d; end;
 Giaodiem:=d<>0;
End;

Function Giatri(i: integer; x,y: real): real;
Begin
 Giatri:=a[i]*x+b[i]*y-c[i];
End;

Function bang(a,b: real): boolean;
Begin
 bang:=abs(a-b)<=exp;
End;

Function Thoaman(i: integer; x,y: real): boolean;
Var ii: integer;
Begin
 Thoaman:=false;
 For ii:=1 to i-1 do
   If bang(Giatri(ii,x,y),0) then exit;
 Thoaman:=true;
End;

Function Cattruoc(i: integer): integer;
Var ii,gt: integer; x,y: real;
Begin
 gt:=0;
 For ii:=1 to i-1 do
   If Giaodiem(i,ii,x,y) then
     If Thoaman(ii,x,y) then Inc(gt);
 cattruoc:=gt;
End;

Procedure Tinhslmien;
Var i: integer;
Begin
 For i:=1 to n do Inc(smien,cattruoc(i)+1);
End;

Procedure Ghinhan;
Var f: text;
Begin
 Assign(f,fg); Rewrite(f);
 Write(f,smien);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Tinhslmien;
 Ghinhan;
END.