bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
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
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
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
		if ((a + b) == 1) then
			r = r + p;
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
	if (math.abs(s_amount) >= N) then
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
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local TABLE_TableIndirection = {};
TABLE_TableIndirection["obf_stringchar%0"] = string.char;
TABLE_TableIndirection["obf_stringbyte%0"] = string.byte;
TABLE_TableIndirection["obf_stringsub%0"] = string.sub;
TABLE_TableIndirection["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%0"] = TABLE_TableIndirection["obf_bitlib%0"].bxor;
TABLE_TableIndirection["obf_tableconcat%0"] = table.concat;
TABLE_TableIndirection["obf_tableinsert%0"] = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["obf_tableinsert%0"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%0"](TABLE_TableIndirection["obf_XOR%0"](TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, i + 1)), TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return TABLE_TableIndirection["obf_tableconcat%0"](TABLE_TableIndirection["result%0"]);
end
TABLE_TableIndirection["obf_bitlib%1"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%1"] = TABLE_TableIndirection["obf_bitlib%1"][LUAOBFUSACTOR_DECRYPT_STR_0("\211\219\212\55", "\126\177\163\187\69\134\219\167")];
TABLE_TableIndirection["obf_OR%0"] = TABLE_TableIndirection["obf_bitlib%1"][LUAOBFUSACTOR_DECRYPT_STR_0("\33\194\56", "\156\67\173\74\165")];
TABLE_TableIndirection["obf_AND%0"] = TABLE_TableIndirection["obf_bitlib%1"][LUAOBFUSACTOR_DECRYPT_STR_0("\54\182\71\18", "\38\84\215\41\118\220\70")];
TABLE_TableIndirection["obf_stringchar%1"] = string[LUAOBFUSACTOR_DECRYPT_STR_0("\83\30\35\0", "\158\48\118\66\114")];
TABLE_TableIndirection["obf_stringbyte%1"] = string[LUAOBFUSACTOR_DECRYPT_STR_0("\169\61\4\51", "\155\203\68\112\86\19\197")];
TABLE_TableIndirection["obf_stringsub%1"] = string[LUAOBFUSACTOR_DECRYPT_STR_0("\85\200\52", "\152\38\189\86\156\32\24\133")];
TABLE_TableIndirection["obf_bitlib%2"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%2"] = TABLE_TableIndirection["obf_bitlib%2"][LUAOBFUSACTOR_DECRYPT_STR_0("\254\79\168\84", "\38\156\55\199")];
TABLE_TableIndirection["obf_tableconcat%1"] = table[LUAOBFUSACTOR_DECRYPT_STR_0("\171\114\114\43\18\96", "\35\200\29\28\72\115\20\154")];
TABLE_TableIndirection["obf_tableinsert%1"] = table[LUAOBFUSACTOR_DECRYPT_STR_0("\16\177\194\218\159\56", "\84\121\223\177\191\237\76")];
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["FlatIdent_95CAC%0"] = 0;
	TABLE_TableIndirection["FlatIdent_95CAC%1"] = nil;
	TABLE_TableIndirection["result%0"] = nil;
	while true do
		if (TABLE_TableIndirection["FlatIdent_95CAC%1"] == 1) then
			while true do
				TABLE_TableIndirection["FlatIdent_8D327%0"] = 0;
				while true do
					if (TABLE_TableIndirection["FlatIdent_8D327%0"] == 0) then
						if ((TABLE_TableIndirection["FlatIdent_95CAC%1"] == 1) or (4593 <= 2672)) then
							return TABLE_TableIndirection["obf_tableconcat%1"](TABLE_TableIndirection["result%0"]);
						end
						if (TABLE_TableIndirection["FlatIdent_95CAC%1"] == 0) then
							TABLE_TableIndirection["result%0"] = {};
							for i = 1, #LUAOBFUSACTOR_STR do
								TABLE_TableIndirection["obf_tableinsert%1"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%1"](TABLE_TableIndirection["obf_XOR%2"](TABLE_TableIndirection["obf_stringbyte%1"](TABLE_TableIndirection["obf_stringsub%1"](LUAOBFUSACTOR_STR, i, TABLE_TableIndirection["obf_AND%0"](i, 1) + TABLE_TableIndirection["obf_OR%0"](i, 1))), TABLE_TableIndirection["obf_stringbyte%1"](TABLE_TableIndirection["obf_stringsub%1"](LUAOBFUSACTOR_KEY, TABLE_TableIndirection["obf_AND%0"](1, i % #LUAOBFUSACTOR_KEY) + TABLE_TableIndirection["obf_OR%0"](1, i % #LUAOBFUSACTOR_KEY), TABLE_TableIndirection["obf_AND%0"](1, i % #LUAOBFUSACTOR_KEY) + TABLE_TableIndirection["obf_OR%0"](1, i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
							end
							TABLE_TableIndirection["FlatIdent_95CAC%1"] = 1;
						end
						break;
					end
				end
			end
			break;
		end
		if (TABLE_TableIndirection["FlatIdent_95CAC%1"] == 0) then
			TABLE_TableIndirection["FlatIdent_95CAC%1"] = 0;
			TABLE_TableIndirection["result%0"] = nil;
			TABLE_TableIndirection["FlatIdent_95CAC%1"] = 1;
		end
	end
end
TABLE_TableIndirection["GuiLib%0"] = {};
TABLE_TableIndirection["CoreGui%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\242\204\201\32\193\174\206", "\126\177\163\187\69\134\219\167"));
GuiLib = {};
GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\146\88\218\180\59\94\51\196\168", "\161\219\54\169\192\90\48\80")] = {};
GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\125\74\5\40\76\81", "\69\41\34\96")] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\51\216\56\213\240\38", "\156\67\173\74\165")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\22\182\74\29\187\52\73\33\185\77", "\38\84\215\41\118\220\70")]=Color3.fromRGB(25, 25, 25),[LUAOBFUSACTOR_DECRYPT_STR_0("\113\21\33\23\240\68", "\158\48\118\66\114")]=Color3.fromRGB(80, 0, 150),[LUAOBFUSACTOR_DECRYPT_STR_0("\159\33\8\34", "\155\203\68\112\86\19\197")]=Color3.fromRGB(255, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\100\200\34\232\79\118", "\152\38\189\86\156\32\24\133")]=Color3.fromRGB(50, 50, 100),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\82\166\66", "\38\156\55\199")]=Color3.fromRGB(40, 0, 80),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\114\110\44\22\102", "\35\200\29\28\72\115\20\154")]=Color3.fromRGB(80, 0, 150)},[LUAOBFUSACTOR_DECRYPT_STR_0("\11\186\213", "\84\121\223\177\191\237\76")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\153\87\202\171\61\66\63\212\181\82", "\161\219\54\169\192\90\48\80")]=Color3.fromRGB(30, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\104\65\3\32\71\86", "\69\41\34\96")]=Color3.fromRGB(150, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\136\198\207\30", "\75\220\163\183\106\98")]=Color3.fromRGB(255, 240, 240),[LUAOBFUSACTOR_DECRYPT_STR_0("\32\175\159\35\214\12", "\185\98\218\235\87")]=Color3.fromRGB(80, 20, 20),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\57\38\226", "\202\171\92\71\134\190")]=Color3.fromRGB(60, 0, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\206\62\140\44\211", "\232\73\161\76")]=Color3.fromRGB(150, 0, 0)},[LUAOBFUSACTOR_DECRYPT_STR_0("\185\213\87\88", "\126\219\185\34\61")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\46\207\93\121\121\101\252\242\2\202", "\135\108\174\62\18\30\23\147")]=Color3.fromRGB(20, 20, 40),[LUAOBFUSACTOR_DECRYPT_STR_0("\151\234\41\206\22\186", "\167\214\137\74\171\120\206\83")]=Color3.fromRGB(0, 120, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\191\245\42\73", "\199\235\144\82\61\152")]=Color3.fromRGB(220, 235, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\37\3\173\63\8\24", "\75\103\118\217")]=Color3.fromRGB(30, 60, 120),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\81\113\16", "\126\167\52\16\116\217")]=Color3.fromRGB(0, 60, 120),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\33\50\132\177\11", "\156\168\78\64\224\212\121")]=Color3.fromRGB(0, 120, 255)},[LUAOBFUSACTOR_DECRYPT_STR_0("\0\252\160\203\9", "\174\103\142\197")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\116\41\92\51\34\76\247\67\38\91", "\152\54\72\63\88\69\62")]=Color3.fromRGB(20, 40, 20),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\199\237\89\218\208", "\60\180\164\142")]=Color3.fromRGB(0, 150, 80),[LUAOBFUSACTOR_DECRYPT_STR_0("\108\91\29\61", "\114\56\62\101\73\71\141")]=Color3.fromRGB(225, 255, 225),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\252\207\208\183\231", "\164\216\137\187")]=Color3.fromRGB(30, 80, 50),[LUAOBFUSACTOR_DECRYPT_STR_0("\250\227\48\182", "\107\178\134\81\210\198\158")]=Color3.fromRGB(0, 80, 40),[LUAOBFUSACTOR_DECRYPT_STR_0("\26\1\144\194\175\42", "\202\88\110\226\166")]=Color3.fromRGB(0, 150, 80)},[LUAOBFUSACTOR_DECRYPT_STR_0("\204\29\131\249\205\198", "\170\163\111\226\151")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\51\49\177\51\73\37\38\4\62\182", "\73\113\80\210\88\46\87")]=Color3.fromRGB(35, 25, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\160\47\206\23\233\149", "\135\225\76\173\114")]=Color3.fromRGB(200, 100, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\46\232\160\164", "\199\122\141\216\208\204\221")]=Color3.fromRGB(255, 245, 225),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\200\4\228\119\248", "\150\205\189\112\144\24")]=Color3.fromRGB(90, 60, 10),[LUAOBFUSACTOR_DECRYPT_STR_0("\13\129\190\72", "\112\69\228\223\44\100\232\113")]=Color3.fromRGB(130, 70, 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\246\16\21\215\179\110", "\230\180\127\103\179\214\28")]=Color3.fromRGB(200, 100, 0)},[LUAOBFUSACTOR_DECRYPT_STR_0("\156\12\81\77", "\128\236\101\63\38\132\33")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\142\168\18\79\177\249\192\185\167\21", "\175\204\201\113\36\214\139")]=Color3.fromRGB(40, 20, 30),[LUAOBFUSACTOR_DECRYPT_STR_0("\102\207\54\217\10\83", "\100\39\172\85\188")]=Color3.fromRGB(255, 50, 150),[LUAOBFUSACTOR_DECRYPT_STR_0("\153\125\161\148", "\83\205\24\217\224")]=Color3.fromRGB(255, 235, 245),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\208\217\41\233\203", "\93\134\165\173")]=Color3.fromRGB(100, 40, 80),[LUAOBFUSACTOR_DECRYPT_STR_0("\150\247\192\198", "\30\222\146\161\162\90\174\210")]=Color3.fromRGB(150, 30, 90),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\65\98\14\224\92", "\106\133\46\16")]=Color3.fromRGB(255, 50, 150)},[LUAOBFUSACTOR_DECRYPT_STR_0("\95\50\114\229", "\32\56\64\19\156\58")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\120\201\230\93\93\224\143\79\198\225", "\224\58\168\133\54\58\146")]=Color3.fromRGB(40, 40, 40),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\85\72\248\123\146", "\107\57\54\43\157\21\230\231")]=Color3.fromRGB(100, 100, 100),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\142\9\225", "\175\187\235\113\149\217\188")]=Color3.fromRGB(230, 230, 230),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\186\149\88\236\119", "\24\92\207\225\44\131\25")]=Color3.fromRGB(70, 70, 70),[LUAOBFUSACTOR_DECRYPT_STR_0("\99\214\185\72", "\29\43\179\216\44\123")]=Color3.fromRGB(90, 90, 90),[LUAOBFUSACTOR_DECRYPT_STR_0("\159\214\50\72\184\203", "\44\221\185\64")]=Color3.fromRGB(100, 100, 100)},[LUAOBFUSACTOR_DECRYPT_STR_0("\22\239\65\75\118", "\19\97\135\40\63")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\140\93\48\48\40\35\161\73\61\63", "\81\206\60\83\91\79")]=Color3.fromRGB(245, 245, 245),[LUAOBFUSACTOR_DECRYPT_STR_0("\111\168\211\119\33\215", "\196\46\203\176\18\79\163\45")]=Color3.fromRGB(80, 80, 80),[LUAOBFUSACTOR_DECRYPT_STR_0("\140\39\102\10", "\143\216\66\30\126\68\155")]=Color3.fromRGB(20, 20, 20),[LUAOBFUSACTOR_DECRYPT_STR_0("\136\221\25\223\202\173", "\129\202\168\109\171\165\195\183")]=Color3.fromRGB(220, 220, 220),[LUAOBFUSACTOR_DECRYPT_STR_0("\10\93\54\220", "\134\66\56\87\184\190\116")]=Color3.fromRGB(200, 200, 200),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\62\27\191\28\249", "\85\92\81\105\219\121\139\65")]=Color3.fromRGB(160, 160, 160)},[LUAOBFUSACTOR_DECRYPT_STR_0("\255\191\81\70\119", "\191\157\211\48\37\28")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\253\30\247\23\61\205\16\225\18\62", "\90\191\127\148\124")]=Color3.fromRGB(10, 10, 10),[LUAOBFUSACTOR_DECRYPT_STR_0("\89\132\45\18\118\147", "\119\24\231\78")]=Color3.fromRGB(30, 30, 30),[LUAOBFUSACTOR_DECRYPT_STR_0("\182\40\189\94", "\113\226\77\197\42\188\32")]=Color3.fromRGB(255, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\24\3\224\161\53\24", "\213\90\118\148")]=Color3.fromRGB(20, 20, 20),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\43\181\82", "\45\59\78\212\54")]=Color3.fromRGB(15, 15, 15),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\89\145\143\131\60", "\144\112\54\227\235\230\78\205")]=Color3.fromRGB(50, 50, 50)}};
TABLE_TableIndirection["DefTheme%0"] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\136\203\210\7\7\56", "\75\220\163\183\106\98")][LUAOBFUSACTOR_DECRYPT_STR_0("\0\182\138\52\210", "\185\98\218\235\87")];
GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\255\52\34\235\219", "\202\171\92\71\134\190")] = TABLE_TableIndirection["DefTheme%0"];
TABLE_TableIndirection["TabsFolder%0"] = nil;
TABLE_TableIndirection["PagesFolder%0"] = nil;
local ScreenGui;
GuiLib.createGui = function(name)
	TABLE_TableIndirection["SGui%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\128\43\29\249\213\85\148\61\6", "\59\211\72\111\156\176"));
	TABLE_TableIndirection["Main%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\104\149\226\32\75", "\77\46\231\131"));
	TABLE_TableIndirection["MFolder%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\156\70\183\77\191", "\32\218\52\214"));
	TABLE_TableIndirection["PFolder%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\104\5\48\165\244", "\58\46\119\81\200\145\208\37"));
	TABLE_TableIndirection["T%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\13\158\49\161\172", "\86\75\236\80\204\201\221"));
	TABLE_TableIndirection["TFolder%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\84\83\118\136\251", "\235\18\33\23\229\158"));
	TABLE_TableIndirection["UILLayout%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\101\147\237\178\67\174\237\186\73\181\212\175", "\219\48\218\161"));
	TABLE_TableIndirection["TTabs%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\208\116\100\93\247\78\226\225\125", "\128\132\17\28\41\187\47"));
	TABLE_TableIndirection["Head%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\39\32\7\55\88", "\61\97\82\102\90"));
	TABLE_TableIndirection["GuiTitle%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\152\43\179\95\235\86\28\12\160", "\105\204\78\203\43\167\55\126"));
	TABLE_TableIndirection["HideBtn%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\145\175\59\10\49\17\211\69\170\164", "\49\197\202\67\126\115\100\167"));
	TABLE_TableIndirection["CloseBtn%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\3\94\199\61\162\67\74\35\84\209", "\62\87\59\191\73\224\54"));
	TABLE_TableIndirection["Frame%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\193\16\251\196\226", "\169\135\98\154"));
	ScreenGui = TABLE_TableIndirection["SGui%0"];
	TABLE_TableIndirection["SGui%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\7\192\33\141", "\232\73\161\76")] = (name .. LUAOBFUSACTOR_DECRYPT_STR_0("\236\98\45", "\168\171\23\68\52\157\83")) or LUAOBFUSACTOR_DECRYPT_STR_0("\218\126\251\172\40\40\160\225\120\202\129\44\47\149\245\99\236", "\231\148\17\149\205\69\77");
	TABLE_TableIndirection["SGui%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\129\240\76\89\27\163\251\71\85\31\173\208\77\79", "\126\219\185\34\61")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\54\231\80\118\123\111\209\226\4\207\72\123\113\101", "\135\108\174\62\18\30\23\147")][LUAOBFUSACTOR_DECRYPT_STR_0("\133\224\40\199\17\160\52", "\167\214\137\74\171\120\206\83")];
	TABLE_TableIndirection["SGui%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\187\241\32\88\246\179", "\199\235\144\82\61\152")] = game[LUAOBFUSACTOR_DECRYPT_STR_0("\55\26\184\50\2\4\170", "\75\103\118\217")][LUAOBFUSACTOR_DECRYPT_STR_0("\235\91\115\21\181\46\203\85\105\17\171", "\126\167\52\16\116\217")]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\176\171\198\226\82\237\167\178\206", "\159\224\199\167\155\55"));
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\248\47\50\133\186\13", "\156\168\78\64\224\212\121")] = TABLE_TableIndirection["SGui%0"];
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\37\239\166\197\0\252\170\219\9\234\134\193\11\225\183\157", "\174\103\142\197")] = Color3.fromRGB(255, 255, 255);
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\116\41\92\51\34\76\247\67\38\91\12\55\95\246\69\56\94\42\32\80\251\79", "\152\54\72\63\88\69\62")] = 1;
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\246\203\252\88\209\214\205\83\216\203\252\15", "\60\180\164\142")] = Color3.fromRGB(0, 0, 0);
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\122\81\23\45\34\255\33\81\68\0\25\46\245\23\84", "\114\56\62\101\73\71\141")] = 1;
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\136\230\200\205\172\224\212\202", "\164\216\137\187")] = UDim2.new(0.299, 0, 0.299, 1);
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\225\239\43\183", "\107\178\134\81\210\198\158")] = UDim2.new(0.4, 0, 0.401, 0);
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\25\13\150\207\188\61", "\202\88\110\226\166")] = true;
	TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\240\10\142\242\201\215\14\128\251\207", "\170\163\111\226\151")] = true;
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\63\49\191\61", "\73\113\80\210\88\46\87")] = LUAOBFUSACTOR_DECRYPT_STR_0("\218\242\53\220", "\178\151\147\92");
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\177\45\223\23\233\149", "\135\225\76\173\114")] = TABLE_TableIndirection["Frame%0"];
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\56\236\187\187\171\175\168\15\227\188\147\163\177\168\8\190", "\199\122\141\216\208\204\221")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\153\213\21\253\125", "\150\205\189\112\144\24")][LUAOBFUSACTOR_DECRYPT_STR_0("\7\133\188\71\3\154\30\5\43\128", "\112\69\228\223\44\100\232\113")];
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\246\30\4\216\177\110\137\193\17\3\231\164\125\136\199\15\6\193\179\114\133\205", "\230\180\127\103\179\214\28")] = 1;
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\174\10\77\66\225\83\195\131\9\80\84\183", "\128\236\101\63\38\132\33")] = Color3.fromRGB(0, 0, 0);
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\142\166\3\64\179\249\252\165\179\20\116\191\243\202\160", "\175\204\201\113\36\214\139")] = 1;
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\119\195\38\213\16\78\195\59", "\100\39\172\85\188")] = UDim2.new(0, 0, 0.105, 0);
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\158\113\163\133", "\83\205\24\217\224")] = UDim2.new(1, 0, 0.9, 0);
	TABLE_TableIndirection["Main%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\197\201\196\45\245\225\200\46\229\192\195\57\231\203\217\46", "\93\134\165\173")] = true;
	TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\144\243\204\199", "\30\222\146\161\162\90\174\210")] = LUAOBFUSACTOR_DECRYPT_STR_0("\161\219\67\62\22\73\104", "\26\236\157\44\82\114\44");
	TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\213\79\98\15\235\90", "\106\133\46\16")] = TABLE_TableIndirection["Main%0"];
	TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\122\33\112\247\93\82\87\53\125\248\121\79\84\47\97\175", "\32\56\64\19\156\58")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\110\192\224\91\95", "\224\58\168\133\54\58\146")][LUAOBFUSACTOR_DECRYPT_STR_0("\123\87\72\246\114\148\136\30\87\82", "\107\57\54\43\157\21\230\231")];
	TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\249\132\3\241\188\206\252\210\145\20\197\176\196\202\215", "\175\187\235\113\149\217\188")] = 1;
	TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\31\163\136\92\240\93\125\47\172\132\66\231\120\118\40\188", "\24\92\207\225\44\131\25")] = true;
	TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\120\218\162\73", "\29\43\179\216\44\123")] = UDim2.new(1, 0, 1, 0);
	TABLE_TableIndirection["T%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\147\216\45\73", "\44\221\185\64")] = "T";
	TABLE_TableIndirection["T%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\49\230\90\90\125\21", "\19\97\135\40\63")] = TABLE_TableIndirection["MFolder%0"];
	TABLE_TableIndirection["T%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\140\93\48\48\40\35\161\73\61\63\12\62\162\83\33\104", "\81\206\60\83\91\79")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\122\163\213\127\42", "\196\46\203\176\18\79\163\45")][LUAOBFUSACTOR_DECRYPT_STR_0("\154\35\125\21\35\233\224\173\44\122", "\143\216\66\30\126\68\155")];
	TABLE_TableIndirection["T%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\136\199\31\207\192\177\228\232\176\205\61\194\221\166\219", "\129\202\168\109\171\165\195\183")] = 1;
	TABLE_TableIndirection["T%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\18\87\36\209\202\29\233\44", "\134\66\56\87\184\190\116")] = UDim2.new(0, 0, 6.028758e-8, 0);
	TABLE_TableIndirection["T%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\15\56\19\190", "\85\92\81\105\219\121\139\65")] = UDim2.new(0.100000001, 0, 0.999999881, 0);
	TABLE_TableIndirection["TFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\211\178\93\64", "\191\157\211\48\37\28")] = LUAOBFUSACTOR_DECRYPT_STR_0("\30\8\218\87\46\43\199", "\59\74\78\181");
	TABLE_TableIndirection["TFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\239\30\230\25\52\203", "\90\191\127\148\124")] = TABLE_TableIndirection["T%0"];
	TABLE_TableIndirection["TFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\90\136\60\19\125\149\29\30\98\130\30\30\96\130\34", "\119\24\231\78")] = 1;
	TABLE_TableIndirection["TFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\160\44\166\65\219\82\30\151\35\161\126\206\65\31\145\61\164\88\217\78\18\155", "\113\226\77\197\42\188\32")] = 0.95;
	TABLE_TableIndirection["TFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\10\25\231\188\46\31\251\187", "\213\90\118\148")] = UDim2.new(0, 0, 0.1, 0);
	TABLE_TableIndirection["TFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\104\39\174\83", "\45\59\78\212\54")] = UDim2.new(1, 0, 0.9, 0);
	TABLE_TableIndirection["TabsFolder%0"] = TABLE_TableIndirection["TFolder%0"];
	TABLE_TableIndirection["UILLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\32\87\145\142\136\58", "\144\112\54\227\235\230\78\205")] = TABLE_TableIndirection["TFolder%0"];
	TABLE_TableIndirection["UILLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\155\39\29\245\202\84\189\60\14\240\241\87\186\47\1\241\213\85\167", "\59\211\72\111\156\176")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\102\136\241\36\84\136\237\57\79\139\194\33\71\128\237\32\75\137\247", "\77\46\231\131")][LUAOBFUSACTOR_DECRYPT_STR_0("\153\81\184\84\191\70", "\32\218\52\214")];
	TABLE_TableIndirection["UILLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\125\24\35\188\222\162\65\95\92", "\58\46\119\81\200\145\208\37")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\24\131\34\184\134\175\50\46\158", "\86\75\236\80\204\201\221")][LUAOBFUSACTOR_DECRYPT_STR_0("\94\64\110\138\235\159\93\83\115\128\236", "\235\18\33\23\229\158")];
	TABLE_TableIndirection["UILLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\96\187\197\191\89\180\198", "\219\48\218\161")] = UDim.new(0.01, 0);
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\212\112\110\76\213\91", "\128\132\17\28\41\187\47")] = TABLE_TableIndirection["T%0"];
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\35\61\20\62\88\19\1\15\32\88\49\59\30\63\81", "\61\97\82\102\90")] = 1;
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\159\39\177\78", "\105\204\78\203\43\167\55\126")] = UDim2.new(1, 0, 0.1, 0);
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\131\165\45\10", "\49\197\202\67\126\115\100\167")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\17\84\209\61", "\62\87\59\191\73\224\54")][LUAOBFUSACTOR_DECRYPT_STR_0("\212\13\239\219\228\7\201\200\233\17\216\198\235\6", "\169\135\98\154")];
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\233\118\39\95\250\33\199\222\121\32\96\239\50\198\216\103\37\70\248\61\203\210", "\168\171\23\68\52\157\83")] = 0.9;
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\192\116\237\185", "\231\148\17\149\205\69\77")] = LUAOBFUSACTOR_DECRYPT_STR_0("\17\208\88\73", "\211\69\177\58\58");
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\180\162\223\239\116\240\140\168\213\168", "\159\224\199\167\155\55")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\195\251\57\223\242", "\178\151\147\92")][LUAOBFUSACTOR_DECRYPT_STR_0("\184\248\84\38", "\26\236\157\44\82\114\44")];
	TABLE_TableIndirection["TTabs%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\30\43\205\79\25\45\212\87\47\42", "\59\74\78\181")] = true;
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\11\208\87\95", "\211\69\177\58\58")] = LUAOBFUSACTOR_DECRYPT_STR_0("\159\224\120\241", "\171\215\133\25\149\137");
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\135\228\107\240\231\223", "\171\215\133\25\149\137")] = TABLE_TableIndirection["Frame%0"];
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\195\201\49\241\232\34\243\87\239\204\17\245\227\63\238\17", "\34\129\168\82\154\143\80\156")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\177\186\54\6\77", "\233\229\210\83\107\40\46")][LUAOBFUSACTOR_DECRYPT_STR_0("\233\71\51\210", "\101\161\34\82\182")];
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\202\2\75\250\222\240\177\39\242\8\105\247\195\231\142", "\78\136\109\57\158\187\130\226")] = 1;
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\14\48\234\248\42\54\246\255", "\145\94\95\153")] = UDim2.new(0, 0, 0, 0);
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\206\196\14\208", "\215\157\173\116\181\46")] = UDim2.new(1, 0, 0.1, 0);
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\27\181\134\247", "\186\85\212\235\146")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\213\193\38\246\234", "\34\129\168\82\154\143\80\156");
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\242\128\4\251\55\250", "\56\162\225\118\158\89\142")] = TABLE_TableIndirection["Head%0"];
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\126\10\210\171\39\202\111\12\218\170\18\209\68\0\204", "\184\60\101\160\207\66")] = 1;
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\1\141\111\181\37\139\115\178", "\220\81\226\28")] = UDim2.new(0.24, 0, 0, 0);
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\49\212\129\240\237\213\28\192\140\255\222\213\18\219\145\235\235\213\22\219\129\226", "\167\115\181\226\155\138")] = 1;
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\209\43\253\89", "\166\130\66\135\60\27\17")] = UDim2.new(0.51, 0, 1, 0);
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\98\69\192\97", "\80\36\42\174\21")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\104\31\57\110", "\26\46\112\87")][LUAOBFUSACTOR_DECRYPT_STR_0("\138\44\190\102\188\186\118\181\183\48\137\123\179\187", "\212\217\67\203\20\223\223\37")];
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\142\136\176\198", "\178\218\237\200")] = name or LUAOBFUSACTOR_DECRYPT_STR_0("\162\167\63\2\67\105\156\140\255\31\2\74\92\136\151\171", "\233\229\210\83\107\40\46");
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\130\176\254\196\149\186\234\223\164\230", "\176\214\213\134")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\192\165\179\217\173", "\57\148\205\214\180\200\54")][LUAOBFUSACTOR_DECRYPT_STR_0("\38\248\45\32", "\22\114\157\85\84")];
	TABLE_TableIndirection["GuiTitle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\240\206\11\208\110\245\169\200\206\23", "\200\164\171\115\164\61\150")] = true;
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\144\245\14\64", "\227\222\148\99\37")] = LUAOBFUSACTOR_DECRYPT_STR_0("\233\75\54\211\39\213\76", "\101\161\34\82\182");
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\3\83\64\243\247\39", "\153\83\50\50\150")] = TABLE_TableIndirection["Head%0"];
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\127\119\112\23\116\185\66\72\120\119\63\124\167\66\79\37", "\45\61\22\19\124\19\203")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\245\26\8\248\7", "\217\161\114\109\149\98\16")][LUAOBFUSACTOR_DECRYPT_STR_0("\48\53\44\104\179\122", "\20\114\64\88\28\220")];
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\19\14\192\176\253\194\142\56\27\215\132\241\200\184\61", "\221\81\97\178\212\152\176")] = 1;
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\253\232\14\242\14\196\232\19", "\122\173\135\125\155")] = UDim2.new(0.76, 0, 0.2, 0);
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\183\200\26\188", "\168\228\161\96\217\95\81")] = UDim2.new(0.09, 0, 0.6, 0);
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\253\222\32\72", "\55\187\177\78\60\79")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\11\193\81\255", "\224\77\174\63\139\38\175")][LUAOBFUSACTOR_DECRYPT_STR_0("\183\78\77\60\135\68\107\47\138\82\122\33\136\69", "\78\228\33\56")];
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\250\123\170\23", "\229\174\30\210\99")] = LUAOBFUSACTOR_DECRYPT_STR_0("\197\4\87\247\214\235\152\43", "\78\136\109\57\158\187\130\226");
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\47\232\158\69\206\50\53\20\255\213", "\89\123\141\230\49\141\93")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\199\121\243\1\21", "\42\147\17\150\108\112")][LUAOBFUSACTOR_DECRYPT_STR_0("\59\163\53\107", "\136\111\198\77\31\135")];
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\54\12\191\66\142\231\22\165\7\13", "\201\98\105\199\54\221\132\119")] = true;
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\151\13\142\36", "\204\217\108\227\65\98\85")] = LUAOBFUSACTOR_DECRYPT_STR_0("\29\51\246\226\59\29\237\255", "\145\94\95\153");
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\110\194\231\224\34\212", "\160\62\163\149\133\76")] = TABLE_TableIndirection["Head%0"];
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\244\161\14\36\196\196\175\24\33\199\245\175\1\32\209\133", "\163\182\192\109\79")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\0\46\5\205\240", "\149\84\70\96\160")][LUAOBFUSACTOR_DECRYPT_STR_0("\26\19\25\249\55\8", "\141\88\102\109")];
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\145\92\216\116\31\47\102\200\169\86\250\121\2\56\89", "\161\211\51\170\16\122\93\53")] = 1;
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\203\161\161\33\239\167\189\38", "\72\155\206\210")] = UDim2.new(0.875, 0, 0.2, 0);
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\117\115\78\11", "\83\38\26\52\110")] = UDim2.new(0.09, 0, 0.6, 0);
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\126\24\41\82", "\38\56\119\71")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\213\224\86\194", "\54\147\143\56\182\69")][LUAOBFUSACTOR_DECRYPT_STR_0("\229\142\234\91\220\211\178\254\71\204\244\142\243\77", "\191\182\225\159\41")];
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\31\23\48\65", "\162\75\114\72\53\235\231")] = LUAOBFUSACTOR_DECRYPT_STR_0("\222\193\27\198\75", "\215\157\173\116\181\46");
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\184\57\92\246\112\13\128\51\86\177", "\98\236\92\36\130\51")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\144\17\9\183\64", "\80\196\121\108\218\37\200\213")][LUAOBFUSACTOR_DECRYPT_STR_0("\52\118\26\107", "\234\96\19\98\31\43\110")];
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\50\26\74\211\159\113\138\10\26\86", "\235\102\127\50\167\204\18")] = true;
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\126\160\248\38", "\78\48\193\149\67\36")] = LUAOBFUSACTOR_DECRYPT_STR_0("\5\181\140\247\201\19\187\135\246\223\39", "\186\85\212\235\146");
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\0\31\146\29\79\36", "\33\80\126\224\120")] = TABLE_TableIndirection["MFolder%0"];
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\206\169\0\207\91\254\167\22\202\88\207\167\15\203\78\191", "\60\140\200\99\164")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\179\252\1\43\167", "\194\231\148\100\70")][LUAOBFUSACTOR_DECRYPT_STR_0("\100\77\194\168\241\218\73\89\207\167", "\168\38\44\161\195\150")];
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\162\253\129\125\55\250\185\3\142\248\182\100\49\230\165\6\129\238\135\120\51\241", "\118\224\156\226\22\80\136\214")] = 1;
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\96\225\75\132\71\252\106\137\88\235\105\137\90\235\85", "\224\34\142\57")] = 1;
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\238\168\214\212\103\248\82\0", "\110\190\199\165\189\19\145\61")] = UDim2.new(0.100000016, 0, 6.028758e-8, 0);
	TABLE_TableIndirection["PFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\233\226\109\237", "\167\186\139\23\136\235")] = UDim2.new(0.899999857, 0, 0.999999881, 0);
	TABLE_TableIndirection["PagesFolder%0"] = TABLE_TableIndirection["PFolder%0"];
	TABLE_TableIndirection["curPos%0"] = TABLE_TableIndirection["MFolder%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\42\186\155\4\14\188\135\3", "\109\122\213\232")];
	TABLE_TableIndirection["hidePos%0"] = UDim2.new(0, 0, -1, 0);
	TABLE_TableIndirection["needToHide%0"] = true;
	TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\195\248\183\35\235\213\183\36\250\248\172\97\205\251\171\51\229", "\80\142\151\194")]:Connect(function()
		if (TABLE_TableIndirection["needToHide%0"] or (4593 <= 2672) or (1168 > 3156)) then
			TABLE_TableIndirection["MFolder%0"]:TweenPosition(TABLE_TableIndirection["hidePos%0"], Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\38\199\100\69\13\193\83\69\17\195\116\88\10\201\121", "\44\99\166\23")].Out, Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\89\246\58\63\61\163\79\227\48\58\54", "\196\28\151\73\86\83")].Quad, 0.3, true);
			TABLE_TableIndirection["needToHide%0"] = false;
			TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\199\6\49\4", "\22\147\99\73\112\226\56\120")] = LUAOBFUSACTOR_DECRYPT_STR_0("\239\128\14\247\52\231\66\199", "\56\162\225\118\158\89\142");
		else
			TABLE_TableIndirection["FlatIdent_7DD24%0"] = 0;
			TABLE_TableIndirection["FlatIdent_8D327%0"] = nil;
			TABLE_TableIndirection["FlatIdent_2584C%0"] = nil;
			while true do
				if (TABLE_TableIndirection["FlatIdent_7DD24%0"] == 1) then
					while true do
						if (TABLE_TableIndirection["FlatIdent_8D327%0"] == 0) then
							TABLE_TableIndirection["FlatIdent_2584C%0"] = 0;
							while true do
								if ((TABLE_TableIndirection["FlatIdent_2584C%0"] ~= 0) or (572 > 4486)) then
								else
									TABLE_TableIndirection["FlatIdent_C460%0"] = 0;
									TABLE_TableIndirection["FlatIdent_86E18%0"] = nil;
									while true do
										if (TABLE_TableIndirection["FlatIdent_C460%0"] == 0) then
											TABLE_TableIndirection["FlatIdent_86E18%0"] = 0;
											while true do
												if ((1404 == 1404) and (TABLE_TableIndirection["FlatIdent_86E18%0"] == 1)) then
													TABLE_TableIndirection["FlatIdent_2584C%0"] = 1;
													break;
												end
												if (TABLE_TableIndirection["FlatIdent_86E18%0"] == 0) then
													TABLE_TableIndirection["MFolder%0"]:TweenPosition(TABLE_TableIndirection["curPos%0"], Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\157\116\241\252\131\191\81\235\231\136\187\97\235\250\131", "\237\216\21\130\149")].Out, Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\167\79\76\86\190\206\109\150\87\83\90", "\62\226\46\63\63\208\169")].Quad, 0.3, true);
													TABLE_TableIndirection["needToHide%0"] = true;
													TABLE_TableIndirection["FlatIdent_86E18%0"] = 1;
												end
											end
											break;
										end
									end
								end
								if (TABLE_TableIndirection["FlatIdent_2584C%0"] ~= 1) then
								else
									TABLE_TableIndirection["HideBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\209\28\77\151", "\62\133\121\53\227\127\109\79")] = LUAOBFUSACTOR_DECRYPT_STR_0("\113\12\206\166\47\209\70\0", "\184\60\101\160\207\66");
									break;
								end
							end
							break;
						end
					end
					break;
				end
				if (TABLE_TableIndirection["FlatIdent_7DD24%0"] == 0) then
					TABLE_TableIndirection["FlatIdent_8D327%0"] = 0;
					TABLE_TableIndirection["FlatIdent_2584C%0"] = nil;
					TABLE_TableIndirection["FlatIdent_7DD24%0"] = 1;
				end
			end
		end
	end);
	TABLE_TableIndirection["TweenService%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\5\149\121\185\63\177\121\174\39\139\127\185", "\220\81\226\28"));
	TABLE_TableIndirection["CloseBtn%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\61\27\39\230\211\140\183\4\0\61\251\135\141\174\25\23\57", "\194\112\116\82\149\182\206")]:Connect(function()
		TABLE_TableIndirection["FlatIdent_61B23%0"] = 0;
		TABLE_TableIndirection["FlatIdent_1D164%0"] = nil;
		TABLE_TableIndirection["FlatIdent_6D4CB%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_61B23%0"] == 0) then
				TABLE_TableIndirection["FlatIdent_1D164%0"] = 0;
				TABLE_TableIndirection["FlatIdent_6D4CB%0"] = nil;
				TABLE_TableIndirection["FlatIdent_61B23%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_61B23%0"] == 1) then
				while true do
					if (0 ~= TABLE_TableIndirection["FlatIdent_1D164%0"]) then
					else
						TABLE_TableIndirection["FlatIdent_6D4CB%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_6D4CB%0"] ~= 1) then
							else
								TABLE_TableIndirection["SGui%0"]:Destroy();
								break;
							end
							if (TABLE_TableIndirection["FlatIdent_6D4CB%0"] ~= 0) then
							else
								TABLE_TableIndirection["FlatIdent_67C40%0"] = 0;
								while true do
									if ((1 ~= TABLE_TableIndirection["FlatIdent_67C40%0"]) or (3748 < 2212)) then
									else
										TABLE_TableIndirection["FlatIdent_6D4CB%0"] = 1;
										break;
									end
									if ((TABLE_TableIndirection["FlatIdent_67C40%0"] ~= 0) or (1180 == 2180)) then
									else
										TABLE_TableIndirection["FlatIdent_77C29%0"] = 0;
										while true do
											if (TABLE_TableIndirection["FlatIdent_77C29%0"] == 0) then
												for _, Obj in pairs(TABLE_TableIndirection["SGui%0"]:GetDescendants()) do
													TABLE_TableIndirection["FlatIdent_5AB84%0"] = 0;
													TABLE_TableIndirection["tweenInfo%0"] = nil;
													while true do
														if ((4090 < 4653) and (TABLE_TableIndirection["FlatIdent_5AB84%0"] ~= 1)) then
														else
															if (Obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\112\79\214\97\18\81\94\218\122\62", "\80\36\42\174\21")) or (1168 > 3156) or (2652 < 196)) then
																TABLE_TableIndirection["FlatIdent_9147D%0"] = 0;
																TABLE_TableIndirection["tween%0"] = nil;
																while true do
																	if (TABLE_TableIndirection["FlatIdent_9147D%0"] == 0) then
																		TABLE_TableIndirection["tween%0"] = TABLE_TableIndirection["TweenService%0"]:Create(Obj, TABLE_TableIndirection["tweenInfo%0"], {[LUAOBFUSACTOR_DECRYPT_STR_0("\108\17\52\113\73\2\56\111\64\20\3\104\79\30\36\106\79\2\50\116\77\9", "\26\46\112\87")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\141\38\179\96\139\173\68\186\170\51\170\102\186\177\70\173", "\212\217\67\203\20\223\223\37")]=1});
																		TABLE_TableIndirection["tween%0"]:Play();
																		break;
																	end
																end
															end
															if Obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\142\136\176\198\150\140\170\215\182", "\178\218\237\200")) then
																TABLE_TableIndirection["tween%0"] = TABLE_TableIndirection["TweenService%0"]:Create(Obj, TABLE_TableIndirection["tweenInfo%0"], {[LUAOBFUSACTOR_DECRYPT_STR_0("\130\176\254\196\130\167\231\222\165\165\231\194\179\187\229\201", "\176\214\213\134")]=1});
																TABLE_TableIndirection["tween%0"]:Play();
															end
															break;
														end
														if (TABLE_TableIndirection["FlatIdent_5AB84%0"] ~= 0) then
														else
															TABLE_TableIndirection["tweenInfo%0"] = TweenInfo.new(0.3, Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\28\169\95\17\206\229\61\45\177\64\29", "\110\89\200\44\120\160\130")].Quad, Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\142\194\88\79\77\77\31\68\185\198\72\82\74\69\53", "\45\203\163\43\38\35\42\91")].Out);
															if (Obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\53\199\131\246\239", "\167\115\181\226\155\138")) or (863 >= 4584)) then
																TABLE_TableIndirection["FlatIdent_6A83E%0"] = 0;
																TABLE_TableIndirection["FlatIdent_8D83D%0"] = nil;
																TABLE_TableIndirection["tween%0"] = nil;
																while true do
																	if (TABLE_TableIndirection["FlatIdent_6A83E%0"] == 1) then
																		while true do
																			if (TABLE_TableIndirection["FlatIdent_8D83D%0"] ~= 0) then
																			else
																				TABLE_TableIndirection["tween%0"] = TABLE_TableIndirection["TweenService%0"]:Create(Obj, TABLE_TableIndirection["tweenInfo%0"], {[LUAOBFUSACTOR_DECRYPT_STR_0("\192\35\228\87\124\99\201\247\44\227\104\105\112\200\241\50\230\78\126\127\197\251", "\166\130\66\135\60\27\17")]=1});
																				TABLE_TableIndirection["tween%0"]:Play();
																				break;
																			end
																		end
																		break;
																	end
																	if (TABLE_TableIndirection["FlatIdent_6A83E%0"] == 0) then
																		TABLE_TableIndirection["FlatIdent_8D83D%0"] = 0;
																		TABLE_TableIndirection["tween%0"] = nil;
																		TABLE_TableIndirection["FlatIdent_6A83E%0"] = 1;
																	end
																end
															end
															TABLE_TableIndirection["FlatIdent_5AB84%0"] = 1;
														end
													end
												end
												wait(1);
												TABLE_TableIndirection["FlatIdent_77C29%0"] = 1;
											end
											if (TABLE_TableIndirection["FlatIdent_77C29%0"] == 1) then
												TABLE_TableIndirection["FlatIdent_67C40%0"] = 1;
												break;
											end
										end
									end
								end
							end
						end
						break;
					end
				end
				break;
			end
		end
	end);
	TABLE_TableIndirection["dragging%0"] = false;
	local dragInput, mouseStartPos, frameStartPos;
	TABLE_TableIndirection["UserInputService%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\193\190\179\198\129\88\73\225\185\133\209\186\64\80\247\168", "\57\148\205\214\180\200\54"));
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\251\139\204\54\147\139\81\213\132\210", "\52\178\229\188\67\231\201")]:Connect(function(input)
		if ((4135 < 4817) and ((input[LUAOBFUSACTOR_DECRYPT_STR_0("\20\82\85\22\222\82\51\52\85\100\29\231\89", "\67\65\33\48\100\151\60")] == Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\234\244\171\202\218\209\247\187\204\199\198\247\171", "\147\191\135\206\184")][LUAOBFUSACTOR_DECRYPT_STR_0("\169\39\179\210\221\113\167\144\60\169\207\137", "\210\228\72\198\161\184\51")]) or (572 > 4486))) then
			TABLE_TableIndirection["FlatIdent_1743D%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_1743D%0"] ~= 0) then
				else
					TABLE_TableIndirection["dragging%0"] = true;
					mouseStartPos = input[LUAOBFUSACTOR_DECRYPT_STR_0("\6\70\224\25\103\199\57\71", "\174\86\41\147\112\19")];
					TABLE_TableIndirection["FlatIdent_1743D%0"] = 1;
				end
				if (TABLE_TableIndirection["FlatIdent_1743D%0"] ~= 1) then
				else
					frameStartPos = TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\107\15\158\2\49\6\30\165", "\203\59\96\237\107\69\111\113")];
					input[LUAOBFUSACTOR_DECRYPT_STR_0("\7\30\173\239\54\245\211", "\183\68\118\204\129\81\144")]:Connect(function()
						if ((1404 == 1404) and (input[LUAOBFUSACTOR_DECRYPT_STR_0("\59\190\117\246\34\140\30\184\100\215\31\131\26\168", "\226\110\205\16\132\107")] == Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\222\208\229\203\104\229\211\245\205\114\255\194\244\220", "\33\139\163\128\185")][LUAOBFUSACTOR_DECRYPT_STR_0("\114\86\0", "\190\55\56\100")])) then
							TABLE_TableIndirection["dragging%0"] = false;
						end
					end);
					break;
				end
			end
		end
	end);
	TABLE_TableIndirection["Head%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\127\161\44\11\7\192\251\87\161\59\27\23", "\147\54\207\92\126\115\131")]:Connect(function(input)
		if (input[LUAOBFUSACTOR_DECRYPT_STR_0("\56\34\48\111\36\112\29\36\33\73\20\110\8", "\30\109\81\85\29\109")] ~= Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\202\98\81\164\31\208\236\234\101\96\175\38\219", "\156\159\17\52\214\86\190")][LUAOBFUSACTOR_DECRYPT_STR_0("\131\224\168\175\171\194\178\170\171\226\184\178\186", "\220\206\143\221")]) then
		else
			dragInput = input;
		end
	end);
	TABLE_TableIndirection["UserInputService%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\175\115\61\2\204\239\218\135\115\42\18\220", "\178\230\29\77\119\184\172")]:Connect(function(input)
		if (((input == dragInput) and TABLE_TableIndirection["dragging%0"]) or (3748 < 2212) or (724 >= 1668)) then
			TABLE_TableIndirection["FlatIdent_5BA5E%0"] = 0;
			TABLE_TableIndirection["FlatIdent_25011%0"] = nil;
			TABLE_TableIndirection["delta%0"] = nil;
			while true do
				if (TABLE_TableIndirection["FlatIdent_5BA5E%0"] == 1) then
					while true do
						if ((272 == 272) and (TABLE_TableIndirection["FlatIdent_25011%0"] ~= 0)) then
						else
							TABLE_TableIndirection["delta%0"] = input[LUAOBFUSACTOR_DECRYPT_STR_0("\197\177\25\18\99\241\250\176", "\152\149\222\106\123\23")] - mouseStartPos;
							TABLE_TableIndirection["Frame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\237\41\229\74\161\212\41\248", "\213\189\70\150\35")] = UDim2.new(frameStartPos['X'].Scale, TABLE_TableIndirection["obf_AND%0"](frameStartPos['X'].Offset, TABLE_TableIndirection["delta%0"].X) + TABLE_TableIndirection["obf_OR%0"](frameStartPos['X'].Offset, TABLE_TableIndirection["delta%0"].X), frameStartPos['Y'].Scale, TABLE_TableIndirection["obf_AND%0"](frameStartPos['Y'].Offset, TABLE_TableIndirection["delta%0"].Y) + TABLE_TableIndirection["obf_OR%0"](frameStartPos['Y'].Offset, TABLE_TableIndirection["delta%0"].Y));
							break;
						end
					end
					break;
				end
				if (TABLE_TableIndirection["FlatIdent_5BA5E%0"] == 0) then
					TABLE_TableIndirection["FlatIdent_25011%0"] = 0;
					TABLE_TableIndirection["delta%0"] = nil;
					TABLE_TableIndirection["FlatIdent_5BA5E%0"] = 1;
				end
			end
		end
	end);
end;
TABLE_TableIndirection["Examples%0"] = {[LUAOBFUSACTOR_DECRYPT_STR_0("\62\244\38\32\66\19\255", "\22\114\157\85\84")]=function(name)
	TABLE_TableIndirection["FlatIdent_20FB0%0"] = 0;
	TABLE_TableIndirection["TabExample%0"] = nil;
	TABLE_TableIndirection["label%0"] = nil;
	TABLE_TableIndirection["ExampleTabFrame%0"] = nil;
	TABLE_TableIndirection["ScrollingFrame%0"] = nil;
	TABLE_TableIndirection["TitleLabel%0"] = nil;
	TABLE_TableIndirection["UIListLayout%0"] = nil;
	while true do
		TABLE_TableIndirection["FlatIdent_6C34%0"] = 0;
		while true do
			if ((100 <= 3123) and (TABLE_TableIndirection["FlatIdent_6C34%0"] ~= 3)) then
			else
				TABLE_TableIndirection["FlatIdent_35A31%0"] = 0;
				while true do
					if (TABLE_TableIndirection["FlatIdent_35A31%0"] == 0) then
						if ((2 == TABLE_TableIndirection["FlatIdent_20FB0%0"]) or (1369 > 4987)) then
							TABLE_TableIndirection["FlatIdent_64E40%0"] = 0;
							TABLE_TableIndirection["FlatIdent_455BF%0"] = nil;
							while true do
								if (TABLE_TableIndirection["FlatIdent_64E40%0"] == 0) then
									TABLE_TableIndirection["FlatIdent_455BF%0"] = 0;
									while true do
										if ((TABLE_TableIndirection["FlatIdent_455BF%0"] ~= 0) or (863 >= 4584)) then
										else
											TABLE_TableIndirection["FlatIdent_8D1A5%0"] = 0;
											while true do
												if (0 == TABLE_TableIndirection["FlatIdent_8D1A5%0"]) then
													TABLE_TableIndirection["label%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\176\196\24\173\29\36\220\144\206\14", "\168\228\161\96\217\95\81"));
													TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\97\84\121\13", "\104\47\53\20")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\239\208\44\126\59\89", "\55\187\177\78\60\79");
													TABLE_TableIndirection["FlatIdent_8D1A5%0"] = 1;
												end
												if (1 == TABLE_TableIndirection["FlatIdent_8D1A5%0"]) then
													TABLE_TableIndirection["FlatIdent_455BF%0"] = 1;
													break;
												end
											end
										end
										if (TABLE_TableIndirection["FlatIdent_455BF%0"] ~= 1) then
										else
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\147\77\147\25\178\27", "\111\195\44\225\124\220")] = TABLE_TableIndirection["TabExample%0"];
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\235\79\26\118", "\203\184\38\96\19\203")] = UDim2.new(1, 0, 1, 0);
											TABLE_TableIndirection["FlatIdent_455BF%0"] = 2;
										end
										if (TABLE_TableIndirection["FlatIdent_455BF%0"] ~= 2) then
										else
											TABLE_TableIndirection["FlatIdent_20FB0%0"] = 3;
											break;
										end
									end
									break;
								end
							end
						end
						if ((TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 3) or (724 >= 1668)) then
						else
							TABLE_TableIndirection["FlatIdent_6DC53%0"] = 0;
							TABLE_TableIndirection["FlatIdent_2AC68%0"] = nil;
							while true do
								if (0 == TABLE_TableIndirection["FlatIdent_6DC53%0"]) then
									TABLE_TableIndirection["FlatIdent_2AC68%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_2AC68%0"] ~= 2) then
										else
											TABLE_TableIndirection["FlatIdent_20FB0%0"] = 4;
											break;
										end
										if ((428 < 1804) and (TABLE_TableIndirection["FlatIdent_2AC68%0"] ~= 0)) then
										else
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\27\114\122\74\201\43\124\108\79\202\26\124\117\78\220\106", "\174\89\19\25\33")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\27\26\87\67\242", "\107\79\114\50\46\151\231")][LUAOBFUSACTOR_DECRYPT_STR_0("\27\167\182\34\141\43\184\213\55\162", "\160\89\198\213\73\234\89\215")];
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\106\112\183\245\194\90\126\161\240\193\124\99\181\240\214\88\112\166\251\203\75\104", "\165\40\17\212\158")] = 0.2;
											TABLE_TableIndirection["FlatIdent_2AC68%0"] = 1;
										end
										if ((TABLE_TableIndirection["FlatIdent_2AC68%0"] ~= 1) or (3325 > 4613)) then
										else
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\209\220\16\39", "\70\133\185\104\83")] = name;
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\48\64\92\62\234\11\73\75\56\154", "\169\100\37\36\74")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\52\143\167\93\5", "\48\96\231\194")][LUAOBFUSACTOR_DECRYPT_STR_0("\252\95\22\57", "\227\168\58\110\77\121\184\207")];
											TABLE_TableIndirection["FlatIdent_2AC68%0"] = 2;
										end
									end
									break;
								end
							end
						end
						TABLE_TableIndirection["FlatIdent_35A31%0"] = 1;
					end
					if (TABLE_TableIndirection["FlatIdent_35A31%0"] == 1) then
						if ((TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 12) or (4950 <= 4553)) then
						else
							TABLE_TableIndirection["FlatIdent_1B1BA%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_1B1BA%0"] ~= 0) then
								else
									TABLE_TableIndirection["FlatIdent_5B4A8%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_5B4A8%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_1B1BA%0"] = 1;
											break;
										end
										if (TABLE_TableIndirection["FlatIdent_5B4A8%0"] == 0) then
											TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\79\57\167\84\130\216\112\169\126\56", "\197\27\92\223\32\209\187\17")] = true;
											TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\55\90\219\239\48\86\217\254", "\155\99\63\163")] = 14;
											TABLE_TableIndirection["FlatIdent_5B4A8%0"] = 1;
										end
									end
								end
								if ((2665 <= 3933) and (TABLE_TableIndirection["FlatIdent_1B1BA%0"] ~= 1)) then
								else
									TABLE_TableIndirection["FlatIdent_49280%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_49280%0"] == 0) then
											TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\182\212\185\153\142\150\131\193\177\136\189", "\228\226\177\193\237\217")] = true;
											TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\0\181\59\242", "\134\84\208\67")] = name;
											TABLE_TableIndirection["FlatIdent_49280%0"] = 1;
										end
										if (TABLE_TableIndirection["FlatIdent_49280%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_1B1BA%0"] = 2;
											break;
										end
									end
								end
								if (TABLE_TableIndirection["FlatIdent_1B1BA%0"] ~= 2) then
								else
									TABLE_TableIndirection["FlatIdent_20FB0%0"] = 13;
									break;
								end
							end
						end
						TABLE_TableIndirection["FlatIdent_6C34%0"] = 4;
						break;
					end
				end
			end
			if (TABLE_TableIndirection["FlatIdent_6C34%0"] ~= 2) then
			else
				if ((3273 == 3273) and (TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 14)) then
				else
					TABLE_TableIndirection["FlatIdent_206F8%0"] = 0;
					TABLE_TableIndirection["FlatIdent_1BCFB%0"] = nil;
					while true do
						if (0 == TABLE_TableIndirection["FlatIdent_206F8%0"]) then
							TABLE_TableIndirection["FlatIdent_1BCFB%0"] = 0;
							while true do
								TABLE_TableIndirection["FlatIdent_3CF36%0"] = 0;
								while true do
									if (0 == TABLE_TableIndirection["FlatIdent_3CF36%0"]) then
										if (TABLE_TableIndirection["FlatIdent_1BCFB%0"] == 1) then
											return TABLE_TableIndirection["TabExample%0"];
										end
										if (TABLE_TableIndirection["FlatIdent_1BCFB%0"] == 0) then
											TABLE_TableIndirection["UIListLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\35\173\130\88\26\162\129", "\60\115\204\230")] = UDim.new(0.02, 0);
											TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\202\53\254\99\226\24\254\100\243\53\229\33\196\54\226\115\236", "\16\135\90\139")]:Connect(function()
												TABLE_TableIndirection["FlatIdent_4D434%0"] = 0;
												TABLE_TableIndirection["FlatIdent_5EE26%0"] = nil;
												while true do
													if (TABLE_TableIndirection["FlatIdent_4D434%0"] == 0) then
														TABLE_TableIndirection["FlatIdent_5EE26%0"] = 0;
														while true do
															if (TABLE_TableIndirection["FlatIdent_5EE26%0"] == 0) then
																for _, page in ipairs(TABLE_TableIndirection["PagesFolder%0"]:GetChildren()) do
																	if ((3824 > 409) and page:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\52\50\57\113\185", "\20\114\64\88\28\220"))) then
																		page[LUAOBFUSACTOR_DECRYPT_STR_0("\98\125\21\58\76\88\125", "\24\52\20\102\83\46\52")] = false;
																	end
																end
																TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\242\38\50\45\13\200\42", "\111\164\79\65\68")] = true;
																break;
															end
														end
														break;
													end
												end
											end);
											TABLE_TableIndirection["FlatIdent_1BCFB%0"] = 1;
										end
										break;
									end
								end
							end
							break;
						end
					end
				end
				if ((2087 == 2087) and (TABLE_TableIndirection["FlatIdent_20FB0%0"] == 7)) then
					TABLE_TableIndirection["FlatIdent_8B336%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_8B336%0"] == 1) then
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\246\216\145\219\32\254", "\138\166\185\227\190\78")] = TABLE_TableIndirection["ExampleTabFrame%0"];
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\234\119\209\62\68\38", "\121\171\20\165\87\50\67")] = true;
							TABLE_TableIndirection["FlatIdent_8B336%0"] = 2;
						end
						if (TABLE_TableIndirection["FlatIdent_8B336%0"] == 0) then
							TABLE_TableIndirection["ScrollingFrame%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\2\2\192\187\244\220\180\63\6\244\166\249\221\184", "\221\81\97\178\212\152\176"));
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\232\57\180\51", "\98\166\88\217\86\217")] = LUAOBFUSACTOR_DECRYPT_STR_0("\254\228\15\244\22\193\238\19\252\60\223\230\16\254", "\122\173\135\125\155");
							TABLE_TableIndirection["FlatIdent_8B336%0"] = 1;
						end
						if (TABLE_TableIndirection["FlatIdent_8B336%0"] == 2) then
							TABLE_TableIndirection["FlatIdent_20FB0%0"] = 8;
							break;
						end
					end
				end
				if (11 == TABLE_TableIndirection["FlatIdent_20FB0%0"]) then
					TABLE_TableIndirection["FlatIdent_6D9D2%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_6D9D2%0"] == 1) then
							TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\208\249\119\21", "\188\150\150\25\97\230")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\252\134\81\22", "\141\186\233\63\98\108")][LUAOBFUSACTOR_DECRYPT_STR_0("\194\229\57\164\38\244\217\45\184\54\211\229\32\178", "\69\145\138\76\214")];
							TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\68\202\145\157\156\25\124\192\155\218", "\118\16\175\233\233\223")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\191\140\48\182\235", "\29\235\228\85\219\142\235")][LUAOBFUSACTOR_DECRYPT_STR_0("\9\209\162\201", "\50\93\180\218\189\23\46\71")];
							TABLE_TableIndirection["FlatIdent_6D9D2%0"] = 2;
						end
						if (TABLE_TableIndirection["FlatIdent_6D9D2%0"] == 2) then
							TABLE_TableIndirection["FlatIdent_20FB0%0"] = 12;
							break;
						end
						if (TABLE_TableIndirection["FlatIdent_6D9D2%0"] == 0) then
							TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\252\171\73\72\65\206\123\215\190\94\124\77\196\77\210", "\40\190\196\59\44\36\188")] = 1;
							TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\15\76\198\177", "\109\92\37\188\212\154\29")] = UDim2.new(0.95, 0, 0.1, 0);
							TABLE_TableIndirection["FlatIdent_6D9D2%0"] = 1;
						end
					end
				end
				TABLE_TableIndirection["FlatIdent_6C34%0"] = 3;
			end
			if ((4 ~= TABLE_TableIndirection["FlatIdent_6C34%0"]) or (3404 > 4503)) then
			else
				if (TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 8) then
				else
					TABLE_TableIndirection["FlatIdent_3EEE1%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_3EEE1%0"] == 1) then
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\38\224\182\199\52\72\55\230\190\198\1\83\28\234\168", "\58\100\143\196\163\81")] = 1;
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\41\75\57\166", "\110\122\34\67\195\95\41\133")] = UDim2.new(1, 0, 1, 0);
							TABLE_TableIndirection["FlatIdent_3EEE1%0"] = 2;
						end
						if (TABLE_TableIndirection["FlatIdent_3EEE1%0"] ~= 2) then
						else
							TABLE_TableIndirection["FlatIdent_20FB0%0"] = 9;
							break;
						end
						if ((TABLE_TableIndirection["FlatIdent_3EEE1%0"] ~= 0) or (3506 <= 1309)) then
						else
							TABLE_TableIndirection["FlatIdent_25A9F%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_25A9F%0"] == 0) then
									TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\87\176\88\65\209\103\190\78\68\210\86\190\87\69\196\38", "\182\21\209\59\42")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\131\95\192\16\36", "\222\215\55\165\125\65")][LUAOBFUSACTOR_DECRYPT_STR_0("\14\208\197\17\245\211\226\95\34\213", "\42\76\177\166\122\146\161\141")];
									TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\135\139\6\197\126\100\170\159\11\202\77\100\164\132\22\222\120\100\160\132\6\215", "\22\197\234\101\174\25")] = 1;
									TABLE_TableIndirection["FlatIdent_25A9F%0"] = 1;
								end
								if (TABLE_TableIndirection["FlatIdent_25A9F%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_3EEE1%0"] = 1;
									break;
								end
							end
						end
					end
				end
				if ((2955 == 2955) and (TABLE_TableIndirection["FlatIdent_20FB0%0"] == 10)) then
					TABLE_TableIndirection["FlatIdent_6B983%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_6B983%0"] == 2) then
							TABLE_TableIndirection["FlatIdent_20FB0%0"] = 11;
							break;
						end
						if ((TABLE_TableIndirection["FlatIdent_6B983%0"] == 1) or (2903 == 1495)) then
							TABLE_TableIndirection["FlatIdent_691EB%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_691EB%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_6B983%0"] = 2;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_691EB%0"] == 0) then
									TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\15\53\166\215\113\189\216\147\35\48\145\206\119\161\196\150\44\38\160\210\117\182", "\230\77\84\197\188\22\207\183")] = 1;
									TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\219\27\212\248\137\179\211\58\245\27\212\175", "\85\153\116\166\156\236\193\144")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\144\232\72\190\225", "\96\196\128\45\211\132")][LUAOBFUSACTOR_DECRYPT_STR_0("\23\130\105\91\215\189", "\184\85\237\27\63\178\207\212")];
									TABLE_TableIndirection["FlatIdent_691EB%0"] = 1;
								end
							end
						end
						if (TABLE_TableIndirection["FlatIdent_6B983%0"] ~= 0) then
						else
							TABLE_TableIndirection["FlatIdent_578E3%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_578E3%0"] == 0) then
									TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\56\88\27\90\6\77", "\63\104\57\105")] = TABLE_TableIndirection["ScrollingFrame%0"];
									TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\41\134\167\79\12\149\171\81\5\131\135\75\7\136\182\23", "\36\107\231\196")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\105\189\167\138\88", "\231\61\213\194")][LUAOBFUSACTOR_DECRYPT_STR_0("\33\168\60\119", "\19\105\205\93")];
									TABLE_TableIndirection["FlatIdent_578E3%0"] = 1;
								end
								if (TABLE_TableIndirection["FlatIdent_578E3%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_6B983%0"] = 1;
									break;
								end
							end
						end
					end
				end
				if ((4546 >= 2275) and (TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 13)) then
				else
					TABLE_TableIndirection["UIListLayout%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\24\231\115\226\85\219\172\44\215\80\254\82", "\224\77\174\63\139\38\175"));
					TABLE_TableIndirection["UIListLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\153\9\204\132\49\189", "\95\201\104\190\225")] = TABLE_TableIndirection["ScrollingFrame%0"];
					TABLE_TableIndirection["UIListLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\156\196\211\218\128\217\197\203\189", "\174\207\171\161")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\222\241\31\231\215\197\233\251\31", "\183\141\158\109\147\152")][LUAOBFUSACTOR_DECRYPT_STR_0("\0\8\255\3\57\29\201\30\40\12\244", "\108\76\105\134")];
					TABLE_TableIndirection["UIListLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\195\202\163\232\212\228\203\165\224\194\202\201\184\230\192\230\192\191\245", "\174\139\165\209\129")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\139\188\240\200\220\12\126\108\162\191\195\205\207\4\126\117\166\189\246", "\24\195\211\130\161\166\99\16")][LUAOBFUSACTOR_DECRYPT_STR_0("\101\6\231\56\86\4", "\118\38\99\137\76\51")];
					TABLE_TableIndirection["FlatIdent_20FB0%0"] = 14;
				end
				break;
			end
			if (TABLE_TableIndirection["FlatIdent_6C34%0"] ~= 1) then
			else
				TABLE_TableIndirection["FlatIdent_40070%0"] = 0;
				while true do
					if (TABLE_TableIndirection["FlatIdent_40070%0"] == 0) then
						if ((819 >= 22) and (1 ~= TABLE_TableIndirection["FlatIdent_20FB0%0"])) then
						else
							TABLE_TableIndirection["FlatIdent_2A9F7%0"] = 0;
							TABLE_TableIndirection["FlatIdent_84478%0"] = nil;
							while true do
								if (TABLE_TableIndirection["FlatIdent_2A9F7%0"] == 0) then
									TABLE_TableIndirection["FlatIdent_84478%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_84478%0"] ~= 2) then
										else
											TABLE_TableIndirection["FlatIdent_20FB0%0"] = 2;
											break;
										end
										if (TABLE_TableIndirection["FlatIdent_84478%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_21297%0"] = 0;
											while true do
												if (TABLE_TableIndirection["FlatIdent_21297%0"] == 0) then
													TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\223\41\23\22\12\50\206\47\31\23\57\41\229\35\9", "\64\157\70\101\114\105")] = 1;
													TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\115\161\189\230", "\112\32\200\199\131")] = UDim2.new(0.95, 0, 0.1, 0);
													TABLE_TableIndirection["FlatIdent_21297%0"] = 1;
												end
												if (TABLE_TableIndirection["FlatIdent_21297%0"] == 1) then
													TABLE_TableIndirection["FlatIdent_84478%0"] = 2;
													break;
												end
											end
										end
										if ((3162 == 3162) and (TABLE_TableIndirection["FlatIdent_84478%0"] ~= 0)) then
										else
											TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\14\81\95\179\196\185\45\57\94\88\140\209\170\44\63\64\93\170\198\165\33\53", "\66\76\48\60\216\163\203")] = 0.2;
											TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\152\137\107\247\90\220\7\181\138\118\225\12", "\68\218\230\25\147\63\174")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\153\34\86\65\179", "\214\205\74\51\44")][LUAOBFUSACTOR_DECRYPT_STR_0("\216\67\240\248\114\232", "\23\154\44\130\156")];
											TABLE_TableIndirection["FlatIdent_84478%0"] = 1;
										end
									end
									break;
								end
							end
						end
						if (TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 6) then
						else
							TABLE_TableIndirection["FlatIdent_270C%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_270C%0"] ~= 1) then
								else
									TABLE_TableIndirection["FlatIdent_44265%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_44265%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_270C%0"] = 2;
											break;
										end
										if (0 == TABLE_TableIndirection["FlatIdent_44265%0"]) then
											TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\34\175\183\171", "\115\113\198\205\206\86")] = UDim2.new(1, 0, 1, 0);
											TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\178\94\237\83\134\91\251", "\58\228\55\158")] = false;
											TABLE_TableIndirection["FlatIdent_44265%0"] = 1;
										end
									end
								end
								if ((2 == TABLE_TableIndirection["FlatIdent_270C%0"]) or (2369 > 4429)) then
									TABLE_TableIndirection["FlatIdent_20FB0%0"] = 7;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_270C%0"] ~= 0) then
								else
									TABLE_TableIndirection["FlatIdent_53124%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_53124%0"] == 0) then
											TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\150\134\194\42\57\191\22\187\133\223\60\111", "\85\212\233\176\78\92\205")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\126\80\141\239\79", "\130\42\56\232")][LUAOBFUSACTOR_DECRYPT_STR_0("\200\186\54\231\69\45", "\95\138\213\68\131\32")];
											TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\8\39\179\71\115\56\27\168\89\115\26\33\185\70\122", "\22\74\72\193\35")] = 1;
											TABLE_TableIndirection["FlatIdent_53124%0"] = 1;
										end
										if (TABLE_TableIndirection["FlatIdent_53124%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_270C%0"] = 1;
											break;
										end
									end
								end
							end
						end
						TABLE_TableIndirection["FlatIdent_40070%0"] = 1;
					end
					if (1 == TABLE_TableIndirection["FlatIdent_40070%0"]) then
						if (0 ~= TABLE_TableIndirection["FlatIdent_20FB0%0"]) then
						else
							TABLE_TableIndirection["FlatIdent_253F0%0"] = 0;
							while true do
								if (0 == TABLE_TableIndirection["FlatIdent_253F0%0"]) then
									TABLE_TableIndirection["FlatIdent_5724B%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_5724B%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_253F0%0"] = 1;
											break;
										end
										if (0 == TABLE_TableIndirection["FlatIdent_5724B%0"]) then
											TABLE_TableIndirection["TabExample%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\123\100\114\17\118", "\45\61\22\19\124\19\203"));
											TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\2\120\233\93", "\56\76\25\132")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\245\19\15", "\217\161\114\109\149\98\16");
											TABLE_TableIndirection["FlatIdent_5724B%0"] = 1;
										end
									end
								end
								if ((4095 >= 3183) and (1 ~= TABLE_TableIndirection["FlatIdent_253F0%0"])) then
								else
									TABLE_TableIndirection["FlatIdent_83844%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_83844%0"] == 0) then
											TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\110\192\185\35\193\74", "\175\62\161\203\70")] = TABLE_TableIndirection["TabsFolder%0"];
											TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\30\220\192\24\50\46\210\214\29\49\31\210\207\28\39\111", "\85\92\189\163\115")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\29\164\53\53\44", "\88\73\204\80")][LUAOBFUSACTOR_DECRYPT_STR_0("\12\130\19\77\46\200\33\150\30\66", "\186\78\227\112\38\73")];
											TABLE_TableIndirection["FlatIdent_83844%0"] = 1;
										end
										if (1 == TABLE_TableIndirection["FlatIdent_83844%0"]) then
											TABLE_TableIndirection["FlatIdent_253F0%0"] = 2;
											break;
										end
									end
								end
								if (TABLE_TableIndirection["FlatIdent_253F0%0"] == 2) then
									TABLE_TableIndirection["FlatIdent_20FB0%0"] = 1;
									break;
								end
							end
						end
						TABLE_TableIndirection["FlatIdent_6C34%0"] = 2;
						break;
					end
				end
			end
			if (TABLE_TableIndirection["FlatIdent_6C34%0"] ~= 0) then
			else
				TABLE_TableIndirection["FlatIdent_2593F%0"] = 0;
				while true do
					if (TABLE_TableIndirection["FlatIdent_2593F%0"] == 0) then
						if ((TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 5) or (3711 < 1008)) then
						else
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\210\86\240\80", "\26\156\55\157\53\51")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\231\196\29\208\88\248\188", "\200\164\171\115\164\61\150");
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\188\217\4\220\182\68", "\48\236\184\118\185\216")] = TABLE_TableIndirection["PagesFolder%0"];
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\199\188\84\59\200\38\234\168\89\52\236\59\233\178\69\99", "\84\133\221\55\80\175")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\137\239\33\171\194", "\60\221\135\68\198\167")][LUAOBFUSACTOR_DECRYPT_STR_0("\204\188\251\136\69\203\225\168\246\135", "\185\142\221\152\227\34")];
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\122\196\84\241\68\33\248\77\203\83\206\81\50\249\75\213\86\232\70\61\244\65", "\151\56\165\55\154\35\83")] = 0;
							TABLE_TableIndirection["FlatIdent_20FB0%0"] = 6;
						end
						if (9 == TABLE_TableIndirection["FlatIdent_20FB0%0"]) then
							TABLE_TableIndirection["FlatIdent_1076E%0"] = 0;
							while true do
								if ((1 ~= TABLE_TableIndirection["FlatIdent_1076E%0"]) or (1049 <= 906)) then
								else
									TABLE_TableIndirection["TitleLabel%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\138\241\27\81\175\191\246\6\73", "\227\222\148\99\37"));
									TABLE_TableIndirection["TitleLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\142\66\8\235", "\142\192\35\101")] = name;
									TABLE_TableIndirection["FlatIdent_1076E%0"] = 2;
								end
								if ((4513 > 2726) and (TABLE_TableIndirection["FlatIdent_1076E%0"] == 2)) then
									TABLE_TableIndirection["FlatIdent_20FB0%0"] = 10;
									break;
								end
								if ((TABLE_TableIndirection["FlatIdent_1076E%0"] == 0) or (1481 >= 2658)) then
									TABLE_TableIndirection["FlatIdent_651C5%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_651C5%0"] == 0) then
											TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\229\118\59\172\235\128\142\23\196\65\33\170\228\135\162\19\197\102", "\118\182\21\73\195\135\236\204")] = 6;
											TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\59\63\8\79\8\1\223\9\46\51\77\5\10\248\43\51\22\79\22\94", "\157\104\92\122\32\100\109")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\151\174\202\199\56", "\203\195\198\175\170\93\71\237")][LUAOBFUSACTOR_DECRYPT_STR_0("\15\72\61\208\95\5", "\156\78\43\94\181\49\113")];
											TABLE_TableIndirection["FlatIdent_651C5%0"] = 1;
										end
										if (TABLE_TableIndirection["FlatIdent_651C5%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_1076E%0"] = 1;
											break;
										end
									end
								end
							end
						end
						TABLE_TableIndirection["FlatIdent_2593F%0"] = 1;
					end
					if (TABLE_TableIndirection["FlatIdent_2593F%0"] == 1) then
						if ((TABLE_TableIndirection["FlatIdent_20FB0%0"] ~= 4) or (3220 == 1364)) then
						else
							TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\84\231\202\183", "\25\18\136\164\195\107\35")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\206\34\167\91", "\216\136\77\201\47\18\220\161")][LUAOBFUSACTOR_DECRYPT_STR_0("\30\227\62\200\11\217\177\44\226\56\248\7\208\134", "\226\77\140\75\186\104\188")];
							TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\141\203\200\43\124\186\207\220\58\75", "\47\217\174\176\95")] = true;
							TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\140\216\110\22\133\70\121\54\168\216\114", "\70\216\189\22\98\210\52\24")] = true;
							TABLE_TableIndirection["ExampleTabFrame%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\21\64\83\251\252", "\153\83\50\50\150"));
							TABLE_TableIndirection["FlatIdent_20FB0%0"] = 5;
						end
						TABLE_TableIndirection["FlatIdent_6C34%0"] = 1;
						break;
					end
				end
			end
		end
	end
