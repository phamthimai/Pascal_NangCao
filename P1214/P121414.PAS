Program P121414;    {Tro choi hai dong soi}
Uses  Crt;
Const fn = 'P12\Loigiai\P1214\BOCSOI.INP'; { So soi nhieu nhat : 5000 vien }
      fg = 'P12\Loigiai\P1214\BOCSOI.OUT';
      max = 10000;
Var   s1,s2: integer;
      ddlen,ddcheo: array [-1..max] of byte;
      luu: array [0..max] of integer;
      socan: integer;
      maxcheo: integer;
      ketthuc: boolean;

Procedure Nhap;
Begin
 Write('So soi o dong thu 1: '); Readln(s1);
 Write('So soi o dong thu 2: '); Readln(s2);
End;

Procedure Chuanbi;
Var i: integer;
Begin
 FillChar(ddlen,SizeOf(ddlen),0);
 FillChar(ddcheo,SizeOf(ddcheo),0);
 socan:=s1;
 If socan<s2 then socan:=s2;
 For i:=1 to socan do luu[i]:=max+1;
 maxcheo :=0;
End;

Function khongdau: integer;
Var ii: integer;
Begin
 ii:=0;
 While (ddlen[ii]<>0)or(ddcheo[ii]<>0) do Inc(ii);
 khongdau:=ii;
End;

Procedure Tinhgiatriluu(i: integer);
Var ii: integer;
Begin
 ii:=khongdau;
 luu[i]:=ii;
 ddlen[ii]:=1;
 ddcheo[ii]:=1;
 If maxcheo<ii then maxcheo:=ii;
End;

Procedure Tangdanhdau;
Var i: integer;
Begin
 Inc(maxcheo);
 For i:=maxcheo downto 0 do
 ddcheo[i]:=ddcheo[i-1];
End;

Procedure Danhdau;
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
 Writeln('Boc ',giam ,' vien tu dong thu ',dong );
 If dong=1 then Dec(s1,giam) Else Dec(s2,giam);
End;

Procedure Didai;
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
   If ii-luu[ii]=s1-s2 then
   begin
     boc(1,s1-ii); boc(2,s2-luu[ii]);
   end;
End;

Procedure Kiemtra;
Begin
 ketthuc:=(s1=0)and(s2=0);
End;

Procedure Maychoi;
Begin
 If s1=luu[s2] then didai Else ditoiuu;
End;

Procedure Nguoiboc1dong;
Var dong,soi: integer;
Begin
 Write('Ban boc dong nao ???[1/2] '); Readln(dong);
 Write('Ban boc may vien ??? '); Readln(soi);
 If dong=1 then Dec(s1,soi) Else Dec(s2,soi);
End;

Procedure Nguoiboc2dong;
Var soi: integer;
Begin
 Write('Ban boc may vien ???'); Readln(soi);
 Dec(s1,soi); Dec(s2,soi);
End;

Procedure Nguoichoi;
Var sl: integer;
Begin
 Write('Ban boc 1 dong hay 2 ???[1/2] ' ); Readln(sl);
 If sl=1 then nguoiboc1dong Else nguoiboc2dong;
End;

Procedure Hienthi;
Begin
 Writeln('So soi hien tai : (1) : ',s1,'    (2) : ',s2);
End;

Procedure choi;
Begin
 Repeat
   Nguoichoi;
   Kiemtra;
   Hienthi;
   If Ketthuc then exit;
   Maychoi;
   Kiemtra;
   Hienthi;
 Until Ketthuc;
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Danhdau;
 Choi;
 Readln;
END.