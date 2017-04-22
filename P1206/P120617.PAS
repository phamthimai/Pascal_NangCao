{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program P120617;  {Kiem tra ma tran co kha nghich hay khong}
Uses  Crt;
Const max=100;
      Fi='P1206\bdmt.Inp';
      Fo='Checkkn.Out';
Var   A   : Array [1..max,1..max+1] of real;
      X   : Array [1..max] of real;
      N   : byte;
      f,f1: Text;

Procedure Nhap;
Var i,j: byte;
Begin
 Assign(f,fi); Reset(f);
 Readln(f,N);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Ketthuc;
Begin
 Assign(f1,fo); Rewrite(f1);
 Writeln(f1,'Khong kha nghich');
 Close(f1);
End;

Function Tim(x: byte): byte;
Var i: byte;
Begin
 tim:= 0;
 For i:=x+1 to n do
   If a[i,x]<>0 then
   begin
     Tim:=i;
     exit;
   end;
End;

Procedure Bdcs1h(j,y: byte);
Var i: byte; tg: real;
Begin
 For i:=1 to n+1 do
 begin
   tg:=a[j,i];
   a[j,i]:=a[y,i];
   a[y,i]:=tg;
 end;
End;

Procedure Bdcs3h(y,j: byte; nho: real);
Var i: byte;
Begin
 For i:=1 to N+1 do A[y,i]:=a[y,i]-nho*a[j,i];
End;

Procedure Bdcs2h(x: byte; nho: real);
Var i: byte;
Begin
 For i:=1 to n do A[x,i]:=a[x,i]*nho;
End;

Procedure Khu_lan1;
Var i,j: byte; nho: real;
Begin
 For i:=1 to n do
 begin
   If a[i,i]=0 then
   begin
     j:=tim(i);
     If j<>0 then Bdcs1h(i,j)
     Else
     begin
       Ketthuc;
       Halt;
     end;
   end;
   Bdcs2H(i,1/a[i,i]);
   For j:=i+1 to n do Bdcs3H(j,i,a[j,i]);
 end;
End;

Procedure Khu_lan2;
Var i,j: byte;
Begin
 For i:=1 to N-1 do
   For j:=i+1 to n do bdcs3h(i,j,a[i,j]);
End;

Procedure Xuly;
Begin
 Khu_lan1;
 Khu_lan2;
 Assign(f1,fo); Rewrite(f1);
 Writeln(f1,'kha nghich');
 Close(f1);
End;

BEGIN
 Clrscr;
 Nhap;
 Xuly;
END.