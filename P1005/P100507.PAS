Program P100507;  {Chia n so thanh 4 nhom}
Uses  Crt;
Const nmax=100;
      inp='b8.inp';
      out='b8.out';
Var   f: text;
      n: byte;
      top,vt: integer;
      le,chan: array[1..nmax] of byte;
      d,pre: array[0..10000] of byte;

Procedure Xu_ly_chan;
Var i: byte; j,t: integer;
Begin
 FillChar(d,Sizeof(d),0);
 d[0]:=1; pre[0]:=0;
 top:=0;
 For i:=1 to n do
   If i mod 2=0 then
   begin
     For j:=top downto 0 do
       If (d[j]=1)and(d[j+i]=0) then
       begin
         d[j+i]:=1;
         pre[j+i]:=i;
       end;
     top:=top+i;
   end;
 vt:=top div 2;
 If (d[vt]=0)or(top mod 2=1) then
   begin
     Writeln('Khong co cach chia.');
     Readln;
     Halt;
   end
 Else
   begin
     Fillchar(chan,Sizeof(chan),0);
     t:=vt;
     While t>0 do
     begin
       chan[pre[t]]:=1;
       t:=t-pre[t];
     end;
   end;
End;

Procedure Xu_ly_le;
Var i: byte; j,t: integer;
Begin
 FillChar(d,Sizeof(d),0);
 d[0]:=1; pre[0]:=0;
 top:=0;
 For i:=1 to n do
   If i mod 2=1 then
   begin
     For j:=top downto 0 do
       If (d[j]=1)and(d[j+i]=0) then
       begin
         d[j+i]:=1;
         pre[j+i]:=i;
       end;
     top:=top+i;
   end;
 vt:=top div 2;
 If (d[vt]=0)or(top mod 2=1) then
   begin
     Writeln('Khong co cach chia.');
     Readln;
     Halt;
   end
 Else
   begin
     FillChar(le,Sizeof(le),0);
     t:=vt;
     While t>0 do
     begin
       le[pre[t]]:=1;
       t:=t-pre[t];
     end;
   end;
End;

Procedure Inkq;
Var i: byte;
Begin
 Writeln('Cac so thuoc Dong:');
 For i:=1 to n do
   If (i mod 2=1)and(le[i]=0) then Write(i,' ');
 Writeln;
 Writeln('Cac so thuoc Tay:');
 For i:=1 to n do
   If (i mod 2=1)and(le[i]=1) then Write(i,' ');
 Writeln;
 Writeln('Cac so thuoc Nam:');
 For i:=1 to n do
   If (i mod 2=0)and(chan[i]=0) then Write(i,' ');
 Writeln;
 Writeln('Cac so thuoc Bac:');
 For i:=1 to n do
   If (i mod 2=0)and(chan[i]=1) then Write(i,' ');
 Readln;
End;

BEGIN
 Clrscr;
 Write('Nhap so N <= 100: '); Readln(n);
 Xu_ly_chan;
 Xu_ly_le;
 Inkq;
END.