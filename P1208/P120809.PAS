{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
{Phep '/' tinh la 'DIV'}
Program P120809;
{Kiem tra xem xau nhap vao co phai la bieu thuc so hoc khong}
Uses  Crt;
Const MN = 1000;
      fn = 'P1208\P120809.INP';
      gn = 'P120809.OUT';
      khac = #255;
Type  mang1 = array [1..MN] of integer;
Var   p,gt,st     : mang1;
      s           : string;
      pi,so,si,sst: integer;
      sym         : char;
      f,g         : text;

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
End;

Procedure Docso;
Begin
 so:=0;
 While s[si] in['0'..'9'] do
 begin
   so:=so*10+ord(s[si])-ord('0');
   Inc(si);
 end;
End;

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
  Inc(pi); p[pi]:=1; gt[pi]:=so;
End;

Procedure Bieuthuc;
Var daubt: char;

 Procedure Hangtu;
 Var dauht: char;

   Procedure Nhantu;
   Begin        {1.1}
     Case sym of
       'S': Nhapso;
       '(': begin {2.1}
              getsym;
              Bieuthuc;
              If sym<>')' then Loi;
            end;   {2.1}
     End;   {case}
     getsym;
   End;{1.1}

 Begin {1.2}
   Clrscr;
   Nhantu;
   While sym in ['*','/'] do
   begin    {2.2}
     dauht:=sym;
     getsym;
     nhantu;
     nhapdau(dauht);
   end;    {2.2}
 End;  {1.2}

Begin    {1.3}
 If sym in ['+','-'] then
 begin      {2.3}
   If sym='-' then daubt:=sym;
   getsym;
 end;        {2.3}
 hangtu;
 If daubt='-' then Nhapdau('&');
 While sym in ['+','-'] do
 begin        {3.3}
   daubt:=sym;
   getsym;
   Hangtu;
   Nhapdau(daubt);
 end;           {3.3}
End;{1.3}

Procedure Xem;
Var i: integer;
Begin
 For i:=1 to pi do
   If p[i]=1 then Writeln(gt[i])
   Else  Case gt[i] of
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
   1: begin st[sst-1]:=st[sst-1]+st[sst]; Dec(sst); end;
   2: begin st[sst-1]:=st[sst-1]-st[sst]; Dec(sst); end;
   3: begin st[sst-1]:=st[sst-1]*st[sst]; Dec(sst); end;
   4: begin st[sst-1]:=st[sst-1] div st[sst]; Dec(sst); end;
   5: st[sst]:=-st[sst];
 End;
End;

Procedure Tinh;
Var i: integer;
Begin
 For i:=1 to pi do
   If p[i]=1 then begin Inc(sst); st[sst]:=gt[i] end
   Else Thuchien(gt[i]);
End;

Procedure Viet;
Begin
 Writeln(g,st[1]);
End;

BEGIN
 Clrscr;
 Motep;
 While not Eof(f) do
 begin
   Clrscr;
   Readln(f,s);
   Write(g,s,' = ');
   Readln;
   Init;
   Getsym;
   Bieuthuc;
   Tinh;
   Viet;
 end;
 Dongtep;
END.

