Program P120307;    {Kim gio kim phut}
Uses Crt;
Var  h,m,s: integer;
     d,hv,hp,mp,hr: real;

BEGIN
 Clrscr;
 Writeln('Thoi gian hien tai la h:m:s');
 Write(' Nhap h: '); Readln(h);
 Write(' Nhap m: '); Readln(m);
 Write(' Nhap s: '); Readln(s);
 hv:=2*pi/12;                 {van toc kim gio}
 hp:=(h+m/60+s/3600)*hv;      {vi tri  kim gio}
 mp:=(m+s/60)*(12*hv)/60;    {vi tri  kim phut}
 If hp>=mp then d:=hp-mp       {Khoang cach tu}
 Else d:=2*pi+hp-mp;     {kim phut den kim gio}
 hr:=d/(11*hv);      {thoi gian kim phut duoi kip kim gio}
 Write('Thoi diem kim phut gap kim gio la: ');
 hr:=h+hr+m/60+s/3600;
 Write(int(hr):2:0,':');
 hr:=(hr-int(hr))*60;
 Write(int(hr):2:0,':');
 hr:=(hr-int(hr))*60;
 Write(int(hr):2:0);
 Readln;
END.