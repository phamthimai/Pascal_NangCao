PROGRAM sort_khoi_record;
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
    A   :       Array[1..20] of hocsinh;
    i   :       integer;
Procedure Nhap;
     Begin
          Assign(F,'hocsinh.Inp'); reset(f);
          for i:=1 to 20 do read(f,a[i]);
          Close(f);
     End;
Function lonhon(S1,s2:string):boolean;
   var i,long:byte;
     Begin
          lonhon:=true;
          If ( length(s1)>length(s2) ) and (pos(s2,s1)<>0) then exit;
          long:=length(s1);
          If length(s2)<long then long:=length(s2);
          for i:=1 to long do
             If S1[i]<>S2[i] then
                begin
                    If S1[i]>s2[i] then exit;
                    If s1[i]<s2[i] then
                        begin
                             lonhon:=false;
                             exit;
                        end;
                end;
     End;
Procedure Hoanvi(x,y:byte);
  var tg:hocsinh;
     Begin
          tg:=a[x];
          a[x]:=a[y];
          a[y]:=tg;
     End;
Procedure sort;
   Var i,j:byte;
     Begin
          For i:=1 to 19 do
             for j:=i+1 to 20 do
               If copy(a[i].lop,1,2)>copy(a[j].lop,1,2) then hoanvi(i,j);
     End;
Procedure hienthi;
     Begin
          For i:=1 to 20 do
          with a[i] do
             begin
                  Writeln('ho lot:',holot);
                  Writeln('ten:',ten);
                  Writeln('tuoi:',tuoi);
                  Writeln('lop:',lop);
                  If i<20 then Writeln('-----------------------');
             end;
     End;
BEGIN
     Clrscr;
     Nhap;
     Sort;
     Hienthi;
END.