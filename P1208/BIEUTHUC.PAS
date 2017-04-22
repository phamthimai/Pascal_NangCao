{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q+,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
uses crt;
  const
         MN = 200;
         fn = 'bieuthuc.inp';

  type
         mangst = array[1..MN] of string[9];
         manggt = array[1..MN] of longint;
         mangit = array[1..MN] of integer;

  var
    tenbien:mangst;
    giatri:manggt;
    tri,stack:manggt;
    ten:mangst;
    p:mangit;
    s,hang,bien:string;
    so,sb,st,ip,sst,slb:longint;
    sym:char;
    f:text;
(*--------*)
procedure docbien;
  var s1:string;
      i:integer;
begin
  slb:=0;
  while not eof(f) do
    begin
      readln(f,s1);
      i:=1; inc(slb); tenbien[slb]:='';
      while s1[i] <> '=' do
        begin
          if s1[i] <>' ' then tenbien[slb]:= tenbien[slb] + upcase(s1[i]);
          inc(i);
        end;
      giatri[slb]:=0;
      while i <= length(s1) do
        begin
          if s1[i] in ['0'..'9'] then
            giatri[slb]:= giatri[slb] * 10 + ord(s1[i]) - ord('0');
          inc(i);
        end;
    end;
  for i:=1 to slb do
    while length(tenbien[i]) < 8 do tenbien[i]:= tenbien[i] + ' ';
end;

procedure nhap;

begin
  assign(f,fn);
  reset(f);
  readln(f,s);
  docbien;
  close(f);
end;

procedure loi(i:byte);
begin
  case i of
    1: write('Khong hop li ');
  end;
end;

procedure init;
  var i:integer;
begin
  for i:=1 to length(s) do s[i]:= upcase(s[i]);
  sb:= 1; st:=0; ip:=0;sst:=0;
end;


procedure cach;
begin
  while s[sb] = ' ' do inc(sb);
end;

function getnum:longint;
begin
  so:=0;
  while s[sb] in ['0' ..'9'] do
    begin
      so:= so*10+(ord(s[sb]) - ord('0'));
      inc(sb);
    end;
end;

procedure getvar;
begin
  bien:='';
  while s[sb] in ['A'..'Z','0'..'9'] do
    begin
      bien:= bien+s[sb]; inc(sb);
    end;
  while length(bien) <8 do bien:= bien+ ' ';
end;

procedure getsym;
begin
  cach;
  case s[sb] of
    '(':begin sym:=s[sb]; inc(sb); end;
    ')':begin sym:=s[sb]; inc(sb); end;
    '+':begin sym:=s[sb]; inc(sb); end;
    '-':begin sym:=s[sb]; inc(sb); end;
    '*':begin sym:=s[sb]; inc(sb); end;
    '/':begin sym:=s[sb]; inc(sb); end;
    '%':begin sym:=s[sb]; inc(sb); end;
    '0' ..'9':begin sym:='0'; getnum; end;
    'A' ..'Z':begin sym:='A'; getvar; end;
    else sym:= #0;
  end;
end;

function findso:integer;
  var i:integer;
begin
  for i:=1 to st do
    if ten[i] = '         ' then
      if tri[i] = so then
        begin
          findso:= i;
          exit;
        end;
  inc(st); ten[st]:='         '; tri[st]:=so;
  findso:= st;
end;

function findbien:integer;
  var i:integer;
begin
  for i:=1 to st do
    if pos(bien,ten[i]) >0 then
      begin
        findbien := i;
        exit;
      end;
  inc(st); ten[st]:='?'+bien;
  findbien:=st;
end;

function finddau(c:char):integer;
begin
  case c of
    '+':finddau:= -1;
    '-':finddau:= -2;
    '*':finddau:= -3;
    '/':finddau:= -4;
    '%':finddau:= -5;
    '#':finddau:= -6;
  end;
end;

procedure bieuthuc;
  var
    i:integer;
    daubt:char;
    procedure hangtu;
      var
        i:integer;
        procedure nhantu;
          var i:integer;
        begin
          while sym in ['0','A','('] do
            begin
              case sym of
                '0': begin i:= findso; inc(ip); p[ip]:= i; end;
                'A': begin i:= findbien; inc(ip); p[ip]:= i; end;
                '(': begin getsym; bieuthuc;
                           if sym <> ')' then loi(1); end;
               end;
               getsym;
            end;
        end;
    begin
      nhantu;
      while sym in ['*','/','%'] do
        begin
          i:= finddau(sym);
          getsym;
          nhantu; inc(ip); p[ip]:= i;
        end;
    end;
begin
  if sym in ['+','-'] then
    begin
      daubt := sym;
      getsym
    end else daubt:='+';
  hangtu;
  if daubt = '-' then begin i:= finddau('#'); inc(ip); p[ip]:=i; end;
  while sym in['+','-'] do
    begin
      daubt:=sym;
      getsym;
      hangtu;
      i:= finddau(daubt); inc(ip); p[ip]:=i;
    end;
end;

procedure tinh(i:integer);
begin
  case p[i] of
    -1:begin stack[sst-1]:=stack[sst-1] + stack[sst]; dec(sst); end;
    -2:begin stack[sst-1]:=stack[sst-1] - stack[sst]; dec(sst); end;
    -3:begin stack[sst-1]:=stack[sst-1] * stack[sst]; dec(sst); end;
    -4:begin stack[sst-1]:=stack[sst-1] div stack[sst]; dec(sst); end;
    -5:begin stack[sst-1]:=stack[sst-1] mod stack[sst]; dec(sst); end;
    -6:begin stack[sst]:=-stack[sst] end;
  end;
end;

procedure napso(i:integer);
begin
  inc(sst);
  stack[sst]:= tri[p[i]];
end;

procedure hoiso(i:integer);
  var j:integer;
begin
  delete(ten[p[i]],1,1);
  {write(ten[p[i]],' = '); readln(tri[p[i]]);}
  tri[p[i]]:=0;
  for j:=1 to slb do
  if tenbien[j] = ten[p[i]] then
  begin tri[p[i]]:= giatri[j]; break; end;
  insert('&',ten[p[i]],1);
end;

procedure tinhtoan;
  var i:integer;
begin
  for i:=1 to ip do
    begin
      if p[i] <0 then tinh(i) else
      case ten[p[i],1] of
          ' ':napso(i);
          '?':begin hoiso(i); napso(i); end;
          '&':napso(i);
        end;
    end;
end;

procedure viet;
  var i:integer;
begin
  writeln(s);
  write(stack[1]);
end;


BEGIN
  clrscr;
  nhap;
  init;
  getsym;
  bieuthuc;
  tinhtoan;
  viet;
  readln;
END.