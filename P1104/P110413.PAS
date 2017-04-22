Program P110413;  {Tim phan lien thong chua dinh S}
Uses  Crt;
Const MN=100;
      fn='P110413.INP';
      gn='P110413.OUT';
Type  mang2=array [1..MN,1..MN] of byte;
      mang1=array [1..MN] of byte;
Var   a: mang2;
      st,kt: mang1;
      n,s,sst: integer;
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
End;

Procedure Init;
Begin
 FillChar(kt,SizeOf(kt),0);
 sst:=1; st[sst]:=s; kt[s]:=1;
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
 While d<sst do
 begin
   Inc(d); s:=st[d];
   Writeln(g,'Buoc ',d+1);
   Writeln(g,'Xet dinh ',s);
   For i:=1 to n do
     If (a[s,i]=1)and(kt[i]=0) then
     begin
       Inc(sst); st[sst]:=i; kt[i]:=1;
     end;
   Write(g,'{ ');
   For i:=1 to d do Write(g,st[i],' ');
   Write(g,' | ');
   For i:=d+1 to sst do Write(g,st[i],' ');
   Writeln(g,'}'); Writeln(g);
 end;
 Close(g);
End;

BEGIN
 Clrscr;
 Nhap;
 Init;
 Viet;
END.