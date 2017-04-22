Program P121510;
Uses  Crt;
Const Nmax = 20;
      Kmax = 400;
      inp  = 'input.txt';
      out1 = 'outputB.txt';
      out2 = 'outputC1.txt';
Type  mang1= array [1..Nmax] of integer;
      mang2= array [1..Nmax] of mang1;
      mang3= array [1..Kmax] of integer;
Var   a:mang2;
      cx,cy: mang3;
      tx,ty: mang3;
      m,n: integer;
      kc: mang3;
      {Kc[i]=Khoang cach cua con chuot gan nhat doi voi con chuot I}
      look: mang3;
      x,y: mang3; {Toa do cac con chuot}
      k: integer; {So chuot}
      okA: boolean;
      found: boolean;
      u,z: integer;

Procedure readfile;
Var f: text; i,j: integer;
Begin
 k:=0;
 Assign(f,inp); Reset(f);
 Readln(f,m,n);
 For i:=1 to n do
   For j:=1 to n do
   begin
     Read(f,a[i,j]);
     If a[i,j]=1 then
     begin
       Inc(k);
       x[k]:=i; y[k]:=j;
     end;
   end;
 Close(f);
End;

Function distance(i,j: integer): integer; {Kc giua hai chuot i,j}
Begin
 distance:=sqr(x[i]-x[j])+sqr(y[i]-y[j]);
End;

Procedure init;
Var min,i,j: integer;
Begin
 For i:=1 to k do
 begin
   min:=maxint;
   For j:=1 to k do
     If (i<>j)and(min>distance(i,j)) then
     begin
       min:=distance(i,j);
       look[i]:=j;
     end;
   kc[i]:=min;
 end;
End;

Function CauA: boolean;
Var f: text; d,i,j: integer; DonDoc: mang3;
Begin
 Fillchar(dondoc,sizeof(dondoc),0);
 CauA:=false;
 For i:=1 to k do
 begin
   d:=0;
   For j:=1 to k do
     If distance(i,j)=kc[i] then
     begin
       Inc(d);
       dondoc[j]:=1;
     end;
   If d>1 then exit;
 end;
 d:=0;
 For i:=1 to k do
   If dondoc[i]=0 then Inc(d);
 Assign(f,out1); Rewrite(f);
 Writeln(f,d);
 For i:=1 to k do
 If dondoc[i]=0 then Writeln(f,x[i],' ',y[i]);
 Close(f);
 CauA:=true;
End;

Procedure try(i: integer);
Var j: integer;
Begin
 For j:=1 to k do
   If not found then
     If (cx[i]<>j)and (distance(i,j)=kc[i])and(ty[j]=0) then
     begin
       ty[j]:=i;
       If cy[j]=0 then begin found:=true; z:=j; end
       Else try(cy[j]);
     end;
End;

Procedure tang;
Var i,j: integer;
Begin
 j:=z;
 Repeat
   i:=ty[j];
   z:=cx[i];
   cx[i]:=j;
   cy[j]:=i;
   j:=z;
 Until i=u;
End;

Procedure timduongtang;
Begin
 found:=false;
 For u:=1 to k do
   If cx[u]=0 then
   begin
     Fillchar(ty,sizeof(ty),0);
     try(u);
     If found then exit;
   end;
End;

Procedure cauB;
Var f: text; i,j: integer;
Begin
 Fillchar(cx,sizeoF(cx),0);
 Fillchar(cy,sizeoF(cy),0);
 For i:=1 to k do
   For j:=1 to k do
     If (cy[j]=0)and(distance(i,j)=kc[i]) then
     begin
       cx[i]:=j; cy[j]:=i;
       break;
     end;
 Repeat
   timduongtang;
   If found then tang;
 Until not found;
 Assign(f,out2); Rewrite(f);
 For i:=1 to k do
 begin
   If cx[i]>0 then j:=cx[i] Else j:=look[i];
   Writeln(f,x[i],',',y[i],'-->',x[j],',',y[j]);
 end;
 Close(f);
End;

Procedure solve;
Begin
 If not CauA then CauB;
End;

BEGIN
 Readfile;
 Init;
 Solve;
END.