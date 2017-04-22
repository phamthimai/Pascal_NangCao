PROGRAM RACE;

CONST Max_points = 50;
      Max_Arrows = 100;

TYPE Point_array = ARRAY [0..Max_points-1] OF BOOLEAN;

VAR input_file,output_file : text;
    current_arrow,current_point,number_of_points,number_of_arrows,
    number_unavoidable_points,number_splitting_points : INTEGER;
    Arrows : ARRAY [0..Max_Arrows-1,0..1] OF INTEGER;
    unavoidable,splitting : Point_array;

PROCEDURE initialisation;
BEGIN
  Assign(input_file,'input.txt');
  Reset(input_file);
  Assign(output_file,'output.txt');
  Rewrite(output_file);
  number_of_points:=1;
  number_of_arrows:=0;
  number_unavoidable_points:=0;
  number_splitting_points:=0;
  FOR current_point:=0 TO Max_points-1 DO
    BEGIN
      splitting [current_point]:=FALSE ;
      unavoidable [current_point]:=FALSE
    END;
END;

PROCEDURE read_input;
VAR num : INTEGER;
BEGIN
  read(input_file,num);
  WHILE NOT (num = -1) DO
  BEGIN
    IF num = -2
    THEN INC (number_of_points)
    ELSE BEGIN
           Arrows [number_of_arrows][0] := number_of_points-1;
           Arrows [number_of_arrows][1] := num;
           INC (number_of_arrows)
         END;
    read(input_file,num)
  END;
END;

PROCEDURE write_output;
BEGIN
  Write(output_file,number_unavoidable_points);
  FOR current_point:=1 TO number_of_points-2 DO
    IF unavoidable[current_point]
    THEN write(output_file,' ',current_point);
  Writeln(output_file);
  Write (output_file,number_splitting_points);
  FOR current_point:=1 TO number_of_points-2 DO
    IF splitting[current_point]
    THEN write(output_file,' ',current_point);
END;

PROCEDURE finalisation;
BEGIN
  Close(input_file);
  Close(output_file);
END;

PROCEDURE compute_results;

VAR reachable : Point_array;

  PROCEDURE find_reachable (current_point:INTEGER);
  VAR point:INTEGER;
      ready:BOOLEAN;
  BEGIN
    FOR point:=1 TO number_of_points - 1 DO
      reachable[point]:=FALSE;
    reachable[0]:=TRUE;
    ready:=FALSE;
    WHILE NOT ready DO
    BEGIN ready:=TRUE;
          FOR current_arrow:=0 TO number_of_arrows-1 DO
            IF reachable [Arrows[current_arrow,0]] AND
               NOT reachable [Arrows[current_arrow,1]] AND
               (Arrows[current_arrow,1]<>current_point)
            THEN BEGIN reachable[Arrows[current_arrow,1]]:=TRUE;
                       ready:=FALSE
                 END;
    END
  END;

  FUNCTION is_splitting:BOOLEAN;
  VAR current_arrow:INTEGER;
      OK:BOOLEAN;
  BEGIN
    current_arrow:=0;
    OK:=TRUE;
    WHILE (current_arrow<number_of_arrows) AND OK DO
    BEGIN
      OK:=reachable [Arrows[current_arrow,0]] OR
          NOT (reachable [Arrows [current_arrow,1]]);
      INC(current_arrow)
    END;
    is_splitting:=OK
  END;

BEGIN
  FOR current_point:=1 TO number_of_points-2 DO
    BEGIN
      find_reachable (current_point);
      IF NOT reachable[number_of_points-1]
      THEN BEGIN
             unavoidable [current_point] := TRUE;
             INC (number_unavoidable_points);
             IF is_splitting
             THEN BEGIN
                    splitting[current_point]:=TRUE;
                    INC (number_splitting_points)
                  END
           END
    END;
END;

BEGIN
  initialisation;
  read_input;
  compute_results;
  write_output;
  finalisation;
END.
