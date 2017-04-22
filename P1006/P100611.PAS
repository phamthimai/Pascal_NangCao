Program P100611;   {Tim dong thoi Max va Min}
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
Var i,min2,max2: integer;
Begin
 max:=-maxint; min:=maxint;
 For i:=0 to (n div 2)-1 do
 begin
   If a[2*i+1]>a[2*i+2] then begin max2:=a[2*i+1]; min2:=a[2*i+2]; end
   Else begin max2:=a[2*i+2]; min2:=a[2*i+1]; end;
   If max2>max then max:=max2;
   If min2<min then min:=min2;
 end;
 If Odd(n) then
 begin
   If a[n]>max then max:=a[n];
   If a[n]<min then min:=a[n];
 end;
 Writeln('Max = ',max);
 Writeln('Min = ',min);
End;

BEGIN
 ClrScr;
 Nhap;
 Tim;
END.