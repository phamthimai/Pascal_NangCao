Program P121208;     {N_mino}
{Tinh va ve NMino lap phuong}
Uses  Crt;
Const fn  = 'P1212\NMINO.INP';
      fg  = 'NMINO.OUT';
      max = 10;
      maxtime = 200; {Cat thoi gian: 200 clock}
Type  bang = array [0..max+1,0..max+1,0..max+1] of integer;
Var   n: integer;
      lonmin: integer;
      hinh,hinh1,xet,dd: bang;
      hang,cot,sau: array [1..max] of integer;
      sl: integer;
      qi,qj,qk: array [1..max*max*max] of integer;
      sh1,sc1,ss1,sh,sc,ss: integer;
      hangthieu,cotthieu,sauthieu: integer;
      slch: longint;
      f: text;
      t1: longint absolute $0000:$046c;
      t2: longint;

Procedure Nhap;
Var f: text;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 Close(f);
End;

Function mu3(a: integer): integer;
Begin
 mu3:=a*a*a;
End;

Procedure Chuanbi;
Begin
 slch:=0;
End;

Function min2(a,b: integer): integer;
Begin
 If a<b then min2:=a Else min2:=b;
End;

Procedure Taobien(i,j,k: integer);
Var ii,jj,kk: integer;
Begin
 FillChar(dd,SizeOf(dd),1);
 FillChar(xet,SizeOf(xet),1);
 For ii:=1 to i do
   For jj:=1 to j do
     For kk:=1 to k do
     begin
       dd[ii,jj,kk]:=0;
       xet[ii,jj,kk]:=0;
     end;
End;

