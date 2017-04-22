Program P121404; {Tim thung dung ve}
Uses  Crt;
Const Out ='P121404.out';
var   F: text;
      K: longint;
      SoLuong: byte;
      Thung  : array [0..9,0..9] of byte;
      Temp   : array [1..10] of integer;

Procedure Nhap;
Begin
 Repeat
   Write('K = '); Readln(K);
   If K<2 then Writeln('Sai gia tri.');
 Until K>1;
End;

Procedure Chon(vt1,vt2: byte);
Var i,j: byte;
Begin
 For i:=vt1 to vt2 do
   For j:=vt1 to vt2 do
     If i<>j then Thung[i,j]:=1;
End;

Procedure ChonThemThung(i: byte);
Var vt1,j: integer;
Begin
 vt1:=0;
 For j:=1 to i-1 do vt1:=vt1+Temp[j];
 Chon(vt1,vt1+Temp[i]-1);
End;

Procedure ChonThung;
Var i,Nguyen,Le: byte;
Begin
 Nguyen:=10 div (k-1);
 Le:=10 mod (k-1);
 For i:=1 to k-1 do Temp[i]:=Nguyen;
 For i:=1 to Le do inc(Temp[i]);
 For i:=1 to k-1 do ChonThemThung(i);
End;

Procedure XuLy;
Var i: byte;
Begin
 Fillchar(Thung,sizeof(Thung),0);
 For i:=0 to 9 do Thung[i,i]:=1;
 If K>10 then Exit Else ChonThung;
End;

Procedure TimSoLuong;
Var i,j: byte;
Begin
 SoLuong:=0;
 For i:=0 to 9 do
   For j:=0 to 9 do
     If Thung[i,j]=1 then Inc(SoLuong);
End;

Procedure InKq;
Var i,j: byte;
Begin
 TimSoLuong;
 Assign(F,Out);
 Rewrite(F);
 Writeln(F,SoLuong);
 For i:=0 to 9 do
   For j:=0 to 9 do
     If Thung[i,j]=1 then Writeln(F,i,j);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 XuLy;
 InKq;
END.