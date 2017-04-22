Program P120211;   {Doi file}
Uses  Crt;
Const f1 = 'text.1';
      f2 = 'text.2';
      f3 = 'text.3';
      f4 = 'text.4';
      ff = 'dem.txt';

Procedure CopyFile(fi1,fi2: string);
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
 CopyFile(f1,ff);
 CopyFile(f4,f1);
 CopyFile(f3,f4);
 CopyFile(f2,f3);
 CopyFile(f1,f2);
 CopyFile(ff,f4);
END.