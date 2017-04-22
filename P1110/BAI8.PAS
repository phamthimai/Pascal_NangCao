{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+}
{$M 64000,0,655360}
program bai8;
uses crt;
const
  fi            = 'bai8.inp';
  fo            = 'bai8.out';
var
  n             : word;
  ok            : boolean;
{-------------}
procedure nhapdl;
begin
  write('N = ');
  readln(n);
end;
{-------------}
procedure ghinhan;
var
  f             : text;
  i,j,k,t       : byte;
begin
  assign(f,fo);
  rewrite(f);
  ok:=n mod 3=0;
  if not ok then write(f,'KHONG CO')
  else
  begin
    writeln(f,'CO');
    for k:=1 to n do
    begin
      writeln(f);
      for i:=1 to n do
      begin
        if i mod 3=2 then t:=0
        else t:=1;
        for j:=1 to n do
          write(f,t:2);
        writeln(f);
      end;
    end;
  end;
  close(f);
end;
{-------------}
begin
  clrscr;
  nhapdl;
  ghinhan;
  write('Da ghi ket qua ra file BAI8.OUT');
end.