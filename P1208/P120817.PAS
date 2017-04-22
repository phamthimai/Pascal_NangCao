{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 64384,0,655360}
Program P120817;   {Xu li xau}
Uses  Crt;
Const MN   = 50;
      fn   = 'Turbo\P120817.inp';
      gn   = 'Turbo\P120817.out';
      khac = #255;
Type  mang1c = array [1..MN] of char;
      mang1i = array [1..MN] of integer;
      xc     = string[MN];
Var   p           : mang1c;
      gt,tu,den   : mang1i;
      s           : string;
      si,pi,so    : integer;
      sym,chu     : char;
      tg,tg1,sc,sr: xc;
      loai        : byte;
      f,g         : text;

Procedure Loi;
Begin

end;

Function Dung(sc: xc): xc;
Var i: word; t: string;
Begin
 dung:='';
 For i:=1 to length(sc) do
   If sc[i]<>sc[1] then exit;
 If length(sc)=1 then Dung:=sc
 Else begin str(length(sc),t); Dung:=sc[1]+t; end;
End;

Function Laplai(x: xc; j: byte): byte;
Var t: byte; cc,cc1: xc;
Begin
 t:=1; cc:=copy(x,length(x)-j+1,j);
 While t<=length(x) div j do
 begin
   Inc(t);
   cc1:=copy(x,length(x)-j*t+1,j);
   If cc1<>cc then break;
 end;
 If t>2 then Laplai:=t-1 Else Laplai:=0;
End;

Function Toiuu(sc: xc): xc;
Var s: array [-3..MN] of xc; i,j,t: byte;
Begin
 s[0]:='';
 If Dung(sc)<>'' then begin Toiuu:=Dung(sc); exit; end;
 For i:=1 to length(sc) do
 begin
   s[-1]:=copy(sc,1,i); s[i]:=s[i-1]+sc[i];
   For j:=1 to i div 2 do
   begin
     t:=Laplai(s[-1],j);
     If t<>0 then
     begin
       s[-2]:=Copy(s[-1],i-j+1,j);
       s[-3]:=Toiuu(s[-2]);
       str(t,tg1);
       If length(s[-3])<>1 then tg:=s[i-j*t]+'('+s[-3]+')'+tg1
       Else tg:=s[i-j*t]+s[-3]+tg1;
       If length(tg)<=length(s[i]) then s[i]:=tg;
     end;
   end;
 end;
 Toiuu:=s[length(sc)];
End;

Procedure Viet2;
Begin
 Writeln(g,sr);
End;

Procedure Xuly2;
Begin
 sr:=Toiuu(sc);
 Viet2;
End;

Procedure Phanloai;
Var i: integer;
Begin
 Loai:=1;
 For i:=1 to length(sc) do
   If sc[i] in ['(',')','0'..'9'] then exit;
 loai:=2;
End;

Procedure Init;
Begin
 si:=1; pi:=0; s:=s+khac;
End;

Procedure Cach;
Begin
 While s[si]=' ' do Inc(si);
End;

Procedure Getsym;
Begin
 Cach;
 Case s[si] of
   'a'..'z','A'..'Z': begin sym:='B'; chu:=s[si]; Inc(si); end;
   '(',')'          : begin sym:=s[si]; Inc(si); end;
   Else sym:=khac;
 End;
End;

Procedure Docso;
Begin
 Cach; so:=0;
 While s[si] in ['0'..'9'] do
 begin
   so:=so*10+ord(s[si])-ord('0');
   Inc(si);
 end;
 If so=0 then so:=1;
End;

Procedure Nhapchu;
Begin
 Inc(pi); p[pi]:=chu; gt[pi]:=so;
End;

Procedure Nhapso(x: integer);
Begin
 Inc(pi); p[pi]:=' ';
 gt[pi]:=so; tu[pi]:=x; den[pi]:=pi-1;
End;

Procedure Lenh;
Begin
 Docso; Nhapchu;
 Getsym;
End;

Procedure Daylenh;
Var bd: integer;
Begin
 While sym in ['(','B'] do
   If sym='(' then
     begin
       bd:=pi+1;
       Getsym;
       Daylenh;
       If sym<>')' then Loi Else Docso;
       Nhapso(bd);
       Getsym;
     end
   Else Lenh;
End;

Procedure Xem;
Var i: integer;
Begin
 For i:=1 to pi do
   Writeln(p[i],' ',gt[i],' ',tu[i],' ',den[i]);
End;

Procedure Viet(x,y: integer);
Var i,j: integer;
Begin
 For i:=x to y do
   If p[i]<>' ' then For j:=1 to gt[i] do Write(g,p[i])
   Else For j:=1 to gt[i]-1 do Viet(tu[i],den[i]);
End;

Procedure Xuly1;
Begin
 s:=sc;
 Init;
 Getsym;
 Daylenh;
 { xem;}
 Viet(1,pi);
 Writeln(g);
End;

BEGIN
 Clrscr;
 Assign(f,fn); Reset(f);
 Assign(g,gn); Rewrite(g);
 While not Eof(f) do
 begin
   Readln(f,sc);
   Phanloai;
   If Loai=1 then Xuly1 Else Xuly2;
 end;
 Close(g); Close(f);
END.
