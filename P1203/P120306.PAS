Program P120306;   {Vi tri kim dong ho}
Uses Crt;
Var  alpha,beta,gama,d: real;
     h,m,s: byte;

BEGIN
 Clrscr;
 d:=pi/6;
 Write('Nhap goc alpha (rad): '); Readln(alpha);
 alpha:=alpha-2*pi*int(alpha/(2*pi)); alpha:=2*pi-alpha;
 h:=Trunc(alpha/d);
 beta:=12*(alpha-d*int(alpha/d));
 d:=pi/30;
 m:=Trunc(beta/d);
 gama:=60*(beta-d*int(beta/d));
 s:=Trunc(gama/d);
 Writeln('Kim phut lech: ',2*pi-beta:6:4,' rad');
 Write('Dong ho chi ',h,':',m:2,':',s:2);
 Readln;
END.