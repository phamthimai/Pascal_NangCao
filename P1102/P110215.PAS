Program P110215;  {Sua loi cho  xau ki tu}
Uses Crt;
Var  i: byte;
     s: string;

BEGIN
 Clrscr;
 Write('Nhap xau ki tu: ');
 Readln(s);
 While pos('#',s)<>0 do
   If pos('#',s)=1 then Delete(s,pos('#',s),1)
   Else Delete(s,pos('#',s)-1,2);
 Write('Xau da sua: ',s);
 Readln;
END.