end,[LUAOBFUSACTOR_DECRYPT_STR_0("\176\64\90\34\129\117\89\44", "\78\228\33\56")]=function(name)
	TABLE_TableIndirection["FlatIdent_2D88C%0"] = 0;
	TABLE_TableIndirection["FlatIdent_32B97%0"] = nil;
	TABLE_TableIndirection["TabExample%0"] = nil;
	TABLE_TableIndirection["label%0"] = nil;
	TABLE_TableIndirection["ExampleTabFrame%0"] = nil;
	TABLE_TableIndirection["ScrollingFrame%0"] = nil;
	TABLE_TableIndirection["UIGridLayout%0"] = nil;
	while true do
		if (1 == TABLE_TableIndirection["FlatIdent_2D88C%0"]) then
			TABLE_TableIndirection["label%0"] = nil;
			TABLE_TableIndirection["ExampleTabFrame%0"] = nil;
			TABLE_TableIndirection["FlatIdent_2D88C%0"] = 2;
		end
		if ((TABLE_TableIndirection["FlatIdent_2D88C%0"] == 3) or (1054 > 3392)) then
			while true do
				if ((TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 3) or (676 >= 1642)) then
				else
					TABLE_TableIndirection["FlatIdent_68E92%0"] = 0;
					while true do
						if (2 == TABLE_TableIndirection["FlatIdent_68E92%0"]) then
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 4;
							break;
						end
						if (TABLE_TableIndirection["FlatIdent_68E92%0"] ~= 1) then
						else
							TABLE_TableIndirection["FlatIdent_43BEE%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_43BEE%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_68E92%0"] = 2;
									break;
								end
								if (0 == TABLE_TableIndirection["FlatIdent_43BEE%0"]) then
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\238\218\187\147", "\179\186\191\195\231")] = name;
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\205\58\0\240\218\48\20\235\235\108", "\132\153\95\120")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\133\186\11\32\242", "\192\209\210\110\77\151\186")][LUAOBFUSACTOR_DECRYPT_STR_0("\212\6\58\253", "\164\128\99\66\137\159")];
									TABLE_TableIndirection["FlatIdent_43BEE%0"] = 1;
								end
							end
						end
						if ((4136 > 2397) and (TABLE_TableIndirection["FlatIdent_68E92%0"] ~= 0)) then
						else
							TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\34\136\234\181\7\155\230\171\14\141\202\177\12\134\251\237", "\222\96\233\137")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\141\187\162\18\141", "\144\217\211\199\127\232\147")][LUAOBFUSACTOR_DECRYPT_STR_0("\218\46\61\35\210\87\13\81\246\43", "\36\152\79\94\72\181\37\98")];
							TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\245\217\68\52\208\202\72\42\217\220\115\45\214\214\84\47\214\202\66\49\212\193", "\95\183\184\39")] = 0.2;
							TABLE_TableIndirection["FlatIdent_68E92%0"] = 1;
						end
					end
				end
				if ((TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 1) or (4334 == 4245)) then
				else
					TABLE_TableIndirection["FlatIdent_6C967%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_6C967%0"] == 0) then
							TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\151\62\228\45\83\146\13\160\49\227\18\70\129\12\166\47\230\52\81\142\1\172", "\98\213\95\135\70\52\224")] = 0.2;
							TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\220\172\219\115\81\236\128\198\123\91\236\240", "\52\158\195\169\23")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\78\180\55\121\131", "\235\26\220\82\20\230\85\27")][LUAOBFUSACTOR_DECRYPT_STR_0("\170\174\251\198\113\154", "\20\232\193\137\162")];
							TABLE_TableIndirection["FlatIdent_6C967%0"] = 1;
						end
						if (TABLE_TableIndirection["FlatIdent_6C967%0"] == 1) then
							TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\0\208\215\162\226\158\36\120\56\218\245\175\255\137\27", "\17\66\191\165\198\135\236\119")] = 1;
							TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\60\166\180\22", "\177\111\207\206\115\159\136\140")] = UDim2.new(0.95, 0, 0.1, 0);
							TABLE_TableIndirection["FlatIdent_6C967%0"] = 2;
						end
						if (2 == TABLE_TableIndirection["FlatIdent_6C967%0"]) then
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 2;
							break;
						end
					end
				end
				if (TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 0) then
				else
					TABLE_TableIndirection["FlatIdent_360E8%0"] = 0;
					TABLE_TableIndirection["FlatIdent_98388%0"] = nil;
					while true do
						if (TABLE_TableIndirection["FlatIdent_360E8%0"] == 0) then
							TABLE_TableIndirection["FlatIdent_98388%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_98388%0"] ~= 2) then
								else
									TABLE_TableIndirection["FlatIdent_32B97%0"] = 1;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_98388%0"] == 0) then
									TABLE_TableIndirection["FlatIdent_7B2D6%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_7B2D6%0"] == 0) then
											TABLE_TableIndirection["TabExample%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\232\108\179\14\128", "\229\174\30\210\99"));
											TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\43\136\29\17", "\63\101\233\112\116\180\47")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\47\236\132", "\89\123\141\230\49\141\93");
											TABLE_TableIndirection["FlatIdent_7B2D6%0"] = 1;
										end
										if (TABLE_TableIndirection["FlatIdent_7B2D6%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_98388%0"] = 1;
											break;
										end
									end
								end
								if (TABLE_TableIndirection["FlatIdent_98388%0"] ~= 1) then
								else
									TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\243\58\255\23\246\34", "\86\163\91\141\114\152")] = TABLE_TableIndirection["TabsFolder%0"];
									TABLE_TableIndirection["TabExample%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\113\10\119\120\61\65\4\97\125\62\112\4\120\124\40\0", "\90\51\107\20\19")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\185\248\128\226\56", "\93\237\144\229\143")][LUAOBFUSACTOR_DECRYPT_STR_0("\55\247\243\18\12\84\26\227\254\29", "\38\117\150\144\121\107")];
									TABLE_TableIndirection["FlatIdent_98388%0"] = 2;
								end
							end
							break;
						end
					end
				end
				if ((TABLE_TableIndirection["FlatIdent_32B97%0"] == 5) or (4276 <= 3031)) then
					TABLE_TableIndirection["FlatIdent_43E8E%0"] = 0;
					while true do
						if ((2 ~= TABLE_TableIndirection["FlatIdent_43E8E%0"]) or (4782 <= 1199)) then
						else
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 6;
							break;
						end
						if (TABLE_TableIndirection["FlatIdent_43E8E%0"] ~= 1) then
						else
							TABLE_TableIndirection["FlatIdent_1BA2F%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_1BA2F%0"] == 0) then
									TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\15\186\237\49\42\169\225\47\35\191\205\53\33\180\252\105", "\90\77\219\142")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\210\12\36\52\73", "\26\134\100\65\89\44\103")][LUAOBFUSACTOR_DECRYPT_STR_0("\211\226\51\40\163\227\236\37\45\160", "\196\145\131\80\67")];
									TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\60\177\5\3\31\250\17\165\8\12\44\250\31\190\21\24\25\250\27\190\5\17", "\136\126\208\102\104\120")] = 0;
									TABLE_TableIndirection["FlatIdent_1BA2F%0"] = 1;
								end
								if (1 == TABLE_TableIndirection["FlatIdent_1BA2F%0"]) then
									TABLE_TableIndirection["FlatIdent_43E8E%0"] = 2;
									break;
								end
							end
						end
						if (TABLE_TableIndirection["FlatIdent_43E8E%0"] ~= 0) then
						else
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\86\139\195\70", "\49\24\234\174\35\207\50\93")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\208\126\248\24\21\68\231", "\42\147\17\150\108\112");
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\60\243\239\141\127\24", "\17\108\146\157\232")] = TABLE_TableIndirection["PagesFolder%0"];
							TABLE_TableIndirection["FlatIdent_43E8E%0"] = 1;
						end
					end
				end
				if ((TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 4) or (4864 < 1902)) then
				else
					TABLE_TableIndirection["FlatIdent_47A85%0"] = 0;
					while true do
						if ((4839 >= 3700) and (2 ~= TABLE_TableIndirection["FlatIdent_47A85%0"])) then
						else
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 5;
							break;
						end
						if ((TABLE_TableIndirection["FlatIdent_47A85%0"] == 1) or (1075 > 1918)) then
							TABLE_TableIndirection["FlatIdent_1D164%0"] = 0;
							while true do
								if (0 == TABLE_TableIndirection["FlatIdent_1D164%0"]) then
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\127\198\12\249\24\186\74\211\4\232\43", "\200\43\163\116\141\79")] = true;
									TABLE_TableIndirection["ExampleTabFrame%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\41\180\44\114\226", "\136\111\198\77\31\135"));
									TABLE_TableIndirection["FlatIdent_1D164%0"] = 1;
								end
								if (TABLE_TableIndirection["FlatIdent_1D164%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_47A85%0"] = 2;
									break;
								end
							end
						end
						if (TABLE_TableIndirection["FlatIdent_47A85%0"] ~= 0) then
						else
							TABLE_TableIndirection["FlatIdent_1E5DB%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_1E5DB%0"] == 0) then
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\153\57\51\151", "\131\223\86\93\227\208\148")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\197\74\184\162", "\213\131\37\214\214\125")][LUAOBFUSACTOR_DECRYPT_STR_0("\21\36\48\173\226\35\24\36\177\242\4\36\41\187", "\129\70\75\69\223")];
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\114\206\235\253\79\236\71\199\246\237", "\143\38\171\147\137\28")] = true;
									TABLE_TableIndirection["FlatIdent_1E5DB%0"] = 1;
								end
								if (TABLE_TableIndirection["FlatIdent_1E5DB%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_47A85%0"] = 1;
									break;
								end
							end
						end
					end
				end
				if (TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 7) then
				else
					TABLE_TableIndirection["FlatIdent_466B2%0"] = 0;
					while true do
						if ((396 <= 3804) and (TABLE_TableIndirection["FlatIdent_466B2%0"] == 0)) then
							TABLE_TableIndirection["ScrollingFrame%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\49\10\181\89\177\232\30\167\5\47\181\87\176\225", "\201\98\105\199\54\221\132\119"));
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\254\131\180\246", "\180\176\226\217\147\99\131")] = LUAOBFUSACTOR_DECRYPT_STR_0("\138\15\145\46\14\57\165\183\11\165\51\3\56\169", "\204\217\108\227\65\98\85");
							TABLE_TableIndirection["FlatIdent_466B2%0"] = 1;
						end
						if (1 ~= TABLE_TableIndirection["FlatIdent_466B2%0"]) then
						else
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\227\184\61\2\221\173", "\103\179\217\79")] = TABLE_TableIndirection["ExampleTabFrame%0"];
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\107\180\8\220\87\137", "\195\42\215\124\181\33\236")] = true;
							TABLE_TableIndirection["FlatIdent_466B2%0"] = 2;
						end
						if (2 ~= TABLE_TableIndirection["FlatIdent_466B2%0"]) then
						else
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 8;
							break;
						end
					end
				end
				if ((TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 8) or (4169 == 2187)) then
				else
					TABLE_TableIndirection["FlatIdent_1D701%0"] = 0;
					TABLE_TableIndirection["FlatIdent_2BE02%0"] = nil;
					while true do
						if (TABLE_TableIndirection["FlatIdent_1D701%0"] == 0) then
							TABLE_TableIndirection["FlatIdent_2BE02%0"] = 0;
							while true do
								if ((1406 == 1406) and (TABLE_TableIndirection["FlatIdent_2BE02%0"] ~= 0)) then
								else
									TABLE_TableIndirection["FlatIdent_5077%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_5077%0"] == 0) then
											TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\47\88\52\53\34\234\2\76\57\58\6\247\1\86\37\109", "\152\109\57\87\94\69")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\205\223\15\174\187", "\200\153\183\106\195\222\178\52")][LUAOBFUSACTOR_DECRYPT_STR_0("\16\226\139\54\78\72\61\246\134\57", "\58\82\131\232\93\41")];
											TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\161\86\211\30\90\45\140\66\222\17\105\45\130\89\195\5\92\45\134\89\211\12", "\95\227\55\176\117\61")] = 1;
											TABLE_TableIndirection["FlatIdent_5077%0"] = 1;
										end
										if (TABLE_TableIndirection["FlatIdent_5077%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_2BE02%0"] = 1;
											break;
										end
									end
								end
								if (TABLE_TableIndirection["FlatIdent_2BE02%0"] ~= 2) then
								else
									TABLE_TableIndirection["FlatIdent_32B97%0"] = 9;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_2BE02%0"] ~= 1) then
								else
									TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\58\113\49\79\174\10\77\42\81\174\40\119\59\78\167", "\203\120\30\67\43")] = 1;
									TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\194\44\87\234", "\185\145\69\45\143")] = UDim2.new(1, 0, 1, 0);
									TABLE_TableIndirection["FlatIdent_2BE02%0"] = 2;
								end
							end
							break;
						end
					end
				end
				if (TABLE_TableIndirection["FlatIdent_32B97%0"] == 11) then
					return TABLE_TableIndirection["TabExample%0"];
				end
				if ((1531 < 4271) and (TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 2)) then
				else
					TABLE_TableIndirection["FlatIdent_43BF7%0"] = 0;
					TABLE_TableIndirection["FlatIdent_280F1%0"] = nil;
					while true do
						if (0 == TABLE_TableIndirection["FlatIdent_43BF7%0"]) then
							TABLE_TableIndirection["FlatIdent_280F1%0"] = 0;
							while true do
								if ((635 == 635) and (TABLE_TableIndirection["FlatIdent_280F1%0"] ~= 0)) then
								else
									TABLE_TableIndirection["label%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\106\198\237\241\14\213\74\215\250\235", "\160\62\163\149\133\76"));
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\164\30\20\163", "\188\234\127\121\198")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\226\161\15\13\215\216", "\163\182\192\109\79");
									TABLE_TableIndirection["FlatIdent_280F1%0"] = 1;
								end
								if ((3373 <= 3556) and (TABLE_TableIndirection["FlatIdent_280F1%0"] ~= 1)) then
								else
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\8\51\1\134\54\38", "\227\88\82\115")] = TABLE_TableIndirection["TabExample%0"];
									TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\112\22\160\162", "\19\35\127\218\199\98")] = UDim2.new(1, 0, 1, 0);
									TABLE_TableIndirection["FlatIdent_280F1%0"] = 2;
								end
								if ((TABLE_TableIndirection["FlatIdent_280F1%0"] == 2) or (3291 < 3280)) then
									TABLE_TableIndirection["FlatIdent_32B97%0"] = 3;
									break;
								end
							end
							break;
						end
					end
				end
				if ((4386 >= 873) and (TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 6)) then
				else
					TABLE_TableIndirection["FlatIdent_6225E%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_6225E%0"] == 1) then
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\47\242\16\231", "\130\124\155\106")] = UDim2.new(1, 0, 1, 0);
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\227\194\229\166\161\250\121", "\223\181\171\150\207\195\150\28")] = false;
							TABLE_TableIndirection["FlatIdent_6225E%0"] = 2;
						end
						if (TABLE_TableIndirection["FlatIdent_6225E%0"] ~= 2) then
						else
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 7;
							break;
						end
						if ((921 <= 1102) and (TABLE_TableIndirection["FlatIdent_6225E%0"] == 0)) then
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\110\53\241\170\12\94\25\236\162\6\94\105", "\105\44\90\131\206")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\203\232\183\180\13", "\94\159\128\210\217\104")][LUAOBFUSACTOR_DECRYPT_STR_0("\114\246\20\187\90\109", "\26\48\153\102\223\63\31\153")];
							TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\32\79\255\247\7\82\222\250\24\69\221\250\26\69\225", "\147\98\32\141")] = 1;
							TABLE_TableIndirection["FlatIdent_6225E%0"] = 1;
						end
					end
				end
				if (TABLE_TableIndirection["FlatIdent_32B97%0"] == 9) then
					TABLE_TableIndirection["FlatIdent_72421%0"] = 0;
					while true do
						if ((4706 >= 963) and (TABLE_TableIndirection["FlatIdent_72421%0"] ~= 2)) then
						else
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 10;
							break;
						end
						if (TABLE_TableIndirection["FlatIdent_72421%0"] ~= 0) then
						else
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\43\64\241\197\10\90\105\25\81\215\194\15\85\64\22\70\240\217", "\43\120\35\131\170\102\54")] = 6;
							TABLE_TableIndirection["ScrollingFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\103\5\149\185\169\188\166\85\20\174\187\164\183\129\119\9\139\185\183\227", "\228\52\102\231\214\197\208")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\42\232\112\199\239", "\182\126\128\21\170\138\235\121")][LUAOBFUSACTOR_DECRYPT_STR_0("\170\217\54\227\136\7", "\102\235\186\85\134\230\115\80")];
							TABLE_TableIndirection["FlatIdent_72421%0"] = 1;
						end
						if ((TABLE_TableIndirection["FlatIdent_72421%0"] ~= 1) or (960 <= 876)) then
						else
							TABLE_TableIndirection["UIGridLayout%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\1\15\39\210\252\48\10\1\217\250\33\50", "\149\84\70\96\160"));
							TABLE_TableIndirection["UIGridLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\103\13\44\90\124\192", "\66\55\108\94\63\18\180")] = TABLE_TableIndirection["ScrollingFrame%0"];
							TABLE_TableIndirection["FlatIdent_72421%0"] = 2;
						end
					end
				end
				if ((TABLE_TableIndirection["FlatIdent_32B97%0"] ~= 10) or (2066 == 932)) then
				else
					TABLE_TableIndirection["FlatIdent_8E3FD%0"] = 0;
					while true do
						if ((4825 < 4843) and (TABLE_TableIndirection["FlatIdent_8E3FD%0"] ~= 2)) then
						else
							TABLE_TableIndirection["FlatIdent_32B97%0"] = 11;
							break;
						end
						if ((TABLE_TableIndirection["FlatIdent_8E3FD%0"] ~= 0) or (3877 >= 4537)) then
						else
							TABLE_TableIndirection["UIGridLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\39\130\151\35\8\75\16\136\151", "\57\116\237\229\87\71")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\153\190\255\243\88\252\67\175\163", "\39\202\209\141\135\23\142")][LUAOBFUSACTOR_DECRYPT_STR_0("\211\50\16\5\39\236\208\33\13\15\32", "\152\159\83\105\106\82")];
							TABLE_TableIndirection["UIGridLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\162\195\93\254\249\93\133\194\88\252\206", "\60\225\166\49\146\169")] = UDim2.new(0.0199999996, 0, 0.0199999996, 0);
							TABLE_TableIndirection["FlatIdent_8E3FD%0"] = 1;
						end
						if ((1 == TABLE_TableIndirection["FlatIdent_8E3FD%0"]) or (4315 < 1726)) then
							TABLE_TableIndirection["UIGridLayout%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\12\27\35\38\50\14\53\27", "\103\79\126\79\74\97")] = UDim2.new(0.140000003, 0, 0.200000003, 0);
							TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\151\112\198\96\91\56\175\107\199\124\80\75\153\115\218\112\85", "\122\218\31\179\19\62")]:Connect(function()
								TABLE_TableIndirection["FlatIdent_84B7E%0"] = 0;
								TABLE_TableIndirection["FlatIdent_578E3%0"] = nil;
								TABLE_TableIndirection["FlatIdent_12703%0"] = nil;
								while true do
									if (TABLE_TableIndirection["FlatIdent_84B7E%0"] == 0) then
										TABLE_TableIndirection["FlatIdent_578E3%0"] = 0;
										TABLE_TableIndirection["FlatIdent_12703%0"] = nil;
										TABLE_TableIndirection["FlatIdent_84B7E%0"] = 1;
									end
									if (1 == TABLE_TableIndirection["FlatIdent_84B7E%0"]) then
										while true do
											if (TABLE_TableIndirection["FlatIdent_578E3%0"] ~= 0) then
											else
												TABLE_TableIndirection["FlatIdent_12703%0"] = 0;
												while true do
													if ((TABLE_TableIndirection["FlatIdent_12703%0"] ~= 0) or (3679 < 625)) then
													else
														for _, page in ipairs(TABLE_TableIndirection["PagesFolder%0"]:GetChildren()) do
															if (page:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\30\20\12\224\61", "\141\88\102\109")) or (4625 < 632)) then
																page[LUAOBFUSACTOR_DECRYPT_STR_0("\133\223\222\200\203\173\64", "\37\211\182\173\161\169\193")] = false;
															end
														end
														TABLE_TableIndirection["ExampleTabFrame%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\193\51\94\208\42\119\188", "\217\151\90\45\185\72\27")] = true;
														break;
													end
												end
												break;
											end
										end
										break;
									end
								end
							end);
							TABLE_TableIndirection["FlatIdent_8E3FD%0"] = 2;
						end
					end
				end
			end
			break;
		end
		if (TABLE_TableIndirection["FlatIdent_2D88C%0"] ~= 0) then
		else
			TABLE_TableIndirection["FlatIdent_32B97%0"] = 0;
			TABLE_TableIndirection["TabExample%0"] = nil;
			TABLE_TableIndirection["FlatIdent_2D88C%0"] = 1;
		end
		if (2 == TABLE_TableIndirection["FlatIdent_2D88C%0"]) then
			TABLE_TableIndirection["FlatIdent_8A9D7%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_8A9D7%0"] == 0) then
					TABLE_TableIndirection["ScrollingFrame%0"] = nil;
					TABLE_TableIndirection["UIGridLayout%0"] = nil;
					TABLE_TableIndirection["FlatIdent_8A9D7%0"] = 1;
				end
				if (TABLE_TableIndirection["FlatIdent_8A9D7%0"] == 1) then
					TABLE_TableIndirection["FlatIdent_2D88C%0"] = 3;
					break;
				end
			end
		end
	end
