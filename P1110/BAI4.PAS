{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 64000,0,655360}
program bai4;
uses crt;
const
  fi            = 'bai4.inp';
  fo            = 'bai4.out';
var
  m,n           : word;
{-------------}
procedure nhapdl;
begin
  write('M, N = ');
  readln(m,n);
end;
{-------------}
procedure ghinhan;
var
  f             : text;
  i,j,dem       : word;
begin
  assign(f,fo);
  rewrite(f);
  dem:=0;
  if m mod 3=0 then
  begin
    for i:=1 to m do
    begin
      for j:=1 to n do
        write(f,dem+j:4);
      if i mod 3=0 then inc(dem,n);
      writeln(f);
    end;
  end
  else
  begin
    for i:=1 to m do
    begin
      for j:=1 to n do
      begin
        if j mod 3=1 then inc(dem);
        write(f,dem:4);
      end;
      writeln(f);
    end;
  end;
  close(f);
end;
{-------------}
begin
  clrscr;
  nhapdl;
  ghinhan;
  write('Da ghi ket qua ra file BAI4.OUT');
end.