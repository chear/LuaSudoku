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

function VerifySudoku(sudokuList)
	local square = {};
	local times = 1;
	local verticals = {};

	if(#sudokuList ~= NUMBER) then
		print("count of 'Verifysudoku' its not 9  ");
		return false;
	end
	-- count the horizon of 'Result'
	for i=1 ,NUMBER do
		local horizon = {};
		horizon = sudokuList[i];
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
--~ 			print("i:"..i..",k:"..k..",number:"..number);
			if square[number] ==nil then
				local squ = {};
				squ[1]= horizon[k];
				table.insert(square,squ);
			else
				table.insert(square[number],horizon[k]);
			end
		end
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

function VerifySameNumber(List,Num)
	for i,v in ipairs(List) do
		if v==Num then
			return true;
		end
	end
	return false
end -- end VerifySameNumber


function VerifySameNumberWithSudokuList(SuArrray , Index, ValueNumber)
	local x = math.floor(Index/NUMBER)+1;
	local y = (Index%NUMBER) == 0 and 9 or Index%NUMBER;
	local num = (math.floor((y-1)/3+1)+math.floor((x-1)/3)*3);
	print("Index:"..Index.."x:"..x..",y:"..y..",num:"..num..",ValueNumber:"..ValueNumber);
	for i ,iv in ipairs(SuArrray) do
		for j,jv in ipairs(iv) do
			num1 = (math.floor((j-1)/3+1)+math.floor((i-1)/3)*3);
			if ((j==y) or num==num1) and (jv == ValueNumber) then
				return true;
			end
		end
	end
	return false;

end -- end VerifySameNumberWithSudokuList


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


function SudukuIniticalize(Array)
	local squ={{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},
	{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9}};
	local ver = {{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},
	{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9}};
	local hor = {{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},
	{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9},{1,2,3,4,5,6,7,8,9}};

	print("------------------");
--~ 	PrintSudoku(Array);
	for i in ipairs(Array) do
		for j=1,NUMBER do
			local n = Array[i][j];
			if n~=0 then
				-- fill data to 'HorizonsNumber'
				hor[i][n] = 0;
				ver[j][n] = 0;

				local num = (math.floor((j-1)/3+1)+math.floor((i-1)/3)*3);
				squ[num][n] =0;
			end
		end
	end	  -- end inititalize
--~ 	print_r(hor);
--~ 	print_r(ver);
--~ 	print_r(squ);
	return hor,ver,squ;
end

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

	-- inititalize , 'HorizonsNumber' its  the may of remain number for the Horizon line . as
	-- 'VerticalsNumber' its for vertical line ,as same as 'SquaresNumber'
	local HorizonsNumber={};
	local VerticalsNumber={};
	local SquaresNumber={};
	HorizonsNumber,VerticalsNumber,SquaresNumber=SudukuIniticalize(SUDOKU);


	-- process fill 'SUDOKU'

	Result = SUDOKU;

--~ 	PrintSudoku(Result);
--~ 	PrintSudoku(HorizonsNumber);
--~ 	PrintSudoku(VerticalsNumber);
--~ 	PrintSudoku(SquaresNumber);
	local index = 0;
	local IndexList = {};
	local isStop = false;
	for i in ipairs(Result) do
		for j in ipairs(Result[i]) do
			index = index+1;
			local n = Result[i][j];
			if(n==0) then
				local probList={};
				for prbIdx,prbVal in ipairs(HorizonsNumber[i]) do
					print("prbval:"..prbVal);
					if prbVal~= 0 then
						table.insert(probList,prbVal);
					end
				end
				local ilist = {index,probList};
				table.insert(IndexList,ilist);
			end
		end -- end for loop 'Result[i]'
	end -- end for loop 'Result'

	print_r(IndexList);

end -- end main function


local li = {{25,{1}},{27,{1,2}},{30,{2}},{31,{3}},
{32,{4}},{33,{8}},{35,{2,3,4,8,9}}};
--~ print_r(li);

function CallNext(IndexList, Index , StrValue,SqueueList)
	if Index >#IndexList then
		print("return StrValue:"..StrValue);
		return StrValue,SqueueList;
	else
		for numidx, numval in ipairs(IndexList[Index][2]) do
			i=Index+1;
			local position = IndexList[Index][1];
			print("position:"..position..",StrValue:"..StrValue);
			local lis = SqueueList;
			table.insert(lis,numval)
--~ 			lis = SqueueList;
			numval = StrValue ..","..numval;
			rs,rv = CallNext(IndexList,i,numval,lis)
			if(rv~=nil) then
				print_r(rv);
				print(" rs ===> "..rs);
			end
		end
	end
end -- end funciotn 'CallNext'
CallNext(li,1,"",{});


--~ main();


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





--~ for i=1,#values[1] do
--~ 	str = str..values[1][i]..",";
--~ 	for i=1,#values[2] do
--~ 		str = str..values[2][i]..",";
--~ 		for i=1,#values[3] do
--~ 			str = str..values[3][i]..",";
--~ 			for i=1,#values[4] do
--~ 				str = str..values[4][i]..",";
--~ 				print(str);
--~ 				str = "";
--~ 				break;
--~ 			end
--~ 		end
--~ 	end
--~ end

--~ for i in ipairs(values) do
--~ 	str = "";
--~ 	if (i+1 <=#values) then
--~ 		print("i:"..i);
--~ 		str = "";
--~ 		for j=1,#values[i] do
--~ 			for k =1 ,#values[i+1] do
--~ 				str=str..","..values[i][j]..","..values[i+1][k]..",";
--~ 				print("str:"..str);
--~ 			end
--~ 		end
--~ 	end
--~ end



