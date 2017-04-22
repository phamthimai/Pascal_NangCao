Program P121207;
{Tinh va ve ra tat cac N-Mino}
Uses  Crt;
Const fn  = 'P1212\NMINO.INP';
      fg  = 'NMINO.OUT';
      max = 16;
Type  bang= array [0..max+1,0..max+1] of integer;
Var   n: integer;
      lonmin: integer;
      hinh,hinh1,xet,dd: bang;
      hang,cot: array [1..max] of integer;
      sl: integer;
      qi,qj: array [1..max*max] of integer;
      sh,sc: integer;
      hangthieu,cotthieu: integer;
      slch: longint;
      f: text;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 Close(f);
End;

Procedure Chuanbi;
Begin
 lonmin:=trunc(sqrt(n));
 If n<>sqr(lonmin) then Inc(lonmin);
 slch:=0;
End;

Function min2(a,b: integer): integer;
Begin
 If a<b then min2:=a Else min2:=b;
End;

Procedure Taobien(i,j: integer);
Var ii,jj: integer;
Begin
 FillChar(dd,SizeOf(dd),1);
 FillChar(xet,SizeOf(xet),1);
 For ii:=1 to i do
   For jj:=1 to j do
   begin
     dd[ii,jj]:=0;
     xet[ii,jj]:=0;
   end;
End;

Procedure Ghinhancauhinh;
Var i,j: integer;
Begin
 Inc(slch);
 Writeln(f,sh,' ',sc);
 For i:=1 to sh do
 begin
   For j:=1 to sc do Write(f,(dd[i,j] mod 2):2); Writeln(f)
 end;
End;

Procedure Quaytrai;
Var hinh1: bang; i,j: integer;
Begin
 hinh1:=hinh;
 For i:=1 to sh do
   For j:=1 to sc do hinh[i,j]:=hinh1[sc-j+1,i];
End;

Procedure Lathinh;
Var hinh1: bang; i,j: integer;
Begin
 hinh1:=hinh;
 For i:=1 to sh do
   For j:=1 to sc do hinh[i,j]:=hinh1[sh-i+1,sc-j+1];
End;

Procedure Daohinh;
Var hinh1: bang; i,j: integer;
Begin
 hinh1:=hinh;
 For i:=1 to sh do
   For j:=1 to sc do hinh[i,j]:=hinh1[sh-i+1,j];
End;

Function Bethat: boolean;
Var ii,jj: integer;
Begin
 Bethat:=false;
 For ii:=1 to sh do
   For jj:=1 to sc do
     If hinh[ii,jj]<>hinh1[ii,jj] then
     begin
       Bethat:=hinh[ii,jj]<hinh1[ii,jj];
       exit;
     end;
End;

Function Behon: boolean;
Begin
 Behon:=Bethat;
End;

Function Xethinhvuong: boolean;
Begin
 Xethinhvuong:=false;
 Quaytrai;
 If Behon then exit; Quaytrai;
 If Behon then exit; Quaytrai;
 If Behon then exit; Daohinh;
 If Behon then exit; Quaytrai;
 If Behon then exit; Quaytrai;
 If Behon then exit; Quaytrai;
 If Behon then exit; Xethinhvuong:=true;
End;

Function Xetchunhat: boolean;
Begin
 Xetchunhat:=false;
 Lathinh;
 If Behon then exit; Daohinh;
 If Behon then exit; Lathinh;
 If Behon then exit; Xetchunhat:=true;
End;

Procedure Chuyensang(a: bang; Var b: bang);
Var i,j: integer;
Begin
 For i:=1 to sh do
   For j:=1 to sc do b[i,j]:=a[i,j] mod 2;
End;

Procedure Thughinhancauhinh;
Begin
 Chuyensang(dd,hinh);
 hinh1:=hinh;
 If sh=sc then begin If not Xethinhvuong then exit end
 Else If not Xetchunhat then exit;
 Ghinhancauhinh;
End;

Procedure Xetthem(i,j: integer);
Begin
 Inc(xet[i,j]);
 If xet[i,j]=1 then
 begin
   Inc(sl);
   qi[sl]:=i; qj[sl]:=j
 end;
End;

Procedure Xetbot(i,j: integer);
Begin
 If xet[i,j]=1 then Dec(sl);
 Dec(xet[i,j]);
End;

Procedure Themdiem(ii: integer);
Var i,j: integer;
Begin
 i:=qi[ii]; j:=qj[ii];
 dd[i,j]:=1;
 If dd[i,j-1]=0 then Xetthem(i,j-1);
 If dd[i,j+1]=0 then Xetthem(i,j+1);
 If dd[i-1,j]=0 then Xetthem(i-1,j);
 If dd[i+1,j]=0 then Xetthem(i+1,j);
End;

Procedure Bodiem(ii: integer);
Var i,j: integer;
Begin
 i:=qi[ii]; j:=qj[ii];
 dd[i,j]:=0;
 If dd[i,j-1]=0 then Xetbot(i,j-1);
 If dd[i,j+1]=0 then Xetbot(i,j+1);
 If dd[i-1,j]=0 then Xetbot(i-1,j);
 If dd[i+1,j]=0 then Xetbot(i+1,j);
End;

Procedure Xethangcot(ii: integer);
Var i,j: integer;
Begin
 i:=qi[ii]; j:=qj[ii];
 Inc(hang[i]);
 If hang[i]=1 then Dec(hangthieu);
 Inc(cot[j]);
 If cot[j]=1 then Dec(cotthieu);
End;

Procedure Xetlaihangcot(ii: integer);
Var i,j: integer;
Begin
 i:=qi[ii]; j:=qj[ii];
 If hang[i]=1 then Inc(hangthieu);
 Dec(hang[i]);
 If cot[j]=1 then Inc(cotthieu);
 Dec(cot[j]);
End;

Procedure Duyet(i: integer; last: integer);
Var ii: integer;
Begin
 If i>n then
 begin
   thughinhancauhinh;
   exit;
 end;
 For ii:=last+1 to sl do
 begin
   themdiem(ii);
   xethangcot(ii);
   If hangthieu+cotthieu<=n-i then duyet(i+1,ii);
   Xetlaihangcot(ii);
   bodiem(ii);
 end;
End;

Procedure Duyetcauhinh(i,j: integer);
Var jj: integer;
Begin
 sh:=i; sc:=j;
 FillChar(hang,SizeOf(hang),0);
 FillChar(cot,SizeOf(cot),0);
 hangthieu:=sh; cotthieu:=sc;
 taobien(i,j);
 For jj:=1 to j do
 begin
   sl:=1;
   qi[1]:=1; qj[1]:=jj;
   duyet(1,0);
   dd[1,jj]:=2;
 end;
End;

Procedure Duyethinhbao;
Var i,j: integer; minj,maxj: integer;
Begin
 For i:=lonmin to n do
 begin
   minj:=(n-1) div i+1;
   maxj:=min2(n+1-i,i);
   For j:=minj to maxj do duyetcauhinh(i,j);
 end;
End;

Procedure Ghicuoi;
Var f: file of char; s: string; i: integer;
Begin
 Str(slch,s);
 Assign(f,fg); Reset(f);
 Seek(f,0);
 For i:=1 to Length(s) do Write(f,s[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 Assign(f,fg); Rewrite(f);
 Writeln(f,'             ');
 Nhap;
 Chuanbi;
 Duyethinhbao;
 Close(f);
 Ghicuoi;
END.