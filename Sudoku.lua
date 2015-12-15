local A = {8,3,2,4,1,9,6,5,7};
local B = {9,7,1,6,5,2,3,8,4};
local C = {6,4,5,8,7,3,0,9,0};
local D = {1,6,0,0,0,0,7,0,5};
local E = {2,5,7,0,0,0,0,0,0};
local F = {4,8,0,5,0,7,0,6,0};
local G = {3,9,4,7,0,0,5,0,0};
local H = {5,1,0,0,0,4,0,7,0};
local I = {7,2,0,0,9,5,4,0,6};

local Result ={{1,2,3,4,5,6,7,8,9},{9,8,7,6,5,4,3,2,1},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0},
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

function VerifySudoku()
	local square = {};
	local times = 1;
	local verticals = {};
	-- count the horizon of 'Result'
	for i=1 ,NUMBER do
		local square_number=1;
		local horizon = {};
		horizon = Result[i];
--~ 		if not AddtionNumberForArray(horizon) then
--~ 			print("verify failed");
--~ 			return false;
--~ 		end


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
				print("new");
			else
				table.insert(square[number],horizon[k]);
				print("insert");
			end
		end
		print_r(square);
	end  -- end horizon

	-- count the vertial of 'Result'
--~ 	for j in ipairs(verticals) do
--~ 		local list = {};
--~ 		if not AddtionNumberForArray(list) then
--~ 			print("verify failed");
--~ 			return false;
--~ 		end
--~ 	end

	-- count the square of 'Result'
	for j in ipairs(square) do
--~		str ="";
--~		for p in ipairs(square[j]) do
--~			str=str.."|"..square[j][p];
--~		end
 		local list = {};
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

VerifySudoku();

function main()
	local sudoku={};
	table.insert(sudoku,A);
	table.insert(sudoku,B);
	table.insert(sudoku,C);
	table.insert(sudoku,D);
	table.insert(sudoku,E);
	table.insert(sudoku,F);
	table.insert(sudoku,G);
	table.insert(sudoku,H);
	table.insert(sudoku,I);
	
	
end


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
