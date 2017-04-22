PROGRAM Biendoi_record;
USES Crt;
Type
    hocsinh1=record
        holot: string[18];
        ten  : string[7];
        tuoi : byte;
        lop  : string[3];
            end;
    hocsinh2=record
        hoten: string[26];
        tuoi : byte;
        khoi : integer;
        lop  : char;
            end;
Var
    F1,F2   :       file of hocsinh1;
    A       :       hocsinh1;
    B       :       hocsinh2;
    I,code  :       integer;
BEGIN
     Clrscr;
     Assign(F1,'Hocsinh1.dat'); Reset(f1);
     Assign(F2,'hocsinh2.dat'); rewrite(f2);
     while not eof(f1) do
        begin
             read(f1,a);
             B.hoten:=A.holot+' '+a.ten;
             B.tuoi:=A.tuoi;
             Val(copy(a.lop,1,2),I,code);
             B.khoi:=I;
             B.lop:=a.lop[3];
        end;
     Close(f2);
     Close(f1);
END.