end};
TABLE_TableIndirection["firstTab%0"] = nil;
TABLE_TableIndirection["firstContent%0"] = nil;
GuiLib.createListTab = function(name)
	TABLE_TableIndirection["FlatIdent_5431F%0"] = 0;
	TABLE_TableIndirection["FlatIdent_2BD95%0"] = nil;
	TABLE_TableIndirection["tabBtn%0"] = nil;
	TABLE_TableIndirection["content%0"] = nil;
	while true do
		if (TABLE_TableIndirection["FlatIdent_5431F%0"] == 0) then
			TABLE_TableIndirection["FlatIdent_2BD95%0"] = 0;
			TABLE_TableIndirection["tabBtn%0"] = nil;
			TABLE_TableIndirection["FlatIdent_5431F%0"] = 1;
		end
		if ((TABLE_TableIndirection["FlatIdent_5431F%0"] == 1) or (83 > 1780)) then
			TABLE_TableIndirection["content%0"] = nil;
			while true do
				if (TABLE_TableIndirection["FlatIdent_2BD95%0"] ~= 1) then
				else
					if ((546 <= 1077) and (428 < 1804) and not TABLE_TableIndirection["firstTab%0"]) then
						TABLE_TableIndirection["FlatIdent_634AF%0"] = 0;
						while true do
							if ((0 ~= TABLE_TableIndirection["FlatIdent_634AF%0"]) or (996 > 4301)) then
							else
								TABLE_TableIndirection["FlatIdent_38BFA%0"] = 0;
								while true do
									if (TABLE_TableIndirection["FlatIdent_38BFA%0"] == 1) then
										TABLE_TableIndirection["FlatIdent_634AF%0"] = 1;
										break;
									end
									if (TABLE_TableIndirection["FlatIdent_38BFA%0"] == 0) then
										TABLE_TableIndirection["firstTab%0"] = TABLE_TableIndirection["tabBtn%0"];
										TABLE_TableIndirection["firstContent%0"] = TABLE_TableIndirection["content%0"];
										TABLE_TableIndirection["FlatIdent_38BFA%0"] = 1;
									end
								end
							end
							if (TABLE_TableIndirection["FlatIdent_634AF%0"] ~= 1) then
							else
								TABLE_TableIndirection["content%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\245\117\244\27\84\207\121", "\54\163\28\135\114")] = true;
								break;
							end
						end
					else
						TABLE_TableIndirection["content%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\30\210\78\139\76\115\45", "\31\72\187\61\226\46")] = false;
					end
					break;
				end
				if (TABLE_TableIndirection["FlatIdent_2BD95%0"] ~= 0) then
				else
					TABLE_TableIndirection["FlatIdent_2F298%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_2F298%0"] == 1) then
							TABLE_TableIndirection["FlatIdent_2BD95%0"] = 1;
							break;
						end
						if (TABLE_TableIndirection["FlatIdent_2F298%0"] == 0) then
							TABLE_TableIndirection["tabBtn%0"] = TABLE_TableIndirection["Examples%0"].ListTab(name);
							TABLE_TableIndirection["content%0"] = TABLE_TableIndirection["PagesFolder%0"]:FindFirstChild(name .. LUAOBFUSACTOR_DECRYPT_STR_0("\144\92\196\100\31\51\65", "\161\211\51\170\16\122\93\53"));
							TABLE_TableIndirection["FlatIdent_2F298%0"] = 1;
						end
					end
				end
			end
			break;
		end
	end
