Program P121212;   {sai}
{Xep hinh vuong con vao hinh vuong to}
Uses  Crt;
Const fn  = 'P1212\XEPVUONG.INP';
      fg  = 'XEPVUONG.OUT';
      max = 10;
      maxc= 100;
Type  cap = record
              i,j: integer;
            end;
Var   n,k     : integer;
      a       : array [1..max+1] of integer;
      ddmax,dd: array [0..maxc+1,0..maxc+1] of byte;
      moc     : array [0..maxc+1,0..maxc+1] of byte;
      tong    : integer;
      thuamax : integer;
      chon    : array [1..max+1] of byte;
      cohinh  : boolean;
      slduoc  : integer;
      tapmoc  : array [1..maxc] of cap;
      slmoc   : integer;

Procedure Nhap;
Var f: text; i: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n,k);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Chuanbi;
Var i,j: integer;
Begin
 FillChar(dd,SizeOf(dd),1);
 FillChar(chon,SizeOf(chon),0);
 FillChar(moc,SizeOf(moc),0);
 For i:=1 to k do
   For j:=1 to k do dd[i,j]:=0;
 tong:=0;
 For i:=1 to n do Inc(tong,a[i]*a[i]);
 thuamax:=trunc(sqrt(k*k-tong));
 moc[1,1]:=1;
 slduoc:=0; slmoc:=1;
 tapmoc[1].i:=1; tapmoc[1].j:=1;
End;

Function vua(k,i,j: integer): boolean;
Var ii,jj: integer;
Begin
 vua:=false;
 For ii:=1 to a[k] do
   For jj:=1 to a[k] do
     If dd[i+ii-1,j+jj-1]<>0 then exit;
 vua:=true;
End;

Procedure Datmocngangduoi(k,i,j: integer);
Var ii,jj: integer;
Begin
 jj:=j+a[k]-1; ii:=i+a[k];
 If dd[ii,jj]=0 then
 begin
   While dd[ii,jj-1]=0 do dec(jj);
   Inc( moc[ii,jj]);
   If moc[ii,jj]=1 then
   begin
     Inc(slmoc);
     tapmoc[slmoc].i:=ii; tapmoc[slmoc].j:=jj;
   end;
 end;
End;

Procedure Datmocdocphai(k,i,j: integer);
Var ii,jj: integer;
Begin
 jj:=j+a[k]; ii:=i+a[k]-1;
 If dd[ii,jj]=0 then
 begin
   While dd[ii-1,jj]=0 do Dec(ii);
   Inc(moc[ii,jj]);
   If moc[ii,jj]=1 then
   begin
     Inc(slmoc);
     tapmoc[slmoc].i:=ii; tapmoc[slmoc].j:=jj;
   end;
 end;
End;

Procedure Bomocngangduoi(k,i,j: integer);
Var ii,jj: integer;
Begin
 jj:=j+a[k]-1; ii:=i+a[k];
 If dd[ii,jj]=0 then
 begin
   While dd[ii,jj-1]=0 do dec(jj);
   If moc[ii,jj]=1 then Dec(slmoc);
   Dec(moc[ii,jj]);
 end;
End;

Procedure bomocdocphai(k,i,j: integer);
Var ii,jj: integer;
Begin
 jj:=j+a[k]; ii:=i+a[k]-1;
 If dd[ii,jj]=0 then
 begin
   While dd[ii-1,jj]=0 do Dec(ii);
   If moc[ii,jj]=1 then Dec(slmoc);
   Dec(moc[ii,jj]);
 end;
End;

Procedure Dat(k,i,j:integer);
Var ii,jj: integer;
Begin
 For ii:=1 to a[k] do
   For jj:=1 to a[k] do dd[i+ii-1,j+jj-1]:=k;
 datmocngangduoi(k,i,j);
 datmocdocphai(k,i,j);
End;

Procedure Bo(k,i,j: integer);
Var ii,jj: integer;
Begin
 Bomocngangduoi(k,i,j);
 Bomocdocphai(k,i,j);
 For ii:=1 to a[k] do
   For jj:=1 to a[k] do dd[i+ii-1,j+jj-1]	:=0;
End;

Procedure Duyet(last: integer); forward;
Procedure Datthuhinh(k,i,j: integer);
Var ii: integer;
Begin
 For ii:=1 to n do
   If chon[ii]=0 then
     If vua(ii,i,j) then
     begin
       dat(ii,i,j);
       chon[ii]:=1;
       Inc( slduoc);
       duyet(k);
       Dec(slduoc);
       chon[ii]:=0;
       bo(ii,i,j);
       If cohinh then exit;
     end;
End;

Procedure Ghinhanhinhmoi;
Begin
 ddmax:=dd;
End;

Procedure Duyet(last: integer);
Var i: integer;
Begin
 If slduoc>=n then
 begin
   Ghinhanhinhmoi;
   cohinh:=true;
   exit;
 end;
 For i:=last+1 to slmoc do Datthuhinh(i,tapmoc[i].i,tapmoc[i].j);
End;

Function Thoamancanh(m: integer): boolean;
Begin
 cohinh:=false;
 Inc(n);
 a[n]:=m;
 duyet(0);
 Dec(n);
 Thoamancanh:=cohinh;
End;

Procedure Duyetnhiphan;
Var d,c: integer; m: integer;
Begin
 d:=0;
 c:=thuamax;
 While d<=c do
 begin
   m:=(d+c) div 2;
   If Thoamancanh(m) then
   begin
     Writeln('Best now : ',m);
     d:=m+1
   end
   Else c:=m-1;
 end;
End;

Procedure Ghinhan;
Var i,j: integer; f: text;
Begin
 Assign(f,fg); Rewrite(f);
 For i:=1 to k do
 begin
   For j:=1 to k do Write( f,ddmax[i,j] mod (n+1):4); Writeln(f);
 end;
 Close(f);
End;

BEGIN
 ClrScr;
 Nhap;
 Chuanbi;
 Duyetnhiphan;
 Ghinhan;
END.