Program P101513;  {tim kiem nhi phan bang de qui}
Uses  Crt;
Const inp='P101513.TXT';
Var   f: text;
      n,b,vt: integer;
      a: array [1..2000]of integer;

Procedure Nhap;
Var i: byte;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Tim(l,r:integer);
Var g: integer;
Begin
 g:=(l+r) div 2;
 If r=l+1 then
   begin
     If a[l]=b then vt:=l;
     If a[r]=b then vt:=r;
   end
 Else If b<a[g] then Tim(l,g)
      Else Tim(g,r);
End;

BEGIN
 ClrScr;
 Nhap;
 Write('Cho so can tim vi tri: '); Readln(b);
 vt:=0;
 Tim(1,n);
 If vt=0 then Writeln('Khong tim thay ',b,' trong day A')
 Else Writeln('Vi tri cua ',b,' trong day A: ',vt);
 Readln;
END.