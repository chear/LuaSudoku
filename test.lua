--[[

1,24,9,2
1,24,8,2
2,24,9,2
2,24,8,2
3,24,9,2
3,24,8,2
4,24,9,2
4,24,8,2
]]
local values={{1,2,3,4},{24},{9,8},{2}};
for i in ipairs(values) do
	print(table.concat(values[i], ","));
end
function CallNextArray(List, Index,StrValue)
	if Index >#List then
		print("Index:"..Index..",StrValue:{"..StrValue.."}");
		return StrValue;
	else
		for idx ,val in ipairs(List[Index]) do
			i=Index+1
			val = StrValue ..","..val;
			print("Index:"..Index..",StrValue:{"..StrValue.."},val:"..val);
			str = CallNextArray(List,i,val);
			if (str~=nil) then
				print(" str ===> "..str);
			end
		end
	end
end
CallNextArray(values,1,"");
