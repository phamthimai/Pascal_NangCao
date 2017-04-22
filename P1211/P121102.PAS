Program P121102;   {Duong tau}
Uses crt;
Const fi='P1211\P121102.inp';
Type  arr = array [0..20] of byte;
Var   n,ta,tb,tc: integer;
      a,b,c     : arr;
      f         : text;
      mau,xc    : byte;

Procedure Nhap;
Var s: string; i: integer;
Begin
 Assign(f,fi);
 Reset(f);
 Readln(f,n);
 Readln(f,s);
 For i:=1 to n do
   If s[i]='D' then a[i]:=1 Else a[i]:=2;
 Close(f);
End;

Procedure Viet(mau,x,y: integer);
Begin
 If mau=1 then mau:=red
 Else If mau=2 then mau:=blue
      Else mau:=black;
 TextColor(mau);
 Gotoxy(x,y);
 Write('Ü');
End;

Procedure Khoitao;
Var x,p: integer;
Begin
 ta:=n; tb:=0; tc:=0;
 x:=80;
 p:=1;
 While p<=n do
   Begin
     Viet(a[p],x,1);
     Inc(p);
     x:=x-2;
   End;
 xc:=40;
 mau:=a[ta];
End;

Procedure Chuyenab;
Var i,d,c,mau: integer;
Begin
 c:=80-ta*2+2; d:=tb*2+2;
 While c>d do
 begin
   Viet(a[ta],c,1);
   Delay(50);
   Viet(3,c,1);
   Dec(c,2);
 end;
 Viet(a[ta],d,1);
 Inc(tb);
 b[tb]:=a[ta];
 Dec(ta);
End;

Procedure Chuyenac;
Var i,x,y: integer;
Begin
 x:=80-ta*2+2;
 While x>xc do
 begin
   Viet(a[ta],x,1);
   Delay(50);
   Viet(3,x,1);
   Dec(x,2);
 end;
 x:=1;
 y:=25-tc-1;
 While x<y do
 begin
   Inc(x);
   Viet(a[ta],xc,x);
   Delay(50);
   Viet(3,xc,x);
 end;
 Viet(a[ta],xc,x);
 Inc(tc);
 c[tc]:=a[ta];
 Dec(ta);
End;

Procedure Chuyencb;
Var x,y: integer;
Begin
 y:=1; x:=25-tc;
 While x>=y do
   begin
     Viet(c[tc],xc,x);
     Delay(50);
     Viet(3,xc,x);
     Dec(x);
   End;
 x:=xc;
 y:=2*tb+2;
 while x>y do
   Begin
     Viet(c[tc],x,1);
     Delay(50);
     Viet(3,x,1);
     Dec(x,2);
   End;
 Viet(c[tc],x,1);
 Inc(tb);
 b[tb]:=c[tc];
 Dec(tc);
End;

Procedure Xuly;
Begin
 Chuyenab;
 While tb<n do
 begin
  mau:=3-mau;
  If c[tc]=mau then Chuyencb
  Else begin
         While a[ta]<>mau do Chuyenac;
         Chuyenab;
       end;
 end;
End;

BEGIN
 Clrscr;
 Nhap;
 Khoitao;
 Xuly;
END.