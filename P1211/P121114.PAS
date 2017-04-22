Program P121114;  {Boc soi}
Uses crt;
Var  d,c,k: integer;
     a    : array [1..2] of integer;
     ch   : char;

Begin
 Write(' Nhap so soi cua dong thu nhat = '); Readln(a[1]);
 Write(' Nhap so soi cua dong thu  hai = '); Readln(a[2]);
 Write(' Bandi truoc C/K ');Readln(ch);
 Repeat
   If Upcase(ch)='C' then
   begin
     Writeln(' Dong 1 co: ',a[1],' vien soi');
     Writeln(' Dong 2 co: ',a[2],' vien soi');
     If (a[1]=1)and(a[2]=1) then
     begin
       Writeln('Ban da thua '); Readln;
       exit;
     end;
     Repeat
       Write(' Ban chia dong nao '); Readln(d);
     Until (d>0)and(d<3)and(a[d]>1);
     If d=1 then k:=2 else k:=1;
     Repeat
       Write(' Mot trong hai dong do co bao nhieu vien soi'); Readln(c);
     Until c<a[d];
     a[k]:=c; a[d]:=a[d]-c;
     Writeln(' Dong 1 co: ',a[1],' vien soi');
     Writeln(' Dong 2 co: ',a[2],' vien soi');
     ch:='K';
   end
   Else
   begin
     If (a[1]=1)and(a[2]=1) then
     begin
       Writeln('May da thua'); Readln;
       exit;
     end;
     d:=a[1]; c:=1;
     If a[1]<a[2] then begin d:=a[2]; c:=2; end;
     If a[1] mod 2=0 then begin d:=a[1]; c:=1; end;
     Writeln(' May chia dong ',c);
     a[2]:=1; a[1]:=d-1;
     ch:='C';
   end;
 Until false;
END.