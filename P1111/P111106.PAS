{$N+}
Program P111106; {Dung hinh vuong voi 2 toa do cho truoc}
Uses  Crt,Graph;
Var   gd,gm: integer;
      x,y: real;
      xt,yt,l: real;
      xa,xb,xc,xd,ya,yb,yc,yd: real;
      xtd,ytd,HeSo: real;

Procedure Nhap;
Begin
 ClrScr;
 Writeln('Nhap toa do diem A:');
 Write('Xa= '); Readln(xa);
 Write('Ya= '); Readln(ya);
 Writeln('Nhap toa do diem B:');
 Write('Xb= '); Readln(xb);
 Write('Yb= '); Readln(yb);
End;

Function Can(x1,y1,x2,y2: real): real;
Begin
 Can:=sqrt(sqr(x1-x2)+sqr(y1-y2));
End;

Procedure Tim_td;
Var d,dx,dy,a,b,c,a1,b1,c1:real;
Begin
 xtd:=round((xa+xb)/2); ytd:=round((ya+yb)/2);
 l:=can(xa,ya,xb,yb);
 a:=xa-xb; b:=ya-yb;
 c:=-((xa-xb)*xtd+(ya-yb)*ytd);
 a1:=(ya-yb); b1:=-(xa-xb);
 c1:=-(HeSo*sqr(l)/2)-(ya-yb)*xb+(xa-xb)*yb;
 d:=a*b1-b*a1;
 dx:=b*c1-c*b1; dy:=c*a1-a*c1;
 xt:=dx/d; yt:=dy/d;
 xc:=round(xt*2-xa); yc:=round(yt*2-ya);
 xd:=round(xt*2-xb); yd:=round(yt*2-yb);
End;

Procedure Ve;
Var sxc,sxd,syc,syd:string;
Begin
 str(xc:0:0,sxc); str(xd:0:0,sxd);
 str(yc:0:0,syc); str(yd:0:0,syd);
 Outtextxy(10,10,'C('+sxc+','+syc+') - D('+sxd+','+syd+')');
 Line(round(xa),round(ya),round(xb),round(yb));
 Line(round(xb),round(yb),round(xc),round(yc));
 Line(round(xc),round(yc),round(xd),round(yd));
 Line(round(xd),round(yd),round(xa),round(ya));
End;

BEGIN
 Nhap;
 gd:=detect;
 InitGraph(gd,gm,'d:\tp70\bgi');
 SetColor(15);
 HeSo:=1;
 Tim_td;
 Ve;
 Repeat Until KeyPressed;
 Delay(100);
 ClearDevice;
 HeSo:=-1;
 Tim_td;
 Ve;
 Readln;
 CloseGraph;
END.