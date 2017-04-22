Program P111112;    {Tim kiem nhi phan trong file chi muc}
Uses  Crt;
Const inp='Hocsinh.dat';
      idx='Canbo.idx';
Type  Canbo=Record
              Hodem : String[25];
              Ten   : String[10];
              SoDT  : LongInt;
              Diachi: String[40];
            End;
Var   n : integer;
      ds: array [0..500] of Canbo;
      id: array [0..500] of integer;
      f : file of Canbo;
      f1: file of integer;
      Stop: boolean;
      c: char;

Procedure Nhap;
Var cb: Canbo;
Begin
 Assign(f,inp); Rewrite(f);
 Write(' Ho dem    : '); Readln(cb.Hodem);
 While cb.Hodem<>'' do
 begin
   Write(' Ten       : '); Readln(cb.ten);
   Write(' Dien thoai: '); Readln(cb.SoDT);
   Write(' Dia Chi   : '); Readln(cb.DiaChi);
   Write(f,Cb);
   Writeln;
   Write(' Ho dem    : '); Readln(cb.Hodem);
 end;
 Close(f);
End;

Procedure Doc;
Begin
 Assign(f1,inp); Reset(f1);
 n:=-1;
 While not EoF(f1) do begin Inc(n); Read(f1,id[n]); end;
 Close(f1);
End;

Procedure Doi(i,j: byte);
Var tg: Canbo; t: integer;
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
   For j:=i+1 to n do
     If (ds[i].ten+ds[i].hodem>ds[j].ten+ds[j].hodem) then Doi(i,j);
End;

Procedure In_Chimuc;
Var i: integer;
Begin
 Assign(f1,idx); Rewrite(f1);
 For i:=0 to n do Write(f1,id[i]);
 Close(f1);
End;

Procedure Timkiem;
Var cb,cb1: Canbo; i,l,r,m: integer; Ok: boolean;
Begin
 Write(' Ho dem    :'); Readln(cb.Hodem);
 Write(' Ten       :'); Readln(cb.ten);
 l:=0; r:=FileSize(f); Ok:=false; m:=(l+r) div 2;
 Repeat
   Seek(f1,m); Read(f1,i); Seek(f,i); Read(f,cb1);
   If (cb.Ten+cb.Hodem=cb1.Ten+cb1.Hodem) then Ok:=true
   Else
   begin
     If (cb.Ten+cb.Hodem>cb1.Ten+cb1.Hodem) then l:=m+1
     Else r:=m;
     m:=(l+r) div 2;
   end;
 Until (l=r)or(Ok);
 If not Ok then Write('Khong co.')
 Else
 begin
   Write(' Dien thoai: ',cb1.SoDT);
   Write(' Dia Chi   : ',cb1.DiaChi);
   Writeln;
 end;
End;

BEGIN
{ Nhap;
 Doc;
 Sapxep;
 In_Chimuc;}
 Assign(f,inp);  Reset(f);
 Assign(f1,idx); Reset(f1);
 Repeat
   Stop:=false;
   Timkiem;
   Write('Co tim nua khong (C/K)? '); c:=ReadKey;
   c:=UpCase(c);
   Writeln(c);
   If c='K' then Stop:=true;
 Until Stop;
 Close(f); Close(f1);
END.
