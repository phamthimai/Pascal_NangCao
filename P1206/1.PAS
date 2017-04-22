PROGRAM Lop11A_record;
USES Crt;
Type
    hocsinh=record
        holot: string[18];
        ten  : string[7];
        tuoi : byte;
        lop  : string[3];
            end;
Var
    F   :       file of hocsinh;
    A   :       hocsinh;
    i   :       integer;
BEGIN
     Clrscr;
     Assign(F,'Hocsinh.sol'); Reset(f);
     Writeln('Danh sach hoc sinh lop 11A');
     while not eof(f) do
        begin
             read(f,a);
             if a.lop='11A' then
               with a do
                 begin
                      Writeln('holot:',holot);
                      Writeln('ten:',ten);
                      Writeln('tuoi:',tuoi)
                 end;
        end;
     Close(f);
END.