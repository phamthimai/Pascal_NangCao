Program P121406; {Tim xau con chung dai nhat}
Uses  Crt;
Const Inp ='P121406.inp';
      Out ='P121406.out';
      Lmax=150;
Type  Xau =string[Lmax];
Var   f: text;
      XauChung,s1,s2: Xau;
      a: array[0..Lmax,0..Lmax] of integer;

Procedure Nhap;
Begin
 Assign(f,Inp); Reset(f);
 Readln(f,s1); Readln(f,s2);
 Close(f);
End;

Function Best(i,j: integer): integer;
Var gt:	integer;
Begin
 gt:=a[i-1,j];
 If gt<a[i,j-1] then gt:=a[i,j-1];
 If s1[i]=s2[j] then
   If gt<a[i-1,j-1]+1 then gt:=a[i-1,j-1]+1;
 Best:=gt;
End;

Procedure QuyHoach;
Var l1,l2: integer; i,j: integer;
Begin
 Fillchar(a,sizeof(a),0);
 l1:=length(s1); l2:=length(s2);
 For i:=1 to l1 do
   For j:=1 to l2 do a[i,j]:=Best(i,j);
End;

Procedure XetNguoc(Var i,j: integer);
Begin
 If a[i,j]=a[i-1,j] then dec(i)
 Else If a[i,j]=a[i,j-1] then dec(j)
      Else
      begin
        XauChung:=s1[i]+XauChung;
	dec(i);
	dec(j);
      end;
End;

Procedure TimXau;
Var i,j: integer;
Begin
 i:=length(s1); j:=length(s2);
 XauChung:='';
 While (i<>0)and(j<>0) do XetNguoc(i,j);
End;

Procedure GhiNhan;
Begin
 Assign(f,Out); Rewrite(f);
 Writeln(f,XauChung);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 QuyHoach;
 TimXau;
 GhiNhan;
END.