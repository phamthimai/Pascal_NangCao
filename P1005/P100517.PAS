Program P100517;   {So lon nhat co cac chu so giam dan}
Uses  Crt;
Const nmax=500;
      inp='INP.TXT';
Type  so=string[10];
Var   f: text;
      l_max: byte;
      n: integer;
      opt,temp: so;
      a: String;
      l,pre: array [1..nmax] of integer;

Procedure Nhap;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,a);
 Close(f);
 n:=Length(a);
End;

Procedure cbi;
Var i,j:integer;
Begin
 FillChar(pre,Sizeof(pre),0);
 For i:=1 to n do l[i]:=1;
 For i:=2 to n do
   For j:=1 to i-1 do
     If (a[i]<a[j])and(l[j]+1>=l[i]) then
     begin
       l[i]:=l[j]+1;
       pre[i]:=j;
     end;
End;

Procedure Tim(k: integer);
Begin
 temp:=a[k]+temp;
 If pre[k]>0 then tim(pre[k]);
End;

Procedure Xu_ly;
Var i: integer;
Begin
 l_max:=0;
 For i:=1 to n do
   If l_max<l[i] then l_max:=l[i];
 opt:='';
 For i:=1 to l_max do opt:=opt+'0';
 For i:=1 to n do
   If l[i]=l_max then
   begin
     temp:='';
     Tim(i);
     Writeln(temp);
     If temp>opt then opt:=temp;
   end;
 Writeln('So lon nhat: ',opt);
End;

BEGIN
 ClrScr;
 Nhap;
 Cbi;
 Xu_ly;
END.
64562372361247120686005007710137667690