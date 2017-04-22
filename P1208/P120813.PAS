{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q+,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
Program P120813;
{Xau ki tu la mot bieu thuc dai so, kiem tra tinh dung dan}
Uses  Crt;
Const MN = 200;
      fn = 'P1208\P120813.inp';
      gn = 'P120813.out';
Type  mangst = array [1..MN] of string[9];
      mangr  = array [1..MN] of real;
      mangit = array [1..MN] of integer;
Var   tenbien,ten     : mangst;
      giatri,tri,stack: mangr;
      p               : mangit;
      s,hang,bien     : string;
      sb,st,ip,sst,slb: longint;
      so              : real;
      sym             : char;
      f,g             : text;

Procedure Docbien;
Var s1: string; i,cho,dd: integer; t: real;
Var d: array [1..2] of longint;

Begin
 slb:=0;
 While not Eof(f) do
 begin
   Readln(f,s1);
   i:=1; Inc(slb); Tenbien[slb]:='';
   While s1[i]<>'=' do
   begin
     If s1[i]<>' ' then Tenbien[slb]:=Tenbien[slb]+UpCase(s1[i]);
     Inc(i);
   end;
   FillChar(d,SizeOf(d),0);
   cho:=1; dd:=1;
   While (i<=length(s1)) do
   begin
     If s1[i]='-' then dd:=2;
     If (s1[i] in ['0'..'9','.']) then
       Case s1[i] of
         '0'..'9': d[cho]:=d[cho]*10+ord(s1[i])-ord('0');
         '.'     : cho:=2;
       End;
     Inc(i);
   end;
   t:=d[2]; While t>1 do t:=t/10;
   giatri[slb]:=d[1]+t;
   If dd=2 then giatri[slb]:=-giatri[slb];
 end;
 For i:=1 to slb do
   While length(Tenbien[i])<8 do Tenbien[i]:=Tenbien[i]+' ';
End;

Procedure Nhap;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,s);
 Docbien;
 Close(f);
End;

Procedure Loi(i: byte);
Begin
 Case i of
   1: Write('Khong hop li!');
 End;
End;

Procedure Init;
Var i: integer;
Begin
 For i:=1 to length(s) do s[i]:=UpCase(s[i]);
 sb:=1; st:=0; ip:=0; sst:=0;
End;


Procedure Cach;
Begin
 While s[sb]=' ' do Inc(sb);
End;

Function Getnum: longint;
Var d: array [1..2] of longint; cho: integer; t: real;
Begin
 FillChar(d,SizeOf(d),0);
 cho:=1;
 While (sb<=length(s))and(s[sb] in ['0'..'9','.']) do
 begin
   Case s[sb] of
     '0'..'9': d[cho]:=d[cho]*10+ord(s[sb])-ord('0');
     '.'     : cho:=2;
   End;
   Inc(sb);
 end;
 t:=d[2]; While t>1 do t:=t/10;
 so:=d[1]+t;
End;

{function getnum:longint;
begin
  so:=0;
  while s[sb] in ['0' ..'9'] do
    begin
      so:= so*10+(ord(s[sb]) - ord('0'));
      inc(sb);
    end;
end;}

Procedure Getvar;
Begin
 bien:='';
 While s[sb] in ['A'..'Z','0'..'9'] do
 begin
   bien:=bien+s[sb]; Inc(sb);
 end;
 While length(bien)<8 do bien:=bien+' ';
End;

Procedure Getsym;
Begin
 Cach;
 Case s[sb] of
   '('     : begin sym:=s[sb]; Inc(sb); end;
   ')'     : begin sym:=s[sb]; Inc(sb); end;
   '+'     : begin sym:=s[sb]; Inc(sb); end;
   '-'     : begin sym:=s[sb]; Inc(sb); end;
   '*'     : begin sym:=s[sb]; Inc(sb); end;
   '/'     : begin sym:=s[sb]; Inc(sb); end;
   '%'     : begin sym:=s[sb]; Inc(sb); end;
   '0'..'9': begin sym:='0';   Getnum;  end;
   'A'..'Z': begin sym:='A';   Getvar;  end;
   Else sym:=#0;
 End;
