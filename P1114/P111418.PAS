Program P111418;   {cuc dai hoa lap phuong}
Uses  Crt;
Const fi='P111418.inp';
Var   a: array [1..6,1..6] of byte;
      b,dx,ds,hv: array [1..7] of byte;
      max: integer;
      i: byte;

Procedure Input;
Var i,j,k: byte; f: text;
Begin
 Assign(f,fi); Reset(f);
 For i:=1 to 4 do
 Begin
   For j:=i to 4 do
   Begin
      Read(f,k);
      a[i,k]:=1;
      a[k,i]:=1;
   End;
   Readln(f);
 End;
 For i:=1 to 6 do Read(f,b[i]);
 Close(f);
End;

Procedure Tim(k,t: byte);
Var i: byte; tong: integer;
Begin
 If(t=hv[1]) and ((k<>1) and (k<>7)) then exit;
 hv[k]:=t;
 If k=7 then
 Begin
   For i:=1 to 6 do tong:=tong+i*b[hv[i]];
   If tong>max then
   Begin
     ds:=hv;
     max:=tong;
   End;
 End
 else
 For i:=1 to 6 do
 If (dx[i]=0) and (a[t,i]=1) then
 Begin
   dx[i]:=1;
   tim(k+1,i);
   dx[i]:=0;
 End;
End;

BEGIN
  input;
  max:=0;
  For i:=1 to 6 do tim(1,i);
  For i:=1 to 6 do write(' ',ds[i]);
  Readln;
END.