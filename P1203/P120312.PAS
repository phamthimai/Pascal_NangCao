Program P120312;    { Tinh cac so lon}
Uses Crt;
Type solon = array[0..255] of byte;

Procedure chen(t,d: integer; Var s: solon);
Var i: integer;
Begin
 Inc(s[0]);
 For i:=s[0] downto d+1 do s[i]:=s[i-1];
 s[d]:=t;
End;

Procedure cut(d: integer; Var s: solon);
Var i: integer;
Begin
 Dec(s[0]);
 For i:=d to s[0] do s[i]:=s[i+1];
End;

Procedure nhap(Var s: solon);
Var str: String;
    i: integer;
Begin
 Readln(str);
 s[0]:=Length(str);
 For i:=Length(str) downto 1 do s[s[0]-i+1]:=ord(str[i])-48;
End;

Procedure hien(s: solon);
Var i: integer;
Begin
 For i:=s[0] downto 1 do Write(s[i]);
End;

Function max(a,b: integer): integer;
Begin
 If a<b then max:=b Else max:=a;
End;

Procedure cong(Var s1,s2: solon);
Var i,nho: integer;
Begin
 nho:=0;
 For i:=1 to max(s1[0],s2[0]) do
 begin
   nho:=nho+s1[i]+s2[i];
   s1[i]:=nho mod 10;
   nho:=nho div 10;
 end;
 s1[0]:=i;
 If nho>0 then begin Inc(s1[0]); s1[s1[0]]:=nho; end;
End;

Procedure tru(Var s1,s2: solon);
Var nho,i: Integer;
Begin
 nho:=0;
 For i:=1 to s2[0] do
   If s1[i]<s2[i]+nho then
     begin s1[i]:=10+s1[i]-nho-s2[i]; nho:=1; end
   Else
     begin s1[i]:=s1[i]-s2[i]-nho; nho:=0; end;
 While (nho>0)and(i<255) do
 begin
   Inc(i);
   If s1[i]=0 then s1[i]:=9
   Else begin dec(s1[i]); nho:=0; end;
 end;
 While(s1[s1[0]]=0)and(s1[0]>0) do Dec(s1[0]);
End;

Procedure nhannho(Var s: solon; t: integer);
Var nho,i: word;
Begin
 nho:=0;
 For i:=1 to s[0] do
 begin
   nho:=nho+s[i]*t;
   s[i]:=nho mod 10;
   nho:=nho div 10;
 end;
 While nho>0 do
 begin
   Inc(s[0]);
   s[s[0]]:=nho mod 10;
   nho:=nho div 10;
 end;
End;

Procedure nhan(Var s1,s2: solon);
Var c,d: solon;
    i,j,t: integer;
Begin
 FillChar(c,SizeOf(c),0);
 For i:=1 to s2[0] do
 begin
   d:=s1;
   nhannho(d,s2[i]);
   For j:=2 to i do nhannho(d,10);
   cong(c,d);
 end;
 s1:=c;
End;

Function sosanh(Var s1,s2: solon): shortint;
Var i: integer;
Begin
 While(s1[s1[0]]=0)and(s1[0]>0) do dec(s1[0]);
 While(s2[s2[0]]=0)and(s2[0]>0) do dec(s2[0]);
 If s1[0]>s2[0] then begin sosanh:=1;  exit; end;
 If s1[0]<s2[0] then begin sosanh:=-1; exit; end;
 For i:=s1[0] downto 1 do
 begin
   If s1[i]>s2[i] then begin sosanh:=1;  exit; end;
   If s1[i]<s2[i] then begin sosanh:=-1; exit; end;
 end;
 sosanh:=0;
End;

Procedure laydu(Var s1,s2: solon; Var t: integer);
Begin
  t:=0;
  While sosanh(s1,s2)>=0 do
  begin
    tru(s1,s2); Inc(t);
  end;
End;

Procedure chia(Var s1,s2,s3: solon);
Var s,s5,s6,s4: solon;
    a,b: byte;
Begin
 FillChar(s,SizeOf(s),0);
 While sosanh(s1,s2)>=0 do
 begin
   s4:=s2; a:=0;
   While (sosanh(s1,s4)>=0) do
   begin
     chen(0,1,s4); Inc(a);
   end;
   cut(1,s4); s5:=s4; b:=0;
   While (sosanh(s1,s5)>=0) do
   begin
     cong(s5,s4); Inc(b);
   end;
   FillChar(s6,SizeOf(s6),0);
   s6[0]:=a; s6[s6[0]]:=b;
   cong(s,s6); nhan(s6,s2); tru(s1,s6);
 end;
 While(s1[s1[0]]=0)and(s1[0]>0) do dec(s1[0]);
 While(s[s[0]]=0)and(s[0]>0) do dec(s[0]);
 s3:=s1; s1:=s;
End;

{Var s1,s2,s3: solon;

BEGIN
 Write('Nhap so thu nhat: '); Nhap(s1);
 Write('Nhap so thu hai : '); Nhap(s2);
     chia(s1,s2,s3);
     hien(s1);
     writeln;
     hien(s3);
     readln;
END.}