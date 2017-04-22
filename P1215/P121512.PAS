program LGame;
{----- Solution using arrays, ample storage of variables    -----}
{----- File is only read once and only valid candidates     -----}
{-----                  are stored                          -----}
{-----               Connie Veugen 7 6 95                   -----}

const
	MaxWrdL   =         7;
	MaxThree  =    35*3*2;  {35 unique possibilties *  no of permutations}
	MaxFour   =  35*4*3*2;  {ibid, both are far more than a normal}
                            {letter distribution would yield}
	MaxCand   =     7*6*5;  {possible candidates}
                            {this margin is absurd as only the highest}
                            {values will be stored}

type
	WrdType = string[MaxWrdL+1];
	Candid  = record
	             Wrd : WrdType;
			     Pnt : word
	          end;
	Ar3     = array[1..MaxThree] of WrdType;
	Ar4     = array[1..MaxFour] of WrdType;
	ArCan   = array[1..MaxCand] of Candid;

var
	InFile,
	OutFile,
	WBook       : text;
	Letters     : WrdType;
	LengthThree : Ar3;      {storage for 3 letter words}
	LengthFour  : Ar4;      {storage for 4 letter words}
	MaxValue,               {highest score so far}
	CountThree,             {number of 3 letter words}
	CountFour,              {number of 4 letter words}
	CountCand  :  word;     {number of possible candidates}
	Found      : ArCan;     {word(s) (pair(s)) with highest score so far}


	procedure Init;

	var I : byte;

	begin {Init}
		CountThree := 0;
		CountFour := 0;
		CountCand  := 0;
		MaxValue  := 0;
		for I := 1 to MaxCand do
	    	begin
		    	Found[I].Wrd := '';
		    	Found[I].Pnt := 0;
		    end;
	    assign(InFile, 'input.txt');
	    assign(WBook, 'words.txt');
	    assign(OutFile, 'output.txt');
	    reset(InFile);
	    reset(WBook);
	    rewrite(OutFile)
	end; {Init}


	function Value(Wrd : WrdType) : byte;

    var
	   Total, I : byte;

    begin {Value}
	    Total := 0;
	    for I := 1 to length(Wrd) do
	    	case upcase(Wrd[I]) of
	       		'E','I','S'            : Total := Total + 1;
		   		'A','N','R','T'        : Total := Total + 2;
		   		'L','O'                : Total := Total + 3;
		   		'C','D','U'            : Total := Total + 4;
		   		'B','G','H','M','P','Y': Total := Total + 5;
		   		'F','K','V','W'        : Total := Total + 6;
		   		'J','Q','X','Z'        : Total := Total + 7
	      	end {case};
	    Value := Total
    end; {Value}


    function OK(Wrd1, Wrd2 : WrdType):boolean;
    {---------------------------------------------------------}
    {checks if there are no 'illegal' letters in the inputline}
    {as only the letters from the set are alowed and they may }
    {only be used once.                                       }
    {---------------------------------------------------------}

    var
	   Good : boolean;
	   I    : byte;

    begin {OK}
    	{no more letters in inputline, so all matched}
		if length(Wrd1) = 0 then OK := true else
       		{no more letters in set, so no match}
	      	if length(Wrd2) = 0 then OK := false else
            	{illegal letter in inputline}
	         	if pos(Wrd1[1], Wrd2) = 0 then OK := false else
	     	    	begin
                   		{take the letter out of the set as it can
                       		only be used once}
		         		delete(Wrd2, pos(Wrd1[1],Wrd2), 1);
                 		{take the letter out of the inputline as
                       		it has already been processed}
			     		delete(Wrd1, 1, 1);
                 		{check what is left}
			     		OK := OK(Wrd1, Wrd2)
		       		end
    end; {OK}


    procedure ProcessWBook(Let : WrdType; var Max, Count, A3, A4 : word);
    {-------------------------------------------------------------------}
    {read wordlist line by line and process each line as it is read     }
    {do not proces lines that contain 'illegal' letters or that use a   }
    {letter from the set more than once, only proces candidates with a  }
    {higher or equal score than the maximum at the given moment, if the }
    {set was 7 letters then store possible 3 and 4 letter candidates    }
    {if it was 6 then store 3 letter candidates only.                   }
    {-------------------------------------------------------------------}

    var
	   InputLine  : WrdType;
	   LengthInpL,
	   LengthLet,
	   ValueCand : byte;
	   Higher    : boolean;

    begin {ProcessWBook}
		while not eof(WBook) do
	    	begin
	        	readln(WBook, InputLine);
			 	Higher := false;
             	{only check valid candidates}
			 	if OK(InputLine, Let) then
			    	begin
			        	ValueCand := Value(InputLine);
			         	LengthInpL := length(InputLine);
		   		     	LengthLet := length(Let);
				     	Higher := ValueCand >= Max;
				     	if Higher then Max := ValueCand;
                       		{only store those with maximum or higher score}
				     		if (LengthInpL = LengthLet) or Higher then
				       			begin
				         			inc(Count);
					     			Found[Count].Wrd := InputLine;
					     			Found[Count].Pnt := ValueCand
				      			end;
				     	if LengthLet = 7 then
                        	{check for possible 4}
				        	if LengthInpL = 4 then
				          		begin
				            		inc(A4);
					        		LengthFour[A4] := InputLine
				          		end;
				     	if LengthLet >= 6 then
                        	{check for possible 3}
				        	if LengthInpL = 3 then
				          		begin
				            		inc(A3);
					        		LengthThree[A3] := InputLine
				          		end;
			    	end
		   	end;
		   	close(WBook)
    end; {ProcessWBook}



    procedure StorePairs(Wrd1, Wrd2: WrdType; Score : word);
    {-------------------------------------------------------}
    {valid word pairs have to be stored in a particular way }
    {for output.                                            }
    {-------------------------------------------------------}

    var
	   I : byte;
	   Bingo : boolean;

    begin {StorePairs}
		I := 1;
	   	Bingo := false;
       	{do not store the same pair twice}
	   	while not Bingo and (I <= MaxCand) and (Found[I].Wrd <> '') do
			begin
		    	if (Wrd1 + ' ' + Wrd2 = Found[I].Wrd) or
			    	(Wrd2 + ' ' + Wrd1 = Found[I].Wrd) then
			        	Bingo := true
			 	else inc(I)
		 	end;
	  	if not Bingo then with Found[I] do
	    	begin
		    	Wrd := Wrd1 + ' ' + Wrd2;
		    	Pnt := Score
		 	end
   end; {StorePairs}


    procedure In3and4(var Count, MaxV : word; A3, A4 : word; Let : WrdType);
    {----------------------------------------------------------------------}
    { when the letterset consists of 7 letters you have to check for pairs }
    { of 3 and 4 letters.                                                  }
    {----------------------------------------------------------------------}

    var
	   I, J, Score : word;
	   Temp        : WrdType;

    begin {In3and4}
	   for I := 1 to A3 do
	       for J := 1 to A4 do
		      begin
                   {make a dummy word out of the two candidates}
		           Temp := LengthThree[I] + LengthFour[J];
			       Score := Value(Temp);
                   {check if no double letters are used and if
                            this is a valid candidate scorewise}
			       if (OK(Temp, Let)) and (Score >= MaxV) then
			         begin
			             inc(Count);
				         if Score > MaxV then MaxV := Score;
				         StorePairs(LengthThree[I], LengthFour[J], Score)
			         end;
		     end
   end; {In3and4}


   procedure In3and3(var Count, MaxV : word; A3: word; Let : WrdType);
   {----------------------------------------------------------------}
   { when the set has 7 or 6 letters check for pais of 3 and 3      }
   { further comments see In4and3                                   }
   {----------------------------------------------------------------}

   var
	   I, J, Score : word;
       Temp        : WrdType;

    begin {In3and3}
	   for I := 1 to A3 do
	       for J := 1 to A3 do
		      begin
		           Temp := LengthThree[I] + LengthThree[J];
	   		       Score := Value(Temp);
			       if (OK(Temp, Let)) and (Score >= MaxV) then
			         begin
			           inc(Count);
				       if Score > MaxV then MaxV := Score;
                          StorePairs(LengthThree[I], LengthThree[J], Score)
			         end;
		     end
   end; {In3and3}


   procedure WriteOutput(Count, MaxV : word);

   var
	   I    : byte;
	   Temp : WrdType;

   begin {WriteOutput}
	  writeln(OutFile, MaxV);
	  for I := 1 to Count do
          {as there are older "high-scoring" candidates
            write only those with actual MaxV}
	      if Found[I].Pnt = MaxV
	         then writeln(OutFile, Found[I].Wrd);
	  close(OutFile)
   end;{WriteOutput}


begin {main}
	Init;
	readln(InFile, Letters);
	close(InFile);
	ProcessWBook(Letters, MaxValue, CountCand, CountThree, CountFour);
	if (length(Letters) = 7) and (CountThree <> 0) and (CountFour <> 0)
	   then In3and4(CountCand, MaxValue, CountThree, CountFour, Letters);
	if (length(Letters) >= 6) and (CountThree <> 0)
	   then In3and3(CountCand, MaxValue, CountThree, Letters);
	WriteOutput(CountCand, MaxValue)
end.