end;
GuiLib.createTableTab = function(name)
	TABLE_TableIndirection["FlatIdent_21297%0"] = 0;
	TABLE_TableIndirection["FlatIdent_60EA1%0"] = nil;
	TABLE_TableIndirection["tabBtn%0"] = nil;
	TABLE_TableIndirection["content%0"] = nil;
	while true do
		if (TABLE_TableIndirection["FlatIdent_21297%0"] ~= 0) then
		else
			TABLE_TableIndirection["FlatIdent_270C%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_270C%0"] == 0) then
					TABLE_TableIndirection["FlatIdent_60EA1%0"] = 0;
					TABLE_TableIndirection["tabBtn%0"] = nil;
					TABLE_TableIndirection["FlatIdent_270C%0"] = 1;
				end
				if (TABLE_TableIndirection["FlatIdent_270C%0"] == 1) then
					TABLE_TableIndirection["FlatIdent_21297%0"] = 1;
					break;
				end
			end
		end
		if ((4070 > 687) and (TABLE_TableIndirection["FlatIdent_21297%0"] ~= 1)) then
		else
			TABLE_TableIndirection["content%0"] = nil;
			while true do
				if (TABLE_TableIndirection["FlatIdent_60EA1%0"] ~= 1) then
				else
					if (not TABLE_TableIndirection["firstTab%0"] or (656 >= 3330)) then
						TABLE_TableIndirection["FlatIdent_B322%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_B322%0"] == 0) then
								TABLE_TableIndirection["firstTab%0"] = TABLE_TableIndirection["tabBtn%0"];
								TABLE_TableIndirection["firstContent%0"] = TABLE_TableIndirection["content%0"];
								TABLE_TableIndirection["FlatIdent_B322%0"] = 1;
							end
							if (1 == TABLE_TableIndirection["FlatIdent_B322%0"]) then
								TABLE_TableIndirection["content%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\245\15\80\219\69\114\33", "\68\163\102\35\178\39\30")] = true;
								break;
							end
						end
					else
						TABLE_TableIndirection["content%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\136\121\201\206\1\185\134", "\113\222\16\186\167\99\213\227")] = false;
					end
					break;
				end
				if ((TABLE_TableIndirection["FlatIdent_60EA1%0"] ~= 0) or (2492 <= 335)) then
				else
					TABLE_TableIndirection["FlatIdent_69D54%0"] = 0;
					TABLE_TableIndirection["FlatIdent_7735C%0"] = nil;
					while true do
						if (TABLE_TableIndirection["FlatIdent_69D54%0"] == 0) then
							TABLE_TableIndirection["FlatIdent_7735C%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_7735C%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_60EA1%0"] = 1;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_7735C%0"] == 0) then
									TABLE_TableIndirection["tabBtn%0"] = TABLE_TableIndirection["Examples%0"].TableTab(name);
									TABLE_TableIndirection["content%0"] = TABLE_TableIndirection["PagesFolder%0"]:FindFirstChild(name .. LUAOBFUSACTOR_DECRYPT_STR_0("\216\161\188\60\254\160\166", "\72\155\206\210"));
									TABLE_TableIndirection["FlatIdent_7735C%0"] = 1;
								end
							end
							break;
						end
					end
				end
			end
			break;
		end
	end
