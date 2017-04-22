Program P110413;  {Tim duong di tu s den t}
Uses  Crt;
Const N=64;
      fn='P111505.INP';
      gn='P111505.OUT';
Type  mang2=array [1..N,1..N] of byte;
      mang1=array [0..N] of byte;
Var   a,e: mang2;
      Qu,kt,dd,ddd: mang1;
      s,ss,t,sst,xi,xj,yi,yj,k: integer;
      f,g: text;
      Co: boolean;

Procedure Nhap;
Var i,j,ds,dt,cs,ct: integer;
Begin
 Assign(f,fn); Reset(f);
 For i:=1 to 8 do
 begin
   For j:=1 to 8 do Read(f,e[i,j]); Readln(f);
 end;
 Close(f);
 Clrscr;
 For i:=1 to 8 do
 begin
   For j:=1 to 8 do
   begin
     GotoXY(2*i+20,j+4); Write(e[i,j]:2);
   end;
 end;
 GotoXY(1,1);
 Write('ds,cs = '); Readln(cs,ds);
 Write('dt,ct = '); Readln(ct,dt);
 s:=(ds-1)*8+cs; t:=(dt-1)*8+ct;
 TextColor(4);
 GotoXY(2*ds+20,cs+4); Write('*':2);
 GotoXY(2*dt+20,ct+4); Write('*':2);
 Readln;
 ss:=s;
 For i:=1 to n do
   For j:=1 to n do
   begin
     xi:=(i-1)div 8+1; yi:=(i-1)mod 8+1;
     xj:=(j-1)div 8+1; yj:=(j-1)mod 8+1;
     If((xi=xj)and(abs(yi-yj)=1)and(e[xi,yi]=0)and(e[xj,yj]=0))
     or((yi=yj)and(abs(xi-xj)=1)and(e[xi,yi]=0)and(e[xj,yj]=0))
     then a[i,j]:=1 Else a[i,j]:=0;
   end;
End;

Procedure Init;
Begin
 FillChar(kt,SizeOf(kt),0);
 FillChar(dd,SizeOf(dd),0);
 sst:=1; Qu[sst]:=s; kt[s]:=1;
End;

Procedure Tim;
Var d,i,j: integer;
Begin
 d:=0; Co:=false;
 While (d<sst)and(not Co) do
 begin
   Inc(d); s:=Qu[d];
   For i:=1 to n do
     If (a[s,i]=1)and(kt[i]=0) then
     begin
       Inc(sst); Qu[sst]:=i; kt[i]:=1;
       dd[sst]:=s;
       If (i=t) then Co:=true;
     end;
 end;
 k:=0;
 If Co then
 begin
   i:=t;
   Repeat
     j:=1; While qu[j]<>i do Inc(j);
     Inc(k); ddd[k]:=dd[j];
     i:=dd[j];
   Until i=ss;
   ddd[0]:=t;
 end
 Else Writeln('Khong co duong di.');
End;

Procedure Viet;
Var i: integer;
Begin
 TextColor(4);
 For i:=1 to k-1 do
 begin
   xi:=(ddd[i]-1)div 8+1;
   yi:=(ddd[i]-1)mod 8+1;
   GotoXY(2*xi+20,yi+4); Write('*':2);
 end;
 Readln;
End;

BEGIN
 Nhap;
 Init;
 Tim;
 Viet;
END.