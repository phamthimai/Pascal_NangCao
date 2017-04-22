Program P120208;  {Gan hai file}
Uses  Crt;
Const f1='file1.txt';
      f2='file2.txt';

Procedure Copyfile(fi1,fi2: string);
Var nread,nbuf: word;
    buf: array [1..1024] of byte;
    f1,f2: file;
Begin
 Assign(f1,fi1); Reset(f1,1);
 Assign(f2,fi2); Rewrite(f2,1);
 nbuf:=1024;
 Repeat
   Blockread(f1,buf,nbuf,nread);
   Blockwrite(f2,buf,nread);
 Until nread<>nbuf;
 Close(f1); Close(f2);
End;

BEGIN
 Copyfile(f1,f2);
END.