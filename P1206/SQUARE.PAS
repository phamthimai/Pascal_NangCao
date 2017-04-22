{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Bai201;
Uses  Crt;
Const Max=9;
      Fi='P1206\Hvuong.Inp';
      Fo='Hvuong.Out';
Var   H,V      : Array [1..100] of byte;
      Troh,TroV: Array [0..max] of byte;
      Dem      : Array [1..max] of byte;
      f,f1     : Text;
      Test     : longint;
      dh,dv    : byte;
      N,M      : Byte;

Procedure Chuanbi;
Var i: byte;
Begin
 Fillchar(Dem,sizeof(dem),0);
 Fillchar(Troh,sizeof(Troh),0);
 Fillchar(TroV,sizeof(TroV),0);
 Fillchar(h,sizeof(h),0);
 Fillchar(v,sizeof(v),0);
 dh:=0; dv:=0;
End;

Procedure Nhap;
Var i,x,y,bh,bv: byte; C: char;
Begin
 bh:=0; bv:=0;
 Readln(F,n);
 Readln(F,M);
 For i:=1 to m do
 begin
   Readln(F,c,x,y);
   If c='H' then
   begin
     If x>bh then
     begin
       bh:=x;
       TroH[bh]:=Troh[bh-1];
     end;
     inc(dh);
     inc( troh[bh] );
     h[dh]:=y;
   end;
   If c='V' then
   begin
     If x>bv then
     begin
       bv:=x;
       Trov[bv]:=Trov[bv-1];
     end;
     inc(dv);
     inc( trov[bv] );
     v[dv]:=y;
   end;
 end;
End;

Function KhongcoH(X,k: byte): boolean;
Var i: byte;
Begin
 KhongcoH:=False;
 For i:=troH[x-1]+1 to troH[x] do If H[i]=k then exit;
 KhongcoH:=True;
End;

Function khongcoV(X,k: byte): boolean;
Var i: byte;
Begin
 KhongcoV:=False;
 For i:=troV[x-1]+1 to troV[x] do If V[i]=k then exit;
 KhongcoV:=True;
End;

Function OK(i,j,x: byte): boolean;
Var k: byte;
Begin
 Ok:=False;
 If i+x>n then exit;
 If j+x>n then exit;
 For k:=j to j+x-1 do
   If khongcoH(i,k) then exit;
 For k:=i to i+x-1 do
   If khongcoV(j,k) then exit;
 For k:=j to j+x-1 do
   If khongcoH(i+x,k) then exit;
 For k:=i to i+x-1 do
   If khongcoV(j+x,k) then exit;
 OK:=true;
End;

Procedure Tinh(x: byte);
Var i,j: byte;
Begin
 For i:=1 to N-1 do
   For j:=1 to N-1 do
     If ok(i,j,x) then inc(dem[x]);
End;

Procedure Xuly;
Var i: byte;
Begin
 For i:=1 to N do Tinh(i);
End;

Procedure Ketqua;
Var i: byte; o: boolean;
Begin
 Writeln(F1,'Problem #,',test);
 o:=False;
 For i:=1 to N do If Dem[i]<>0 then
 begin
   o:=true;
   Writeln(F1,dem[i],' Square (s) of size ',i);
 end;
 If not o then Writeln(F1,'No completed square can be found');
End;

BEGIN
 Clrscr;
 Test:=0;
 Assign(f,Fi);  Reset(f);
 Assign(f1,Fo); Rewrite(f1);
 While not Eof(f) do
 begin
   inc(test);
   Chuanbi;
   Nhap;
   Xuly;
   Ketqua;
 end;
 Close(f1); Close(f);
END.
4
16
H 1 1
H 1 3
H 2 1
H 2 2
H 2 3
H 3 2
H 4 2
H 4 3
V 1 1
V 2 1
V 2 2
V 2 3
V 3 2
V 4 1
V 4 2
V 4 3
2
3
H 1 1
H 2 1
V 1 2
