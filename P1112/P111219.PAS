{$B-}
Program P111219;   {Me cung}
Uses  Crt;
Const inp='P11\P1112\P111219.inp';
      out='P111219.out';
Var   a,pred: array [1..100,1..100] of byte;
      first,last,so: integer;
      m,n,k,l,i,j,dr,cr: byte;
      q: array [1..2,1..10000] of byte;
      f: text;

Procedure Nhap;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,m,n,k,l);
 For i:=1 to m do
   For j:=1 to n do Read(f,a[i,j]);
 Close(f);
End;

Procedure Tim;
Begin
 FillChar(pred,SizeOf(pred),0);
 First:=1; Last:=1;
 q[1,first]:=k; q[2,first]:=l;
 pred[k,l]:=1;
 dr:=0; cr:=0;
 While first<=last do
 begin
   i:=q[1,first]; j:=q[2,first];
   Inc(first);
   If (i=1)or(i=m)or(j=1)or(j=n) then
   begin
     dr:=i; cr:=j;
     exit;
   end;
   If (i>1)and(pred[i-1,j]=0)and(a[i-1,j]=0) then
   begin
     pred[i-1,j]:=4;
     If (i-1=1) then begin dr:=i-1; cr:=j; exit; end;
     Inc(last); q[1,last]:=i-1; q[2,last]:=j;
   end;
   If (i<m)and(pred[i+1,j]=0)and(a[i+1,j]=0) then
   begin
     pred[i+1,j]:=2;
     If (i+1=m) then begin dr:=i+1; cr:=j; exit; end;
     Inc(last); q[1,last]:=i+1; q[2,last]:=j;
   end;
   If (j>1)and(pred[i,j-1]=0)and(a[i,j-1]=0) then
   begin
     pred[i,j-1]:=3;
     If (j-1=1) then begin dr:=i; cr:=j-1; exit; end;
     Inc(last); q[1,last]:=i; q[2,last]:=j-1;
   end;
   If (j<n)and(pred[i,j+1]=0)and(a[i,j+1]=0) then
   begin
     pred[i,j+1]:=1;
     If (j+1=n) then begin dr:=i; cr:=j+1; exit; end;
     Inc(last); q[1,last]:=i; q[2,last]:=j+1;
   end;
 end;
End;

Procedure Viet;
Begin
 Assign(f,out); Rewrite(f);
 If dr+cr=0 then Writeln(f,'KHONG')
 Else
 begin
   so:=1;
   Writeln(f,'CO');
   i:=dr; j:=cr; q[1,so]:=i; q[2,so]:=j;
   While (i<>k)or(j<>l) do
   begin
     If pred[i,j]=1 then begin Dec(j); Inc(so); q[1,so]:=i; q[2,so]:=j; end;
     If pred[i,j]=2 then begin Dec(i); inc(so); q[1,so]:=i; q[2,so]:=j; end;
     If pred[i,j]=3 then begin Inc(j); Inc(so); q[1,so]:=i; q[2,so]:=j; end;
     If pred[i,j]=4 then begin Inc(i); Inc(so); q[1,so]:=i; q[2,so]:=j; end;
   end;
   For i:=so downto 1 do Writeln(f,q[1,i]:4,q[2,i]:4);
 end;
 Close(f);
End;

BEGIN
 Nhap;
 Tim;
 Viet;
END.
5 5 3 2
1 1 1 1 1
1 0 0 0 1
1 0 1 0 1
1 1 1 0 1
0 0 1 0 1