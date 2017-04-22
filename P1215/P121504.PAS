Program P121504;  {IOI 94}
Var inp, out: text;
    a,b,c,d,e,f,g,h,i: integer;
    t: array [1..9] of integer;

BEGIN
 Assign(inp,'input.txt'); Reset(inp);
 Readln(inp,a,b,c,d,e,f,g,h,i);
 t[1]:=(8+  a+2*b+  c+2*d+2*e  -f+  g  -h    ) mod 4;
 t[2]:=(    a+  b+  c+  d+  e+  f+2*g+    2*i) mod 4;
 t[3]:=(8+  a+2*b+  c  -d+2*e+2*f      -h+  i) mod 4;
 t[4]:=(    a+  b+2*c+  d+  e+      g+  h+2*i) mod 4;
 t[5]:=(4+  a+2*b+  c+2*d  -e+2*f+  g+2*h+  i) mod 4;
 t[6]:=(  2*a+  b+  c+      e+  f+2*g+  h+  i) mod 4;
 t[7]:=(8+  a  -b+    2*d+2*e  -f+  g+2*h+  i) mod 4;
 t[8]:=(  2*a+    2*c+  d+  e+  f+  g+  h+  i) mod 4;
 t[9]:=(8      -b+  c  -d+2*e+2*f+  g+2*h+  i) mod 4;
 Assign(out,'output.txt'); Rewrite(out);
 For a:=1 to 9 do
   For b:=1 to t[a] do Write(out,a:2);
 Writeln(out);
 Close(out);
END.
