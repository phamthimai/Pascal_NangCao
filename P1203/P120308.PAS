Program P120308;    {Lien phan so}
Uses Crt;
Var s,t,r: word;

BEGIN
 Clrscr;
 Write(' Nhap so S: '); Readln(s);
 Write(' Nhap so T: '); Readln(t);
 Repeat
   Write(t div s,',');
   r:=t mod s;
   t:=s; s:=r;
 Until r=0;
 Readln;
END.