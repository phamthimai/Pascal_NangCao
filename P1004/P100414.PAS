Program P100414; {Doi cot thu p va cot thu q cua ma tran A}
Uses Crt;
Var  A: array[1..50,1..50] of integer;
     i,j,n,p,q: integer;

Procedure Nhap;
Begin
 Clrscr;
 Write('Nhap kich thuoc cua mang vuong: n = '); Readln(n);
 Writeln('Nhap mang A: ');
 For i:=1 to n do
   begin For j:=1 to n do Read(a[i,j]); Readln; end;
 Write('Nhap p,q: '); Readln(p,q);
End;

Procedure Xuat;
Begin
 Writeln('Mang A doi cho cot thu ',p,' va cot thu ',q,' la:');
 For i:=1 to n do
   begin For j:=1 to n do write(a[i,j]:4); Writeln; end;
 Readln;
End;

Procedure Doicot(p,q: integer);
Var i,tg: integer;
Begin
 For i:=1 to n do begin tg:=a[i,p]; a[i,p]:=a[i,q]; a[i,q]:=tg; end;
End;

BEGIN
 Nhap;
 Doicot(p,q);
 Xuat;
END.