end;
local function findTab(tabname)
	TABLE_TableIndirection["FlatIdent_33F65%0"] = 0;
	TABLE_TableIndirection["FlatIdent_8F047%0"] = nil;
	TABLE_TableIndirection["tabN%0"] = nil;
	while true do
		if ((4322 >= 2562) and (TABLE_TableIndirection["FlatIdent_33F65%0"] == 0)) then
			TABLE_TableIndirection["FlatIdent_70003%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_70003%0"] == 0) then
					TABLE_TableIndirection["FlatIdent_8F047%0"] = 0;
					TABLE_TableIndirection["tabN%0"] = nil;
					TABLE_TableIndirection["FlatIdent_70003%0"] = 1;
				end
				if (TABLE_TableIndirection["FlatIdent_70003%0"] == 1) then
					TABLE_TableIndirection["FlatIdent_33F65%0"] = 1;
					break;
				end
			end
		end
		if ((TABLE_TableIndirection["FlatIdent_33F65%0"] ~= 1) or (3637 >= 3770)) then
		else
			while true do
				TABLE_TableIndirection["FlatIdent_9851B%0"] = 0;
				TABLE_TableIndirection["FlatIdent_2DA99%0"] = nil;
				while true do
					if (TABLE_TableIndirection["FlatIdent_9851B%0"] == 0) then
						TABLE_TableIndirection["FlatIdent_2DA99%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_2DA99%0"] ~= 0) then
							else
								if ((TABLE_TableIndirection["FlatIdent_8F047%0"] ~= 0) or (2379 > 4578)) then
								else
									TABLE_TableIndirection["FlatIdent_8CB90%0"] = 0;
									TABLE_TableIndirection["FlatIdent_69486%0"] = nil;
									while true do
										if (TABLE_TableIndirection["FlatIdent_8CB90%0"] == 0) then
											TABLE_TableIndirection["FlatIdent_69486%0"] = 0;
											while true do
												if ((TABLE_TableIndirection["FlatIdent_69486%0"] ~= 0) or (483 > 743)) then
												else
													TABLE_TableIndirection["FlatIdent_79729%0"] = 0;
													while true do
														if (TABLE_TableIndirection["FlatIdent_79729%0"] == 1) then
															TABLE_TableIndirection["FlatIdent_69486%0"] = 1;
															break;
														end
														if (0 == TABLE_TableIndirection["FlatIdent_79729%0"]) then
															TABLE_TableIndirection["tabN%0"] = nil;
															for _, tab in pairs(TABLE_TableIndirection["PagesFolder%0"]:GetChildren()) do
																if (tab[LUAOBFUSACTOR_DECRYPT_STR_0("\0\15\246\243", "\150\78\110\155")] ~= (tabname .. LUAOBFUSACTOR_DECRYPT_STR_0("\101\117\90\26\54\72\110", "\83\38\26\52\110"))) then
																else
																	TABLE_TableIndirection["tabN%0"] = tab:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\107\20\53\73\84\27\46\72\95\49\53\71\85\18", "\38\56\119\71"));
																	break;
																end
															end
															TABLE_TableIndirection["FlatIdent_79729%0"] = 1;
														end
													end
												end
												if ((2454 > 578) and (TABLE_TableIndirection["FlatIdent_69486%0"] ~= 1)) then
												else
													TABLE_TableIndirection["FlatIdent_8F047%0"] = 1;
													break;
												end
											end
											break;
										end
									end
								end
								if (TABLE_TableIndirection["FlatIdent_8F047%0"] ~= 1) then
								else
									TABLE_TableIndirection["FlatIdent_7993F%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_7993F%0"] == 0) then
											if ((930 < 4458) and (not TABLE_TableIndirection["tabN%0"] or (3325 > 4613))) then
												TABLE_TableIndirection["FlatIdent_24237%0"] = 0;
												TABLE_TableIndirection["FlatIdent_51F42%0"] = nil;
												while true do
													if ((662 <= 972) and (TABLE_TableIndirection["FlatIdent_24237%0"] == 0)) then
														TABLE_TableIndirection["FlatIdent_51F42%0"] = 0;
														while true do
															if (TABLE_TableIndirection["FlatIdent_51F42%0"] ~= 0) then
															else
																TABLE_TableIndirection["FlatIdent_129E6%0"] = 0;
																TABLE_TableIndirection["FlatIdent_31ECC%0"] = nil;
																while true do
																	if (0 == TABLE_TableIndirection["FlatIdent_129E6%0"]) then
																		TABLE_TableIndirection["FlatIdent_31ECC%0"] = 0;
																		while true do
																			if ((4370 == 4370) and (TABLE_TableIndirection["FlatIdent_31ECC%0"] ~= 0)) then
																			else
																				warn(LUAOBFUSACTOR_DECRYPT_STR_0("\199\238\90\150\43\89\231\175\94\217\48\88\247\181\24", "\54\147\143\56\182\69") .. tabname);
																				return;
																			end
																		end
																		break;
																	end
																end
															end
														end
														break;
													end
												end
											end
											return TABLE_TableIndirection["tabN%0"];
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end
GuiLib.createClickBtn = function(name, tabname, callback)
	TABLE_TableIndirection["FlatIdent_1BCFB%0"] = 0;
	TABLE_TableIndirection["tabN%0"] = nil;
	TABLE_TableIndirection["TextButton%0"] = nil;
	while true do
		if (1 ~= TABLE_TableIndirection["FlatIdent_1BCFB%0"]) then
		else
			TABLE_TableIndirection["FlatIdent_6D68E%0"] = 0;
			while true do
				if ((TABLE_TableIndirection["FlatIdent_6D68E%0"] ~= 0) or (4762 <= 861)) then
				else
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\167\196\36\234\163\12\176\85\139\193\4\238\168\17\173\19", "\32\229\165\71\129\196\126\223")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\247\129\193\140\132", "\181\163\233\164\225\225")][LUAOBFUSACTOR_DECRYPT_STR_0("\113\136\61\114\94\159", "\23\48\235\94")];
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\94\213\202\89\82\33\241\115\214\215\79\4", "\178\28\186\184\61\55\83")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\240\197\66\49\247", "\149\164\173\39\92\146\110")][LUAOBFUSACTOR_DECRYPT_STR_0("\209\40\2\27\31\9", "\123\147\71\112\127\122")];
					TABLE_TableIndirection["FlatIdent_6D68E%0"] = 1;
				end
				if (TABLE_TableIndirection["FlatIdent_6D68E%0"] == 1) then
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\238\194\144\117\67\222\254\139\107\67\252\196\154\116\74", "\38\172\173\226\17")] = 1;
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\126\24\54\234", "\143\45\113\76")] = UDim2.new(0.9, 0, 0.05, 0);
					TABLE_TableIndirection["FlatIdent_6D68E%0"] = 2;
				end
				if (2 ~= TABLE_TableIndirection["FlatIdent_6D68E%0"]) then
				else
					TABLE_TableIndirection["FlatIdent_1BCFB%0"] = 2;
					break;
				end
			end
		end
		if ((TABLE_TableIndirection["FlatIdent_1BCFB%0"] ~= 0) or (1412 == 4264)) then
		else
			TABLE_TableIndirection["FlatIdent_12E4E%0"] = 0;
			TABLE_TableIndirection["FlatIdent_3F7F4%0"] = nil;
			while true do
				if (0 == TABLE_TableIndirection["FlatIdent_12E4E%0"]) then
					TABLE_TableIndirection["FlatIdent_3F7F4%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_3F7F4%0"] ~= 1) then
						else
							TABLE_TableIndirection["TextButton%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\226\132\231\93\253\195\149\235\70\209", "\191\182\225\159\41"));
							TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\136\185\14\57\182\172", "\92\216\216\124")] = TABLE_TableIndirection["tabN%0"];
							TABLE_TableIndirection["FlatIdent_3F7F4%0"] = 2;
						end
						if (0 ~= TABLE_TableIndirection["FlatIdent_3F7F4%0"]) then
						else
							TABLE_TableIndirection["FlatIdent_89126%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_89126%0"] == 1) then
									TABLE_TableIndirection["FlatIdent_3F7F4%0"] = 1;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_89126%0"] == 0) then
									TABLE_TableIndirection["tabN%0"] = findTab(tabname);
									if (not TABLE_TableIndirection["tabN%0"] or (1180 == 2180) or (3168 < 2153)) then
										return;
									end
									TABLE_TableIndirection["FlatIdent_89126%0"] = 1;
								end
							end
						end
						if ((2 ~= TABLE_TableIndirection["FlatIdent_3F7F4%0"]) or (4976 < 1332)) then
						else
							TABLE_TableIndirection["FlatIdent_1BCFB%0"] = 1;
							break;
						end
					end
					break;
				end
			end
		end
		if (3 == TABLE_TableIndirection["FlatIdent_1BCFB%0"]) then
			TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\111\55\180\84", "\157\59\82\204\32")] = name;
			if ((4090 < 4653) and callback and (typeof(callback) == LUAOBFUSACTOR_DECRYPT_STR_0("\45\7\38\86\159\142\205\37", "\162\75\114\72\53\235\231"))) then
				TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\21\49\246\233\236\200\198\165\44\49\237\171\202\230\218\178\51", "\209\88\94\131\154\137\138\179")]:Connect(callback);
			end
			break;
		end
		if ((4628 == 4628) and (TABLE_TableIndirection["FlatIdent_1BCFB%0"] ~= 2)) then
		else
			TABLE_TableIndirection["FlatIdent_1B5ED%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_1B5ED%0"] == 1) then
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\28\164\220\104\45\32\48\46\45\165", "\66\72\193\164\28\126\67\81")] = true;
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\211\41\176\76\17\100\230\60\184\93\34", "\22\135\76\200\56\70")] = true;
					TABLE_TableIndirection["FlatIdent_1B5ED%0"] = 2;
				end
				if (TABLE_TableIndirection["FlatIdent_1B5ED%0"] == 0) then
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\171\63\246\48", "\129\237\80\152\68\61")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\119\167\10\231", "\56\49\200\100\147\124\119")][LUAOBFUSACTOR_DECRYPT_STR_0("\255\49\170\226\207\59\140\241\194\45", "\144\172\94\223")];
					TABLE_TableIndirection["TextButton%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\16\10\186\83\7\0\174\72\54\92", "\39\68\111\194")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\226\174\226\202\124", "\215\182\198\135\167\25")][LUAOBFUSACTOR_DECRYPT_STR_0("\185\76\242\92", "\40\237\41\138")];
					TABLE_TableIndirection["FlatIdent_1B5ED%0"] = 1;
				end
				if (TABLE_TableIndirection["FlatIdent_1B5ED%0"] == 2) then
					TABLE_TableIndirection["FlatIdent_1BCFB%0"] = 3;
					break;
				end
			end
		end
	end
