Program P121213;
{Cat vai sao cho vai thua co dien tich la nho nhat}
Uses  Crt;
Const fn='P1212\CATVAI.INP';
      fg='CATVAI.OUT';
      maxbien=60;
      max=10;
      maxmoc=100;
Type  bien = record
               chinh: longint;
               loai : longint;
               d,c  : longint;
             end;
      td   = record
               x,y  : longint;
             end;
Var   a,b : array [1..max] of longint;
      r,n : longint;
      ngangduoi,ngangtren,doctrai,docphai: array [1..maxbien] of bien;
      slbien   : longint;
      tongngang: longint;
      moc: array [1..maxmoc] of td;
      slmoc:	longint;
      cohinh : boolean;
      chon,bitrung: array [1..maxmoc] of longint;
      slduoc: integer;
      kl,gtht: longint;
      tong : integer;

Procedure Nhap;
Var f: text; i: longint;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n,r);
 For i:=1 to n do Readln(f,a[i],b[i]);
 Close(f);
End;

Procedure Chuanbi;
Var i: longint;
Begin
 tong:=0;
 For i:=1 to n do Inc(tong,a[i]*b[i]);
 slduoc:=0;
 tongngang:=0;
 For i:=1 to n do Inc(tongngang,a[i]);
 FillChar(chon,SizeOf(chon),0);
 FillChar(bitrung,SizeOf(bitrung),0);
End;

Procedure Thembien(x1,y1,x2,y2: longint);
Begin
 Inc(slbien);
 ngangtren[slbien].chinh:=y1;
 ngangtren[slbien].d:=x1;
 ngangtren[slbien].c:=x2;
 ngangduoi[slbien].chinh:=y2;
 ngangduoi[slbien].d:=x1;
 ngangduoi[slbien].c:=x2;
 doctrai[slbien].chinh:=x1;
 doctrai[slbien].d:=y1;
 doctrai[slbien].c:=y2;
 docphai[slbien].chinh:=x2;
 docphai[slbien].d:=y1;
 docphai[slbien].c:=y2;
End;

Procedure Taobien(dai: longint);
Begin
 slbien:=0;
 thembien(0,-1,dai,0);
 thembien(0,r,dai,r+1);
 thembien(-1,0,0,r);
 thembien(dai,0,dai+1,r);
End;

Procedure Khoitaobomoc;
Begin
 slmoc:=1;
 moc[1].x:=0; moc[1].y:=0;
End;

Procedure Ghinhanklmoi;
Begin
 kl:=gtht;
End;

Procedure Duyet(last: longint); forward;
Function Giaocanh(d1,c1,d2,c2: integer): boolean;
Begin
 Giaocanh:=(d1<c2)and(d2<c1);
End;

Function Giaohinh(i1,k,i2: integer): boolean;
Begin
 giaohinh:=giaocanh(ngangtren[i1].d,ngangtren[i1].c,moc[k].x,moc[k].x+a[i2])
 and giaocanh(doctrai[i1].d,doctrai[i1].c,moc[k].y,moc[k].y+b[i2]);
End;

Function Vua(k,i: longint): boolean;
Var ii: integer;
Begin
 vua:=false;
 For ii:=1 to slbien do
   If giaohinh(ii,k,i) then exit;
 vua:=true;
End;

Function Thoamanmoc(x,y: longint): boolean;
Var i: longint;
Begin
 Thoamanmoc:=false;
 For i:=1 to slmoc do
   If (moc[i].x=x)and(moc[i].y=y) then exit;
 Thoamanmoc:=true;
End;

Procedure Themmocngang(y,x: longint);
Var i,xc,yc,max: longint;
Begin
 max:=-1;
 For i:=1 to slbien do
   If (docphai[i].d<=y)and(docphai[i].c>=y) then
     If (docphai[i].chinh>max)and(docphai[i].chinh<x) then
     begin
       max:=docphai[i].chinh;
       xc:=max; yc:=y;
     end;
 If thoamanmoc(xc,yc) then
 begin
   Inc(slmoc);
   moc[slmoc].x:=xc; moc[slmoc].y:=yc;
 end;
End;

Procedure Themmocdoc(x,y: longint);
Var i,xc,yc,max: longint;
Begin
 max:=-1;
 For i:=1 to slbien do
   If (ngangduoi[i].d<=x)and(ngangduoi[i].c>=x) then
     If (ngangduoi[i].chinh>max)and(ngangduoi[i].chinh<y) then
     begin
       max:=ngangduoi[i].chinh;
       xc:=x; yc:=max;
     end;
 If thoamanmoc(xc,yc) then
 begin
   Inc(slmoc);
   moc[slmoc].x:=xc; moc[slmoc].y:=yc;
 end;
End;

Procedure dat(k,i: longint);
Begin
 Themmocngang(moc[k].y+b[i],moc[k].x+a[i]);
 Themmocdoc(moc[k].x+a[i],moc[k].y+b[i]);
 Thembien(moc[k].x,moc[k].y,moc[k].x+a[i],moc[k].y+b[i]);
End;

Procedure bo(k,i: longint);
Begin
 Dec(slbien);
End;

Procedure Dathinhvaomoc(k: longint);
Var i,slmoc1: longint;
Begin
 For i:=1 to n do
   If chon[i]=0 then
     If vua(k,i) then
     begin
       slmoc1:=slmoc;
       dat(k,i);
       chon[i]:=1;
       Inc(slduoc);
       duyet(k);
       Dec(slduoc);
       chon[i]:=0;
       bo(k,i);
       slmoc:=slmoc1;
       If cohinh then exit;
     end;
End;

Procedure Duyet(last: longint);
Var ii: longint;
Begin
 If slduoc=n then
 begin
   ghinhanklmoi;
   cohinh:=true;
   exit;
 end;
 For ii:=last+1 to slmoc do
 begin
   dathinhvaomoc(ii);
   If cohinh then exit;
 end;
End;

Function Thoamanmieng(dai: longint): boolean;
Begin
 cohinh:=false;
 taobien(dai);
 khoitaobomoc;
 gtht:=dai;
 duyet(0);
 thoamanmieng:=cohinh;
End;

Procedure Duyetnhiphan;
Var dau,cuoi,giua: longint;
Begin
 dau:=0; cuoi:=tongngang;
 While dau<=cuoi do
 begin
   giua:=(dau+cuoi) div 2;
   If not thoamanmieng(giua) then dau:=giua+1
   Else cuoi:=giua-1;
 end;
End;

Procedure Ghinhan;
Var f: text;
Begin
 Assign(f,fg); Rewrite(f);
 Writeln(f,kl);
 Writeln(f,kl*r-tong);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Duyetnhiphan;
 Ghinhan;
END.