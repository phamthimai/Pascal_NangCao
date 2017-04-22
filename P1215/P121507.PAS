Program P121507;    {IOI 94}
Const Test = true;
      Trace = false;

Var   inp,out: text;

Procedure Init;
Begin
 If Test then
   Writeln('IOI''94 - Day 2 - Problem 2: The Buses');
 Assign(inp,'input.txt');  Reset(inp);
 Assign(out,'output.txt'); ReWrite(out);
 If Test then Writeln('Initialized')
End;

Procedure Fini;
Begin
 Close(inp); Close(out)
End;

Type  BusRoute = Record
                   first   : 0..29;
                   interval: 1..59;
                   howoften: 2..60;
                 End;

Procedure WriteTimes(Var f: text);
Var i,j: integer;
Begin
 For i:=0 to 5 do
   For j:=0 to 9 do Write(f,i:1);
 Writeln(f);
 For i:=0 to 5 do
   For j:=0 to 9 do Write(f,j:1);
 Writeln(f)
End;

Procedure GraphBusRoute(Var f: text; b: BusRoute);
Var i: integer;
Begin
 With b do
 begin
   Write(f,1:first+1);
   i:=first+interval;
   While (i<=59) do
   begin
     Write(f,1:interval);
     i:=i+interval
   end;
   Write(f,' ':62-i+interval);
   Writeln(f,'[',first:2,',',interval:2,',',howoften:2,']')
 end;
End;

Var   s: integer;
      a: array [0..59] of integer;

Procedure GraphUnaccounted(Var f: text);
Var h,i,j: integer;
Begin
 WriteTimes(f);
 For i:=0 to 5 do
   For j:=0 to 9 do
   begin
     h:=a[10*i+j];
     If (h=0) then Write(f,' ')
     Else If (h<10) then Write(f,h:1)
          Else Write(f,chr(ord('A')+h-10))
   end;
 Writeln(f,'   total = ',s:1)
End;

Procedure ReadInput;
Var i,j: integer;
Begin
 If Test then Writeln('Reading input'); Readln(inp,s);
 If Test then Writeln('Number of stops = ',s:1);
 For i:=0 to 59 do a[i]:=0;
 For i:=1 to s do
 begin
   Read(inp,j);
   Inc(a[j])
 end;
 Readln(inp);
 If Test then begin GraphUnaccounted(out); Writeln end
End;

Function Fits(b: BusRoute): boolean;
Var i,j: integer;
Begin
 With b do
 begin
   i:=first; j:=60;
   While i<j do
     If a[i]<>0 then i:=i+interval Else j:=i;
   Fits:=(i>=60)
 end;
End;

Var   n: integer;
      c: array [0..899] of BusRoute;

Procedure FindBusRoutes;
Var f,i,j,k: integer; b: BusRoute;
Begin
 If Test then
 begin
   Writeln('Finding candidate bus routes');
   WriteTimes(out)
 end;
 n:=0;
 For f:=0 to 29 do
 begin
   If a[f]<>0 then
   begin
     For i:=f+1 to 59-f do
     begin
       With c[n] do
       begin
         first:=f;
         interval:=i;
         howoften:=1+(59-f) div i
       end;
       If Fits(c[n]) then
       begin
         If Test then GraphBusRoute(out,c[n]);
         j:=0; k:=n;
         While j<>k do
           If c[k-1].howoften<c[k].howoften then
           begin
             b:=c[k-1]; c[k-1]:=c[k]; c[k]:=b; dec(k)
           end
           Else j:=k;
         Inc(n)
       end;
     end;
   end;
 end;
 If Test then
 begin
   Writeln('Number of candidate bus routes = ',n:1);
   If Trace then
     For j:=0 to n-1 do With c[j] do
       Writeln(first:4,' ',interval:2,' ',howoften:2)
 end;
End;

Type  Schedule = array [0..16] of BusRoute;

Procedure WriteSchedule(Var f: text; sc: Schedule; len: integer);
Var i: integer;
Begin
 For i:=0 to len-1 do With sc[i] do
   Writeln(f,first:2,' ',interval:2);
 If Test then Writeln(f,'-----')
End;

Var   t: longint;
      freq: array [1..17] of longint;
      p: integer;
      m: integer;
      sched: Schedule;
      best: Schedule;

Procedure WriteFrequencies(Var f: text);
Begin
 Writeln(f,'Frequency table For schedule lengths:');
 Write(f,'  Len:');
 For i:=1 to 17 do
   If freq[i]<>0 then Write(f,i:4);
 Writeln(f,'total':6);
 Write(f,'   # :');
 For i:=1 to 17 do
   If freq[i]<>0 then Write(f,freq[i]:4);
 Writeln(f,t:6);
End;

Procedure ScheduleFound;
Begin
 If Test then
 begin
   Inc(t);
   Inc(freq[p]);
   WriteSchedule(out,sched,p);
 end;
 m:=p;
 best:=sched;
 If Test then
 begin
   Writeln('Best schedule so far:');
   WriteSchedule(output,best,m);
 end;
End;

Procedure Use(b: BusRoute);
Var i: integer;
Begin
 sched[p]:=b;
 Inc(p);
 With b do
 begin
   i:=first;
   While (i<=59) do
   begin
     dec(a[i]);
     i:=i+interval;
   end;
   s:=s-howoften;
 end;
 If Trace then
 begin
   WriteSchedule(output,sched,p);
   GraphUnaccounted(output);
 end;
End;

Procedure RemoveLast;
Var i: integer;
Begin
 Dec(p);
 With sched[p] do
 begin
   i:=first;
   While (i<=59) do
   begin
     Inc(a[i]);
     i=i+interval;
   end;
   s:=s+howoften;
 end;
End;

Procedure FindBestSchedule(k: integer);
Begin
 If s=0 then ScheduleFound
 Else
 begin
   While (k<n)and (c[k].howoften>s) do Inc(k);
   While (k<n)and (p+1+(s-1) div c[k].howoften<m) do
   begin
     If Fits(c[k]) then
     begin
       Use(c[k]);
       FindBestSchedule(k);
       RemoveLast
     end;
     Inc(k);
   end;
 end;
End;

Procedure ComputeAnswer;
Begin
 FindBusRoutes;
 If Test then Writeln('Finding schedules');
 For p:=1 to 16 do freq[p]:=0;
 t:=0; p:=0; m:=18;
 FindBestSchedule(0);
 If Test then
 begin
   Writeln('Number of schedules = ',t:1);
   WriteFrequencies(out);
 end;
End;

Procedure WriteOutput;
Var i: integer;
Begin
 If (m>17) then Writeln('More than 17 bus routes')
 Else
 begin
   If Test then
   begin
     For i:=0 to m-1 do GraphBusRoute(out,best[i]);
     Writeln('Smallest number of bus routes = ',m:1);
     WriteSchedule(output,best,m);
   end;
   WriteSchedule(out,best,m);
 end;
End;

BEGIN
 Init;
 ReadInput;
 ComputeAnswer;
 WriteOutput;
 Fini;
END.
