Program P111115b;   {Tim ma tran lien thong}
Uses  Crt;
Const MN=100;
      fn='inp.dat';
      gn='out.dat';
Type  mang2=array [1..MN,1..MN] of byte;
      mang1=array [1..MN] of byte;
Var   a,b: mang2;
      st,kt: mang1;
      n,s: integer;
      f: text;

Procedure Nhap;
Var i,j: integer;
Begin
 Assign(f,fn); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
End;

Procedure Xuat;
Var i,j: integer;
Begin
 Assign(f,gn); Rewrite(f);
 Writeln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Write(f,b[i,j]); Writeln(f);
 end;
 Close(f);
End;

Procedure Xuli;
Var d,i,sst: integer;
Begin
 For s:=1 to n do
 begin
   FillChar(kt,Sizeof(kt),0);
   sst:=1; st[sst]:=s; d:=0;
   While (d<sst) do
   begin
     Inc(d);
     For i:=1 to n do
       If (a[st[d],i]=1)and(kt[i]=0) then
       begin
         Inc(sst); st[sst]:=i; kt[i]:=1; b[s,i]:=1;
       end;
   end;
 end;
End;

BEGIN
 Nhap;
 Xuli;
 Xuat;
END.