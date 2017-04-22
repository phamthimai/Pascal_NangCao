Program P121415; {Bai toan hai dong soi tong quat}
Uses  Crt;
Const fn = 'P12\Loigiai\P1214\BOCSOI.INP';
      fg = 'P12\Loigiai\P1214\BOCSOI.OUT';
      max = 10000;  { So soi nhieu nhat : 1000 vien }
      maxc = 100;
Var   c: integer;
      s1,s2: integer;
      ddlen,ddcheo: array [-maxc-1..max] of byte;
      luu    : array [0..max] of integer;
      socan  : integer;
      maxcheo: integer;
      ketthuc: boolean;

Procedure Nhap;
Begin
 Write('So soi o dong thu 1: '); Readln(s1);
 Write('So soi o dong thu 2: '); Readln(s2);
 Write('Hang so gioi han ³k - l³: '); Readln(c);
End;

Procedure Chuanbi;
Var i: integer;
Begin
 FillChar(ddlen,SizeOf(ddlen),0);
 FillChar(ddcheo,SizeOf(ddcheo),0);
 socan:=s1;
 If socan<s2 then socan:=s2;
 For i:=1 to socan do luu[i]:=max+1;
 maxcheo:=0;
End;

Function khongdau: integer;
Var ii: integer;
Begin
 ii:=0;
 While (ddlen[ii]<>0)or(ddcheo[ii]<>0) do Inc(ii);
 khongdau:=ii;
End;

Procedure Tinhgiatriluu(i: integer);
Var ii,jj: integer;
Begin
 ii:=khongdau;
 luu[i]:=ii;
 ddlen[ii]:=1;
 For jj:=-c to c do ddcheo[ii+jj]:=1;
 If maxcheo<ii+c then maxcheo:=ii+c;
End;

Procedure Tangdanhdau;
Var i: integer;
Begin
 Inc(maxcheo);
 For i:=maxcheo downto -c do ddcheo[i]:=ddcheo[i-1];
End;

Procedure danhdau;
Var i: integer;
Begin
 For i:=0 to socan do
 begin
   Tinhgiatriluu(i);
   Tangdanhdau;
 end;
End;

Procedure boc(dong,giam: integer);
Begin
 Writeln('Boc ',giam,' vien tu dong thu ',dong);
 If dong=1 then Dec(s1,giam) Else Dec(s2,giam);
End;

Procedure didai;
Begin
 If s1<s2 then boc(2,1) Else boc(1,1);
End;

Procedure Ditoiuu;
Var ii: integer;
Begin
 If s1>luu[s2] then
 begin
   boc(1,s1-luu[s2]);
   exit;
 end;
 If s2>luu[s1] then
 begin
   boc(2,s2-luu[s1]);
   exit;
 end;
 For ii:=s1-1 downto 0 do
   If (abs((s1-ii)-(s2-luu[ii]))<=c)and(s2>=luu[ii]) then
   begin
     boc(1,s1-ii); boc(2,s2-luu[ii]);
   end;
End;

Procedure Kiemtra;
Begin
 Ketthuc:=(s1=0)and(s2=0);
End;

Procedure Maychoi;
Begin
 If s1=luu[s2] then didai Else ditoiuu;
End;

Procedure Nguoiboc1dong;
Var dong,soi: integer; ok: boolean;
Begin
 Repeat
   Write('Ban boc dong nao ???[1/2] '); Readln(dong);
   Write('Ban boc may vien ??? '); Readln(soi);
   ok:=false;
   If dong=1 then
     If s1<soi then ok:=true Else Dec(s1,soi)
   Else
     If s2<soi then ok:=true Else Dec(s2,soi);
   If ok then writeln('Boc lai ... ');
 Until not ok;
End;

Procedure Nguoiboc2dong;
Var soi: integer;
Begin
 Write('Ban boc may vien o dong 1 ??? '); Readln(soi);
 Dec(s1,soi);
 Write('Ban boc may vien o dong 2 ??? '); Readln(soi);
 Dec(s2,soi);
End;

Procedure Nguoichoi;
Var sl: integer;
Begin
 Write('Ban boc 1 dong hay 2 ???[1/2] '); Readln(sl);
 If sl=1 then nguoiboc1dong Else nguoiboc2dong;
End;

Procedure hienthi;
Begin
 Writeln('So soi hien tai: (1): ',s1,'    (2): ',s2);
End;

Procedure Choi;
Begin
 Repeat
   nguoichoi;
   kiemtra;
   hienthi;
   If ketthuc then exit;
   maychoi;
   kiemtra;
   hienthi;
 Until ketthuc;
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Danhdau;
 Choi;
 Readln;
END.