Program P110416;   {Tim duong di cua con ma tren ban co}
Uses  Crt;
Const MN=64;
      gn='P1104\P110416.OUT';
      h: array [1..8,1..2] of integer =
      ((-2,-1),(-2,1),(-1,-2),(-1,2),(1,-2),(1,2),(2,-1),(2,1));
Type  mang1=array [1..MN] of byte;
Var   ng,kt,st: mang1;
      sst,s,t: integer;
      g: text;

Procedure Nhap;
Begin
  Write('s = '); Readln(s);
  Write('t = '); Readln(t);
end;

Procedure Init;
Begin
 FillChar(kt,SizeOf(kt),0);
 sst:=1; st[1]:=s; kt[s]:=65;
End;

Procedure Loang(d: integer);
Var x,y,i: integer;
Begin
 y:=d mod 8; x:=d div 8;
 If y=0 then y:=8 Else Inc(x);
 For i:=1 to 8 do
   If (x+h[i,1]>0)and(x+h[i,1]<=8) then
     If (y+h[i,2]>0)and(y+h[i,2]<=8) then
       If kt[(x+h[i,1]-1)*8+y+h[i,2]]=0 then
       begin
         Inc(sst); st[sst]:=(x+h[i,1]-1)*8+y+h[i,2];
         kt[(x+h[i,1]-1)*8+y+h[i,2]]:=(x-1)*8+y;
       end;
End;

Procedure Xuly;
Var d: integer;
Begin
 d:=1;
 While (d<=sst)and(kt[t]=0) do
 begin
   Loang(st[d]); Inc(d);
 end;
End;

Procedure Viet;
Var d,i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 If kt[t]=0 then Write(g,'Vo nghiem')
 Else
 begin
   d:=1; ng[d]:=t;
   While kt[ng[d]]<>65 do
   begin
     Inc(d); ng[d]:=kt[ng[d-1]];
   end;
   For i:=d downto 1 do Write(g,ng[i],' ');
 end;
 Close(g);
End;

BEGIN
 Clrscr;
 Nhap;
 Init;
 Xuly;
 Viet;
END.