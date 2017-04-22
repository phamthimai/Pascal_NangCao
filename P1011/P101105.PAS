{$N+}
uses crt,graph;
 const
      nmax=100;
      inp='p101105.inp';
 var
    gd,gm:integer;
    f:text;
    n:integer;
    x,y:array[1..nmax]of integer;

  procedure Nhap;
   begin
    n:=0;
    assign(f,inp);
    reset(f);
     while not eof(f) do
      begin
       inc(n);
       readln(f,x[n],y[n]);
      end;
    close(f);
   end;

  procedure Tim_max(i:integer;var max:real);
    var j:integer;
        s1,s2:real;
   begin
    max:=0;
    for j:=1 to n do
     begin
      s1:=sqr(x[i]-x[j]);
      s2:=sqr(y[i]-y[j]);
      if (s1+s2>sqr(max)) then max:=sqrt(s1+s2);
     end;
   end;

  procedure Ve;
    var i,j:integer;
        max:real;
   begin
    setcolor(4);
    for i:=1 to n do
     begin
      putpixel(x[i],y[i],4);
      Tim_max(i,max);
      for j:=1 to n do
       if (sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]))=max) then line(x[i],y[i],x[j],y[j]);
     end;
   end;

 begin
  clrscr;
  Nhap;
  gd:=detect;
  initgraph(gd,gm,'d:\tp70\bgi');
  Ve;
  repeat until keypressed;
  closegraph;
 end.
12 54
74 1
45 88
234 132