end;
GuiLib.CreateLabel = function(text, tabname)
	TABLE_TableIndirection["tabN%0"] = findTab(tabname);
	if (not TABLE_TableIndirection["tabN%0"] or (2652 < 196) or (54 == 395)) then
		return;
	end
	TABLE_TableIndirection["label%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\184\57\92\246\127\3\142\57\72", "\98\236\92\36\130\51"));
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\247\117\232\253\68\211", "\42\167\20\154\152")] = TABLE_TableIndirection["tabN%0"];
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\121\247\184\71", "\65\42\158\194\34\17")] = UDim2.new(1, 0, 0, 25);
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\56\38\81\7\42\255\20\251\20\35\102\30\44\227\8\254\27\53\87\2\46\244", "\142\122\71\50\108\77\141\123")] = 1;
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\33\167\231\12", "\91\117\194\159\120")] = text;
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\46\24\38\12\22\254\40\21\15\109", "\68\122\125\94\120\85\145")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\35\20\202\83\205", "\218\119\124\175\62\168\185")][LUAOBFUSACTOR_DECRYPT_STR_0("\145\245\80\208", "\164\197\144\40")];
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\165\255\164\159", "\214\227\144\202\235\189")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\203\170\137\111", "\92\141\197\231\27\112\211\51")][LUAOBFUSACTOR_DECRYPT_STR_0("\213\240\159\177\210\227\204\139\173\194\196\240\134\167", "\177\134\159\234\195")];
	TABLE_TableIndirection["label%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\137\238\39\180\250\190\234\51\165\205", "\169\221\139\95\192")] = true;
