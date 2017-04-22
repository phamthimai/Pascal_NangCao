Program P110615;    {Lap file chi muc}
Uses Crt;
Type Hocsinh=Record
               Ten : String[30];
               Tuoi: Byte;
             End;
Var  n : integer;
     ds: array [0..500] of Hocsinh;
     id: array [0..500] of integer;

Procedure Nhap;
Const inp='Hocsinh.dat';
Var   f : file of Hocsinh;
Begin
 Assign(f,inp); Reset(f);
 n:=-1;
 While not EoF(f) do begin Inc(n); Read(f,ds[n]); end;
 Close(f);
End;

Procedure Doi(i,j: byte);
Var tg: Hocsinh; t: integer;
Begin
 tg:=ds[i];    t:=id[i];
 ds[i]:=ds[j]; id[i]:=id[j];
 ds[j]:=tg;    id[j]:=t;
End;

Procedure Sapxep;
Var i,j: integer;
Begin
 For i:=0 to n do id[i]:=i;
 For i:=0 to n-1 do
   For j:=i+1 to n do If (ds[i].ten>ds[j].ten) then Doi(i,j);
End;

Procedure In_Chimuc;
Const idx='Hocsinh.idx';
Var f1: file of integer; i: integer;
Begin
 Assign(f1,idx); Rewrite(f1);
 For i:=0 to n do Write(f1,id[i]);
 Close(f1);
End;

BEGIN
 Nhap;
 Sapxep;
 In_Chimuc;
END.
