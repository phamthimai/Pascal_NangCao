Program P121410;    {Phan hoach}
Uses  Crt;
Const fn  = 'P12\Loigiai\P1214\PHOACH.INP';
      fg  = 'P12\Loigiai\P1214\PHUHINH.OUT';
      max = 100;
      maxhinh = 200;
Var   n: integer;
      a: array [0..max+1,0..max+1] of integer;
      dau,cuoi,x1,y1,x2,y2: array [1..maxhinh] of integer;
      ptdau,co: integer;
      dauc,cuoic: integer;
      sh: integer;
      truoc,best: array [0..max+1] of integer;
      klthuong,kldon: integer;
      sthuong,sdon: integer;
      kltapthuong,tapthuong,kltapdon,tapdon: array [1..max] of integer;
      ten: array [1..maxhinh] of integer;

Procedure Nhap;
Var f: text; i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n,ptdau);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Chuanbi;
Begin
 sh:=0;
 kldon:=max+1;
 klthuong:=max+1;
End;

Procedure Xoahinh(k: integer);
Var ii,jj: integer;
Begin
 For ii:=y1[k] to y2[k] do
   For jj:=x1[k] to x2[k] do a[ii,jj]:=0;
End;

Procedure Laythongtinhinh;
Var ii,jj: integer; i,j: integer;
Begin
 For i:=1 to n do
   For j:=1 to n do
     If a[i,j]<>0 then
     begin
       Inc( sh);
       ten[sh]:=a[i,j];
       If a[i,j]=ptdau then co:=sh;
       ii:=1; jj:=1;
       While a[i+ii-1,j]=a[i,j] do Inc(ii);
       While a[i,j+jj-1]=a[i,j] do Inc(jj);
       Dec(ii); Dec(jj);
       x1[sh]:=j; y1[sh]:=i;
       x2[sh]:=j+jj-1; y2[sh]:=i+ii-1;
       xoahinh(sh);
     end;
End;

Procedure Taodaungang;
Var i: integer;
Begin
 For i:=1 to sh do
 begin
   dau[i]:=x1[i]; cuoi[i]:=x2[i];
 end;
 dauc:=x1[co]; cuoic:=x2[co];
End;

Procedure Taodaudoc;
Var i: integer;
Begin
 For i:=1 to sh do
 begin
   dau[i]:=y1[i]; cuoi[i]:=y2[i];
 end;
 dauc:=y1[co]; cuoic:=y2[co];
End;

Procedure Quyhoachdondau(i: integer);
Var ii,j: integer;
Begin
 For ii:=1 to sh do
   If cuoi[ii]=i then
   begin
     j:=dau[ii]-1;
     If best[i]>best[j]+1 then
     begin
       best[i]:=best[j]+1;
       truoc[i]:=ii;
     end;
   end;
End;

Procedure Quyhoachdoncuoi(i: integer);
Var ii,j: integer;
Begin
 For ii:=1 to sh do
   If dau[ii]=i then
   begin
     j:=cuoi[ii]+1;
     If best[i]>best[j]+1 then
     begin
       best[i]:=best[j]+1;
       truoc[i]:=ii;
     end;
   end;
End;

Procedure Landondau(i: integer);
Var ii: integer;
Begin
 While Truoc[i]<>0 do
 begin
   ii:=truoc[i];
   Inc(sdon);
   Tapdon[sdon]:=ii;
   i:=dau[ii]-1;
 end;
End;

Procedure Landoncuoi(i: integer);
Var ii: integer;
Begin
 While truoc[i]<>0 do
 begin
   ii:=truoc[i];
   Inc(sdon);
   tapdon[sdon]:=ii;
   i:=cuoi[ii]+1;
 end;
End;

Procedure Timphudon;
Var i: integer;
Begin
 FillChar(truoc,SizeOf(truoc),0);
 FillChar(best,SizeOf(best),0);
 For i:=1 to n do best[i]:=max+1;
 For i:=1 to dauc-1 do quyhoachdondau(i);
 For i:=n downto cuoic+1  do quyhoachdoncuoi(i);
 sdon:=0;
 Landondau(dauc-1);
 Landoncuoi(cuoic+1);
End;

Procedure Quyhoachthuong(i: integer);
Var ii,jj: integer;
Begin
 For ii:=1 to sh do
   If (i>=dau[ii])and(i<=cuoi[ii]) then
     For jj:=dau[ii]-1 to i-1 do
       If best[i]>best[jj]+1 then
       begin
         best[i]:=best[jj]+1;
	 truoc[i]:=ii;
       end;
End;

Procedure Lanthuong(i: integer);
Var ii: integer;
Begin
 While truoc[i]<>0 do
 begin
   ii:=truoc[i];
   Inc(sthuong);
   Tapthuong[sthuong]:=ii;
   i:=dau[ii]-1;
 end;
End;

Procedure Timphuthuong;
Var i: integer;
Begin
 FillChar(truoc,SizeOf(truoc),0);
 Fillchar(best,SizeOf(best),0);
 For i:=1 to n do  best[i]:=max+1;
 For i:=1 to dauc-1 do quyhoachthuong(i);
 For i:=dauc to cuoic do
 begin
   best[i]:=best[dauc-1];
   truoc[i]:=truoc[dauc-1];
 end;
 For i:=cuoic+1 to n do quyhoachthuong(i);
 sthuong:=0;
 Lanthuong(n);
End;

Procedure Capnhatkl;
Begin
 If kldon>sdon then
 begin
   kldon:=sdon;
   kltapdon:=tapdon;
 end;
 If klthuong>sthuong then
 begin
   klthuong:=sthuong;
   kltapthuong:=tapthuong;
 end;
End;

Procedure Ghinhan;
Var f: text; i,j: integer;
Begin
 Assign(f,fg); Rewrite(f);
 Writeln(f,'So phan tu cua phu don nho nhat: ',kldon+1);
 For i:=1 to kldon do
 begin
   j:=kltapdon[i];
   Write(f,ten[j],' ');
 end;
 Writeln(f,ten[co]);
 Writeln(f,'So phan tu cua phu thuong nho nhat: ',klthuong+1);
 For i:=1 to klthuong do
 begin
  j:=kltapthuong[i];
  Write(f,ten[j],' ');
 end;
 Writeln(f,ten[co]);
 Close(f);
End;

Begin
 Clrscr;
 Nhap;
 Chuanbi;
 Laythongtinhinh;
 Taodaungang;
 Timphudon;
 Timphuthuong;
 Capnhatkl;
 Taodaudoc;
 Timphudon;
 Timphuthuong;
 Capnhatkl;
 Ghinhan;
End.