Program P121113;  {tim so}
Uses  Crt;
Var   b,a,k,dem: word;
      ch       : char;

BEGIN
 Clrscr;
 TextColor(15);
 b:=1000; a:=0;
 dem:=0;
 Repeat
   Inc(dem);
   k:=(a+b) div 2;
   Write(dem,' Co lon hon ',k,' khong C/K'); Readln(ch);
   If Upcase(ch)='C' then a:=k
   Else b:=k;
 Until b-a<2;
 If a<b then
 begin
   If upcase(ch)='C' then a:=b
   Else b:=a;
 end;
 Write(' So ban nghi la ',a);
 Readln;
END.