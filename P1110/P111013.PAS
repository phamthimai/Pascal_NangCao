Program P111013;{dien tich hop cua 3 duong tron}
Uses crt;
Const fi = 'P111013.inp';
Var a,b,c,oa,ob,oc,s,ga,gb,gc:real;
    f:text;
Begin
  Assign(f,fi);
  Reset(f);
  Readln(f,oa,ob,oc);
  c:=sqrt(oa*oa+ob*ob+oa*ob);
  b:=sqrt(oa*oa+oc*oc+oa*oc);
  a:=sqrt(oc*oc+ob*ob+oc*ob);
  ga:=(b*b+c*c-a*a)/(2*b*c);
  gb:=(a*a+c*c-b*b)/(2*a*c);
  gc:=(b*b+a*a-c*c)/(2*a*b);
  ga:= 2*ArcTan (sqrt (1-sqr (ga)) /ga);
  gb:= 2*ArcTan (sqrt (1-sqr (gb)) /gb);
  gc:= 2*ArcTan (sqrt (1-sqr (gc)) /gc);
  s:=(oa*ob+ob*ob+oc*oa)*sqrt(3)/2;
  s:=s+(2*pi-ga)*oa*oa/2+(2*pi-gb)*ob*ob/2+(2*pi-gc)*oc*oc/2;
  Writeln('dien tich phan hop cua 3 duong tron la: ',s);
  Close(f);
End.