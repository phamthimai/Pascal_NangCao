Program P110605;  {Tao mot tep cac so nguyen}
Uses Crt;
Var  i: Integer;
     f: file of Integer;

BEGIN
  Assign(f,'Thu.dat'); Rewrite(f);
  For i:=1 to 1000 do Write(f,i);
  Close(f);
END.