end;
GuiLib.createToggle = function(text, tabname, default, callback)
	TABLE_TableIndirection["FlatIdent_4D69A%0"] = 0;
	TABLE_TableIndirection["FlatIdent_92F66%0"] = nil;
	TABLE_TableIndirection["tabN%0"] = nil;
	TABLE_TableIndirection["state%0"] = nil;
	TABLE_TableIndirection["toggle%0"] = nil;
	while true do
		if (TABLE_TableIndirection["FlatIdent_4D69A%0"] == 1) then
			TABLE_TableIndirection["state%0"] = nil;
			TABLE_TableIndirection["toggle%0"] = nil;
			TABLE_TableIndirection["FlatIdent_4D69A%0"] = 2;
		end
		if (TABLE_TableIndirection["FlatIdent_4D69A%0"] == 2) then
			while true do
				if (TABLE_TableIndirection["FlatIdent_92F66%0"] == 0) then
					TABLE_TableIndirection["FlatIdent_5013F%0"] = 0;
					TABLE_TableIndirection["FlatIdent_1468D%0"] = nil;
					while true do
						if (0 == TABLE_TableIndirection["FlatIdent_5013F%0"]) then
							TABLE_TableIndirection["FlatIdent_1468D%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_1468D%0"] ~= 2) then
								else
									TABLE_TableIndirection["FlatIdent_92F66%0"] = 1;
									break;
								end
								if ((82 == 82) and (TABLE_TableIndirection["FlatIdent_1468D%0"] ~= 0)) then
								else
									TABLE_TableIndirection["tabN%0"] = findTab(tabname);
									if (not TABLE_TableIndirection["tabN%0"] or (4950 <= 4553) or (581 < 282)) then
										return;
									end
									TABLE_TableIndirection["FlatIdent_1468D%0"] = 1;
								end
								if (TABLE_TableIndirection["FlatIdent_1468D%0"] ~= 1) then
								else
									TABLE_TableIndirection["state%0"] = default;
									TABLE_TableIndirection["toggle%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\144\28\20\174\103\189\161\36\171\23", "\80\196\121\108\218\37\200\213"));
									TABLE_TableIndirection["FlatIdent_1468D%0"] = 2;
								end
							end
							break;
						end
					end
				end
				if (TABLE_TableIndirection["FlatIdent_92F66%0"] ~= 3) then
				else
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\234\142\103\43\21\52\223\155\111\58\38", "\70\190\235\31\95\66")] = true;
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\142\231\2\242", "\133\218\130\122\134")] = text .. LUAOBFUSACTOR_DECRYPT_STR_0("\90\51", "\234\96\19\98\31\43\110") .. ((TABLE_TableIndirection["state%0"] and LUAOBFUSACTOR_DECRYPT_STR_0("\41\49", "\235\102\127\50\167\204\18")) or LUAOBFUSACTOR_DECRYPT_STR_0("\127\135\211", "\78\48\193\149\67\36"));
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\17\240\246\215\217\129\45\40\235\236\202\141\128\52\53\252\232", "\88\92\159\131\164\188\195")]:Connect(function()
						TABLE_TableIndirection["FlatIdent_19FC0%0"] = 0;
						TABLE_TableIndirection["FlatIdent_5D0DC%0"] = nil;
						TABLE_TableIndirection["FlatIdent_6E549%0"] = nil;
						while true do
							if (TABLE_TableIndirection["FlatIdent_19FC0%0"] == 1) then
								while true do
									if ((TABLE_TableIndirection["FlatIdent_5D0DC%0"] ~= 0) or (4609 < 2495)) then
									else
										TABLE_TableIndirection["FlatIdent_6E549%0"] = 0;
										while true do
											if ((1152 == 1152) and (TABLE_TableIndirection["FlatIdent_6E549%0"] ~= 1)) then
											else
												pcall(callback, TABLE_TableIndirection["state%0"]);
												break;
											end
											if (TABLE_TableIndirection["FlatIdent_6E549%0"] == 0) then
												TABLE_TableIndirection["FlatIdent_851CE%0"] = 0;
												TABLE_TableIndirection["FlatIdent_63A3A%0"] = nil;
												while true do
													if (TABLE_TableIndirection["FlatIdent_851CE%0"] == 0) then
														TABLE_TableIndirection["FlatIdent_63A3A%0"] = 0;
														while true do
															if ((1896 <= 3422) and (TABLE_TableIndirection["FlatIdent_63A3A%0"] == 1)) then
																TABLE_TableIndirection["FlatIdent_6E549%0"] = 1;
																break;
															end
															if ((TABLE_TableIndirection["FlatIdent_63A3A%0"] ~= 0) or (990 > 1620)) then
															else
																TABLE_TableIndirection["FlatIdent_98E39%0"] = 0;
																while true do
																	if (0 == TABLE_TableIndirection["FlatIdent_98E39%0"]) then
																		TABLE_TableIndirection["state%0"] = not TABLE_TableIndirection["state%0"];
																		TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\180\43\167\95", "\189\224\78\223\43\183\139")] = text .. LUAOBFUSACTOR_DECRYPT_STR_0("\106\94", "\33\80\126\224\120") .. ((TABLE_TableIndirection["state%0"] and LUAOBFUSACTOR_DECRYPT_STR_0("\195\134", "\60\140\200\99\164")) or LUAOBFUSACTOR_DECRYPT_STR_0("\168\210\34", "\194\231\148\100\70"));
																		TABLE_TableIndirection["FlatIdent_98E39%0"] = 1;
																	end
																	if (TABLE_TableIndirection["FlatIdent_98E39%0"] == 1) then
																		TABLE_TableIndirection["FlatIdent_63A3A%0"] = 1;
																		break;
																	end
																end
															end
														end
														break;
													end
												end
											end
										end
										break;
									end
								end
								break;
							end
							if (0 == TABLE_TableIndirection["FlatIdent_19FC0%0"]) then
								TABLE_TableIndirection["FlatIdent_5D0DC%0"] = 0;
								TABLE_TableIndirection["FlatIdent_6E549%0"] = nil;
								TABLE_TableIndirection["FlatIdent_19FC0%0"] = 1;
							end
						end
					end);
					break;
				end
				if ((TABLE_TableIndirection["FlatIdent_92F66%0"] ~= 2) or (877 > 4695)) then
				else
					TABLE_TableIndirection["FlatIdent_2A1A%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_2A1A%0"] == 2) then
							TABLE_TableIndirection["FlatIdent_92F66%0"] = 3;
							break;
						end
						if (TABLE_TableIndirection["FlatIdent_2A1A%0"] == 1) then
							TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\26\249\146\2\226\33\240\133\4\146", "\161\78\156\234\118")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\147\191\204\209\162", "\188\199\215\169")][LUAOBFUSACTOR_DECRYPT_STR_0("\200\12\71\111", "\136\156\105\63\27")];
							TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\47\137\97\32\40\143\120\56\30\136", "\84\123\236\25")] = true;
							TABLE_TableIndirection["FlatIdent_2A1A%0"] = 2;
						end
						if (0 == TABLE_TableIndirection["FlatIdent_2A1A%0"]) then
							TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\195\130\176\18", "\213\144\235\202\119\204")] = UDim2.new(0.9, 0, 0.05, 0);
							TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\5\23\208\62", "\45\67\120\190\74\72\67")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\6\45\227\177", "\137\64\66\141\197\153\232\142")][LUAOBFUSACTOR_DECRYPT_STR_0("\48\223\55\180\139\6\227\35\168\155", "\232\99\176\66\198")];
							TABLE_TableIndirection["FlatIdent_2A1A%0"] = 1;
						end
					end
				end
				if (TABLE_TableIndirection["FlatIdent_92F66%0"] ~= 1) then
				else
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\220\32\58\3\117\153", "\76\140\65\72\102\27\237\153")] = TABLE_TableIndirection["tabN%0"];
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\104\219\21\217\208\19\177\95\212\18\241\216\13\177\88\137", "\222\42\186\118\178\183\97")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\105\228\65\135\88", "\234\61\140\36")][LUAOBFUSACTOR_DECRYPT_STR_0("\0\222\185\119\1\53", "\111\65\189\218\18")];
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\97\68\9\49\14\78\140\76\71\20\39\88", "\207\35\43\123\85\107\60")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\68\162\165\231\124", "\25\16\202\192\138")][LUAOBFUSACTOR_DECRYPT_STR_0("\223\196\191\230\172\230", "\148\157\171\205\130\201")];
					TABLE_TableIndirection["toggle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\1\219\102\45\212\228\16\221\110\44\225\255\59\209\120", "\150\67\180\20\73\177")] = 1;
					TABLE_TableIndirection["FlatIdent_92F66%0"] = 2;
				end
			end
			break;
		end
		if (0 == TABLE_TableIndirection["FlatIdent_4D69A%0"]) then
			TABLE_TableIndirection["FlatIdent_92F66%0"] = 0;
			TABLE_TableIndirection["tabN%0"] = nil;
			TABLE_TableIndirection["FlatIdent_4D69A%0"] = 1;
		end
	end
end;
GuiLib.createTextbox = function(placeholderText, tabname, defaultText, callback, sizeY)
	TABLE_TableIndirection["FlatIdent_76EB7%0"] = 0;
	TABLE_TableIndirection["FlatIdent_956D%0"] = nil;
	TABLE_TableIndirection["FlatIdent_D14D%0"] = nil;
	TABLE_TableIndirection["tabN%0"] = nil;
	TABLE_TableIndirection["UserInputService%0"] = nil;
	TABLE_TableIndirection["isMobile%0"] = nil;
	TABLE_TableIndirection["textbox%0"] = nil;
	while true do
		if (TABLE_TableIndirection["FlatIdent_76EB7%0"] == 2) then
			TABLE_TableIndirection["isMobile%0"] = nil;
			TABLE_TableIndirection["textbox%0"] = nil;
			TABLE_TableIndirection["FlatIdent_76EB7%0"] = 3;
		end
		if (TABLE_TableIndirection["FlatIdent_76EB7%0"] == 3) then
			while true do
				if ((2691 >= 1851) and (TABLE_TableIndirection["FlatIdent_956D%0"] ~= 2)) then
				else
					TABLE_TableIndirection["textbox%0"] = nil;
					while true do
						if ((TABLE_TableIndirection["FlatIdent_D14D%0"] == 4) or (2985 >= 4856)) then
							TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\185\29\2\89", "\45\237\120\122")] = defaultText or "";
							TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\241\231\161\57\196\196\173\63\195", "\76\183\136\194")]:Connect(function(enterPressed)
								if ((4276 >= 1195) and (2665 <= 3933) and (4135 < 4817) and enterPressed) then
									pcall(callback, TABLE_TableIndirection["textbox%0"].Text);
								end
							end);
							break;
						end
						if ((3232 <= 4690) and (0 ~= TABLE_TableIndirection["FlatIdent_D14D%0"])) then
						else
							TABLE_TableIndirection["FlatIdent_803FB%0"] = 0;
							while true do
								if ((TABLE_TableIndirection["FlatIdent_803FB%0"] ~= 2) or (896 >= 3146)) then
								else
									TABLE_TableIndirection["FlatIdent_D14D%0"] = 1;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_803FB%0"] ~= 1) then
								else
									TABLE_TableIndirection["UserInputService%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\115\95\196\177\223\198\86\89\213\144\243\218\80\69\194\166", "\168\38\44\161\195\150"));
									TABLE_TableIndirection["isMobile%0"] = TABLE_TableIndirection["UserInputService%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\78\233\240\59\88\106\26\123\228\233\61\84", "\116\26\134\133\88\48\47")] and not TABLE_TableIndirection["UserInputService%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\51\206\181\247\184\87\16\192\162\232\184\118", "\18\126\161\192\132\221")];
									TABLE_TableIndirection["FlatIdent_803FB%0"] = 2;
								end
								if ((3061 >= 2958) and (TABLE_TableIndirection["FlatIdent_803FB%0"] ~= 0)) then
								else
									TABLE_TableIndirection["FlatIdent_82A94%0"] = 0;
									while true do
										if (TABLE_TableIndirection["FlatIdent_82A94%0"] == 1) then
											TABLE_TableIndirection["FlatIdent_803FB%0"] = 1;
											break;
										end
										if (0 == TABLE_TableIndirection["FlatIdent_82A94%0"]) then
											TABLE_TableIndirection["tabN%0"] = findTab(tabname);
											if ((3187 >= 644) and not TABLE_TableIndirection["tabN%0"]) then
												return;
											end
											TABLE_TableIndirection["FlatIdent_82A94%0"] = 1;
										end
									end
								end
							end
						end
						if (2 ~= TABLE_TableIndirection["FlatIdent_D14D%0"]) then
						else
							TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\125\39\188\0\83\77\27\167\30\83\111\33\182\1\90", "\54\63\72\206\100")] = 1;
							TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\251\80\95\127", "\27\168\57\37\26\133")] = UDim2.new(0.9, 0, sizeY or 0.1, 0);
							TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\11\165\114\188", "\183\77\202\28\200")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\49\60\135\28", "\104\119\83\233")][LUAOBFUSACTOR_DECRYPT_STR_0("\198\247\50\48\64\240\203\38\44\80", "\35\149\152\71\66")];
							TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\45\237\90\164\25\22\228\77\162\105", "\90\121\136\34\208")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\243\6\80\19\194", "\126\167\110\53")][LUAOBFUSACTOR_DECRYPT_STR_0("\9\21\54\236", "\95\93\112\78\152\188")];
							TABLE_TableIndirection["FlatIdent_D14D%0"] = 3;
						end
						if ((644 <= 704) and (TABLE_TableIndirection["FlatIdent_D14D%0"] ~= 1)) then
						else
							TABLE_TableIndirection["FlatIdent_8DAB1%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_8DAB1%0"] == 0) then
									TABLE_TableIndirection["textbox%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\180\249\154\98\18\231\174", "\118\224\156\226\22\80\136\214"));
									TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\241\244\151\16\234\170", "\178\161\149\229\117\132\222")] = TABLE_TableIndirection["tabN%0"];
									TABLE_TableIndirection["FlatIdent_8DAB1%0"] = 1;
								end
								if (TABLE_TableIndirection["FlatIdent_8DAB1%0"] == 2) then
									TABLE_TableIndirection["FlatIdent_D14D%0"] = 2;
									break;
								end
								if (TABLE_TableIndirection["FlatIdent_8DAB1%0"] == 1) then
									TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\170\218\222\167\166\4\169\54\134\223\254\163\173\25\180\112", "\67\232\187\189\204\193\118\198")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\191\38\176\45\62", "\143\235\78\213\64\91\98")][LUAOBFUSACTOR_DECRYPT_STR_0("\175\73\135\226\119\164\130\93\138\237", "\214\237\40\228\137\16")];
									TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\167\236\253\221\6\180\166\236\227\214\17\245", "\198\229\131\143\185\99")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\101\132\173\126\84", "\19\49\236\200")][LUAOBFUSACTOR_DECRYPT_STR_0("\223\52\245\178\234\174", "\218\158\87\150\215\132")];
									TABLE_TableIndirection["FlatIdent_8DAB1%0"] = 2;
								end
							end
						end
						if ((958 > 947) and (TABLE_TableIndirection["FlatIdent_D14D%0"] == 3)) then
							TABLE_TableIndirection["FlatIdent_21387%0"] = 0;
							TABLE_TableIndirection["FlatIdent_5B476%0"] = nil;
							while true do
								if (TABLE_TableIndirection["FlatIdent_21387%0"] == 0) then
									TABLE_TableIndirection["FlatIdent_5B476%0"] = 0;
									while true do
										if ((4492 >= 2654) and (TABLE_TableIndirection["FlatIdent_5B476%0"] ~= 1)) then
										else
											TABLE_TableIndirection["FlatIdent_2861D%0"] = 0;
											while true do
												if (TABLE_TableIndirection["FlatIdent_2861D%0"] == 0) then
													TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\216\18\220\227\36\22\200\227\10\246\236\16\45\206\238\13", "\173\155\126\185\130\86\66")] = false;
													TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\213\170\187\196\141\228\234\170\190\194\154\216\224\190\174", "\140\133\198\218\167\232")] = placeholderText or "";
													TABLE_TableIndirection["FlatIdent_2861D%0"] = 1;
												end
												if (TABLE_TableIndirection["FlatIdent_2861D%0"] == 1) then
													TABLE_TableIndirection["FlatIdent_5B476%0"] = 2;
													break;
												end
											end
										end
										if (TABLE_TableIndirection["FlatIdent_5B476%0"] == 2) then
											TABLE_TableIndirection["FlatIdent_D14D%0"] = 4;
											break;
										end
										if (TABLE_TableIndirection["FlatIdent_5B476%0"] ~= 0) then
										else
											TABLE_TableIndirection["FlatIdent_6D8EC%0"] = 0;
											while true do
												if (TABLE_TableIndirection["FlatIdent_6D8EC%0"] == 1) then
													TABLE_TableIndirection["FlatIdent_5B476%0"] = 1;
													break;
												end
												if (TABLE_TableIndirection["FlatIdent_6D8EC%0"] == 0) then
													TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\129\43\172\105\183\182\47\184\120\128", "\228\213\78\212\29")] = true;
													TABLE_TableIndirection["textbox%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\179\73\174\17\220\149\77\166\21\238\131", "\139\231\44\214\101")] = true;
													TABLE_TableIndirection["FlatIdent_6D8EC%0"] = 1;
												end
											end
										end
									end
									break;
								end
							end
						end
					end
					break;
				end
				if ((3442 >= 1503) and (TABLE_TableIndirection["FlatIdent_956D%0"] == 0)) then
					TABLE_TableIndirection["FlatIdent_D14D%0"] = 0;
					TABLE_TableIndirection["tabN%0"] = nil;
					TABLE_TableIndirection["FlatIdent_956D%0"] = 1;
				end
				if ((TABLE_TableIndirection["FlatIdent_956D%0"] ~= 1) or (3170 <= 1464)) then
				else
					TABLE_TableIndirection["FlatIdent_2F3FA%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_2F3FA%0"] == 0) then
							TABLE_TableIndirection["UserInputService%0"] = nil;
							TABLE_TableIndirection["isMobile%0"] = nil;
							TABLE_TableIndirection["FlatIdent_2F3FA%0"] = 1;
						end
						if (1 == TABLE_TableIndirection["FlatIdent_2F3FA%0"]) then
							TABLE_TableIndirection["FlatIdent_956D%0"] = 2;
							break;
						end
					end
				end
			end
			break;
		end
		if (1 == TABLE_TableIndirection["FlatIdent_76EB7%0"]) then
			TABLE_TableIndirection["tabN%0"] = nil;
			TABLE_TableIndirection["UserInputService%0"] = nil;
			TABLE_TableIndirection["FlatIdent_76EB7%0"] = 2;
		end
		if (TABLE_TableIndirection["FlatIdent_76EB7%0"] == 0) then
			TABLE_TableIndirection["FlatIdent_956D%0"] = 0;
			TABLE_TableIndirection["FlatIdent_D14D%0"] = nil;
			TABLE_TableIndirection["FlatIdent_76EB7%0"] = 1;
		end
	end
