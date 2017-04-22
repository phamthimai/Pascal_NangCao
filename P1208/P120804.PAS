{chuong trinh chay voi du lieu khong qua lon }
Program P120804;
{Ti le cac tu co trong van ban theo thu tu chu cai}
Uses  Crt;
Const Mn = 1000;
      fn = 'P1208\P120804.inp';
      gn = 'P120804.out';
Type  mang1s = array [1..MN] of string[16];
      mang1i = array [1..MN] of integer;
Var   chu       : mang1s;
      sl        : mang1i;
      s,tu      : string;
      p,tong,sst: integer;
      f,g       : text;

Procedure Init;
Begin
  Tong:=0;
End;

Function Contu: boolean;
Begin
 tu:=''; contu:=false;
 If not (s[1] in ['a'..'z','A'..'Z']) then
   Repeat
     Delete(s,1,1);
   Until (s='')or(s[1] in ['a'..'z','A'..'Z']);
 If s<>'' then
 begin
   contu:=true;
   While (s<>'')and(s[1] in ['a'..'z','A'..'Z']) do
   begin
     tu:=tu+UpCase(s[1]); Delete(s,1,1);
   end;
 end;
End;

Function Giong: boolean;
Var i: integer;
Begin
 Giong:=true;
 For i:=1 to sst do
   If chu[i]=tu then begin Inc(sl[i]); exit; end;
 Giong:=false;
End;

Function Nhohon: boolean;
Var i,t: integer;
Begin
 If length(chu[p])>length(chu[p-1]) then t:=length(chu[p-1])
 Else t:=length(chu[p]);
 For i:=1 to t do
   If Ord(chu[p,i])<Ord(chu[p-1,i]) then
     begin Nhohon:=true; exit end
   Else If Ord(chu[p,i])>Ord(chu[p-1,i]) then
          begin Nhohon:=false; exit; end;
 If length(chu[p])=t then nhohon:=true Else nhohon:=false;
End;

Procedure Nap;
Begin
 Inc(sst); chu[sst]:=tu; sl[sst]:=1;
 p:=sst;
 While (p>1)and Nhohon do
 begin
   chu[p]:=chu[p-1]; sl[p]:=sl[p-1];
   Dec(p);
   chu[p]:=tu; sl[p]:=1;
 end;
End;

Procedure Xulytu;
Begin
 Inc(Tong);
 If Giong then exit
 Else Nap;
End;

Procedure Xuly;
Begin
 While contu do Xulytu;
End;

Procedure Doc;
Begin
 Assign(f,fn); Reset(f);
 While not Eof(f) do
 begin
   Readln(f,s);
   Xuly;
 end;
 Close(f);
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 For i:=1 to sst do
   Writeln(g,chu[i],' ',sl[i]/Tong*100:4:4,' %');
 Close(g);
End;

BEGIN
 Clrscr;
 Init;
 Doc;
 Viet;
END.
