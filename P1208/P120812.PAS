{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q+,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
{phep '/' tinh la 'DIV'}
Program P120812;
Uses  Crt;
Const MN = 200;
      fn = 'P1208\P120812.inp';
      gn = 'P120812.out';
Type  mangst = array [1..MN] of string[9];
      manglg = array [1..MN] of longint;
      mangit = array [1..MN] of integer;
Var   tenbien,ten        : mangst;
      giatri,tri,stack   : manglg;
      p                  : mangit;
      s,hang,bien        : string;
      so,sb,st,ip,sst,slb: longint;
      sym                : char;
      f,g                : text;

Procedure Docbien;
Var s1: string; i: integer;
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
   Giatri[slb]:=0;
   While i<=length(s1) do
   begin
     If s1[i] in ['0'..'9'] then
       Giatri[slb]:=giatri[slb]*10+ord(s1[i])-ord('0');
     Inc(i);
   end;
 end;
 For i:=1 to slb do
   While length(tenbien[i])<8 do tenbien[i]:=tenbien[i]+' ';
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
Begin
 so:=0;
 While s[sb] in ['0' ..'9'] do
 begin
   so:=so*10+(ord(s[sb])-ord('0'));
   Inc(sb);
 end;
End;

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
   '0'..'9': begin sym:='0';   getnum;  end;
   'A'..'Z': begin sym:='A';   getvar;  end;
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
 Inc(st); ten[st]:='         '; tri[st]:=so;
 Findso:=st;
End;

Function Findbien: integer;
Var i: integer;
Begin
 For i:=1 to st do
   If pos(bien,ten[i])>0 then
   begin
     Findbien:=i;
     exit;
   end;
 Inc(st); ten[st]:='?'+bien;
 Findbien:=st;
End;

Function Finddau(c: char): integer;
Begin
 Case c of
   '+':Finddau :=-1;
   '-': Finddau:=-2;
   '*': Finddau:=-3;
   '/': Finddau:=-4;
   '%': Finddau:=-5;
   '#': Finddau:=-6;
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
         '0': begin i:=Findso;   Inc(ip); p[ip]:=i; end;
         'A': begin i:=Findbien; Inc(ip); p[ip]:=i; end;
         '(': begin
                getsym; Bieuthuc;
                If sym<>')' then Loi(1);
              end;
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
 If daubt='-' then begin i:=finddau('#'); inc(ip); p[ip]:=i; end;
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
   -1: begin stack[sst-1]:=stack[sst-1]+stack[sst];     Dec(sst); end;
   -2: begin stack[sst-1]:=stack[sst-1]-stack[sst];     Dec(sst); end;
   -3: begin stack[sst-1]:=stack[sst-1]*stack[sst];     Dec(sst); end;
   -4: begin stack[sst-1]:=stack[sst-1] div stack[sst]; Dec(sst); end;
   -5: begin stack[sst-1]:=stack[sst-1] mod stack[sst]; Dec(sst); end;
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
 begin
   If p[i]<0 then Tinh(i)
   Else Case ten[p[i],1] of
          ' ': Napso(i);
          '?': begin Hoiso(i); Napso(i); end;
          '&': Napso(i);
        End;
 end;
End;

Procedure Viet;
Var i: integer;
Begin
 Assign(g,gn); Rewrite(g);
 Writeln(g,s,' = ',stack[1]);
 Close(g);
End;


BEGIN
 Clrscr;
 Nhap;
 Init;
 getsym;
 Bieuthuc;
 Tinhtoan;
 Viet;
END.
