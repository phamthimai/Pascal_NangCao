PROGRAM Phan_khoi_record;
USES Crt;
Type
    hocsinh=record
        holot: string[18];
        ten  : string[7];
        tuoi : byte;
        lop  : string[3];
            end;
Var
    F,F10,F11,F12   :       file of hocsinh;
    A   :       hocsinh;
BEGIN
     Clrscr;
     Assign(F,'Hocsinh.sol'); Reset(f);
     Assign(F10,'khoi10.dat'); rewrite(f10);
     Assign(F11,'khoi11.dat'); rewrite(f11);
     Assign(F12,'khoi12.dat'); rewrite(f12);
     while not eof(f) do
        begin
             read(f,a);
             case a.lop[2] of
             '0': Write(f10,a);
             '1': Write(f11,a);
             '3': Write(f12,a);
             end;
        end;
     Close(f10);
     Close(f11);
     Close(f12);
     Close(f);
END.