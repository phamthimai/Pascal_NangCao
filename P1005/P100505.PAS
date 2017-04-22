Program P100505;{Tim so o vuong trong ma tran}
Uses Crt;
Const fin = 'ngang.inp';
      fid = 'doc.inp';

Var nga,doc:array[1..100,1..100] of byte;
    f:text;
    n:byte;

Procedure input;
Var i,j:byte;
Begin
 Assign(f,fin);
 Reset(f);
 n:=0;
 while not eoln(f) do
 Begin
   inc(n);
   Read(f,nga[1,n]);
 End;
 Readln(f);
 For i:=1 to n do
 Begin
   For j:=1 to n do Read(f,nga[i+1,j]);
   Readln(f);
 End;
 inc(n);
 close(f);
 assign(f,fid);
 reset(f);
 For i:=1 to n-1 do
 Begin
   For j:=1 to n do Read(f,doc[i,j]);
   Readln(f);
 End;
 close(f);
End;

Procedure work;
Var i,j,dem:byte;
    s:word;
Begin
 s:=0;
 For i:=1 to n-1 do
 For j:=1 to n-1 do
 If nga[i,j]+nga[i+1,j]+doc[i,j]+doc[i,j+1]=4 then inc(s);
 Writeln;
 Writeln('So o vuong la : ',s);
End;

Begin
 input;
 work;
 Readln;
End.