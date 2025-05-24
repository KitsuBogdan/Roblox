

local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v27, v28)
	local v29 = {};
	for v267 = 1, #v27 do
		v6(v29, v0(v4(v1(v2(v27, v267, v267 + 1)), v1(v2(v28, 1 + (v267 % #v28), 1 + (v267 % #v28) + 1))) % 256));
	end
	return v5(v29);
end
local v8 = {};
local v9 = game:GetService(v7("\242\204\201\32\193\174\206", "\126\177\163\187\69\134\219\167"));
v8 = {};
v8.Themes = {[v7("\51\216\56\213\240\38", "\156\67\173\74\165")]={[v7("\22\182\74\29\187\52\73\33\185\77", "\38\84\215\41\118\220\70")]=Color3.fromRGB(1121 - (709 + 387), 20 + 5, 1883 - (673 + 1185)),[v7("\113\21\33\23\240\68", "\158\48\118\66\114")]=Color3.fromRGB(232 - 152, 0 - 0, 1275 - (936 + 189)),[v7("\159\33\8\34", "\155\203\68\112\86\19\197")]=Color3.fromRGB(84 + 171, 1868 - (1565 + 48), 158 + 97),[v7("\100\200\34\232\79\118", "\152\38\189\86\156\32\24\133")]=Color3.fromRGB(38 + 12, 1188 - (782 + 356), 25 + 75),[v7("\212\82\166\66", "\38\156\55\199")]=Color3.fromRGB(79 - 39, 267 - (176 + 91), 157 - 77),[v7("\138\114\110\44\22\102", "\35\200\29\28\72\115\20\154")]=Color3.fromRGB(208 - 128, 0 - 0, 150)}};
local v11 = v8.Themes.purple;
local v12 = v11;
local v13;
local v14;
v8.createGui = function(v30)
	local v31 = Instance.new(v7("\42\188\195\218\136\34\19\12\182", "\84\121\223\177\191\237\76"));
	local v32 = Instance.new(v7("\157\68\200\173\63", "\161\219\54\169\192\90\48\80"));
	local v33 = Instance.new(v7("\111\80\1\40\76", "\69\41\34\96"));
	local v34 = Instance.new(v7("\154\209\214\7\7", "\75\220\163\183\106\98"));
	local v35 = Instance.new(v7("\36\168\138\58\220", "\185\98\218\235\87"));
	local v36 = Instance.new(v7("\237\46\38\235\219", "\202\171\92\71\134\190"));
	local v37 = Instance.new(v7("\28\232\0\129\58\213\0\137\48\206\57\156", "\232\73\161\76"));
	local v38 = Instance.new(v7("\143\220\90\73\50\186\219\71\81", "\126\219\185\34\61"));
	local v39 = Instance.new(v7("\42\220\95\127\123", "\135\108\174\62\18\30\23\147"));
	local v40 = Instance.new(v7("\130\236\50\223\52\175\49\194\186", "\167\214\137\74\171\120\206\83"));
	local v41 = Instance.new(v7("\191\245\42\73\218\178\159\228\61\83", "\199\235\144\82\61\152"));
	local v42 = Instance.new(v7("\51\19\161\63\37\3\173\63\8\24", "\75\103\118\217"));
	local v43 = Instance.new(v7("\225\70\113\25\188", "\126\167\52\16\116\217"));
	v31.Name = (v30 .. v7("\239\59\41", "\156\168\78\64\224\212\121")) or v7("\41\225\171\207\10\235\130\219\14\209\137\199\5\252\164\220\30", "\174\103\142\197");
	v31.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	v31.Parent = game.Players.LocalPlayer:WaitForChild(v7("\102\36\94\33\32\76\223\67\33", "\152\54\72\63\88\69\62"));
	v43.Parent = v31;
	v43.BackgroundColor3 = Color3.fromRGB(255, 1347 - (975 + 117), 2130 - (157 + 1718));
	v43.BackgroundTransparency = 1 + 0;
	v43.BorderColor3 = Color3.fromRGB(0 - 0, 0 - 0, 0);
	v43.BorderSizePixel = 2 - 1;
	v43.Position = UDim2.new(1847.299 - (559 + 1288), 1018 - (697 + 321), 0.299 - 0, 1 - 0);
	v43.Size = UDim2.new(0.4 - 0, 0 + 0, 0.401, 0 - 0);
	v43.Active = true;
	v43.Selectable = true;
	v43.Draggable = true;
	v32.Name = v7("\249\197\231\82", "\60\180\164\142");
	v32.Parent = v43;
	v32.BackgroundColor3 = v12.Background;
	v32.BackgroundTransparency = 1 + 0;
	v32.BorderColor3 = Color3.fromRGB(0 - 0, 0 + 0, 0 - 0);
	v32.BorderSizePixel = 1228 - (322 + 905);
	v32.Position = UDim2.new(611 - (602 + 9), 1189 - (449 + 740), 0.105 - 0, 0);
	v32.Size = UDim2.new(873 - (826 + 46), 947 - (245 + 702), 0.9 + 0, 0);
	v32.ClipsDescendants = true;
	v33.Name = v7("\117\120\10\37\35\232\0", "\114\56\62\101\73\71\141");
	v33.Parent = v32;
	v33.BackgroundColor3 = v12.Background;
	v33.BorderSizePixel = 3 - 2;
	v33.ClipsDescendants = true;
	v33.Size = UDim2.new(1 + 0, 1898 - (260 + 1638), 441 - (382 + 58), 0 - 0);
	v35.Name = "T";
	v35.Parent = v33;
	v35.BackgroundColor3 = v12.Background;
	v35.BorderSizePixel = 1;
	v35.Position = UDim2.new(0 + 0, 0 + 0, 6.028758e-8 - 0, 0 - 0);
	v35.Size = UDim2.new(1205.100000001 - (902 + 303), 0 - 0, 0.999999881, 0 - 0);
	v36.Name = v7("\140\207\212\200\188\236\201", "\164\216\137\187");
	v36.Parent = v35;
	v36.BorderSizePixel = 1 + 0;
	v36.BackgroundTransparency = 667.95 - (89 + 578);
	v36.Position = UDim2.new(1690 - (1121 + 569), 214 - (22 + 192), 683.1 - (483 + 200), 1463 - (1404 + 59));
	v36.Size = UDim2.new(2 - 1, 0 - 0, 0.9, 0 + 0);
	v13 = v36;
	v37.Parent = v36;
	v37.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	v37.SortOrder = Enum.SortOrder.LayoutOrder;
	v37.Padding = UDim.new(0.01, 765 - (468 + 297));
	v38.Parent = v35;
	v38.BorderSizePixel = 563 - (334 + 228);
	v38.Size = UDim2.new(3 - 2, 0 - 0, 0.1 - 0, 0 + 0);
	v38.Font = Enum.Font.SourceSansBold;
	v38.BackgroundTransparency = 236.9 - (141 + 95);
	v38.Text = v7("\230\231\51\161", "\107\178\134\81\210\198\158");
	v38.TextColor3 = v12.Text;
	v38.TextScaled = true;
	v39.Name = v7("\16\11\131\194", "\202\88\110\226\166");
	v39.Parent = v43;
	v39.BackgroundColor3 = v12.Head;
	v39.BorderSizePixel = 1 + 0;
	v39.Position = UDim2.new(0 - 0, 0 - 0, 0 + 0, 0 + 0);
	v39.Size = UDim2.new(2 - 1, 0 + 0, 0.1 + 0, 0 + 0);
	v40.Name = v30 .. v7("\247\6\150\251\207", "\170\163\111\226\151");
	v40.Parent = v39;
	v40.BorderSizePixel = 1 - 0;
	v40.Position = UDim2.new(0.24 + 0, 163 - (92 + 71), 0 + 0, 0 + 0);
	v40.BackgroundTransparency = 1;
	v40.Size = UDim2.new(489.51 - (457 + 32), 0 - 0, 766 - (574 + 191), 1402 - (832 + 570));
	v40.Font = Enum.Font.SourceSansBold;
	v40.Text = v30 or v7("\54\37\190\49\69\16\60\24\125\158\49\76\37\40\3\41", "\73\113\80\210\88\46\87");
	v40.TextColor3 = v12.Text;
	v40.TextScaled = true;
	v41.Name = v7("\169\37\201\23\197\149\34", "\135\225\76\173\114");
	v41.Parent = v39;
	v41.BackgroundColor3 = v12.Button;
	v41.BorderSizePixel = 1 + 0;
	v41.Position = UDim2.new(0.76 + 0, 0 - 0, 0.2 + 0, 796 - (588 + 208));
	v41.Size = UDim2.new(849.09 - (254 + 595), 0, 126.6 - (55 + 71), 0 - 0);
	v41.Font = Enum.Font.SourceSansBold;
	v41.Text = v7("\55\228\182\185\161\180\189\31", "\199\122\141\216\208\204\221");
	v41.TextColor3 = v12.Text;
	v41.TextScaled = true;
	v42.Name = v7("\142\209\31\227\125\212\185\211", "\150\205\189\112\144\24");
	v42.Parent = v39;
	v42.BackgroundColor3 = v12.Button;
	v42.BorderSizePixel = 1 - 0;
	v42.Position = UDim2.new(0.875, 0, 0.2, 1790 - (573 + 1217));
	v42.Size = UDim2.new(0.09 - 0, 0 - 0, 0.6, 0 + 0);
	v42.Font = Enum.Font.SourceSansBold;
	v42.Text = v7("\6\136\176\95\1", "\112\69\228\223\44\100\232\113");
	v42.TextColor3 = v12.Text;
	v42.TextScaled = true;
	v34.Name = v7("\228\30\0\214\165\90\137\216\27\2\193", "\230\180\127\103\179\214\28");
	v34.Parent = v33;
	v34.BackgroundColor3 = v12.Background;
	v34.BackgroundTransparency = 1 - 0;
	v34.BorderSizePixel = 940 - (714 + 225);
	v34.Position = UDim2.new(653.100000016 - (232 + 421), 0 - 0, 6.028758e-8 - 0, 1889 - (1569 + 320));
	v34.Size = UDim2.new(0.899999857 + 0, 0 - 0, 0.999999881 + 0, 0 - 0);
	v14 = v34;
	local v147 = v33.Position;
	local v148 = UDim2.new(605 - (316 + 289), 0 - 0, -(807 - (118 + 688)), 48 - (25 + 23));
	local v149 = true;
	v41.MouseButton1Click:Connect(function()
		if v149 then
			v33:TweenPosition(v148, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3 + 0, true);
			v149 = false;
			v41.Text = v7("\161\4\71\79\233\72\250\137", "\128\236\101\63\38\132\33");
		else
			v33:TweenPosition(v147, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true);
			v149 = true;
			v41.Text = v7("\129\160\31\77\187\226\213\169", "\175\204\201\113\36\214\139");
		end
	end);
	local v150 = game:GetService(v7("\115\219\48\217\10\116\201\39\202\13\68\201", "\100\39\172\85\188"));
	v42.MouseButton1Click:Connect(function()
		local v268 = 1886 - (927 + 959);
		local v269;
		while true do
			if (v268 == (0 - 0)) then
				v269 = 0;
				while true do
					if (v269 == 1) then
						v31:Destroy();
						break;
					end
					if (v269 == (732 - (16 + 716))) then
						for v426, v427 in pairs(v31:GetDescendants()) do
							local v428 = 254 - (79 + 175);
							local v429;
							while true do
								if ((1 - 0) == v428) then
									if v427:IsA(v7("\138\247\217\214\24\219\166\106\177\252", "\30\222\146\161\162\90\174\210")) then
										local v454 = 0;
										local v455;
										while true do
											if ((97 - (11 + 86)) == v454) then
												v455 = v150:Create(v427, v429, {[v7("\199\79\115\1\226\92\127\31\235\74\68\24\228\64\99\26\228\92\117\4\230\87", "\106\133\46\16")]=1,[v7("\108\37\107\232\110\82\89\46\96\236\91\82\93\46\112\229", "\32\56\64\19\156\58")]=(2 - 1)});
												v455:Play();
												break;
											end
										end
									end
									if v427:IsA(v7("\110\205\253\66\118\243\130\95\196", "\224\58\168\133\54\58\146")) then
										local v456 = 285 - (175 + 110);
										local v457;
										while true do
											if (v456 == (0 - 0)) then
												v457 = v150:Create(v427, v429, {[v7("\109\83\83\233\65\148\134\5\74\70\74\239\112\136\132\18", "\107\57\54\43\157\21\230\231")]=(2 - 1)});
												v457:Play();
												break;
											end
										end
									end
									break;
								end
								if (v428 == 0) then
									v429 = TweenInfo.new(0.3 - 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
									if v427:IsA(v7("\139\106\184\141\54", "\83\205\24\217\224")) then
										local v458 = 1796 - (503 + 1293);
										local v459;
										while true do
											if (v458 == (0 - 0)) then
												v459 = v150:Create(v427, v429, {[v7("\196\196\206\54\225\215\194\40\232\193\249\47\231\203\222\45\231\215\200\51\229\220", "\93\134\165\173")]=(182 - (92 + 89))});
												v459:Play();
												break;
											end
										end
									end
									v428 = 1 + 0;
								end
							end
						end
						wait(1 + 0);
						v269 = 1062 - (810 + 251);
					end
				end
				break;
			end
		end
	end);
end;
local v16 = {[v7("\247\130\2\225\141\221\205", "\175\187\235\113\149\217\188")]=function(v151)
	local v152 = 0 + 0;
	local v153;
	local v154;
	local v155;
	local v156;
	local v157;
	local v158;
	while true do
		local v270 = 0 - 0;
		while true do
			if (v270 == (0 + 0)) then
				if ((3 + 0) == v152) then
					v154.TextWrapped = true;
					v155 = Instance.new(v7("\136\78\50\54\42", "\81\206\60\83\91\79"));
					v155.Name = v151 .. v7("\109\164\222\102\42\205\89", "\196\46\203\176\18\79\163\45");
					v155.Parent = v14;
					v155.BackgroundColor3 = v12.Background;
					v155.BackgroundTransparency = 533 - (43 + 490);
					v152 = 737 - (711 + 22);
				end
				if (v152 == (7 - 5)) then
					v154.BackgroundColor3 = v12.Background;
					v154.BackgroundTransparency = 859.2 - (240 + 619);
					v154.Text = v151;
					v154.TextColor3 = v12.Text;
					v154.Font = Enum.Font.SourceSansBold;
					v154.TextScaled = true;
					v152 = 3;
				end
				v270 = 1 + 0;
			end
			if (v270 == (1 + 3)) then
				if (v152 == (13 - 4)) then
					v158.SortOrder = Enum.SortOrder.LayoutOrder;
					v158.HorizontalAlignment = Enum.HorizontalAlignment.Center;
					v158.Padding = UDim.new(0.02 - 0, 0 - 0);
					v154.MouseButton1Click:Connect(function()
						for v430, v431 in ipairs(v14:GetChildren()) do
							if v431:IsA(v7("\219\161\81\72\121", "\191\157\211\48\37\28")) then
								v431.Visible = false;
							end
						end
						v155.Visible = true;
					end);
					return v153;
				end
				if (v152 == (1197 - (442 + 747))) then
					v157.TextScaled = true;
					v157.TextSize = 1 + 13;
					v157.TextWrapped = true;
					v157.Text = v151;
					v158 = Instance.new(v7("\9\24\37\178\10\255\13\52\37\62\28\175", "\85\92\81\105\219\121\139\65"));
					v158.Parent = v156;
					v152 = 1753 - (1344 + 400);
				end
				break;
			end
			if (v270 == (407 - (255 + 150))) then
				if (v152 == (5 + 1)) then
					v156.ScrollBarThickness = 4 + 2;
					v156.ScrollBarImageColor3 = v12.Accent;
					v157 = Instance.new(v7("\22\93\47\204\242\21\228\39\84", "\134\66\56\87\184\190\116"));
					v157.Name = v151;
					v157.Parent = v156;
					v157.BackgroundColor3 = v12.Head;
					v152 = 796 - (766 + 23);
				end
				if ((4 - 3) == v152) then
					v153.BorderSizePixel = 3 - 2;
					v153.Size = UDim2.new(1739.95 - (404 + 1335), 406 - (183 + 223), 0.1 - 0, 0 - 0);
					v154 = Instance.new(v7("\137\220\56\88\159\204\52\88\178\215", "\44\221\185\64"));
					v154.Name = v151 .. v7("\53\230\74\125\103\15", "\19\97\135\40\63");
					v154.Parent = v153;
					v154.Size = UDim2.new(1 + 0, 0 + 0, 338 - (10 + 327), 0 + 0);
					v152 = 340 - (118 + 220);
				end
				v270 = 1 + 2;
			end
			if (v270 == (1483 - (641 + 839))) then
				if (7 == v152) then
					v157.BackgroundTransparency = 450 - (108 + 341);
					v157.BorderColor3 = v12.Border;
					v157.BorderSizePixel = 1 + 0;
					v157.Size = UDim2.new(0.95 - 0, 0 - 0, 1493.1 - (711 + 782), 0 + 0);
					v157.Font = Enum.Font.SourceSansBold;
					v157.TextColor3 = v12.Text;
					v152 = 15 - 7;
				end
				if (v152 == (474 - (270 + 199))) then
					v156.Parent = v155;
					v156.Active = true;
					v156.BackgroundColor3 = v12.Background;
					v156.BackgroundTransparency = 809 - (329 + 479);
					v156.BorderSizePixel = 855 - (174 + 680);
					v156.Size = UDim2.new(1 + 0, 1819 - (580 + 1239), 1, 0 - 0);
					v152 = 6 + 0;
				end
				v270 = 1 + 3;
			end
			if (v270 == (1 + 0)) then
				if ((9 - 5) == v152) then
					v155.BorderColor3 = v12.Border;
					v155.BorderSizePixel = 740 - (396 + 343);
					v155.Size = UDim2.new(1 + 0, 1167 - (645 + 522), 1791 - (1010 + 780), 0 + 0);
					v155.Visible = false;
					v156 = Instance.new(v7("\139\33\108\17\40\247\230\182\37\88\12\37\246\234", "\143\216\66\30\126\68\155"));
					v156.Name = v7("\153\203\31\196\201\175\222\239\173\238\31\202\200\166", "\129\202\168\109\171\165\195\183");
					v152 = 23 - 18;
				end
				if (v152 == (0 - 0)) then
					v153 = Instance.new(v7("\26\189\128\65\230", "\24\92\207\225\44\131\25"));
					v153.Name = v151 .. v7("\127\210\186", "\29\43\179\216\44\123");
					v153.Parent = v13;
					v153.BackgroundColor3 = v12.Background;
					v153.BackgroundTransparency = 1836.2 - (1045 + 791);
					v153.BorderColor3 = v12.Border;
					v152 = 2 - 1;
				end
				v270 = 2 + 0;
			end
		end
	end
end,[v7("\235\30\246\16\63\235\30\246", "\90\191\127\148\124")]=function(v159)
	local v160 = 0 - 0;
	local v161;
	local v162;
	local v163;
	local v164;
	local v165;
	while true do
		local v271 = 505 - (351 + 154);
		while true do
			if (v271 == (1576 - (1281 + 293))) then
				if (v160 == (273 - (28 + 238))) then
					v164.Size = UDim2.new(2 - 1, 1559 - (1381 + 178), 1, 0 + 0);
					v164.ScrollBarThickness = 5 + 1;
					v164.ScrollBarImageColor3 = v12.Accent;
					v165 = Instance.new(v7("\123\62\22\186\248\180\105\91\87\24\36\188", "\58\46\119\81\200\145\208\37"));
					v165.Parent = v164;
					v160 = 4 + 4;
				end
				if (v160 == 1) then
					v161.BorderColor3 = v12.Border;
					v161.BorderSizePixel = 3 - 2;
					v161.Size = UDim2.new(0.95, 0 + 0, 0.1, 470 - (381 + 89));
					v162 = Instance.new(v7("\14\19\236\161\24\3\224\161\53\24", "\213\90\118\148"));
					v162.Name = v159 .. v7("\111\47\182\116\89\85", "\45\59\78\212\54");
					v160 = 2;
				end
				v271 = 1862 - (821 + 1038);
			end
			if (v271 == (0 + 0)) then
				if (v160 == (2 + 0)) then
					v162.Parent = v161;
					v162.Size = UDim2.new(1 - 0, 1156 - (1074 + 82), 1 + 0, 0 - 0);
					v162.BackgroundColor3 = v12.Background;
					v162.BackgroundTransparency = 1784.2 - (214 + 1570);
					v162.Text = v159;
					v160 = 1 + 2;
				end
				if (v160 == (1458 - (990 + 465))) then
					v162.TextColor3 = v12.Text;
					v162.Font = Enum.Font.SourceSansBold;
					v162.TextScaled = true;
					v162.TextWrapped = true;
					v163 = Instance.new(v7("\54\68\130\134\131", "\144\112\54\227\235\230\78\205"));
					v160 = 1 + 3;
				end
				v271 = 1 - 0;
			end
			if (v271 == (2 + 2)) then
				if (v160 == (3 + 2)) then
					local v410 = 0 - 0;
					while true do
						if (v410 == (363 - (112 + 250))) then
							v163.Visible = false;
							v164 = Instance.new(v7("\125\132\241\34\66\139\234\35\73\161\241\44\67\130", "\77\46\231\131"));
							v410 = 2 + 0;
						end
						if (v410 == (7 - 5)) then
							v164.Name = v7("\137\87\164\79\182\88\191\78\189\114\164\65\183\81", "\32\218\52\214");
							v160 = 1732 - (1668 + 58);
							break;
						end
						if (v410 == (626 - (512 + 114))) then
							v163.BorderSizePixel = 2 - 1;
							v163.Size = UDim2.new(1 + 0, 0 + 0, 1 + 0, 1414 - (1001 + 413));
							v410 = 2 - 1;
						end
					end
				end
				break;
			end
			if (v271 == (5 - 2)) then
				if (v160 == (0 - 0)) then
					local v411 = 693 - (627 + 66);
					while true do
						if (v411 == (1 + 1)) then
							v161.BackgroundTransparency = 0.2 + 0;
							v160 = 1 + 0;
							break;
						end
						if (v411 == (0 - 0)) then
							v161 = Instance.new(v7("\94\149\47\26\125", "\119\24\231\78"));
							v161.Name = v159 .. v7("\182\44\167", "\113\226\77\197\42\188\32");
							v411 = 1995 - (109 + 1885);
						end
						if (v411 == (1470 - (1269 + 200))) then
							v161.Parent = v13;
							v161.BackgroundColor3 = v12.Background;
							v411 = 3 - 1;
						end
					end
				end
				if (v160 == (821 - (98 + 717))) then
					v164.Parent = v163;
					v164.Active = true;
					v164.BackgroundColor3 = v12.Background;
					v164.BackgroundTransparency = 1 + 0;
					v164.BorderSizePixel = 827 - (802 + 24);
					v160 = 18 - 11;
				end
				v271 = 4;
			end
			if (v271 == (1 - 0)) then
				if (v160 == (9 - 1)) then
					v165.SortOrder = Enum.SortOrder.LayoutOrder;
					v165.CellPadding = UDim2.new(0.0199999996 - 0, 0 + 0, 1099.0199999996 - (35 + 1064), 0 + 0);
					v165.CellSize = UDim2.new(0.140000003 - 0, 0 + 0, 0.200000003 + 0, 0 + 0);
					v162.MouseButton1Click:Connect(function()
						local v424 = 0 - 0;
						while true do
							if (v424 == 0) then
								for v452, v453 in ipairs(v14:GetChildren()) do
									if v453:IsA(v7("\13\158\49\161\172", "\86\75\236\80\204\201\221")) then
										v453.Visible = false;
									end
								end
								v163.Visible = true;
								break;
							end
						end
					end);
					return v161;
				end
				if (v160 == (1240 - (298 + 938))) then
					local v422 = 0 - 0;
					while true do
						if (v422 == (0 + 0)) then
							v163.Name = v159 .. v7("\144\39\1\232\213\85\167", "\59\211\72\111\156\176");
							v163.Parent = v14;
							v422 = 1;
						end
						if (v422 == (2 + 0)) then
							v163.BorderColor3 = v12.Border;
							v160 = 3 + 2;
							break;
						end
						if (v422 == 1) then
							v163.BackgroundColor3 = v12.Background;
							v163.BackgroundTransparency = 0 + 0;
							v422 = 2 + 0;
						end
					end
				end
				v271 = 1 + 1;
			end
		end
	end
end};
local v17 = nil;
local v18 = nil;
v8.createListTab = function(v166)
	local v167 = 1433 - (797 + 636);
	local v168;
	local v169;
	while true do
		if (v167 == (222 - (55 + 166))) then
			if not v17 then
				v17 = v168;
				v18 = v169;
				v169.Visible = true;
			else
				v169.Visible = false;
			end
			break;
		end
		if (v167 == (0 + 0)) then
			v168 = v16.ListTab(v166);
			v169 = v14:FindFirstChild(v166 .. v7("\81\78\121\145\251\133\102", "\235\18\33\23\229\158"));
			v167 = 1 + 0;
		end
	end
end;
v8.createTableTab = function(v170)
	local v171 = 0 - 0;
	local v172;
	local v173;
	while true do
		if (v171 == (1620 - (1427 + 192))) then
			if not v17 then
				local v320 = 0 + 0;
				while true do
					if ((0 - 0) == v320) then
						v17 = v172;
						v18 = v173;
						v320 = 1 + 0;
					end
					if (v320 == (1 + 0)) then
						v173.Visible = true;
						break;
					end
				end
			else
				v173.Visible = false;
			end
			break;
		end
		if (v171 == (326 - (192 + 134))) then
			v172 = v16.TableTab(v170);
			v173 = v14:FindFirstChild(v170 .. v7("\115\181\207\175\85\180\213", "\219\48\218\161"));
			v171 = 1277 - (316 + 960);
		end
	end
end;
local function v21(v174)
	local v175;
	for v272, v273 in pairs(v14:GetChildren()) do
		if (v273.Name == (v174 .. v7("\199\126\114\93\222\65\244", "\128\132\17\28\41\187\47"))) then
			v175 = v273:FindFirstChild(v7("\50\49\20\53\81\13\59\8\61\123\19\51\11\63", "\61\97\82\102\90"));
			break;
		end
	end
	if not v175 then
		local v285 = 1283 - (1035 + 248);
		while true do
			if (v285 == (0 + 0)) then
				warn(v7("\152\47\169\11\201\88\10\73\170\33\190\69\195\13\94", "\105\204\78\203\43\167\55\126") .. v174);
				return;
			end
		end
	end
	return v175;
end
v8.createClickBtn = function(v176, v177, v178)
	local v179 = v21(v177);
	if not v179 then
		return;
	end
	local v180 = Instance.new(v7("\145\175\59\10\49\17\211\69\170\164", "\49\197\202\67\126\115\100\167"));
	v180.Parent = v179;
	v180.BackgroundColor3 = v12.Accent;
	v180.BorderColor3 = v12.Border;
	v180.BorderSizePixel = 1 + 0;
	v180.Size = UDim2.new(0.9 + 0, 319 - (134 + 185), 0.05 - 0, 551 - (83 + 468));
	v180.Font = Enum.Font.SourceSans;
	v180.TextColor3 = v12.Text;
	v180.TextScaled = true;
	v180.TextWrapped = true;
	v180.Text = v176;
	if (v178 and (typeof(v178) == v7("\49\78\209\42\148\95\81\57", "\62\87\59\191\73\224\54"))) then
		v180.MouseButton1Click:Connect(v178);
	end
end;
v8.CreateLabel = function(v195, v196)
	local v197 = 1806 - (1202 + 604);
	local v198;
	local v199;
	while true do
		if (v197 == 3) then
			v199.Text = v195;
			v199.TextColor3 = v12.Text;
			v197 = 18 - 14;
		end
		if (v197 == (2 - 0)) then
			v199.Size = UDim2.new(1, 0, 0 + 0, 69 - 44);
			v199.BackgroundTransparency = 326 - (45 + 280);
			v197 = 3 + 0;
		end
		if (v197 == (0 + 0)) then
			v198 = v21(v196);
			if not v198 then
				return;
			end
			v197 = 1 + 0;
		end
		if (v197 == (1 + 0)) then
			local v293 = 0 + 0;
			local v294;
			while true do
				if ((0 - 0) == v293) then
					v294 = 0 + 0;
					while true do
						if (v294 == (1912 - (340 + 1571))) then
							v197 = 1 + 1;
							break;
						end
						if ((1772 - (1733 + 39)) == v294) then
							v199 = Instance.new(v7("\211\7\226\221\203\3\248\204\235", "\169\135\98\154"));
							v199.Parent = v198;
							v294 = 2 - 1;
						end
					end
					break;
				end
			end
		end
		if (v197 == 4) then
			v199.Font = Enum.Font.SourceSansBold;
			v199.TextScaled = true;
			break;
		end
	end
end;
v8.createToggle = function(v200, v201, v202, v203)
	local v204 = 0;
	local v205;
	local v206;
	local v207;
	while true do
		if (v204 == (1037 - (125 + 909))) then
			v207.TextWrapped = true;
			v207.Text = v200 .. v7("\174\49", "\231\148\17\149\205\69\77") .. ((v206 and v7("\175\137", "\159\224\199\167\155\55")) or v7("\216\213\26", "\178\151\147\92"));
			v207.MouseButton1Click:Connect(function()
				local v312 = 1948 - (1096 + 852);
				while true do
					if (v312 == (1 + 0)) then
						pcall(v203, v206);
						break;
					end
					if (v312 == (0 - 0)) then
						v206 = not v206;
						v207.Text = v200 .. v7("\214\189", "\26\236\157\44\82\114\44") .. ((v206 and v7("\5\0", "\59\74\78\181")) or v7("\10\247\124", "\211\69\177\58\58"));
						v312 = 1 + 0;
					end
				end
			end);
			break;
		end
		if (v204 == (3 - 2)) then
			v207.Parent = v205;
			v207.BackgroundColor3 = v12.Accent;
			v207.BorderColor3 = v12.Border;
			v207.BorderSizePixel = 2 - 1;
			v204 = 514 - (409 + 103);
		end
		if (v204 == (236 - (46 + 190))) then
			v205 = v21(v201);
			if not v205 then
				return;
			end
			v206 = v202;
			v207 = Instance.new(v7("\255\114\60\64\223\38\220\223\120\42", "\168\171\23\68\52\157\83"));
			v204 = 1 + 0;
		end
		if (v204 == (97 - (51 + 44))) then
			v207.Size = UDim2.new(0.9 + 0, 1317 - (1114 + 203), 726.05 - (228 + 498), 0 + 0);
			v207.Font = Enum.Font.SourceSans;
			v207.TextColor3 = v12.Text;
			v207.TextScaled = true;
			v204 = 2 + 1;
		end
	end
end;
v8.createTextbox = function(v208, v209, v210, v211)
	local v212 = v21(v209);
	if not v212 then
		return;
	end
	local v213 = game:GetService(v7("\130\246\124\231\192\197\167\240\109\198\236\217\161\236\122\240", "\171\215\133\25\149\137"));
	local v214 = v213.TouchEnabled and not v213.MouseEnabled;
	local v215 = Instance.new(v7("\213\205\42\238\205\63\228", "\34\129\168\82\154\143\80\156"));
	v215.Parent = v212;
	v215.BackgroundColor3 = v12.Accent;
	v215.BorderColor3 = v12.Border;
	v215.BorderSizePixel = 664 - (174 + 489);
	v215.Size = UDim2.new(0.9 - 0, 0 - 0, 0.05, 1905 - (830 + 1075));
	v215.Font = Enum.Font.SourceSans;
	v215.TextColor3 = v12.Text;
	v215.TextScaled = true;
	v215.TextWrapped = true;
	v215.ClearTextOnFocus = false;
	v215.PlaceholderText = v208 or "";
	v215.Text = v210 or "";
	v215.FocusLost:Connect(function(v274)
		if v274 then
			pcall(v211, v215.Text);
		end
	end);
end;
v8.createSlider = function(v232, v233, v234, v235)
	local v236 = v21(v233);
	if not v236 then
		return;
	end
	local v237 = Instance.new(v7("\163\160\50\6\77", "\233\229\210\83\107\40\46"));
	local v238 = Instance.new(v7("\231\80\51\219\0", "\101\161\34\82\182"));
	local v239 = Instance.new(v7("\206\31\88\243\222", "\78\136\109\57\158\187\130\226"));
	local v240 = Instance.new(v7("\10\58\225\229\18\62\251\244\50", "\145\94\95\153"));
	v237.Name = v232 .. v7("\194\254\24\220\74\178\239", "\215\157\173\116\181\46");
	v237.Parent = v236;
	v237.BackgroundTransparency = 4 - 3;
	v237.Size = UDim2.new(524 - (303 + 221), 200, 1269 - (231 + 1038), 30 + 5);
	v240.Parent = v237;
	v240.BackgroundTransparency = 1163 - (171 + 991);
	v240.Size = UDim2.new(1, 0 - 0, 0.4 - 0, 0 - 0);
	v240.Font = Enum.Font.SourceSansBold;
	v240.TextColor3 = Color3.new(1 + 0, 3 - 2, 2 - 1);
	v240.TextScaled = true;
	v240.Text = v232 .. v7("\111\244", "\186\85\212\235\146") .. tostring(v234);
	v238.Name = v7("\241\141\31\250\60\252\126\203\141\26", "\56\162\225\118\158\89\142");
	v238.Parent = v237;
	v238.BackgroundColor3 = Color3.fromRGB(1 + 79, 0 - 0, 463 - 313);
	v238.Position = UDim2.new(1248 - (111 + 1137), 158 - (91 + 67), 0.6 - 0, 0 + 0);
	v238.Size = UDim2.new(v234 / (623 - (423 + 100)), 0 + 0, 0.2 - 0, 0 + 0);
	v239.Name = v7("\111\9\201\171\39\202\116\4\206\171\46\221", "\184\60\101\160\207\66");
	v239.Parent = v237;
	v239.BackgroundColor3 = Color3.fromRGB(1026 - (326 + 445), 469 - 214, 1112 - 857);
	v239.Position = UDim2.new(v234 / (222 - 122), -(4 + 1), 0.6 - 0, -(16 - 11));
	v239.Size = UDim2.new(0, 10, 711 - (530 + 181), 901 - (614 + 267));
	v239.BorderSizePixel = 33 - (19 + 13);
	local v264 = false;
	local v265 = game:GetService(v7("\4\145\121\174\24\140\108\169\37\177\121\174\39\139\127\185", "\220\81\226\28"));
	local function v266(v275)
		local v276 = 0 - 0;
		local v277;
		local v278;
		local v279;
		local v280;
		local v281;
		while true do
			if ((0 + 0) == v276) then
				v277 = v237.AbsolutePosition.X;
				v278 = v237.AbsoluteSize.X;
				v276 = 2 - 1;
			end
			if (v276 == (5 - 3)) then
				v238.Size = UDim2.new(v280, 0 + 0, 0.2 - 0, 0 - 0);
				v239.Position = UDim2.new(v280, -5, 0.6, -(19 - 14));
				v276 = 1815 - (1293 + 519);
			end
			if ((5 - 2) == v276) then
				v281 = math.floor((v280 * (261 - 161)) + (0.5 - 0));
				v240.Text = v232 .. v7("\73\149", "\167\115\181\226\155\138") .. tostring(v281);
				v276 = 17 - 13;
			end
			if (v276 == (97 - (4 + 89))) then
				if v235 then
					pcall(v235, v281);
				end
				break;
			end
			if (v276 == 1) then
				v279 = math.clamp(v275.Position.X - v277, 0 - 0, v278);
				v280 = v279 / v278;
				v276 = 2 + 0;
			end
		end
	end
	v239.InputBegan:Connect(function(v282)
		if (v282.UserInputType == Enum.UserInputType.MouseButton1) then
			v264 = true;
		end
	end);
	v265.InputChanged:Connect(function(v283)
		if (v264 and (v283.UserInputType == Enum.UserInputType.MouseMovement)) then
			v266(v283);
		end
	end);
	v265.InputEnded:Connect(function(v284)
		if (v284.UserInputType == Enum.UserInputType.MouseButton1) then
			v264 = false;
		end
	end);
	v238.Size = UDim2.new(v234 / (21 + 79), 0 - 0, 0.2 - 0, 0 + 0);
	v239.Position = UDim2.new(v234 / (34 + 66), -(1458 - (28 + 1425)), 0.6 + 0, -(5 + 0));
end;
return v8;