Procedure Ghinhancauhinh;
Var ii,jj,kk: integer;
Begin
 Inc(slch);
 Write(#13,slch);
 Writeln(f,ss,' ',sh,' ',sc);
 For kk:=1 to ss do
 begin
   For ii:=1 to sh do
   begin
     For jj:=1 to sc do Write(f,hinh1[ii,jj,kk],' '); Writeln(f);
   end;
   Writeln(f);
 end;
End;

Procedure Ghicuoi;
Var f: file of char; s: string; i: integer;
Begin
 Str(slch,s);
 Assign(f,fg); Reset(f);
 Seek(f,0);
 For i:=1 to Length(s) do Write(f,s[i]); Readln;
 Close(f);
End;

Procedure Doi(Var a,b: integer);
Var h: integer;
Begin
 h:=a; a:=b; b:=h
End;

Procedure Layrahinh;
Var ii,jj,kk: integer;
Begin
 For ii:=1 to sh do
   For jj:=1 to sc do
     For kk:=1 to ss do hinh[ii,jj,kk]:=dd[ii,jj,kk] mod 2;
End;

Function Lonhon: boolean;
Var ii,jj,kk: integer;
Begin
 lonhon:=false;
 If (sh1<>sh)or(sc1<>sc)or(ss1<>ss) then exit;
 For ii:=1 to sh do
   For jj:=1 to sc do
     For kk:=1 to ss do
       If hinh[ii,jj,kk]<>hinh1[ii,jj,kk] then
       begin
         lonhon:=hinh[ii,jj,kk]>hinh1[ii,jj,kk];
         exit;
       end;
End;

Procedure Quaytren;
Var hinhtg: bang; ii,jj,kk: integer;
Begin
 hinhtg:=hinh; doi(sh,ss);
 For ii:=1 to sh do
   For jj:=1 to sc do
     For kk:=1 to ss do hinh[ii,jj,kk]:=hinhtg[ss-kk+1,jj,ii];
End;

Procedure Quayphai;
Var hinhtg: bang; ii,jj,kk: integer;
Begin
 hinhtg:=hinh; doi(sc,ss);
 For ii:=1 to sh do
   For jj:=1 to sc do
     For kk:=1 to ss do hinh[ii,jj,kk]:=hinhtg[ii,ss-kk+1,jj];
End;

Procedure Latphai;
Var hinhtg: bang; ii,jj,kk: integer;
Begin
 hinhtg:=hinh; doi(sh,sc);
 For ii:=1 to sh do
   For jj:=1 to sc do
     For kk:=1 to ss do hinh[ii,jj,kk]:=hinhtg[sc-jj+1,ii,kk];
End;

Procedure Doixung;
Var hinhtg: bang; ii,jj,kk: integer;
Begin
 hinhtg:=hinh;
 For ii:=1 to sh do
   For jj:=1 to sc do
     For kk:=1 to ss do hinh[ii,jj,kk]:=hinhtg[sh-ii+1,jj,kk];
End;

Function kiemtramat: boolean;
Begin
 kiemtramat:=true;
 If not(((sh1=sh)and(sc1=sc))or((sh1=sc)and(sc1=sh)))or(ss1<>ss) then exit;
 kiemtramat:=false;
 If lonhon then exit; latphai;
 If lonhon then exit; latphai;
 If lonhon then exit; latphai;
 If lonhon then exit; latphai;
 doixung;
 If lonhon then exit; latphai;
 If lonhon then exit; latphai;
 If lonhon then exit; latphai;
 If lonhon then exit; latphai;
 kiemtramat:=true;
End;

Procedure Thughinhancauhinh;
Begin
 layrahinh; hinh1:=hinh;
 sh1:=sh; sc1:=sc; ss1:=ss;
 If not Kiemtramat then exit; quaytren;
 If not kiemtramat then exit; quaytren;
 If not kiemtramat then exit; quaytren;
 If not kiemtramat then exit; quaytren;
 quayphai;
 If not kiemtramat then exit; quayphai;
 quayphai;
 If not kiemtramat then exit; quayphai;
 ghinhancauhinh;
End;

Procedure xetthem(i,j,k: integer);
Begin
 Inc(xet[i,j,k]);
 If xet[i,j,k]=1 then
 begin
   Inc(sl);
   qi[sl]:=i; qj[sl]:=j; qk[sl]:=k;
 end;
End;

Procedure Xetbot(i,j,k: integer);
Begin
 If xet[i,j,k]=1 then Dec(sl);
 Dec(xet[i,j,k]);
End;

Procedure Themdiem(ii: integer);
Var i,j,k: integer;
Begin
 i:=qi[ii]; j:=qj[ii]; k:=qk[ii];
 dd[i,j,k]:=1;
 If dd[i,j-1,k]=0 then Xetthem(i,j-1,k);
 If dd[i,j+1,k]=0 then Xetthem(i,j+1,k);
 If dd[i-1,j,k]=0 then Xetthem(i-1,j,k);
 If dd[i+1,j,k]=0 then Xetthem(i+1,j,k);
 If dd[i,j,k-1]=0 then Xetthem(i,j,k-1);
 If dd[i,j,k+1]=0 then Xetthem(i,j,k+1);
End;

Procedure Bodiem(ii: integer);
Var i,j,k: integer;
Begin
 i:=qi[ii]; j:=qj[ii]; k:=qk[ii];
 dd[i,j,k]:=0;
 If dd[i,j-1,k]=0 then Xetbot(i,j-1,k);
 If dd[i,j+1,k]=0 then Xetbot(i,j+1,k);
 If dd[i-1,j,k]=0 then Xetbot(i-1,j,k);
 If dd[i+1,j,k]=0then Xetbot(i+1,j,k);
 If dd[i,j,k-1]=0 then Xetbot(i,j,k-1);
 If dd[i,j,k+1]=0 then Xetbot(i,j,k+1);
End;

Procedure Xethangcotsau(ii: integer);
Var i,j,k: integer;
Begin
 i:=qi[ii]; j:=qj[ii]; k:=qk[ii];
 Inc(hang[i]); If hang[i]=1 then Dec(hangthieu);
 Inc(cot[j]);  If cot[j]=1  then Dec(cotthieu);
 Inc(sau[k]);  If sau[k]=1  then Dec(sauthieu);
End;

Procedure Xetlaihangcotsau(ii: integer);
Var i,j,k: integer;
Begin
 i:=qi[ii]; j:=qj[ii]; k:=qk[ii];
 If hang[i]=1 then Inc(hangthieu); Dec(hang[i]);
 If cot[j]=1  then Inc(cotthieu);  Dec(cot[j]);
 If sau[k]=1  then Inc(sauthieu);  Dec(sau[k]);
End;

Procedure Duyet(i: integer; last: integer);
Var ii: integer;
Begin
 If t1-t2>=maxtime then
 begin
   Close(f);
   Ghicuoi;
   Halt;
 end;
 If i>n then
 begin
   thughinhancauhinh;
   exit;
 end;
 For ii:=last+1 to sl do
 begin
   themdiem(ii);
   xethangcotsau(ii);
   If hangthieu+cotthieu+sauthieu<=n-i then duyet(i+1,ii);
   xetlaihangcotsau(ii);
   bodiem(ii);
 end;
End;

Procedure Duyetcauhinh(i,j,k: integer);
Var jj,kk: integer;
Begin
 sh:=i; sc:=j; ss:=k;
 FillChar(hang,SizeOf(hang),0);
 FillChar(cot,SizeOf(cot),0);
 FillChar(sau,SizeOf(sau),0);
 hangthieu:=sh; cotthieu:=sc; sauthieu:=ss;
 taobien(i,j,k);
 For jj:=1 to j do
   For kk:=1 to k do
   begin
     sl:=1;
     qi[1]:=1; qj[1]:=jj; qk[1]:=kk;
     duyet(1,0);
     dd[1,jj,kk]:=2;
   end;
End;

Procedure Duyethinhbao;
Var i,j,k: integer;
Begin
 For i:=1 to n do
   For j:=1 to i do
     For k:=1 to j do
       If (i+j+k-2<=n)and(i*j*k>=n) then duyetcauhinh(i,j,k);
End;

BEGIN
 t2:=t1;
 ClrScr;
 Assign(f,fg); Rewrite(f);
 Writeln(f,'             ');
 Nhap;
 Chuanbi;
 Duyethinhbao;
 Close(f);
 Ghicuoi;
END.