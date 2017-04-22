Program P120807;
{Kiem tra sap xep theo chieu giam cua bac don thuc}
Uses  Crt;
Const MN = 100;
      fn ='P1208\P120807.inp';
      gn ='P120807.out';
Type  mangR = array [0..100] of real;
Var   a  : mangr;
      sa : real;
      sb : integer;
      dau: char;
      s  : string;
      si : integer;
      f,g: text;

Procedure Nhap;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,s);
 Close(f);
End;

Procedure Sapxep;
Begin

End;

Procedure Xoacach;
Var i: integer;
Begin
 i:=1;
 While i<=length(s) do
   If s[i]=' ' then Delete(s,i,1) Else Inc(i);
   If (s[1]<>'-')and(s[1]<>'+') then s:='+'+s ;
End;

Procedure Loi(x: integer);
Begin
 Case x of
   1: Write('thieu dau');
   2: Write('thieu a');
   3: Write('thieu b');
 End;
 Readln;
 Halt;
End;

Procedure Docdau;
Begin
 If not (s[si] in ['+','-']) then Loi(1)
 Else begin dau:=s[si]; Inc(si); end;
End;

Procedure Doca;
Var d: array [1..2] of longint; cho: integer; t: real;
Begin
 FillChar(d,SizeOf(d),0);
 cho:=1;
 If not (s[si] in ['0'..'9']) then Loi(2);
 While (si<=length(s))and(s[si] in ['0'..'9','.']) do
 begin
   Case s[si] of
     '0'..'9': d[cho]:=d[cho]*10+ord(s[si])-ord('0');
     '.'     : cho:=2;
   End;
   Inc(si);
 end;
 t:=d[2];
 While t>1 do t:=t/10;
 sa:=d[1]+t;
End;

Procedure Docb;
Begin
 sb:=0;
 If s[si]<>'x' then sb:=0
 Else
 begin
   Inc(si);
   If s[si]<>'^' then begin sb:=1; exit; end;
   Inc(si);
   If not(s[si] in ['0'..'9']) then Loi(3);
   While (si<=length(s))and(s[si] in ['0'..'9']) do
   begin
     sb:=sb*10+ord(s[si])-ord('0');
     Inc(si);
   end;
 end;
End;

Procedure Nhapdab;
Begin
 If dau='-' then sa:=-sa;
 a[sb]:=a[sb]+sa;
End;

Procedure Phantich;
Begin
 si:=1;
 While si<=length(s) do
 begin
   Docdau;
   Doca;
   Docb;
   Nhapdab;
 end;
End;

Procedure Xuly;
Begin
 FillChar(a,SizeOf(a),0);
 Xoacach;
 Phantich;
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 For i:=MN downto 0 do
   If abs(a[i])>0.0001 then
     If a[i]>0 then Write(g,'+ ',a[i]:4:2,'x^',i)
     Else Write(g,a[i]:4:2,'x^',i);
 Close(g);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
 Viet;
END.
