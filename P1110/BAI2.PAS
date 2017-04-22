{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 64000,0,655360}
program bai2;
uses crt;
const
  fo            = 'bai2.out';
  hi            : array[1..4] of shortint=(-1,0,0,1);
  hj            : array[1..4] of shortint=(0,-1,1,0);
type
  mang          = array[0..51,0..51] of byte;
var
  a             : mang;
  n,mm,nn,ll    : byte;
  sl            : longint;
  f             : text;
{-------------}
procedure nhapdl;
begin
  write('N = ');
  readln(n);
end;
{-------------}
procedure chuanbi;
begin
  assign(f,fo);
  rewrite(f);
  fillchar(a,sizeof(a),0);
end;
{-------------}
procedure dxd(a:mang;var b:mang);
var
  i,j           : byte;
begin
  for i:=1 to mm do
  for j:=1 to nn do
    b[i,nn-j+1]:=a[i,j];
end;
{-------------}
procedure dxn(a:mang;var b:mang);
var
  i,j           : byte;
begin
  for i:=1 to mm do
  for j:=1 to nn do
    b[mm-i+1,j]:=a[i,j];
end;
{-------------}
procedure xoay(a:mang;var b:mang);
var
  i,j           : byte;
begin
  for i:=1 to mm do
  for j:=1 to nn do
    b[j,nn-i+1]:=a[i,j];
end;
{-------------}
function sau(a,b:mang):boolean;
var
  i,j           : byte;
begin
  sau:=false;
  for i:=1 to mm do
  for j:=1 to nn do
  if a[i,j]<>b[i,j] then
  begin
    sau:=a[i,j]<b[i,j];
    exit;
  end;
end;
{-------------}
function lt(i,j:byte):byte;
var
  w,k           : byte;
begin
  w:=1;a[i,j]:=2;
  for k:=1 to 4 do
  if a[i+hi[k],j+hj[k]]=1 then inc(w,lt(i+hi[k],j+hj[k]));
  lt:=w;
end;
{-------------}
procedure ghi;
var
  i,j           : byte;
begin
  for i:=1 to mm do
  begin
    for j:=1 to nn do
    if a[i,j]=1 then write(f,' *')
    else write(f,'  ');
    writeln(f);
  end;
  writeln(f);
  inc(sl);
end;
{-------------}
procedure kiemtra;
var
  b             : array[1..7] of mang;
  ok            : boolean;
  i,j,w         : byte;
begin
  for i:=1 to mm do
  if a[i,nn]<>0 then break;
  if a[i,nn]=0 then exit;
  for i:=1 to mm do
  if a[i,1]<>0 then break;
  if a[i,1]=0 then exit;
  for i:=1 to nn do
  if (a[1,i]=1) then break;
  w:=lt(1,i);
  for i:=1 to mm do
  for j:=1 to nn do
  if a[i,j]=2 then a[i,j]:=1;
  if w<n then exit;
  fillchar(b,sizeof(b),0);
  if mm<>nn then
  begin
    dxd(a,b[1]);dxn(a,b[2]);dxd(b[2],b[3]);
    for i:=1 to 3 do
    if sau(a,b[i]) then exit;
  end
  else
  begin
    xoay(a,b[1]);xoay(b[1],b[2]);xoay(b[2],b[3]);
    dxd(a,b[4]);xoay(b[4],b[5]);xoay(b[5],b[6]);xoay(b[6],b[7]);
    for i:=1 to 7 do
    if sau(a,b[i]) then exit;
  end;
  ghi;
end;
{-------------}
procedure duyet(ii,jj,l,dem:byte);
var
  j,l1          : byte;
begin
  if l>0 then
  begin
    for j:=jj to nn-l+1 do
    begin
      a[ii,j]:=1;
      duyet(ii,j+1,l-1,dem+1);
      a[ii,j]:=0;
    end;
  end
  else
  begin
    if dem=n then kiemtra
    else
    begin
      for l1:=1 to n-dem+1-(mm-ii) do
      if ((mm-ii-1)*nn+l1>=n-dem) and (l1<=nn) then
        duyet(ii+1,1,l1,dem);
    end;
  end;
end;
{-------------}
begin
  clrscr;
  nhapdl;
  chuanbi;
  for mm:=1 to (n+1) div 2 do
  for nn:=1 to n+1-mm do
  if (mm<=nn) and (mm*nn>=n) then
  begin
    for ll:=1 to n-mm+1 do
    if ((mm-1)*nn+ll>=n) and (ll<=nn) then
      duyet(1,1,ll,0);
  end;
  write(f,sl);
  close(f);
  write('Da ghi ket qua ra file BAI2.OUT');
end.