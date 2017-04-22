{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
Program P120810;
{Kiem tra xem neu la bieu thuc so hoc thi tinh gia tri}
Uses  Crt;
Const MN = 1000;
      fn = 'P1208\P120810.INP';
      gn = 'P120810.OUT';
      khac = #255;
Type  mang1r = array [1..MN] of real;
      mang1i = array [1..MN] of integer;
Var   p,gt     : mang1i;
      gt1,st   : mang1r;
      s        : string;
      pi,si,sst: integer;
      so       : real;
      sym      : char;
      f,g      : text;

Procedure Motep;
Begin
 Assign(f,fn); Reset(f);
 Assign(g,gn); Rewrite(g);
End;

Procedure Dongtep;
Begin
 Close(f); Close(g);
End;


Procedure Init;
Begin
 pi:=0; si:=1; s:=s+khac; sst:=0;
End;

Procedure Loi;
Begin

end;

Procedure Docso;
Var d: array [1..2] of longint; cho: integer; t: real;
Begin
 FillChar(d,SizeOf(d),0);
 cho:=1;
 While (si<=length(s))and(s[si] in ['0'..'9','.']) do
 begin
   Case s[si] of
     '0'..'9': d[cho]:=d[cho]*10+ord(s[si])-ord('0');
     '.'     : cho:=2;
   End;
   Inc(si);
 end;
 t:=d[2]; While t>1 do t:=t/10;
 so:=d[1]+t;
End;

{procedure docso;
begin
  so:=0;
  while s[si] in['0'..'9','.'] do
    begin
      so:=so * 10 + ord(s[si]) - ord('0');
      inc(si);
    end;
end;}

Procedure Cach;
Begin
 While s[si]=' 'do Inc(si);
End;

Procedure Getsym;
Begin
 Cach;
 Case s[si] of
   '+','-','*','/','(',')': begin sym:=s[si]; Inc(si); end;
   '0'..'9'               : begin sym:='S';   Docso;   end;
   Else sym:=khac;
 End;
End;

Procedure Nhapdau(d: char);
Begin
 Inc(pi); p[pi]:=2;
 Case d of
   '+': gt[pi]:=1;
   '-': gt[pi]:=2;
   '*': gt[pi]:=3;
   '/': gt[pi]:=4;
   '&': gt[pi]:=5;
 End;
End;

Procedure Nhapso;
Begin
 Inc(pi); p[pi]:=1; gt[pi]:=trunc(so); gt1[pi]:=so;
End;

Procedure Bieuthuc;
Var daubt: char;

 Procedure Hangtu;
 Var dauht: char;

   Procedure Nhantu;
   Begin
     Case sym of
       'S': Nhapso;
       '(': begin
              Getsym;
              bieuthuc;
              If sym<>')' then Loi;
            end;
     End;
     Getsym;
   End;

 Begin
   Nhantu;
   While sym in ['*','/'] do
   begin
     dauht:=sym;
     Getsym;
     Nhantu;
     Nhapdau(dauht);
   end;
 End;

Begin
 If sym in ['+','-'] then
 begin
   If sym='-' then daubt:=sym;
   Getsym;
 end;
 Hangtu;
 If daubt='-' then Nhapdau('&');
 While sym in ['+','-'] do
 begin
   daubt:=sym;
   Getsym;
   Hangtu;
   Nhapdau(daubt);
 end;
End;

Procedure Xem;
Var i: integer;
Begin
 For i:=1 to pi do
   If p[i]=1 then Writeln(gt[i])
   Else Case gt[i] of
          1: Writeln('+');
          2: Writeln('-');
          3: Writeln('*');
          4: Writeln('/');
          5: Writeln('-');
        End;
End;

Procedure Thuchien(x: integer);
Begin
 Case x of
   1: begin st[sst-1]:=st[sst-1]+st[sst];   Dec(sst); end;
   2: begin st[sst-1]:=st[sst-1]-st[sst];   Dec(sst); end;
   3: begin st[sst-1]:=st[sst-1] * st[sst]; Dec(sst); end;
   4: begin st[sst-1]:=st[sst-1]/st[sst];   Dec(sst); end;
   5: st[sst]:=-st[sst];
 End;
End;

Procedure Tinh;
Var i: integer;
Begin
 For i:=1 to pi do
   If p[i]=1 then begin Inc(sst); st[sst]:=gt1[i] end
   Else Thuchien(gt[i]);
End;

Procedure Viet;
Begin
 Writeln(g,st[1]:5:2);
End;

BEGIN
 Clrscr;
 Motep;
 While not Eof(f) do
 begin
   Clrscr;
   Readln(f,s);
   Write(g,s,' = ');
   Init;
   Getsym;
   Bieuthuc;
   Tinh;
   Viet;
 end;
 Dongtep;
END.
