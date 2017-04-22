Program P121216;    {Day diem gan nhau}
Uses  Crt;
Const fn  = 'P1212\GANNHAU.INP';
      fg  = 'GANNHAU.OUT';
      max = 10;
Var   n   : integer;
      x,y : array[1..max] of real;
      tap : array[1..max] of integer;
      chon: array[1..max] of byte;

Procedure Nhap;
Var f: text; i: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,x[i],y[i]);
 Close(f);
End;

Procedure Chuanbi;
Begin
 FillChar(chon,SizeOf(chon),0);
End;

Procedure Ghinhan;
Var f: text; i: integer;
Begin
 Assign(f,fg); Rewrite(f);
 Writeln(f,'CO CACH');
 For i:=1 to n do Write( f,tap[i],' ');
 Close(f);
End;

Function bpkc(i,j: integer): real;
Begin
 bpkc:=sqr(x[i]-x[j])+sqr(y[i]-y[j]);
End;

Procedure Duyetdiem(i: integer; last: integer);
Var ii: integer;
Begin
 If i>n then
 begin
   ghinhan;
   halt
 end;
 For ii:=1 to n do
   If chon[ii]=0 then
     If bpkc(last,ii)<=1 then
     begin
       tap[i]:=ii;
       chon[ii]:=1;
       duyetdiem(i+1,ii);
       chon[ii]:=0;
     end;
End;

Procedure Duyet;
Var i: integer;
Begin
 For i:=1 to n-1 do
 begin
   chon[i]:=1;
   tap[1]:=i;
   duyetdiem(2,i);
   chon[i]:=0;
 end;
End;

Procedure Vonghiem;
Var f: text; i: integer;
Begin
 Assign(f,fg); Rewrite(f);
 Writeln(f,'VO NGHIEM');
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Duyet;
 Vonghiem;
END.