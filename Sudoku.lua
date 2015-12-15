local A = {8,3,2,4,1,9,6,5,7};
local B = {9,7,1,6,5,2,3,8,4};
local C = {6,4,5,8,7,3,0,9,0};
local D = {1,6,0,0,0,0,7,0,5};
local E = {2,5,7,0,0,0,0,0,0};
local F = {4,8,0,5,0,7,0,6,0};
local G = {3,9,4,7,0,0,5,0,0};
local H = {5,1,0,0,0,4,0,7,0};
local I = {7,2,0,0,9,5,4,0,6};

local Result ={{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0}};

local sudoku = 45;
local NUMBER = 9;

function AddtionNumberForArray(Array)
	local count = 0;
	for value in ipairs(Array) do
		count=count+Array[value];
	end
	print("count:"..count);
	if(count ==sudoku) then
		return true;
	else
		return false;
	end
end

function VerifySudoku(Verifysudoku)
	local square = {};
	local times = 1;
	local verticals = {};

	if(#Verifysudoku ~= NUMBER) then
		print("count of 'Verifysudoku' its not 9  ");
		return false;
	end
	-- count the horizon of 'Result'
	for i=1 ,NUMBER do
		local horizon = {};
		horizon = Verifsudoku[i];
		if not AddtionNumberForArray(horizon) then
			print("verify failed");
			return false;
		end

		for k in ipairs(horizon) do
			-- dump vertical array from 'Result'
			if verticals[k]==nil then
				local var = {};
				var[i]= horizon[k];
				table.insert(verticals,var);
			else
				table.insert(verticals[k],horizon[k]);
			end

			-- dump square array from 'Result'
			local number = (math.floor((k-1)/3+1)+math.floor((i-1)/3)*3);
			print("i:"..i..",k:"..k..",number:"..number);
			if square[number] ==nil then
				local squ = {};
				squ[1]= horizon[k];
				table.insert(square,squ);
			else
				table.insert(square[number],horizon[k]);
			end
		end
		print_r(square);
	end  -- end horizon

	-- count the vertial of 'Result'
	for j in ipairs(verticals) do
		local list = {};
		list = verticals[j];
		if not AddtionNumberForArray(list) then
			print("verify failed");
			return false;
		end
	end

	-- count the square of 'Result'
	for j in ipairs(square) do
 		local list = {};
		list = square[j];
 		if not AddtionNumberForArray(list) then
 			print("verify failed");
 			return false;
 		end
	end

end  -- end VerifySudoku


function print_r(arr, indentLevel)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..print_r(value, (indentLevel + 1))
        else
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end


function GetNumber(List )
	for v in ipairs(List) do
		if List[v]~=0 then
			return v;
		end
	end
end


function VerifySameNumber(List,Num)
	for i in ipairs(List) do
		if List[i]==Num then
			return true;
		end
	end
	return false
end -- end VerifySameNumber


function PrintSudoku(Array)
	-- print this array
	print("begin print .... ");
	for i in ipairs(Array) do
		local str ="";
		for p in ipairs(Array[i]) do
			v = (p-1)%3+1;
			if v==3 then
				str=str..Array[i][p].."|";
			else
				str=str..Array[i][p].." ";
			end
		end
		print(str);
		if ((i-1)%3+1)==3 then
			print("------------------");
		end
	end
	print("end");
end --end PrintSudoku

 ---------------------------------
 --		Main function			--
 ---------------------------------

 function main()

	local SUDOKU={};
	table.insert(SUDOKU,A);
	table.insert(SUDOKU,B);
	table.insert(SUDOKU,C);
	table.insert(SUDOKU,D);
	table.insert(SUDOKU,E);
	table.insert(SUDOKU,F);
	table.insert(SUDOKU,G);
	table.insert(SUDOKU,H);
	table.insert(SUDOKU,I);

	-- inititalize
	local SquaresNumber={{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},
	{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9}};
	local VerticalsNumber = {{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},
	{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9}};
	local HorizonsNumber = {{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},
	{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9}};

	print("------------------");
	for i in ipairs(SUDOKU) do
		for j=1,NUMBER do
			local n = SUDOKU[i][j];
			if n~=0 then
				-- fill data to 'HorizonsNumber'
				HorizonsNumber[i][n] = 0;
				VerticalsNumber[j][n] = 0;

				local num = (math.floor((j-1)/3+1)+math.floor((i-1)/3)*3);
				SquaresNumber[num][n] =0;
			end
		end
	end	  -- end inititalize

	-- process fill 'SUDOKU'
	Result = SUDOKU;

	PrintSudoku(Result);

	while(true) do
		for i in ipairs(Result) do
			for j in ipairs(Result[i]) do

				local n = Result[i][j];
				-- if the grid is empty
				if(n==0) then
					-- get number from array.
					for k in ipairs(HorizonsNumber[i]) do
						local num = (math.floor((j-1)/3+1)+math.floor((i-1)/3)*3);
						local ho = HorizonsNumber[i][k];
						if ho~=0 and (VerifySameNumber(VerticalsNumber[j],ho ) or VerifySameNumber(SquaresNumber[num],ho )) then
							print("i="..i..",j="..j..",ho="..ho);
							HorizonsNumber[i][k] = 0;
							VerticalsNumber[j][ho]=0;
							SquaresNumber[num][ho]=0;
							Result[i][j] = ho;
							break;
						end
					end
				end
			end
		end --end

		-- verify SUDOKU
		PrintSudoku(Result);
		PrintSudoku(HorizonsNumber);
		PrintSudoku(VerticalsNumber);
		PrintSudoku(SquaresNumber);
		break;

	end  -- end while

end -- end main function


main();

--~ for i=1,NUMBER do
--~ 	local str = ""
--~ 	for j=1,NUMBER do
--~ 		str=str.."|"..math.floor((j-1)/3+1)+math.floor((i-1)/3)*3;
--~ 	end
--~ 	print(str);
--~ end


------------------------------------
-- 			  test codeing 	   	  --
------------------------------------

--~ local list={};
--~ for i=1,NUMBER do
--~ 	local li ={};
--~ 	for j=1,NUMBER do
--~ 		table.insert(li,j);
--~ 	end
--~ 	table.insert(list,li);
--~ end


--~ for i in ipairs(list) do
--~ 	print("i=",list[i]);
--~ 	for j=1 ,NUMBER  do
--~ 		print("val="..list[i][j]);
--~ 	end
--~ end
