Program P111516;{Chia luoi}
Uses crt;
Const fi = 'luoi.dat';
      fo = 'luoi.out';
      px:array[1..4] of shortint = (0,1,0,-1);
      py:array[1..4] of shortint = (-1,0,1,0);

Var f:text;
    m,n:byte;
    a,c,b:array[1..10,1..10] of byte;
    min,tong,tong2:integer;

Procedure input;
Var i,j:byte;
Begin
 Assign(f,fi);
 Reset(f);
 Readln(f,m,n);
 tong:=0;
 For i:=1 to m do
 Begin
   For j:=1 to n do
   Begin
     Read(f,a[i,j]);
     tong:=tong+a[i,j];
   End;
   Readln(f);
 End;
 close(f);
End;

Function test(x,y:byte):boolean;
Var x1,y1,i:byte;
Begin
 test:=true;
 For i:=1 to 4 do
 Begin
   x1:=x+px[i];
   y1:=y+py[i];
   If (x1 in [1..n]) and (y1 in [1..m]) and (b[y1,x1]=1) then exit;
 End;
 test:=false;
End;

Procedure tim(sum:integer);
Var i,j:byte;
Begin
 If abs(tong2-sum)<min then
 Begin
   c:=b;
   min:=tong2-sum;
 End;
 If sum>tong2 then exit;
 For i:=1 to m do
 For j:=1 to n do
 If (b[i,j]=0) and test(j,i) then
 Begin
   b[i,j]:=1;
   tim(sum+a[i,j]);
   b[i,j]:=0;
 End;
End;

Procedure work;
Begin
 Fillchar(b,sizeof(b),0);
 b[1,1]:=1;
 tong2:=tong div 2;
 min:=tong2;
 tim(a[1,1]);
End;

Procedure output;
Var i,j:byte;
Begin
 Assign(f,fo);
 ReWrite(f);
 For i:=1 to m do
 Begin
      For j:=1 to n do Write(f,' ',c[i,j]);
      Writeln(f);
 End;
 Close(f);
End;

Begin
 input;
 work;
 output;
End.