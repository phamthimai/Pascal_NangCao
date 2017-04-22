Program P121412;{Bai toan ket ban ben vung}
Uses  Crt;
Const fn = 'P12\Loigiai\P1214\KETBAN.INP';
      fg = 'P12\Loigiai\P1214\KETBAN.OUT';
      max = 100;
Var   f,m: array [1..max,1..max] of integer;
      n: integer;
      ghepf,ghepm: array [1..max] of integer;
      dd: array [1..max] of byte;

Procedure Nhap;
Var inp: text; i,k: integer;
Begin
 Assign(inp,fn); Reset(inp);
 Readln(inp,n);
 For k:=1 to n do
 begin
   For i:=1 to n do Read(inp,f[i,k]); Readln(inp);
 end;
 Readln(inp);
 For k:=1 to n do
 begin
   For i:=1 to n do  Read(inp,m[i,k]); Readln(inp);
 end;
 Close(inp);
End;

Procedure Chuanbi;
Begin
 FillChar(ghepf,SizeOf(ghepf),0);
 FillChar(ghepm,SizeOf(ghepm),0);
End;

Procedure Danhdausothich(k: integer);
Var ii,i: integer;
Begin
 For ii:=1 to n do
   If (ghepf[ii]=0) then
   begin
     i:=f[ii,k];
     If ghepm[i]=0 then dd[i]:=1;
   end;
End;

Function Thichf(i,j: integer): integer;
Var ii: integer;
Begin
 For ii:=1 to n do
   If m[i,ii]=j then
   begin
     thichf:=ii;
     exit;
   end;
End;

Procedure Ghephopsothichmin(i,k: integer);
Var ii,min,chon: integer;
Begin
 min:=n+1;
 For ii:=1 to n do
   If (ghepf[ii]=0)and(f[ii,k]=i) then
     If thichf(i,ii)<min then
     begin
       min:=thichf(i,ii);
       chon:=ii;
     end;
   ghepf[chon]:=i;
   ghepm[i]:=chon;
End;

Procedure Chonvuasothich(k: integer);
Var ii: integer;
Begin
 For ii:=1 to n do
   If dd[ii]=1 then Ghephopsothichmin(ii,k);
End;

Procedure Ghepsothich(i: integer);
Begin
 FillChar(dd,SizeOf(dd),0);
 Danhdausothich(i);
 Chonvuasothich(i);
End;

Procedure Ghepcap;
Var i: integer;
Begin
 For i:=1 to n do ghepsothich(i);
End;

Procedure Ghinhan;
Var f: text; i: integer;
Begin
 Assign(f,fg); Rewrite(f);
 For i:=1 to n do Writeln(f,i,' ',ghepf[i]);
 Close(f);
End;

BEGIN
 Clrscr;
 Nhap;
 Chuanbi;
 Ghepcap;
 Ghinhan;
END.