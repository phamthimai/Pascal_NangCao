PROGRAM NGHI_PHEP;
USES Crt;
Type
    Tle=record
     ngay,thang:  byte;
     ten       :  String[40];
     songay    :  byte;
        end;
Var
     F          :       file of Tle;
     A          :       Tle;
     Deml,Demsn :       word;
     Quy        :       Array[1..12,1..3] of Word;
     demq       :       byte;
Procedure Nhap;
   var ck:char;
     Begin
          Assign(F,'nghi_le.dat'); rewrite(f);
          Writeln('Nhap so lieu cac ngay le trong nam');
          repeat
              Clrscr;
              Write('Ngay:'); readln(a.ngay);
              Write('Thang:'); readln(a.thang);
              Write('Ten:'); readln(a.ten);
              Write('So ngay nghi:'); readln(a.songay);
              Write(f,a);
              Write('Ban co nhap nua khong:'); readln(ck);
          until upcase(ck)='N';
          Close(f);
     End;
Procedure Cau1;
     Begin
          Assign(F,'nghi_le.dat'); reset(f);
          deml:=0; demsn:=0;      {tong so ngay le,ngay nghi}
          While not eof(f) do
             begin
                  read(f,a);
                  inc(deml);
                  inc(demsn,a.songay);
             end;
          Close(f);
     End;
Procedure cau2;
   Var i:byte;
     Begin
          Fillchar(quy,sizeof(quy),0);
          demq:=0;
          Write('nhap so quy trong nam:'); readln(demq);
          for i:=1 to demq do
             begin
                  Write('tu thang:'); readln(quy[i,1]);
                  Write('den thang:'); readln(quy[i,2]);
             end;
         Assign(F,'ngile.dat'); reset(f);
         While not eof(f) do
           begin
                read(f,a);
                for i:=1 to demq do
                if (a.thang>=quy[i,1]) and (a.thang<=quy[i,2]) then inc(quy[i,3]);
           end;
         Close(f);
     End;
Procedure Output1;
     Begin
          Writeln('So ngay le trong nam:',deml);
          Writeln('So ngay nghi trong nam:',demsn);
     End;
Procedure Output2;
   Var i:byte;
     Begin
          For i:=1 to demq do Writeln('So ngay nghi cua quy ',i,':',quy[i,3]);
     End;
BEGIN
     Clrscr;
     Nhap;
     Cau1;
     Cau2;
     Output1;
     Output2;
END.