end;
GuiLib.createSlider = function(name, tabname, default, callback, sizeX)
	TABLE_TableIndirection["parentTab%0"] = findTab(tabname);
	if ((3273 == 3273) and (272 == 272) and not TABLE_TableIndirection["parentTab%0"]) then
		return;
	end
	TABLE_TableIndirection["SliderTrack%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\100\252\88\141\71", "\224\34\142\57"));
	TABLE_TableIndirection["SliderFill%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\248\181\196\208\118", "\110\190\199\165\189\19\145\61"));
	TABLE_TableIndirection["SliderHandle%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\252\249\118\229\142", "\167\186\139\23\136\235"));
	TABLE_TableIndirection["TextLabel%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\46\176\144\25\54\180\138\8\22", "\109\122\213\232"));
	TABLE_TableIndirection["SliderTrack%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\247\238\11\91", "\118\185\143\102\62\112\209\81")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\209\196\174\57\234\242\176", "\80\142\151\194");
	TABLE_TableIndirection["SliderTrack%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\108\113\59\227\171\1", "\88\60\16\73\134\197\117\124")] = TABLE_TableIndirection["parentTab%0"];
	TABLE_TableIndirection["SliderTrack%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\114\235\251\195\70\66\229\237\198\69\100\248\249\198\82\64\235\234\205\79\83\243", "\33\48\138\152\168")] = 1;
	TABLE_TableIndirection["SliderTrack%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\65\31\42\84", "\87\18\118\80\49\161")] = UDim2.new(sizeX or 0.4, 0, 0.2, 0);
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\124\31\200\165\190\88", "\208\44\126\186\192")] = TABLE_TableIndirection["SliderTrack%0"];
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\213\27\167\205\19\238\198\91\249\30\144\212\21\242\218\94\246\8\161\200\23\229", "\46\151\122\196\166\116\156\169")] = 1;
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\214\228\92\31", "\155\133\141\38\122")] = UDim2.new(1, 0, 0.4, 0);
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\3\37\162\85", "\197\69\74\204\33\47\31")] = Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\214\64\84\147", "\231\144\47\58")][LUAOBFUSACTOR_DECRYPT_STR_0("\129\215\207\103\27\56\252\56\188\203\248\122\20\57", "\89\210\184\186\21\120\93\175")];
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\133\86\100\193\90\53\189\92\110\134", "\90\209\51\28\181\25")] = Color3.new(1, 1, 1);
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\228\126\79\250\140\211\122\91\235\187", "\223\176\27\55\142")] = true;
	TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\16\190\214\161", "\213\68\219\174")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\89\134", "\44\99\166\23") .. tostring(default);
	TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\37\225\46\226", "\31\107\128\67\135\74\165\95")] = LUAOBFUSACTOR_DECRYPT_STR_0("\79\251\32\50\54\182\90\254\37\58", "\196\28\151\73\86\83");
	TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\232\233\238\72\79\165", "\209\184\136\156\45\33")] = TABLE_TableIndirection["SliderTrack%0"];
	TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\37\201\118\3\191\21\199\96\6\188\36\199\121\7\170\84", "\216\103\168\21\104")] = GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\76\165\70\169\125", "\196\24\205\35")][LUAOBFUSACTOR_DECRYPT_STR_0("\15\136\224\3\32\159", "\102\78\235\131")];
	TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\202\33\39\77\83\48\184\58", "\84\154\78\84\36\39\89\215")] = UDim2.new(0, 0, 0.6, 0);
	TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\206\232\76\93", "\101\157\129\54\56")] = UDim2.new(default / 100, 0, 0.2, 0);
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\51\168\135\174", "\25\125\201\234\203\67")] = LUAOBFUSACTOR_DECRYPT_STR_0("\192\15\32\20\135\74\48\119\253\7\37\21", "\22\147\99\73\112\226\56\120");
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\73\245\10\6\26\51", "\115\25\148\120\99\116\71")] = TABLE_TableIndirection["SliderTrack%0"];
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\46\60\186\47\70\30\50\172\42\69\47\50\181\43\83\95", "\33\108\93\217\68")] = Color3.fromRGB(255, 255, 255);
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\235\68\178\164\207\66\174\163", "\205\187\43\193")] = UDim2.new(default / 100, -5, 0.6, -5);
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\205\123\31\218", "\191\158\18\101")] = UDim2.new(0, 10, 0, 20);
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\231\204\149\179\170\215\240\142\173\170\245\202\159\178\163", "\207\165\163\231\215")] = 1;
	TABLE_TableIndirection["dragging%0"] = false;
	TABLE_TableIndirection["UIS%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\141\102\231\231\164\182\101\247\225\190\189\103\244\252\142\189", "\237\216\21\130\149"));
	local function updateSlider(input)
		TABLE_TableIndirection["FlatIdent_8F59B%0"] = 0;
		TABLE_TableIndirection["absPos%0"] = nil;
		TABLE_TableIndirection["absSize%0"] = nil;
		TABLE_TableIndirection["x%0"] = nil;
		TABLE_TableIndirection["percent%0"] = nil;
		TABLE_TableIndirection["value%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_8F59B%0"] ~= 4) or (4797 == 4388)) then
			else
				if ((551 <= 681) and (3824 > 409) and callback) then
					pcall(callback, TABLE_TableIndirection["value%0"]);
				end
				break;
			end
			if (TABLE_TableIndirection["FlatIdent_8F59B%0"] ~= 2) then
			else
				TABLE_TableIndirection["FlatIdent_90DF8%0"] = 0;
				while true do
					if ((3277 > 407) and (TABLE_TableIndirection["FlatIdent_90DF8%0"] ~= 0)) then
					else
						TABLE_TableIndirection["FlatIdent_2E7F5%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_2E7F5%0"] == 1) then
								TABLE_TableIndirection["FlatIdent_90DF8%0"] = 1;
								break;
							end
							if (TABLE_TableIndirection["FlatIdent_2E7F5%0"] == 0) then
								TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\245\240\227\83", "\16\166\153\153\54\68")] = UDim2.new(TABLE_TableIndirection["percent%0"], 0, 0.2, 0);
								TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\226\188\211\79\32\40\246\220", "\153\178\211\160\38\84\65")] = UDim2.new(TABLE_TableIndirection["percent%0"], -5, 0.6, -5);
								TABLE_TableIndirection["FlatIdent_2E7F5%0"] = 1;
							end
						end
					end
					if (TABLE_TableIndirection["FlatIdent_90DF8%0"] == 1) then
						TABLE_TableIndirection["FlatIdent_8F59B%0"] = 3;
						break;
					end
				end
			end
			if (TABLE_TableIndirection["FlatIdent_8F59B%0"] ~= 3) then
			else
				TABLE_TableIndirection["FlatIdent_3B2E6%0"] = 0;
				TABLE_TableIndirection["FlatIdent_2DACE%0"] = nil;
				while true do
					if (TABLE_TableIndirection["FlatIdent_3B2E6%0"] == 0) then
						TABLE_TableIndirection["FlatIdent_2DACE%0"] = 0;
						while true do
							if ((4695 >= 1415) and (TABLE_TableIndirection["FlatIdent_2DACE%0"] ~= 0)) then
							else
								TABLE_TableIndirection["value%0"] = math.floor(TABLE_TableIndirection["obf_AND%0"](TABLE_TableIndirection["percent%0"] * 100, 0.5) + TABLE_TableIndirection["obf_OR%0"](TABLE_TableIndirection["percent%0"] * 100, 0.5));
								TABLE_TableIndirection["TextLabel%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\182\14\66\63", "\75\226\107\58")] = name .. LUAOBFUSACTOR_DECRYPT_STR_0("\216\14", "\62\226\46\63\63\208\169") .. tostring(TABLE_TableIndirection["value%0"]);
								TABLE_TableIndirection["FlatIdent_2DACE%0"] = 1;
							end
							if ((TABLE_TableIndirection["FlatIdent_2DACE%0"] ~= 1) or (3212 <= 944)) then
							else
								TABLE_TableIndirection["FlatIdent_8F59B%0"] = 4;
								break;
							end
						end
						break;
					end
				end
			end
			if (TABLE_TableIndirection["FlatIdent_8F59B%0"] == 0) then
				TABLE_TableIndirection["FlatIdent_1DE58%0"] = 0;
				TABLE_TableIndirection["FlatIdent_77478%0"] = nil;
				while true do
					if (TABLE_TableIndirection["FlatIdent_1DE58%0"] == 0) then
						TABLE_TableIndirection["FlatIdent_77478%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_77478%0"] ~= 0) then
							else
								TABLE_TableIndirection["absPos%0"] = TABLE_TableIndirection["SliderTrack%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\121\220\2\117\29\215\217\93\238\30\105\24\214\196\87\208", "\173\56\190\113\26\113\162")]['X'];
								TABLE_TableIndirection["absSize%0"] = TABLE_TableIndirection["SliderTrack%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\234\220\62\10\251\222\202\40\54\254\209\219", "\151\171\190\77\101")]['X'];
								TABLE_TableIndirection["FlatIdent_77478%0"] = 1;
							end
							if ((1 ~= TABLE_TableIndirection["FlatIdent_77478%0"]) or (3096 <= 1798)) then
							else
								TABLE_TableIndirection["FlatIdent_8F59B%0"] = 1;
								break;
							end
						end
						break;
					end
				end
			end
			if ((3537 == 3537) and (TABLE_TableIndirection["FlatIdent_8F59B%0"] ~= 1)) then
			else
				TABLE_TableIndirection["FlatIdent_7C89%0"] = 0;
				while true do
					if (TABLE_TableIndirection["FlatIdent_7C89%0"] == 0) then
						TABLE_TableIndirection["x%0"] = math.clamp(input[LUAOBFUSACTOR_DECRYPT_STR_0("\245\32\235\160\236\116\4\203", "\107\165\79\152\201\152\29")]['X'] - TABLE_TableIndirection["absPos%0"], 0, TABLE_TableIndirection["absSize%0"]);
						TABLE_TableIndirection["percent%0"] = TABLE_TableIndirection["x%0"] / TABLE_TableIndirection["absSize%0"];
						TABLE_TableIndirection["FlatIdent_7C89%0"] = 1;
					end
					if (1 == TABLE_TableIndirection["FlatIdent_7C89%0"]) then
						TABLE_TableIndirection["FlatIdent_8F59B%0"] = 2;
						break;
					end
				end
			end
		end
	end
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\126\64\248\222\64\93\82\73\233\197", "\31\55\46\136\171\52")]:Connect(function(input)
		if ((3837 >= 1570) and (input[LUAOBFUSACTOR_DECRYPT_STR_0("\228\59\217\230\248\38\204\225\197\28\197\228\212", "\148\177\72\188")] ~= Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\147\165\82\193\143\184\71\198\178\130\78\195\163", "\179\198\214\55")][LUAOBFUSACTOR_DECRYPT_STR_0("\221\3\103\101\64\241\229\24\102\121\75\130", "\179\144\108\18\22\37")])) then
		else
			TABLE_TableIndirection["dragging%0"] = true;
		end
	end);
	TABLE_TableIndirection["UIS%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\239\173\11\156\219\229\171\26\135\200\195\167", "\175\166\195\123\233")]:Connect(function(input)
		if (((2087 == 2087) and TABLE_TableIndirection["dragging%0"] and (input[LUAOBFUSACTOR_DECRYPT_STR_0("\218\209\88\91\217\225\210\72\93\196\246\210\88", "\144\143\162\61\41")] == Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\213\192\24\66\91\137\35\245\199\41\73\98\130", "\83\128\179\125\48\18\231")][LUAOBFUSACTOR_DECRYPT_STR_0("\112\184\230\206\66\51\82\161\246\208\66\16\73", "\126\61\215\147\189\39")])) or (2950 == 3812)) then
			updateSlider(input);
		end
	end);
	TABLE_TableIndirection["UIS%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\81\241\13\80\108\218\19\65\125\251", "\37\24\159\125")]:Connect(function(input)
		if ((4723 >= 2318) and (input[LUAOBFUSACTOR_DECRYPT_STR_0("\239\181\112\80\243\168\101\87\206\146\108\82\223", "\34\186\198\21")] ~= Enum[LUAOBFUSACTOR_DECRYPT_STR_0("\205\27\192\79\235\246\24\208\73\246\225\24\192", "\162\152\104\165\61")][LUAOBFUSACTOR_DECRYPT_STR_0("\224\32\167\110\117\199\216\59\166\114\126\180", "\133\173\79\210\29\16")])) then
		else
			TABLE_TableIndirection["dragging%0"] = false;
		end
	end);
	TABLE_TableIndirection["SliderFill%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\190\117\247\46", "\75\237\28\141")] = UDim2.new(default / 100, 0, 0.2, 0);
	TABLE_TableIndirection["SliderHandle%0"][LUAOBFUSACTOR_DECRYPT_STR_0("\236\80\223\184\59\18\232\239", "\129\188\63\172\209\79\123\135")] = UDim2.new(default / 100, -5, 0.6, -5);
end;
local function insUpd()
	while wait() do
		TABLE_TableIndirection["FlatIdent_2EDA1%0"] = 0;
		TABLE_TableIndirection["FlatIdent_145D2%0"] = nil;
		TABLE_TableIndirection["FlatIdent_6DFD9%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_2EDA1%0"] == 0) then
				TABLE_TableIndirection["FlatIdent_145D2%0"] = 0;
				TABLE_TableIndirection["FlatIdent_6DFD9%0"] = nil;
				TABLE_TableIndirection["FlatIdent_2EDA1%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_2EDA1%0"] == 1) then
				while true do
					if ((TABLE_TableIndirection["FlatIdent_145D2%0"] ~= 0) or (2027 > 2852)) then
					else
						TABLE_TableIndirection["FlatIdent_6DFD9%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_6DFD9%0"] ~= 0) then
							else
								if (((100 <= 3123) and not ScreenGui) or (3404 > 4503) or (1136 > 4317)) then
									return;
								end
								for _, obj in pairs(ScreenGui:GetDescendants()) do
									if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\194\12\92\172\29\7\42\93\241", "\62\133\121\53\227\127\109\79")) or (1369 > 4987)) then
										TABLE_TableIndirection["FlatIdent_2F8E7%0"] = 0;
										TABLE_TableIndirection["FlatIdent_6D884%0"] = nil;
										TABLE_TableIndirection["FlatIdent_5202D%0"] = nil;
										TABLE_TableIndirection["fullName%0"] = nil;
										TABLE_TableIndirection["name%0"] = nil;
										while true do
											if (TABLE_TableIndirection["FlatIdent_2F8E7%0"] == 1) then
												TABLE_TableIndirection["fullName%0"] = nil;
												TABLE_TableIndirection["name%0"] = nil;
												TABLE_TableIndirection["FlatIdent_2F8E7%0"] = 2;
											end
											if (TABLE_TableIndirection["FlatIdent_2F8E7%0"] == 2) then
												while true do
													if (0 ~= TABLE_TableIndirection["FlatIdent_6D884%0"]) then
													else
														TABLE_TableIndirection["FlatIdent_90507%0"] = 0;
														while true do
															if (TABLE_TableIndirection["FlatIdent_90507%0"] == 0) then
																TABLE_TableIndirection["FlatIdent_5202D%0"] = 0;
																TABLE_TableIndirection["fullName%0"] = nil;
																TABLE_TableIndirection["FlatIdent_90507%0"] = 1;
															end
															if (TABLE_TableIndirection["FlatIdent_90507%0"] == 1) then
																TABLE_TableIndirection["FlatIdent_6D884%0"] = 1;
																break;
															end
														end
													end
													if (TABLE_TableIndirection["FlatIdent_6D884%0"] == 1) then
														TABLE_TableIndirection["name%0"] = nil;
														while true do
															if ((4748 == 4748) and (1 == TABLE_TableIndirection["FlatIdent_5202D%0"])) then
																if ((3736 <= 4740) and (not GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\105\234\245\217\65\234\229\200\83", "\173\32\132\134")][TABLE_TableIndirection["name%0"]] or (3506 <= 1309))) then
																	GuiLib[LUAOBFUSACTOR_DECRYPT_STR_0("\103\21\27\251\175\63\206\75\8", "\173\46\123\104\143\206\81")][TABLE_TableIndirection["name%0"]] = TABLE_TableIndirection["fullName%0"];
																end
																break;
															end
															if ((0 ~= TABLE_TableIndirection["FlatIdent_5202D%0"]) or (3390 <= 3060)) then
															else
																TABLE_TableIndirection["fullName%0"] = obj:GetFullName();
																TABLE_TableIndirection["name%0"] = obj[LUAOBFUSACTOR_DECRYPT_STR_0("\154\28\47\143", "\97\212\125\66\234\37\227")];
																TABLE_TableIndirection["FlatIdent_5202D%0"] = 1;
															end
														end
														break;
													end
												end
												break;
											end
											if (TABLE_TableIndirection["FlatIdent_2F8E7%0"] == 0) then
												TABLE_TableIndirection["FlatIdent_6D884%0"] = 0;
												TABLE_TableIndirection["FlatIdent_5202D%0"] = nil;
												TABLE_TableIndirection["FlatIdent_2F8E7%0"] = 1;
											end
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	end
end
task.spawn(insUpd);
return GuiLib;
