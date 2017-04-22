Program P110415;   {Tim duong di tu dinh S den dinh T}
Uses  Crt;
Const MN=100;
      fn='P1104\p110415.inp';
      gn='P1104\p110415.out';
Type  mang2=array [1..MN,1..MN] of byte;
      mang1=array [1..MN] of byte;
Var   a: mang2;
      st,kt,tu,duong: mang1;
      n,s,t,sst,sd: integer;
      f,g: text;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do
   For j:=1 to n do Read(f,a[i,j]);
 Close(f);
 Write('s = '); Readln(s);
 Write('t = '); Readln(t);
End;

Procedure Init;
Begin
 FillChar(kt,Sizeof(kt),0);
 FillChar(tu,Sizeof(tu),0);
 sst:=1; st[sst]:=s; kt[s]:=1;
End;

Procedure Timduong;
Var i: integer;
Begin
 sd:=1; duong[1]:=t;
 While tu[duong[sd]]<>0 do
 begin
   Inc(sd); duong[sd]:=tu[duong[sd-1]];
 end;
 For i:=sd downto 1 do Write(g,duong[i],' ');
 Readln;
End;

Procedure Viet;
Var d,i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 Writeln(g,'Buoc 1');
 Writeln(g,'khoi tao Queue');
 Writeln(g,'{',s,'}');
 Writeln(g);
 d:=0;
 While (d<sst)and(tu[t]=0) do
 begin
   Inc(d); s:=st[d];                {t[d]}
   Writeln(g,'Buoc ',d+1);
   Writeln(g,'Xet dinh ',s);
   For i:=1 to n do
     If (a[s,i]=1)and(kt[i]=0) then
     begin
       Inc(sst); st[sst]:=i; kt[i]:=1; tu[i]:=s;
     end;
   Write(g,'{ ');
   For i:=1 to d do Write(g,st[i]:4); Write(g,' | ');
   For i:=d+1 to sst do Write(g,st[i]:4); Writeln(g,'}');
   Write(g,'{ ');
   For i:=1 to d do If tu[st[i]]<>0 then Write(g,tu[st[i]]:4)
                    Else Write(g,'    ');
   Write(g,' | ');
   For i:=d+1 to sst do If tu[st[i]]<>0 then Write(g,tu[st[i]]:4)
                        Else Write(g,'    ');
   Writeln(g,'}'); Writeln(g);
 End;
 If tu[t]=0 then Write(g,' Vo nghiem ')
 Else  Timduong;
 Readln;
 Close(g);
End;

BEGIN
 Clrscr;
 Nhap;
 Init;
 Viet;
END.