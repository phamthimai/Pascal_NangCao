Program P101110;  {giong hang cho van ban}
Uses  Crt;
Const inp='P1011\kt.inp';
      out='kt.out';
Var   f,g: text;
      s: string;
      DongMax,SoTu,DauCach,Kt: byte;
      Tu: array [1..130] of string[100];

Procedure TimDongMax;
Begin
 DongMax:=0;
 Assign(f,inp); Reset(f);
 While not eof(f) do
 begin
   Readln(f,s);
   If length(s)>DongMax then DongMax:=length(s);
 end;
 Close(f);
End;

Procedure XuLy;
Var i: byte; st: string;
Begin
 s:=s+' '; SoTu:=0; Kt:=0; st:='';
 For i:=1 to length(s) do
   If s[i]<>' ' then
     begin
       inc(Kt);
       st:=st+s[i];
     end
   Else
     If (s[i-1]<>' ')and(i>1) then
     begin
       inc(SoTu);
       Tu[SoTu]:=st;
       st:='';
     end;
End;

Procedure InKQ;
Var Du,Cach,i,j: byte;
Begin
 Du:=(DongMax-Kt)mod (SoTu-1);
 Cach:=(DongMax-Kt)div (SoTu-1);
 Write(g,Tu[1]);
 For i:=2 to SoTu do
 begin
   If Du>0 then
   begin
     Dec(du); Write(g,' ');
   end;
   For j:=1 to Cach do Write(g,' ');
   Write(g,Tu[i]);
 end;
 Writeln(g);
End;

Procedure GiongHang;
Begin
 Assign(f,inp); Reset(f);
 Assign(g,out); Rewrite(g);
 While not EoF(f) do
 begin
   Readln(f,s);
   XuLy;
   InKQ;
 end;
 Close(g);
 Close(f);
End;

BEGIN
 Clrscr;
 TimDongMax;
 GiongHang;
END.