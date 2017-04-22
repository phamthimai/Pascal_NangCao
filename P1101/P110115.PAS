Program P110115;  {tim diem thuoc tat ca cac hinh chu nhat}
Uses  Crt;
Const inp='P110115.INP';
Var   a: array [1..4,1..100] of real;
      x1,y1,x2,y2: real;
      n,i: integer;

Procedure Nhap;
Var i: integer; f: text;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do Readln(f,a[1,i],a[2,i],a[3,i],a[4,i]);
 Close(f);
End;

Function Giao(i: integer): boolean;
Begin
 If x1<a[1,i] then x1:=a[1,i];
 If x2>a[3,i] then x2:=a[3,i];
 If y1<a[2,i] then y1:=a[2,i];
 If y2>a[4,i] then y2:=a[4,i];
 If (x1<=x2)and(y1<=y2) then Giao:=true Else Giao:=false;
End;

BEGIN
 Nhap;
 Clrscr;
 For i:=1 to n do
   Writeln(a[1,i]:8:1,a[2,i]:8:1,a[3,i]:8:1,a[4,i]:8:1);
 Writeln;
 x1:=a[1,1]; y1:=a[2,1]; x2:=a[3,1]; y2:=a[4,1];
 i:=1; While (i<=n)and Giao(i) do Inc(i);
 If i>n then
   Write('Co diem thuoc tat ca cac hinh CN:',x1:8:1,y1:8:1,x2:8:1,y2:8:1)
 Else Write('Khong co diem nao thuoc tat ca cac hinh CN.');
 Readln;
END.