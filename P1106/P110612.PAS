Program P110612;  {xoa mot ban ghi tai vi tri tuy chon}
Uses  Crt;
Const inp='Hocsinh.dat';
      Tg ='Trunggian.d';
Type  Hocsinh=Record
                Ten : String[30];
                Tuoi: Byte;
              End;
Var   f1,f2: file of Hocsinh;
      Hs: Hocsinh;
      i,k: integer;

BEGIN
 Write('Thu tu ban ghi muon xoa: '); Readln(k);
 Assign(f1,inp); Reset(f1);
 Assign(f2,Tg);  Rewrite(f2);
 For i:=0 to k-1 do
 begin
   Read(f1,Hs); Write(f2,Hs);
 end;
 Read(f1,Hs);  {bo qua ban ghi nay}
 While not EoF(f1) do
 begin
   Read(f1,Hs); Write(f2,Hs);
 end;
 Close(f1); Close(f2);
 Erase(f1);
 Rename(f2,inp);
END.