End;

Function Findso: integer;
Var i: integer;
Begin
 For i:=1 to st do
   If ten[i]='         ' then
     If tri[i]=so then
     begin
       Findso:=i;
       exit;
     end;
 Inc(st); Ten[st]:='         '; Tri[st]:=so;
 Findso:=st;
End;

Function Findbien: integer;
Var i: integer;
Begin
 For i:=1 to st do
   If pos(bien,ten[i])>0 then begin Findbien:=i; exit; end;
 Inc(st); Ten[st]:='?'+bien;
 Findbien:=st;
End;

Function Finddau(c: char): integer;
Begin
 Case c of
   '+': finddau:=-1;
   '-': finddau:=-2;
   '*': finddau:=-3;
   '/': finddau:=-4;
   '%': finddau:=-5;
   '#': finddau:=-6;
 End;
End;

Procedure Bieuthuc;
Var i: integer; daubt: char;

  Procedure Hangtu;
  Var i: integer;

    Procedure Nhantu;
    Var i: integer;
    Begin
      While sym in ['0','A','('] do
      begin
        Case sym of
          '0': begin i:=findso;   Inc(ip); p[ip]:=i; end;
          'A': begin i:=findbien; Inc(ip); p[ip]:=i; end;
          '(': begin
                 getsym; Bieuthuc;
                 If sym<>')' then Loi(1);
               end
        End;
        getsym;
      end;
     End;

  Begin
    Nhantu;
    While sym in ['*','/','%'] do
    begin
      i:=finddau(sym);
      getsym;
      Nhantu; Inc(ip); p[ip]:=i;
    end;
  End;

Begin
 If sym in ['+','-'] then begin daubt:=sym; getsym end
 Else daubt:='+';
 Hangtu;
 If daubt='-' then begin i:=finddau('#'); Inc(ip); p[ip]:=i; end;
 While sym in ['+','-'] do
 begin
   daubt:=sym;
   getsym;
   Hangtu;
   i:=finddau(daubt); Inc(ip); p[ip]:=i;
 end;
End;

Procedure Tinh(i: integer);
Begin
 Case p[i] of
   -1: begin stack[sst-1]:=stack[sst-1]+stack[sst]; Dec(sst); end;
   -2: begin stack[sst-1]:=stack[sst-1]-stack[sst]; Dec(sst); end;
   -3: begin stack[sst-1]:=stack[sst-1]*stack[sst]; Dec(sst); end;
   -4: begin stack[sst-1]:=stack[sst-1]/stack[sst]; Dec(sst); end;
{    -5:begin stack[sst-1]:=stack[sst-1] mod stack[sst]; dec(sst); end;}
   -6: stack[sst]:=-stack[sst];
 End;
End;

Procedure Napso(i: integer);
Begin
 Inc(sst);
 stack[sst]:=tri[p[i]];
End;

Procedure Hoiso(i: integer);
Var j: integer;
Begin
 Delete(ten[p[i]],1,1);
 {write(ten[p[i]],' = '); readln(tri[p[i]]);}
 tri[p[i]]:=0;
 For j:=1 to slb do
   If tenbien[j]=ten[p[i]] then
     begin tri[p[i]]:=giatri[j]; break; end;
 Insert('&',ten[p[i]],1);
End;

Procedure Tinhtoan;
Var i: integer;
Begin
 For i:=1 to ip do
   If p[i]<0 then Tinh(i)
   Else  Case ten[p[i],1] of
           ' ': Napso(i);
           '?': begin Hoiso(i); Napso(i); end;
           '&': Napso(i);
         End;
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 Writeln(g,s,' = ',stack[1]:4:2);
 Close(g);
End;

BEGIN
 Clrscr;
 Nhap;
 Init;
 Getsym;
 Bieuthuc;
 Tinhtoan;
 Viet;
{  readln;}
END.
