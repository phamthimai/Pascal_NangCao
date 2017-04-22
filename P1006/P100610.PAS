Program P100610;   {Tim dong thoi Max va Min}
Uses  Crt;
Const nmax=1000;
      inp='P10\P100610.TXT';
Var   f: text;
      n: integer;
      min,max: integer;
      a: array [1..nmax] of integer;

Procedure Nhap;
Var i: integer;
Begin
 Assign(f,inp);
 Reset(f);
 Readln(f,n);
 For i:=1 to n do Read(f,a[i]);
 Close(f);
End;

Procedure Tim;
Var i: integer;
Begin
 max:=a[1]; min:=a[1];
 For i:=2 to n do
   If a[i]>max then max:=a[i]
   Else If a[i]<min then min:=a[i];
 Writeln('Max = ',max);
 Writeln('Min = ',min);
 Readln;
End;

BEGIN
 ClrScr;
 Nhap;
 Tim;
END.