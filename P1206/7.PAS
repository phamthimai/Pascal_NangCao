USES crt;
Type
    sach=record
       tacgia:string[26];
       ten   :string[40];
       nam   :word;
           end;
Var
   F    :       file of sach;
   A    :       Sach;
   name :       string[40];
   year :       word;
Procedure Nhap;
    Begin
         Assign(F,'sach.dat'); rewrite(f);
         Writeln('Nhap cho den khi tac gia=''!');
         Repeat
             A.tacgia:='';
             A.ten:='';
             A.nam:=0;
             Write('ten tac gia:'); readln(a.tacgia);
             Write('ten sach:'); readln(a.ten);
             Write('nam xuat ban:'); readln(a.nam);
             If a.tacgia<>'' then Write(f,a);
         Until a.tacgia='';
         Close(f);
    End;
Procedure Cau1;
  var ck:char;
     dem:longint;
    Begin
         Repeat
             Write('tac gia:'); readln(name);
             Write('nam xuat ban:'); readln(year);
             Assign(F,'sach.dat'); reset(f);
             dem:=0; {so quyen sach co cac dieu kien tren}
             While not eof(f) do
                begin
                     read(F,a);
                     if (a.tacgia=name) and (a.nam=year) then
                        begin
                             inc(dem);
                             Writeln(dem,':');
                             Writeln('ten sach:',a.ten);
                        end;
                end;
             Close(f);
             Repeat
               Write('Ban co muon tim nua khong Y - N:'); readln(ck);
             Until upcase(ck) in ['Y','N'];
         Until upcase(ck)='N';
    End;
Procedure Cau2;
  var ck:char;
  dem:longint;
    Begin
         repeat
             Write('ten sach :'); readln(name);
             Assign(F,'sach.dat'); reset(f);
             dem:=0; {so quyen sach co cac dieu kien tren}
             While not eof(f) do
                begin
                     read(F,a);
                     if a.ten=name then
                        begin
                             inc(dem);
                             Writeln(dem,':');
                             Writeln('tac gia:',a.tacgia);
                             Writeln('nam xuat ban:',a.nam);
                        end;
                end;
             Close(f);
             Repeat
               Write('Ban co muon tim nua khong Y - N:'); read(ck);
             Until upcase(ck) in ['Y','N'];
         until ck='N'
    End;
BEGIN
   Nhap;
   Cau1;
   Cau2;
END.