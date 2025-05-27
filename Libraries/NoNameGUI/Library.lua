local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v30, v31)
	local v32 = {};
	for v335 = 1, #v30 do
		v6(v32, v0(v4(v1(v2(v30, v335, v335 + 1)), v1(v2(v31, 1 + (v335 % #v31), 1 + (v335 % #v31) + 1))) % 256));
	end
	return v5(v32);
end
local v8 = {};
local v9 = game:GetService(v7("\242\204\201\32\193\174\206", "\126\177\163\187\69\134\219\167"));
v8 = {};
v8.Instances = {};
v8.Themes = {[v7("\51\216\56\213\240\38", "\156\67\173\74\165")]={[v7("\22\182\74\29\187\52\73\33\185\77", "\38\84\215\41\118\220\70")]=Color3.fromRGB(9 + 16, 25, 25),[v7("\113\21\33\23\240\68", "\158\48\118\66\114")]=Color3.fromRGB(1899 - (580 + 1239), 0 - 0, 150),[v7("\159\33\8\34", "\155\203\68\112\86\19\197")]=Color3.fromRGB(255, 255, 255),[v7("\100\200\34\232\79\118", "\152\38\189\86\156\32\24\133")]=Color3.fromRGB(48 + 2, 2 + 48, 44 + 56),[v7("\212\82\166\66", "\38\156\55\199")]=Color3.fromRGB(104 - 64, 0 + 0, 1247 - (645 + 522)),[v7("\138\114\110\44\22\102", "\35\200\29\28\72\115\20\154")]=Color3.fromRGB(80, 1790 - (1010 + 780), 150)},[v7("\11\186\213", "\84\121\223\177\191\237\76")]={[v7("\153\87\202\171\61\66\63\212\181\82", "\161\219\54\169\192\90\48\80")]=Color3.fromRGB(30, 0, 0 + 0),[v7("\104\65\3\32\71\86", "\69\41\34\96")]=Color3.fromRGB(150, 0 - 0, 0 - 0),[v7("\136\198\207\30", "\75\220\163\183\106\98")]=Color3.fromRGB(255, 240, 240),[v7("\32\175\159\35\214\12", "\185\98\218\235\87")]=Color3.fromRGB(80, 20, 1856 - (1045 + 791)),[v7("\227\57\38\226", "\202\171\92\71\134\190")]=Color3.fromRGB(151 - 91, 0 - 0, 505 - (351 + 154)),[v7("\11\206\62\140\44\211", "\232\73\161\76")]=Color3.fromRGB(1724 - (1281 + 293), 0, 0)},[v7("\185\213\87\88", "\126\219\185\34\61")]={[v7("\46\207\93\121\121\101\252\242\2\202", "\135\108\174\62\18\30\23\147")]=Color3.fromRGB(286 - (28 + 238), 20, 89 - 49),[v7("\151\234\41\206\22\186", "\167\214\137\74\171\120\206\83")]=Color3.fromRGB(0, 1679 - (1381 + 178), 255),[v7("\191\245\42\73", "\199\235\144\82\61\152")]=Color3.fromRGB(207 + 13, 235, 206 + 49),[v7("\37\3\173\63\8\24", "\75\103\118\217")]=Color3.fromRGB(13 + 17, 206 - 146, 120),[v7("\239\81\113\16", "\126\167\52\16\116\217")]=Color3.fromRGB(0 + 0, 530 - (381 + 89), 107 + 13),[v7("\234\33\50\132\177\11", "\156\168\78\64\224\212\121")]=Color3.fromRGB(0 + 0, 205 - 85, 1411 - (1074 + 82))},[v7("\0\252\160\203\9", "\174\103\142\197")]={[v7("\116\41\92\51\34\76\247\67\38\91", "\152\54\72\63\88\69\62")]=Color3.fromRGB(43 - 23, 40, 20),[v7("\245\199\237\89\218\208", "\60\180\164\142")]=Color3.fromRGB(0, 1934 - (214 + 1570), 1535 - (990 + 465)),[v7("\108\91\29\61", "\114\56\62\101\73\71\141")]=Color3.fromRGB(93 + 132, 111 + 144, 219 + 6),[v7("\154\252\207\208\183\231", "\164\216\137\187")]=Color3.fromRGB(118 - 88, 80, 1776 - (1668 + 58)),[v7("\250\227\48\182", "\107\178\134\81\210\198\158")]=Color3.fromRGB(626 - (512 + 114), 208 - 128, 82 - 42),[v7("\26\1\144\194\175\42", "\202\88\110\226\166")]=Color3.fromRGB(0 - 0, 150, 80)},[v7("\204\29\131\249\205\198", "\170\163\111\226\151")]={[v7("\51\49\177\51\73\37\38\4\62\182", "\73\113\80\210\88\46\87")]=Color3.fromRGB(17 + 18, 25, 0),[v7("\160\47\206\23\233\149", "\135\225\76\173\114")]=Color3.fromRGB(200, 100, 0 + 0),[v7("\46\232\160\164", "\199\122\141\216\208\204\221")]=Color3.fromRGB(255, 245, 196 + 29),[v7("\143\200\4\228\119\248", "\150\205\189\112\144\24")]=Color3.fromRGB(303 - 213, 2054 - (109 + 1885), 1479 - (1269 + 200)),[v7("\13\129\190\72", "\112\69\228\223\44\100\232\113")]=Color3.fromRGB(249 - 119, 885 - (98 + 717), 0),[v7("\246\16\21\215\179\110", "\230\180\127\103\179\214\28")]=Color3.fromRGB(200, 100, 826 - (802 + 24))},[v7("\156\12\81\77", "\128\236\101\63\38\132\33")]={[v7("\142\168\18\79\177\249\192\185\167\21", "\175\204\201\113\36\214\139")]=Color3.fromRGB(68 - 28, 25 - 5, 5 + 25),[v7("\102\207\54\217\10\83", "\100\39\172\85\188")]=Color3.fromRGB(196 + 59, 9 + 41, 33 + 117),[v7("\153\125\161\148", "\83\205\24\217\224")]=Color3.fromRGB(709 - 454, 783 - 548, 88 + 157),[v7("\196\208\217\41\233\203", "\93\134\165\173")]=Color3.fromRGB(41 + 59, 33 + 7, 59 + 21),[v7("\150\247\192\198", "\30\222\146\161\162\90\174\210")]=Color3.fromRGB(71 + 79, 30, 1523 - (797 + 636)),[v7("\199\65\98\14\224\92", "\106\133\46\16")]=Color3.fromRGB(1238 - 983, 50, 1769 - (1427 + 192))},[v7("\95\50\114\229", "\32\56\64\19\156\58")]={[v7("\120\201\230\93\93\224\143\79\198\225", "\224\58\168\133\54\58\146")]=Color3.fromRGB(40, 14 + 26, 92 - 52),[v7("\120\85\72\248\123\146", "\107\57\54\43\157\21\230\231")]=Color3.fromRGB(100, 100, 90 + 10),[v7("\239\142\9\225", "\175\187\235\113\149\217\188")]=Color3.fromRGB(230, 105 + 125, 556 - (192 + 134)),[v7("\30\186\149\88\236\119", "\24\92\207\225\44\131\25")]=Color3.fromRGB(1346 - (316 + 960), 70, 39 + 31),[v7("\99\214\185\72", "\29\43\179\216\44\123")]=Color3.fromRGB(90, 70 + 20, 90),[v7("\159\214\50\72\184\203", "\44\221\185\64")]=Color3.fromRGB(100, 93 + 7, 382 - 282)},[v7("\22\239\65\75\118", "\19\97\135\40\63")]={[v7("\140\93\48\48\40\35\161\73\61\63", "\81\206\60\83\91\79")]=Color3.fromRGB(796 - (83 + 468), 245, 2051 - (1202 + 604)),[v7("\111\168\211\119\33\215", "\196\46\203\176\18\79\163\45")]=Color3.fromRGB(80, 80, 80),[v7("\140\39\102\10", "\143\216\66\30\126\68\155")]=Color3.fromRGB(20, 20, 20),[v7("\136\221\25\223\202\173", "\129\202\168\109\171\165\195\183")]=Color3.fromRGB(220, 220, 1027 - 807),[v7("\10\93\54\220", "\134\66\56\87\184\190\116")]=Color3.fromRGB(332 - 132, 200, 200),[v7("\30\62\27\191\28\249", "\85\92\81\105\219\121\139\65")]=Color3.fromRGB(442 - 282, 160, 485 - (45 + 280))},[v7("\255\191\81\70\119", "\191\157\211\48\37\28")]={[v7("\253\30\247\23\61\205\16\225\18\62", "\90\191\127\148\124")]=Color3.fromRGB(10, 10, 10),[v7("\89\132\45\18\118\147", "\119\24\231\78")]=Color3.fromRGB(30, 30, 29 + 1),[v7("\182\40\189\94", "\113\226\77\197\42\188\32")]=Color3.fromRGB(223 + 32, 94 + 161, 142 + 113),[v7("\24\3\224\161\53\24", "\213\90\118\148")]=Color3.fromRGB(4 + 16, 37 - 17, 20),[v7("\115\43\181\82", "\45\59\78\212\54")]=Color3.fromRGB(15, 15, 1926 - (340 + 1571)),[v7("\50\89\145\143\131\60", "\144\112\54\227\235\230\78\205")]=Color3.fromRGB(20 + 30, 1822 - (1733 + 39), 137 - 87)}};
local v12 = v8.Themes.black;
v8.Theme = v12;
local v14;
local v15;
local v16;
v8.createGui = function(v33)
	local v34 = Instance.new(v7("\128\43\29\249\213\85\148\61\6", "\59\211\72\111\156\176"));
	local v35 = Instance.new(v7("\104\149\226\32\75", "\77\46\231\131"));
	local v36 = Instance.new(v7("\156\70\183\77\191", "\32\218\52\214"));
	local v37 = Instance.new(v7("\104\5\48\165\244", "\58\46\119\81\200\145\208\37"));
	local v38 = Instance.new(v7("\13\158\49\161\172", "\86\75\236\80\204\201\221"));
	local v39 = Instance.new(v7("\84\83\118\136\251", "\235\18\33\23\229\158"));
	local v40 = Instance.new(v7("\101\147\237\178\67\174\237\186\73\181\212\175", "\219\48\218\161"));
	local v41 = Instance.new(v7("\208\116\100\93\247\78\226\225\125", "\128\132\17\28\41\187\47"));
	local v42 = Instance.new(v7("\39\32\7\55\88", "\61\97\82\102\90"));
	local v43 = Instance.new(v7("\152\43\179\95\235\86\28\12\160", "\105\204\78\203\43\167\55\126"));
	local v44 = Instance.new(v7("\145\175\59\10\49\17\211\69\170\164", "\49\197\202\67\126\115\100\167"));
	local v45 = Instance.new(v7("\3\94\199\61\162\67\74\35\84\209", "\62\87\59\191\73\224\54"));
	local v46 = Instance.new(v7("\193\16\251\196\226", "\169\135\98\154"));
	v16 = v34;
	v34.Name = (v33 .. v7("\236\98\45", "\168\171\23\68\52\157\83")) or v7("\218\126\251\172\40\40\160\225\120\202\129\44\47\149\245\99\236", "\231\148\17\149\205\69\77");
	v34.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	v34.Parent = game.Players.LocalPlayer:WaitForChild(v7("\176\171\198\226\82\237\167\178\206", "\159\224\199\167\155\55"));
	v46.Parent = v34;
	v46.BackgroundColor3 = Color3.fromRGB(1289 - (125 + 909), 255, 2203 - (1096 + 852));
	v46.BackgroundTransparency = 1;
	v46.BorderColor3 = Color3.fromRGB(0 + 0, 0, 0 - 0);
	v46.BorderSizePixel = 1 + 0;
	v46.Position = UDim2.new(512.299 - (409 + 103), 236 - (46 + 190), 95.299 - (51 + 44), 1 + 0);
	v46.Size = UDim2.new(1317.4 - (1114 + 203), 726 - (228 + 498), 0.401 + 0, 0 + 0);
	v46.Active = true;
	v46.Selectable = true;
	v35.Name = v7("\218\242\53\220", "\178\151\147\92");
	v35.Parent = v46;
	v35.BackgroundColor3 = v8.Theme.Background;
	v35.BackgroundTransparency = 664 - (174 + 489);
	v35.BorderColor3 = Color3.fromRGB(0, 0 - 0, 1905 - (830 + 1075));
	v35.BorderSizePixel = 1;
	v35.Position = UDim2.new(524 - (303 + 221), 1269 - (231 + 1038), 0.105 + 0, 0);
	v35.Size = UDim2.new(1, 1162 - (171 + 991), 0.9 - 0, 0);
	v35.ClipsDescendants = true;
	v36.Name = v7("\161\219\67\62\22\73\104", "\26\236\157\44\82\114\44");
	v36.Parent = v35;
	v36.BackgroundColor3 = v8.Theme.Background;
	v36.BorderSizePixel = 2 - 1;
	v36.ClipsDescendants = true;
	v36.Size = UDim2.new(2 - 1, 0 + 0, 3 - 2, 0 - 0);
	v38.Name = "T";
	v38.Parent = v36;
	v38.BackgroundColor3 = v8.Theme.Background;
	v38.BorderSizePixel = 1 - 0;
	v38.Position = UDim2.new(0, 0 - 0, 6.028758e-8, 1248 - (111 + 1137));
	v38.Size = UDim2.new(0.100000001, 158 - (91 + 67), 0.999999881, 0);
	v39.Name = v7("\30\8\218\87\46\43\199", "\59\74\78\181");
	v39.Parent = v38;
	v39.BorderSizePixel = 2 - 1;
	v39.BackgroundTransparency = 0.95;
	v39.Position = UDim2.new(0 + 0, 523 - (423 + 100), 0.1 + 0, 0);
	v39.Size = UDim2.new(2 - 1, 0, 0.9 + 0, 771 - (326 + 445));
	v14 = v39;
	v40.Parent = v39;
	v40.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	v40.SortOrder = Enum.SortOrder.LayoutOrder;
	v40.Padding = UDim.new(0.01, 0);
	v41.Parent = v38;
	v41.BorderSizePixel = 4 - 3;
	v41.Size = UDim2.new(2 - 1, 0, 0.1 - 0, 711 - (530 + 181));
	v41.Font = Enum.Font.SourceSansBold;
	v41.BackgroundTransparency = 881.9 - (614 + 267);
	v41.Text = v7("\17\208\88\73", "\211\69\177\58\58");
	v41.TextColor3 = v8.Theme.Text;
	v41.TextScaled = true;
	v42.Name = v7("\159\224\120\241", "\171\215\133\25\149\137");
	v42.Parent = v46;
	v42.BackgroundColor3 = v8.Theme.Head;
	v42.BorderSizePixel = 1;
	v42.Position = UDim2.new(32 - (19 + 13), 0 - 0, 0 - 0, 0 - 0);
	v42.Size = UDim2.new(1, 0 + 0, 0.1, 0 - 0);
	v43.Name = v33 .. v7("\213\193\38\246\234", "\34\129\168\82\154\143\80\156");
	v43.Parent = v42;
	v43.BorderSizePixel = 1 - 0;
	v43.Position = UDim2.new(0.24, 1812 - (1293 + 519), 0 - 0, 0 - 0);
	v43.BackgroundTransparency = 1 - 0;
	v43.Size = UDim2.new(0.51, 0 - 0, 1, 0);
	v43.Font = Enum.Font.SourceSansBold;
	v43.Text = v33 or v7("\162\167\63\2\67\105\156\140\255\31\2\74\92\136\151\171", "\233\229\210\83\107\40\46");
	v43.TextColor3 = v8.Theme.Text;
	v43.TextScaled = true;
	v44.Name = v7("\233\75\54\211\39\213\76", "\101\161\34\82\182");
	v44.Parent = v42;
	v44.BackgroundColor3 = v8.Theme.Button;
	v44.BorderSizePixel = 2 - 1;
	v44.Position = UDim2.new(0.76 + 0, 0, 0.2 + 0, 0);
	v44.Size = UDim2.new(0.09 - 0, 0, 0.6 + 0, 0);
	v44.Font = Enum.Font.SourceSansBold;
	v44.Text = v7("\197\4\87\247\214\235\152\43", "\78\136\109\57\158\187\130\226");
	v44.TextColor3 = v8.Theme.Text;
	v44.TextScaled = true;
	v45.Name = v7("\29\51\246\226\59\29\237\255", "\145\94\95\153");
	v45.Parent = v42;
	v45.BackgroundColor3 = v8.Theme.Button;
	v45.BorderSizePixel = 1 + 0;
	v45.Position = UDim2.new(0.875 + 0, 1096 - (709 + 387), 1858.2 - (673 + 1185), 0 - 0);
	v45.Size = UDim2.new(0.09, 0 - 0, 0.6, 0 - 0);
	v45.Font = Enum.Font.SourceSansBold;
	v45.Text = v7("\222\193\27\198\75", "\215\157\173\116\181\46");
	v45.TextColor3 = v8.Theme.Text;
	v45.TextScaled = true;
	v37.Name = v7("\5\181\140\247\201\19\187\135\246\223\39", "\186\85\212\235\146");
	v37.Parent = v36;
	v37.BackgroundColor3 = v8.Theme.Background;
	v37.BackgroundTransparency = 1;
	v37.BorderSizePixel = 1;
	v37.Position = UDim2.new(0.100000016 + 0, 0, 6.028758e-8 + 0, 0);
	v37.Size = UDim2.new(0.899999857, 0 - 0, 0.999999881 + 0, 0);
	v15 = v37;
	local v149 = v36.Position;
	local v150 = UDim2.new(0, 0, -(1 - 0), 0);
	local v151 = true;
	v44.MouseButton1Click:Connect(function()
		if v151 then
			local v353 = 0;
			while true do
				if (v353 == (0 - 0)) then
					v36:TweenPosition(v150, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 1880.3 - (446 + 1434), true);
					v151 = false;
					v353 = 1284 - (1040 + 243);
				end
				if (v353 == (2 - 1)) then
					v44.Text = v7("\239\128\14\247\52\231\66\199", "\56\162\225\118\158\89\142");
					break;
				end
			end
		else
			local v354 = 1847 - (559 + 1288);
			local v355;
			while true do
				if (v354 == 0) then
					v355 = 1931 - (609 + 1322);
					while true do
						if (v355 == (455 - (13 + 441))) then
							v44.Text = v7("\113\12\206\166\47\209\70\0", "\184\60\101\160\207\66");
							break;
						end
						if (v355 == 0) then
							v36:TweenPosition(v149, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3 - 0, true);
							v151 = true;
							v355 = 2 - 1;
						end
					end
					break;
				end
			end
		end
	end);
	local v152 = game:GetService(v7("\5\149\121\185\63\177\121\174\39\139\127\185", "\220\81\226\28"));
	v45.MouseButton1Click:Connect(function()
		local v336 = 0;
		while true do
			if ((0 - 0) == v336) then
				for v433, v434 in pairs(v34:GetDescendants()) do
					local v435 = TweenInfo.new(0.3 + 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
					if v434:IsA(v7("\53\199\131\246\239", "\167\115\181\226\155\138")) then
						local v460 = v152:Create(v434, v435, {[v7("\192\35\228\87\124\99\201\247\44\227\104\105\112\200\241\50\230\78\126\127\197\251", "\166\130\66\135\60\27\17")]=(3 - 2)});
						v460:Play();
					end
					if v434:IsA(v7("\112\79\214\97\18\81\94\218\122\62", "\80\36\42\174\21")) then
						local v461 = 0;
						local v462;
						while true do
							if (v461 == 0) then
								v462 = v152:Create(v434, v435, {[v7("\108\17\52\113\73\2\56\111\64\20\3\104\79\30\36\106\79\2\50\116\77\9", "\26\46\112\87")]=(1 + 0),[v7("\141\38\179\96\139\173\68\186\170\51\170\102\186\177\70\173", "\212\217\67\203\20\223\223\37")]=1});
								v462:Play();
								break;
							end
						end
					end
					if v434:IsA(v7("\142\136\176\198\150\140\170\215\182", "\178\218\237\200")) then
						local v463 = v152:Create(v434, v435, {[v7("\130\176\254\196\130\167\231\222\165\165\231\194\179\187\229\201", "\176\214\213\134")]=1});
						v463:Play();
					end
				end
				wait(1 + 0);
				v336 = 2 - 1;
			end
			if (1 == v336) then
				v34:Destroy();
				break;
			end
		end
	end);
	local v153 = false;
	local v154, v155, v156;
	local v157 = game:GetService(v7("\193\190\179\198\129\88\73\225\185\133\209\186\64\80\247\168", "\57\148\205\214\180\200\54"));
	v42.InputBegan:Connect(function(v337)
		if (v337.UserInputType == Enum.UserInputType.MouseButton1) then
			v153 = true;
			v155 = v337.Position;
			v156 = v46.Position;
			v337.Changed:Connect(function()
				if (v337.UserInputState == Enum.UserInputState.End) then
					v153 = false;
				end
			end);
		end
	end);
	v42.InputChanged:Connect(function(v338)
		if (v338.UserInputType == Enum.UserInputType.MouseMovement) then
			v154 = v338;
		end
	end);
	v157.InputChanged:Connect(function(v339)
		if ((v339 == v154) and v153) then
			local v358 = v339.Position - v155;
			v46.Position = UDim2.new(v156.X.Scale, v156.X.Offset + v358.X, v156.Y.Scale, v156.Y.Offset + v358.Y);
		end
	end);
end;
local v18 = {[v7("\62\244\38\32\66\19\255", "\22\114\157\85\84")]=function(v158)
	local v159 = Instance.new(v7("\226\217\18\201\88", "\200\164\171\115\164\61\150"));
	v159.Name = v158 .. v7("\138\245\1", "\227\222\148\99\37");
	v159.Parent = v14;
	v159.BackgroundColor3 = v8.Theme.Background;
	v159.BackgroundTransparency = 0.2 + 0;
	v159.BorderColor3 = v8.Theme.Border;
	v159.BorderSizePixel = 1;
	v159.Size = UDim2.new(0.95 - 0, 0, 0.1 + 0, 0 + 0);
	local v169 = Instance.new(v7("\7\87\74\226\219\38\70\70\249\247", "\153\83\50\50\150"));
	v169.Name = v158 .. v7("\105\119\113\62\103\165", "\45\61\22\19\124\19\203");
	v169.Parent = v159;
	v169.Size = UDim2.new(1, 0 + 0, 1, 0 + 0);
	v169.BackgroundColor3 = v8.Theme.Background;
	v169.BackgroundTransparency = 0.2 + 0;
	v169.Text = v158;
	v169.TextColor3 = v8.Theme.Text;
	v169.Font = Enum.Font.SourceSansBold;
	v169.TextScaled = true;
	v169.TextWrapped = true;
	local v182 = Instance.new(v7("\231\0\12\248\7", "\217\161\114\109\149\98\16"));
	v182.Name = v158 .. v7("\49\47\54\104\185\122\6", "\20\114\64\88\28\220");
	v182.Parent = v15;
	v182.BackgroundColor3 = v8.Theme.Background;
	v182.BackgroundTransparency = 433 - (153 + 280);
	v182.BorderColor3 = v8.Theme.Border;
	v182.BorderSizePixel = 2 - 1;
	v182.Size = UDim2.new(1 + 0, 0 + 0, 1, 0);
	v182.Visible = false;
	local v191 = Instance.new(v7("\2\2\192\187\244\220\180\63\6\244\166\249\221\184", "\221\81\97\178\212\152\176"));
	v191.Name = v7("\254\228\15\244\22\193\238\19\252\60\223\230\16\254", "\122\173\135\125\155");
	v191.Parent = v182;
	v191.Active = true;
	v191.BackgroundColor3 = v8.Theme.Background;
	v191.BackgroundTransparency = 1 + 0;
	v191.BorderSizePixel = 1 + 0;
	v191.Size = UDim2.new(1 + 0, 0 - 0, 1 + 0, 667 - (89 + 578));
	v191.ScrollBarThickness = 5 + 1;
	v191.ScrollBarImageColor3 = v8.Theme.Accent;
	local v202 = Instance.new(v7("\176\196\24\173\19\48\202\129\205", "\168\228\161\96\217\95\81"));
	v202.Name = v158;
	v202.Parent = v191;
	v202.BackgroundColor3 = v8.Theme.Head;
	v202.BackgroundTransparency = 1 - 0;
	v202.BorderColor3 = v8.Theme.Border;
	v202.BorderSizePixel = 1050 - (572 + 477);
	v202.Size = UDim2.new(0.95 + 0, 0 + 0, 0.1 + 0, 86 - (84 + 2));
	v202.Font = Enum.Font.SourceSansBold;
	v202.TextColor3 = v8.Theme.Text;
	v202.TextScaled = true;
	v202.TextSize = 14;
	v202.TextWrapped = true;
	v202.Text = v158;
	local v217 = Instance.new(v7("\238\248\2\85\60\67\247\208\55\83\58\67", "\55\187\177\78\60\79"));
	v217.Parent = v191;
	v217.SortOrder = Enum.SortOrder.LayoutOrder;
	v217.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	v217.Padding = UDim.new(0.02, 0);
	v169.MouseButton1Click:Connect(function()
		local v340 = 0 - 0;
		while true do
			if (v340 == 0) then
				for v436, v437 in ipairs(v15:GetChildren()) do
					if v437:IsA(v7("\11\220\94\230\67", "\224\77\174\63\139\38\175")) then
						v437.Visible = false;
					end
				end
				v182.Visible = true;
				break;
			end
		end
	end);
	return v159;
end,[v7("\176\64\90\34\129\117\89\44", "\78\228\33\56")]=function(v224)
	local v225 = 0 + 0;
	local v226;
	local v227;
	local v228;
	local v229;
	local v230;
	while true do
		if ((850 - (497 + 345)) == v225) then
			v229.BackgroundColor3 = v8.Theme.Background;
			v229.BackgroundTransparency = 1;
			v229.BorderSizePixel = 1 + 0;
			v229.Size = UDim2.new(1 + 0, 1333 - (605 + 728), 1 + 0, 0 - 0);
			v225 = 1 + 8;
		end
		if ((7 - 5) == v225) then
			v227 = Instance.new(v7("\199\116\238\24\50\95\231\101\249\2", "\42\147\17\150\108\112"));
			v227.Name = v224 .. v7("\59\167\47\93\243\230", "\136\111\198\77\31\135");
			v227.Parent = v226;
			v227.Size = UDim2.new(1, 0, 1 + 0, 0 - 0);
			v225 = 3;
		end
		if (v225 == (4 + 1)) then
			v228.Name = v224 .. v7("\154\3\141\53\7\59\184", "\204\217\108\227\65\98\85");
			v228.Parent = v15;
			v228.BackgroundColor3 = v8.Theme.Background;
			v228.BackgroundTransparency = 489 - (457 + 32);
			v225 = 6;
		end
		if (v225 == 11) then
			return v226;
		end
		if (v225 == (5 + 5)) then
			v230.SortOrder = Enum.SortOrder.LayoutOrder;
			v230.CellPadding = UDim2.new(0.0199999996, 1402 - (832 + 570), 0.0199999996 + 0, 0 + 0);
			v230.CellSize = UDim2.new(0.140000003 - 0, 0, 0.200000003 + 0, 796 - (588 + 208));
			v227.MouseButton1Click:Connect(function()
				local v423 = 0 - 0;
				local v424;
				while true do
					if (v423 == (1800 - (884 + 916))) then
						v424 = 0;
						while true do
							if (v424 == (0 - 0)) then
								for v475, v476 in ipairs(v15:GetChildren()) do
									if v476:IsA(v7("\30\20\12\224\61", "\141\88\102\109")) then
										v476.Visible = false;
									end
								end
								v228.Visible = true;
								break;
							end
						end
						break;
					end
				end
			end);
			v225 = 7 + 4;
		end
		if ((653 - (232 + 421)) == v225) then
			v226 = Instance.new(v7("\232\108\179\14\128", "\229\174\30\210\99"));
			v226.Name = v224 .. v7("\47\236\132", "\89\123\141\230\49\141\93");
			v226.Parent = v14;
			v226.BackgroundColor3 = v8.Theme.Background;
			v225 = 1890 - (1569 + 320);
		end
		if (v225 == 9) then
			v229.ScrollBarThickness = 6;
			v229.ScrollBarImageColor3 = v8.Theme.Accent;
			v230 = Instance.new(v7("\1\15\39\210\252\48\10\1\217\250\33\50", "\149\84\70\96\160"));
			v230.Parent = v229;
			v225 = 3 + 7;
		end
		if (v225 == (1 + 3)) then
			v227.Font = Enum.Font.SourceSansBold;
			v227.TextScaled = true;
			v227.TextWrapped = true;
			v228 = Instance.new(v7("\36\27\166\91\184", "\201\98\105\199\54\221\132\119"));
			v225 = 16 - 11;
		end
		if (v225 == 1) then
			v226.BackgroundTransparency = 0.2;
			v226.BorderColor3 = v8.Theme.Border;
			v226.BorderSizePixel = 606 - (316 + 289);
			v226.Size = UDim2.new(0.95 - 0, 0, 0.1, 0);
			v225 = 1 + 1;
		end
		if (v225 == (1456 - (666 + 787))) then
			v227.BackgroundColor3 = v8.Theme.Background;
			v227.BackgroundTransparency = 0.2;
			v227.Text = v224;
			v227.TextColor3 = v8.Theme.Text;
			v225 = 429 - (360 + 65);
		end
		if (v225 == (7 + 0)) then
			v229 = Instance.new(v7("\109\192\231\234\32\204\87\205\242\195\62\193\83\198", "\160\62\163\149\133\76"));
			v229.Name = v7("\229\163\31\32\207\218\169\3\40\229\196\161\0\42", "\163\182\192\109\79");
			v229.Parent = v228;
			v229.Active = true;
			v225 = 8;
		end
		if (v225 == (260 - (79 + 175))) then
			v228.BorderColor3 = v8.Theme.Border;
			v228.BorderSizePixel = 1 - 0;
			v228.Size = UDim2.new(1 + 0, 0 - 0, 1, 0 - 0);
			v228.Visible = false;
			v225 = 7;
		end
	end
end};
local v19 = nil;
local v20 = nil;
v8.createListTab = function(v231)
	local v232 = 899 - (503 + 396);
	local v233;
	local v234;
	while true do
		if (0 == v232) then
			v233 = v18.ListTab(v231);
			v234 = v15:FindFirstChild(v231 .. v7("\144\92\196\100\31\51\65", "\161\211\51\170\16\122\93\53"));
			v232 = 1;
		end
		if (v232 == 1) then
			if not v19 then
				local v438 = 0;
				while true do
					if (v438 == 0) then
						v19 = v233;
						v20 = v234;
						v438 = 182 - (92 + 89);
					end
					if (1 == v438) then
						v234.Visible = true;
						break;
					end
				end
			else
				v234.Visible = false;
			end
			break;
		end
	end
end;
v8.createTableTab = function(v235)
	local v236 = 0 - 0;
	local v237;
	local v238;
	while true do
		if (v236 == (1 + 0)) then
			if not v19 then
				v19 = v237;
				v20 = v238;
				v238.Visible = true;
			else
				v238.Visible = false;
			end
			break;
		end
		if ((0 + 0) == v236) then
			v237 = v18.TableTab(v235);
			v238 = v15:FindFirstChild(v235 .. v7("\216\161\188\60\254\160\166", "\72\155\206\210"));
			v236 = 3 - 2;
		end
	end
end;
local function v23(v239)
	local v240 = 0 + 0;
	local v241;
	while true do
		if (1 == v240) then
			local v408 = 0;
			while true do
				if (v408 == 0) then
					if not v241 then
						local v471 = 0;
						while true do
							if ((0 - 0) == v471) then
								warn(v7("\199\238\90\150\43\89\231\175\94\217\48\88\247\181\24", "\54\147\143\56\182\69") .. v239);
								return;
							end
						end
					end
					return v241;
				end
			end
		end
		if (v240 == (0 + 0)) then
			v241 = nil;
			for v425, v426 in pairs(v15:GetChildren()) do
				if (v426.Name == (v239 .. v7("\101\117\90\26\54\72\110", "\83\38\26\52\110"))) then
					v241 = v426:FindFirstChild(v7("\107\20\53\73\84\27\46\72\95\49\53\71\85\18", "\38\56\119\71"));
					break;
				end
			end
			v240 = 1;
		end
	end
end
v8.createClickBtn = function(v242, v243, v244)
	local v245 = v23(v243);
	if not v245 then
		return;
	end
	local v246 = Instance.new(v7("\226\132\231\93\253\195\149\235\70\209", "\191\182\225\159\41"));
	v246.Parent = v245;
	v246.BackgroundColor3 = v8.Theme.Accent;
	v246.BorderColor3 = v8.Theme.Border;
	v246.BorderSizePixel = 1 + 0;
	v246.Size = UDim2.new(0.9 - 0, 0, 0.05, 0);
	v246.Font = Enum.Font.SourceSans;
	v246.TextColor3 = v8.Theme.Text;
	v246.TextScaled = true;
	v246.TextWrapped = true;
	v246.Text = v242;
	if (v244 and (typeof(v244) == v7("\45\7\38\86\159\142\205\37", "\162\75\114\72\53\235\231"))) then
		v246.MouseButton1Click:Connect(v244);
	end
end;
v8.CreateLabel = function(v261, v262)
	local v263 = 0 + 0;
	local v264;
	local v265;
	local v266;
	while true do
		if ((1 - 0) == v263) then
			v266 = nil;
			while true do
				if ((1246 - (485 + 759)) == v264) then
					v266.Size = UDim2.new(2 - 1, 1189 - (442 + 747), 0, 25);
					v266.BackgroundTransparency = 1136 - (832 + 303);
					v264 = 3;
				end
				if ((950 - (88 + 858)) == v264) then
					v266.Font = Enum.Font.SourceSansBold;
					v266.TextScaled = true;
					break;
				end
				if (v264 == 0) then
					local v450 = 0 + 0;
					while true do
						if (v450 == (1 + 0)) then
							v264 = 1;
							break;
						end
						if ((0 + 0) == v450) then
							v265 = v23(v262);
							if not v265 then
								return;
							end
							v450 = 1;
						end
					end
				end
				if (v264 == (792 - (766 + 23))) then
					v266.Text = v261;
					v266.TextColor3 = v8.Theme.Text;
					v264 = 4;
				end
				if (v264 == 1) then
					v266 = Instance.new(v7("\184\57\92\246\127\3\142\57\72", "\98\236\92\36\130\51"));
					v266.Parent = v265;
					v264 = 9 - 7;
				end
			end
			break;
		end
		if ((0 - 0) == v263) then
			v264 = 0 - 0;
			v265 = nil;
			v263 = 3 - 2;
		end
	end
end;
v8.createToggle = function(v267, v268, v269, v270)
	local v271 = v23(v268);
	if not v271 then
		return;
	end
	local v272 = v269;
	local v273 = Instance.new(v7("\144\28\20\174\103\189\161\36\171\23", "\80\196\121\108\218\37\200\213"));
	v273.Parent = v271;
	v273.BackgroundColor3 = v8.Theme.Accent;
	v273.BorderColor3 = v8.Theme.Border;
	v273.BorderSizePixel = 1;
	v273.Size = UDim2.new(1073.9 - (1036 + 37), 0 + 0, 0.05, 0 - 0);
	v273.Font = Enum.Font.SourceSans;
	v273.TextColor3 = v8.Theme.Text;
	v273.TextScaled = true;
	v273.TextWrapped = true;
	v273.Text = v267 .. v7("\90\51", "\234\96\19\98\31\43\110") .. ((v272 and v7("\41\49", "\235\102\127\50\167\204\18")) or v7("\127\135\211", "\78\48\193\149\67\36"));
	v273.MouseButton1Click:Connect(function()
		v272 = not v272;
		v273.Text = v267 .. v7("\106\94", "\33\80\126\224\120") .. ((v272 and v7("\195\134", "\60\140\200\99\164")) or v7("\168\210\34", "\194\231\148\100\70"));
		pcall(v270, v272);
	end);
end;
v8.createTextbox = function(v288, v289, v290, v291, v292)
	local v293 = 0;
	local v294;
	local v295;
	local v296;
	local v297;
	while true do
		if (v293 == (0 + 0)) then
			local v409 = 0;
			while true do
				if (v409 == (1481 - (641 + 839))) then
					v295 = game:GetService(v7("\115\95\196\177\223\198\86\89\213\144\243\218\80\69\194\166", "\168\38\44\161\195\150"));
					v293 = 914 - (910 + 3);
					break;
				end
				if (v409 == (0 - 0)) then
					v294 = v23(v289);
					if not v294 then
						return;
					end
					v409 = 1685 - (1466 + 218);
				end
			end
		end
		if (v293 == (1 + 1)) then
			local v410 = 1148 - (556 + 592);
			while true do
				if (v410 == (1 + 0)) then
					v297.BorderSizePixel = 809 - (329 + 479);
					v293 = 857 - (174 + 680);
					break;
				end
				if (v410 == (0 - 0)) then
					v297.BackgroundColor3 = v8.Theme.Background;
					v297.BorderColor3 = v8.Theme.Accent;
					v410 = 1 - 0;
				end
			end
		end
		if (v293 == (3 + 0)) then
			v297.Size = UDim2.new(739.9 - (396 + 343), 0, v292 or (0.1 + 0), 1477 - (29 + 1448));
			v297.Font = Enum.Font.SourceSans;
			v297.TextColor3 = v8.Theme.Text;
			v293 = 1393 - (135 + 1254);
		end
		if (v293 == 4) then
			v297.TextScaled = true;
			v297.TextWrapped = true;
			v297.ClearTextOnFocus = false;
			v293 = 5;
		end
		if (v293 == (3 - 2)) then
			v296 = v295.TouchEnabled and not v295.MouseEnabled;
			v297 = Instance.new(v7("\180\249\154\98\18\231\174", "\118\224\156\226\22\80\136\214"));
			v297.Parent = v294;
			v293 = 2;
		end
		if (v293 == 5) then
			v297.PlaceholderText = v288 or "";
			v297.Text = v290 or "";
			v297.FocusLost:Connect(function(v427)
				if v427 then
					pcall(v291, v297.Text);
				end
			end);
			break;
		end
	end
end;
v8.createSlider = function(v298, v299, v300, v301, v302)
	local v303 = v23(v299);
	if not v303 then
		return;
	end
	local v304 = Instance.new(v7("\100\252\88\141\71", "\224\34\142\57"));
	local v305 = Instance.new(v7("\248\181\196\208\118", "\110\190\199\165\189\19\145\61"));
	local v306 = Instance.new(v7("\252\249\118\229\142", "\167\186\139\23\136\235"));
	local v307 = Instance.new(v7("\46\176\144\25\54\180\138\8\22", "\109\122\213\232"));
	v304.Name = v298 .. v7("\209\196\174\57\234\242\176", "\80\142\151\194");
	v304.Parent = v303;
	v304.BackgroundTransparency = 4 - 3;
	v304.Size = UDim2.new(v302 or (0.4 + 0), 0, 0.2, 1527 - (389 + 1138));
	v307.Parent = v304;
	v307.BackgroundTransparency = 1;
	v307.Size = UDim2.new(1, 574 - (102 + 472), 0.4 + 0, 0 + 0);
	v307.Font = Enum.Font.SourceSansBold;
	v307.TextColor3 = Color3.new(1, 1 + 0, 1546 - (320 + 1225));
	v307.TextScaled = true;
	v307.Text = v298 .. v7("\89\134", "\44\99\166\23") .. tostring(v300);
	v305.Name = v7("\79\251\32\50\54\182\90\254\37\58", "\196\28\151\73\86\83");
	v305.Parent = v304;
	v305.BackgroundColor3 = v8.Theme.Accent;
	v305.Position = UDim2.new(0 - 0, 0 + 0, 1464.6 - (157 + 1307), 0);
	v305.Size = UDim2.new(v300 / 100, 1859 - (821 + 1038), 0.2 - 0, 0 + 0);
	v306.Name = v7("\192\15\32\20\135\74\48\119\253\7\37\21", "\22\147\99\73\112\226\56\120");
	v306.Parent = v304;
	v306.BackgroundColor3 = Color3.fromRGB(452 - 197, 95 + 160, 632 - 377);
	v306.Position = UDim2.new(v300 / (1126 - (834 + 192)), -(1 + 4), 0.6, -(2 + 3));
	v306.Size = UDim2.new(0 + 0, 15 - 5, 0, 20);
	v306.BorderSizePixel = 1;
	local v332 = false;
	local v333 = game:GetService(v7("\141\102\231\231\164\182\101\247\225\190\189\103\244\252\142\189", "\237\216\21\130\149"));
	local function v334(v342)
		local v343 = 0;
		local v344;
		local v345;
		local v346;
		local v347;
		local v348;
		while true do
			if (v343 == (304 - (300 + 4))) then
				local v428 = 0 + 0;
				while true do
					if (v428 == 1) then
						v343 = 2 - 1;
						break;
					end
					if ((362 - (112 + 250)) == v428) then
						v344 = v304.AbsolutePosition.X;
						v345 = v304.AbsoluteSize.X;
						v428 = 1 + 0;
					end
				end
			end
			if (v343 == (4 - 2)) then
				v305.Size = UDim2.new(v347, 0, 0.2 + 0, 0);
				v306.Position = UDim2.new(v347, -(3 + 2), 0.6, -5);
				v343 = 3 + 0;
			end
			if (v343 == (2 + 2)) then
				if v301 then
					pcall(v301, v348);
				end
				break;
			end
			if (v343 == (1 + 0)) then
				local v431 = 1414 - (1001 + 413);
				while true do
					if (v431 == (2 - 1)) then
						v343 = 884 - (244 + 638);
						break;
					end
					if (v431 == (693 - (627 + 66))) then
						v346 = math.clamp(v342.Position.X - v344, 0 - 0, v345);
						v347 = v346 / v345;
						v431 = 1;
					end
				end
			end
			if (v343 == 3) then
				local v432 = 602 - (512 + 90);
				while true do
					if (v432 == 0) then
						v348 = math.floor((v347 * (2006 - (1665 + 241))) + (717.5 - (373 + 344)));
						v307.Text = v298 .. v7("\216\14", "\62\226\46\63\63\208\169") .. tostring(v348);
						v432 = 1 + 0;
					end
					if (v432 == 1) then
						v343 = 2 + 2;
						break;
					end
				end
			end
		end
	end
	v306.InputBegan:Connect(function(v349)
		if (v349.UserInputType == Enum.UserInputType.MouseButton1) then
			v332 = true;
		end
	end);
	v333.InputChanged:Connect(function(v350)
		if (v332 and (v350.UserInputType == Enum.UserInputType.MouseMovement)) then
			v334(v350);
		end
	end);
	v333.InputEnded:Connect(function(v351)
		if (v351.UserInputType == Enum.UserInputType.MouseButton1) then
			v332 = false;
		end
	end);
	v305.Size = UDim2.new(v300 / 100, 0, 0.2 - 0, 0 - 0);
	v306.Position = UDim2.new(v300 / (1199 - (35 + 1064)), -(4 + 1), 0.6 - 0, -(1 + 4));
end;
local function v29()
	while wait() do
		local v352 = 1236 - (298 + 938);
		while true do
			if ((1259 - (233 + 1026)) == v352) then
				if not v16 then
					return;
				end
				for v442, v443 in pairs(v16:GetDescendants()) do
					if v443:IsA(v7("\194\12\92\172\29\7\42\93\241", "\62\133\121\53\227\127\109\79")) then
						local v468 = v443:GetFullName();
						local v469 = v443.Name;
						if not v8.Instances[v469] then
							v8.Instances[v469] = v468;
						end
					end
				end
				break;
			end
		end
	end
end
task.spawn(v29);
return v8;
