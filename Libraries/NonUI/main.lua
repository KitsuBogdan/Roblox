local module = {}
local tweenService = game:GetService("TweenService")
local inputService = game:GetService("UserInputService")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local plr = game.Players.LocalPlayer
module.UId = nil
module.I = {Release = 1, Version = "1.3.5", Creator = "Noname Hub"}

local writefile = writefile or false
local isfile = isfile or false
local gethui = gethui or false
local readfile = readfile or false
local setclipboard = setclipboard or false
local make_folder = make_folder or false
local listfiles = listfiles or false
local isfolder = isfolder or false

local folderName = "Noname Scripts"

module.lucide_icons = {
	["aperture"] = "rbxassetid://7733666258",
	["bug"]= "rbxassetid://7733701545",
	["chevrons-down-up"]= "rbxassetid://7733720483",
	["clock-6"]= "rbxassetid://8997384977",
	["egg"]= "rbxassetid://8997385940",
	["external-link"]= "rbxassetid://7743866903",
	["lightbulb-off"]= "rbxassetid://7733975123",
	["file-check-2"]= "rbxassetid://7733779610",
	["settings"]= "rbxassetid://7734053495",
	["crown"]= "rbxassetid://7733765398",
	["coins"]= "rbxassetid://7743866529",
	["battery"]= "rbxassetid://7733674820",
	["flashlight-off"]= "rbxassetid://7733798799",
	["camera-off"]= "rbxassetid://7733919260",
	["function-square"]= "rbxassetid://7733799682",
	["mountain-snow"]= "rbxassetid://7743870286",
	["gamepad"]= "rbxassetid://7733799901",
	["gift"]= "rbxassetid://7733946818",
	["globe"]= "rbxassetid://7733954760",
	["option"]= "rbxassetid://7734021300",
	["hand"]= "rbxassetid://7733955740",
	["hard-hat"]= "rbxassetid://7733955850",
	["hash"]= "rbxassetid://7733955906",
	["server"]= "rbxassetid://7734053426",
	["align-horizontal-space-around"]= "rbxassetid://8997381738",
	["highlighter"]= "rbxassetid://7743868648",
	["bike"]= "rbxassetid://7733678330",
	["home"]= "rbxassetid://7733960981",
	["image"]= "rbxassetid://7733964126",
	["indent"]= "rbxassetid://7733964452",
	["infinity"]= "rbxassetid://7733964640",
	["inspect"]= "rbxassetid://7733964808",
	["alert-triangle"]= "rbxassetid://7733658504",
	["align-start-horizontal"]= "rbxassetid://8997381965",
	["figma"]= "rbxassetid://7743867310",
	["pin"]= "rbxassetid://8997386648",
	["corner-up-right"]= "rbxassetid://7733764915",
	["list-x"]= "rbxassetid://7743869517",
	["monitor-off"]= "rbxassetid://7734000184",
	["chevron-first"]= "rbxassetid://8997383275",
	["package-search"]= "rbxassetid://8997386448",
	["pencil"]= "rbxassetid://7734022107",
	["cloud-fog"]= "rbxassetid://7733920317",
	["grip-horizontal"]= "rbxassetid://7733955302",
	["align-center-vertical"]= "rbxassetid://8997380737",
	["outdent"]= "rbxassetid://7734021384",
	["more-vertical"]= "rbxassetid://7734006187",
	["package-plus"]= "rbxassetid://8997386355",
	["bluetooth"]= "rbxassetid://7733687147",
	["pen-tool"]= "rbxassetid://7734022041",
	["person-standing"]= "rbxassetid://7743871002",
	["tornado"]= "rbxassetid://7743873633",
	["phone-incoming"]= "rbxassetid://7743871120",
	["phone-off"]= "rbxassetid://7734029534",
	["dribbble"]= "rbxassetid://7733770843",
	["at-sign"]= "rbxassetid://7733673907",
	["edit-2"]= "rbxassetid://7733771217",
	["sheet"]= "rbxassetid://7743871876",
	["tv"]= "rbxassetid://7743874674",
	["headphones"]= "rbxassetid://7733956063",
	["qr-code"]= "rbxassetid://7743871575",
	["reply"]= "rbxassetid://7734051594",
	["rewind"]= "rbxassetid://7734051670",
	["bell-off"]= "rbxassetid://7733675107",
	["file-check"]= "rbxassetid://7733779668",
	["quote"]= "rbxassetid://7734045100",
	["rotate-ccw"]= "rbxassetid://7734051861",
	["library"]= "rbxassetid://7743869054",
	["clock-1"]= "rbxassetid://8997383694",
	["on-charge"]= "rbxassetid://7734021231",
	["video-off"]= "rbxassetid://7743876466",
	["save"]= "rbxassetid://7734052335",
	["arrow-left-circle"]= "rbxassetid://7733673056",
	["screen-share"]= "rbxassetid://7734052814",
	["clock-3"]= "rbxassetid://8997384456",
	["help-circle"]= "rbxassetid://7733956210",
	["server-crash"]= "rbxassetid://7734053281",
	["bluetooth-searching"]= "rbxassetid://7733914320",
	["equal"]= "rbxassetid://7733771811",
	["shield-close"]= "rbxassetid://7734056470",
	["phone"]= "rbxassetid://7734032056",
	["type"]= "rbxassetid://7743874740",
	["file-x-2"]= "rbxassetid://7743867554",
	["sidebar"]= "rbxassetid://7734058260",
	["sigma"]= "rbxassetid://7734058345",
	["smartphone-charging"]= "rbxassetid://7734058894",
	["arrow-left"]= "rbxassetid://7733673136",
	["framer"]= "rbxassetid://7733799486",
	["currency"]= "rbxassetid://7733765592",
	["star"]= "rbxassetid://7734068321",
	["stretch-horizontal"]= "rbxassetid://8997387754",
	["smile"]= "rbxassetid://7734059095",
	["subscript"]= "rbxassetid://8997387937",
	["sun"]= "rbxassetid://7734068495",
	["switch-camera"]= "rbxassetid://7743872492",
	["table"]= "rbxassetid://7734073253",
	["tag"]= "rbxassetid://7734075797",
	["cross"]= "rbxassetid://7733765224",
	["gem"]= "rbxassetid://7733942651",
	["link"]= "rbxassetid://7733978098",
	["terminal"]= "rbxassetid://7743872929",
	["thermometer-sun"]= "rbxassetid://7734084018",
	["share-2"]= "rbxassetid://7734053595",
	["timer-off"]= "rbxassetid://8997388325",
	["megaphone"]= "rbxassetid://7733993049",
	["timer-reset"]= "rbxassetid://7743873336",
	["phone-forwarded"]= "rbxassetid://7734027345",
	["unlock"]= "rbxassetid://7743875263",
	["trello"]= "rbxassetid://7743873996",
	["camera"]= "rbxassetid://7733708692",
	["triangle"]= "rbxassetid://7743874367",
	["truck"]= "rbxassetid://7743874482",
	["file-output"]= "rbxassetid://7733788742",
	["gamepad-2"]= "rbxassetid://7733799795",
	["network"]= "rbxassetid://7734021047",
	["users"]= "rbxassetid://7743876054",
	["electricity-off"]= "rbxassetid://7733771563",
	["book"]= "rbxassetid://7733914390",
	["clock-9"]= "rbxassetid://8997385485",
	["corner-down-left"]= "rbxassetid://7733764327",
	["locate-fixed"]= "rbxassetid://7733992424",
	["bar-chart"]= "rbxassetid://7733674319",
	["shield-check"]= "rbxassetid://7734056411",
	["signal-low"]= "rbxassetid://8997387189",
	["reply-all"]= "rbxassetid://7734051524",
	["zoom-in"]= "rbxassetid://7743878977",
	["grip-vertical"]= "rbxassetid://7733955410",
	["ticket"]= "rbxassetid://7734086558",
	["smartphone"]= "rbxassetid://7734058979",
	["arrow-big-right"]= "rbxassetid://7733671493",
	["tv-2"]= "rbxassetid://7743874599",
	["flashlight"]= "rbxassetid://7733798851",
	["database"]= "rbxassetid://7743866778",
	["plus-square"]= "rbxassetid://7734040369",
	["align-justify"]= "rbxassetid://7733661326",
	["clipboard-list"]= "rbxassetid://7733920117",
	["github"]= "rbxassetid://7733954058",
	["columns"]= "rbxassetid://7733757178",
	["arrow-big-down"]= "rbxassetid://7733668653",
	["cloud-off"]= "rbxassetid://7733745572",
	["target"]= "rbxassetid://7743872758",
	["skip-back"]= "rbxassetid://7734058404",
	["x-circle"]= "rbxassetid://7743878496",
	["clock-10"]= "rbxassetid://8997383876",
	["align-right"]= "rbxassetid://7733663582",
	["clock-5"]= "rbxassetid://8997384798",
	["bell-plus"]= "rbxassetid://7733675181",
	["battery-medium"]= "rbxassetid://7733674731",
	["arrow-down"]= "rbxassetid://7733672933",
	["inbox"]= "rbxassetid://7733964370",
	["cast"]= "rbxassetid://7733919326",
	["gift-card"]= "rbxassetid://7733945018",
	["webcam"]= "rbxassetid://7743877896",
	["folder-minus"]= "rbxassetid://7733799022",
	["scan-line"]= "rbxassetid://8997386772",
	["shovel"]= "rbxassetid://7734056878",
	["download-cloud"]= "rbxassetid://7733770689",
	["list-checks"]= "rbxassetid://7743869317",
	["file-text"]= "rbxassetid://7733789088",
	["codesandbox"]= "rbxassetid://7733752575",
	["laptop-2"]= "rbxassetid://7733965313",
	["podcast"]= "rbxassetid://7734042234",
	["log-out"]= "rbxassetid://7733992677",
	["thumbs-up"]= "rbxassetid://7743873212",
	["timer"]= "rbxassetid://7743873443",
	["text-cursor"]= "rbxassetid://8997388195",
	["file-search"]= "rbxassetid://7733788966",
	["thermometer"]= "rbxassetid://7734084149",
	["bluetooth-off"]= "rbxassetid://7733914252",
	["refresh-cw"]= "rbxassetid://7734051052",
	["clipboard-check"]= "rbxassetid://7733919947",
	["languages"]= "rbxassetid://7733965249",
	["asterisk"]= "rbxassetid://7733673800",
	["superscript"]= "rbxassetid://8997388036",
	["user-check"]= "rbxassetid://7743875503",
	["move-diagonal"]= "rbxassetid://7743870505",
	["copy"]= "rbxassetid://7733764083",
	["bot"]= "rbxassetid://7733916988",
	["alarm-minus"]= "rbxassetid://7733656164",
	["log-in"]= "rbxassetid://7733992604",
	["maximize"]= "rbxassetid://7733992982",
	["align-horizontal-space-between"]= "rbxassetid://8997381854",
	["brush"]= "rbxassetid://7733701455",
	["equal-not"]= "rbxassetid://7733771726",
	["upload"]= "rbxassetid://7743875428",
	["minus-circle"]= "rbxassetid://7733998053",
	["graduation-cap"]= "rbxassetid://7733955058",
	["edit-3"]= "rbxassetid://7733771361",
	["check"]= "rbxassetid://7733715400",
	["scissors"]= "rbxassetid://7734052570",
	["info"]= "rbxassetid://7733964719",
	["align-horizonal-distribute-start"]= "rbxassetid://8997381290",
	["book-open"]= "rbxassetid://7733687281",
	["divide-circle"]= "rbxassetid://7733769152",
	["file"]= "rbxassetid://7733793319",
	["clock-2"]= "rbxassetid://8997384295",
	["corner-right-up"]= "rbxassetid://7733764680",
	["clover"]= "rbxassetid://7733747233",
	["expand"]= "rbxassetid://7733771982",
	["gauge"]= "rbxassetid://7733799969",
	["phone-outgoing"]= "rbxassetid://7743871253",
	["shield-alert"]= "rbxassetid://7734056326",
	["paperclip"]= "rbxassetid://7734021680",
	["arrow-big-left"]= "rbxassetid://7733911731",
	["album"]= "rbxassetid://7733658133",
	["bookmark"]= "rbxassetid://7733692043",
	["check-circle-2"]= "rbxassetid://7733710700",
	["list-ordered"]= "rbxassetid://7743869411",
	["delete"]= "rbxassetid://7733768142",
	["axe"]= "rbxassetid://7733674079",
	["radio"]= "rbxassetid://7743871662",
	["octagon"]= "rbxassetid://7734021165",
	["git-commit"]= "rbxassetid://7743868360",
	["shirt"]= "rbxassetid://7734056672",
	["corner-right-down"]= "rbxassetid://7733764605",
	["trending-down"]= "rbxassetid://7743874143",
	["airplay"]= "rbxassetid://7733655834",
	["repeat"]= "rbxassetid://7734051454",
	["layers"]= "rbxassetid://7743868936",
	["chevron-right"]= "rbxassetid://7733717755",
	["chevrons-right"]= "rbxassetid://7733919682",
	["folder-plus"]= "rbxassetid://7733799092",
	["alarm-check"]= "rbxassetid://7733655912",
	["arrow-up-right"]= "rbxassetid://7733673646",
	["user-plus"]= "rbxassetid://7743875759",
	["file-minus"]= "rbxassetid://7733936115",
	["cloud-drizzle"]= "rbxassetid://7733920226",
	["stretch-vertical"]= "rbxassetid://8997387862",
	["align-vertical-distribute-start"]= "rbxassetid://8997382428",
	["unlink"]= "rbxassetid://7743875149",
	["wand"]= "rbxassetid://8997388430",
	["regex"]= "rbxassetid://7734051188",
	["command"]= "rbxassetid://7733924046",
	["haze"]= "rbxassetid://7733955969",
	["trash"]= "rbxassetid://7743873871",
	["battery-full"]= "rbxassetid://7733674503",
	["flag-triangle-left"]= "rbxassetid://7733798509",
	["server-off"]= "rbxassetid://7734053361",
	["loader-2"]= "rbxassetid://7733989869",
	["monitor-speaker"]= "rbxassetid://7743869988",
	["shuffle"]= "rbxassetid://7734057059",
	["tablet"]= "rbxassetid://7743872620",
	["cloud-moon"]= "rbxassetid://7733920519",
	["clipboard-x"]= "rbxassetid://7733734668",
	["pocket"]= "rbxassetid://7734042139",
	["watch"]= "rbxassetid://7743877668",
	["file-plus"]= "rbxassetid://7733788885",
	["locate"]= "rbxassetid://7733992469",
	["share"]= "rbxassetid://7734053697",
	["thermometer-snowflake"]= "rbxassetid://7743873074",
	["volume-1"]= "rbxassetid://7743877081",
	["arrow-left-right"]= "rbxassetid://8997382869",
	["coffee"]= "rbxassetid://7733752630",
	["chevron-last"]= "rbxassetid://8997383390",
	["cloud-hail"]= "rbxassetid://7733920444",
	["alarm-clock-off"]= "rbxassetid://7733656003",
	["pound-sterling"]= "rbxassetid://7734042354",
	["tent"]= "rbxassetid://7734078943",
	["toggle-left"]= "rbxassetid://7734091286",
	["dollar-sign"]= "rbxassetid://7733770599",
	["sunrise"]= "rbxassetid://7743872365",
	["sunset"]= "rbxassetid://7734070982",
	["code"]= "rbxassetid://7733749837",
	["thumbs-down"]= "rbxassetid://7734084236",
	["trending-up"]= "rbxassetid://7743874262",
	["clock-12"]= "rbxassetid://8997384150",
	["rocking-chair"]= "rbxassetid://7734051769",
	["check-square"]= "rbxassetid://7733919526",
	["cpu"]= "rbxassetid://7733765045",
	["palette"]= "rbxassetid://7734021595",
	["minimize-2"]= "rbxassetid://7733997870",
	["cloud-sun"]= "rbxassetid://7733746880",
	["copyleft"]= "rbxassetid://7733764196",
	["archive"]= "rbxassetid://7733911621",
	["building"]= "rbxassetid://7733701625",
	["image-minus"]= "rbxassetid://7733963797",
	["italic"]= "rbxassetid://7733964917",
	["link-2-off"]= "rbxassetid://7733975283",
	["sort-asc"]= "rbxassetid://7734060715",
	["underline"]= "rbxassetid://7743874904",
	["gitlab"]= "rbxassetid://7733954246",
	["file-minus-2"]= "rbxassetid://7733936010",
	["play-circle"]= "rbxassetid://7734037784",
	["clock-8"]= "rbxassetid://8997385352",
	["file-input"]= "rbxassetid://7733935917",
	["beaker"]= "rbxassetid://7733674922",
	["shopping-bag"]= "rbxassetid://7734056747",
	["navigation"]= "rbxassetid://7734020989",
	["moon"]= "rbxassetid://7743870134",
	["align-vertical-space-between"]= "rbxassetid://8997382793",
	["glasses"]= "rbxassetid://7733954403",
	["clipboard-copy"]= "rbxassetid://7733920037",
	["feather"]= "rbxassetid://7733777166",
	["skip-forward"]= "rbxassetid://7734058495",
	["wind"]= "rbxassetid://7743878264",
	["frown"]= "rbxassetid://7733799591",
	["move-vertical"]= "rbxassetid://7743870608",
	["umbrella"]= "rbxassetid://7743874820",
	["package"]= "rbxassetid://7734021469",
	["chevrons-up"]= "rbxassetid://7733723433",
	["download"]= "rbxassetid://7733770755",
	["eye"]= "rbxassetid://7733774602",
	["files"]= "rbxassetid://7743867811",
	["arrow-down-right"]= "rbxassetid://7733672831",
	["code-2"]= "rbxassetid://7733920644",
	["wrap-text"]= "rbxassetid://8997388548",
	["file-digit"]= "rbxassetid://7733935829",
	["x-square"]= "rbxassetid://7743878737",
	["clipboard"]= "rbxassetid://7733734762",
	["maximize-2"]= "rbxassetid://7733992901",
	["send"]= "rbxassetid://7734053039",
	["alarm-clock"]= "rbxassetid://7733656100",
	["sliders"]= "rbxassetid://7734058803",
	["refresh-ccw"]= "rbxassetid://7734050715",
	["music"]= "rbxassetid://7734020554",
	["banknote"]= "rbxassetid://7733674153",
	["hard-drive"]= "rbxassetid://7733955793",
	["search"]= "rbxassetid://7734052925",
	["layout-list"]= "rbxassetid://7733970442",
	["edit"]= "rbxassetid://7733771472",
	["contrast"]= "rbxassetid://7733764005",
	["wifi"]= "rbxassetid://7743878148",
	["swiss-franc"]= "rbxassetid://7734071038",
	["ghost"]= "rbxassetid://7743868000",
	["laptop"]= "rbxassetid://7733965386",
	["clock-4"]= "rbxassetid://8997384603",
	["layout-dashboard"]= "rbxassetid://7733970318",
	["align-vertical-justify-end"]= "rbxassetid://8997382584",
	["circle"]= "rbxassetid://7733919881",
	["file-x"]= "rbxassetid://7733938136",
	["award"]= "rbxassetid://7733673987",
	["corner-left-down"]= "rbxassetid://7733764448",
	["arrow-up-left"]= "rbxassetid://7733673539",
	["carrot"]= "rbxassetid://8997382987",
	["globe-2"]= "rbxassetid://7733954611",
	["compass"]= "rbxassetid://7733924216",
	["git-branch"]= "rbxassetid://7733949149",
	["vibrate"]= "rbxassetid://7743876302",
	["pause-circle"]= "rbxassetid://7734021767",
	["minus-square"]= "rbxassetid://7743869899",
	["mic-off"]= "rbxassetid://7743869714",
	["arrow-down-circle"]= "rbxassetid://7733671763",
	["move-horizontal"]= "rbxassetid://7734016210",
	["chrome"]= "rbxassetid://7733919783",
	["radio-receiver"]= "rbxassetid://7734045155",
	["shield"]= "rbxassetid://7734056608",
	["image-plus"]= "rbxassetid://7733964016",
	["more-horizontal"]= "rbxassetid://7734006080",
	["slash"]= "rbxassetid://8997387644",
	["divide"]= "rbxassetid://7733769365",
	["view"]= "rbxassetid://7743876754",
	["list"]= "rbxassetid://7743869612",
	["printer"]= "rbxassetid://7734042580",
	["corner-left-up"]= "rbxassetid://7733764536",
	["meh"]= "rbxassetid://7733993147",
	["copyright"]= "rbxassetid://7733764275",
	["align-end-vertical"]= "rbxassetid://8997380907",
	["heart"]= "rbxassetid://7733956134",
	["lock"]= "rbxassetid://7733992528",
	["align-center"]= "rbxassetid://7733909776",
	["signal-high"]= "rbxassetid://8997387110",
	["upload-cloud"]= "rbxassetid://7743875358",
	["arrow-up-circle"]= "rbxassetid://7733673466",
	["git-branch-plus"]= "rbxassetid://7743868200",
	["align-vertical-justify-center"]= "rbxassetid://8997382502",
	["screen-share-off"]= "rbxassetid://7734052653",
	["git-pull-request"]= "rbxassetid://7733952287",
	["flag"]= "rbxassetid://7733798691",
	["star-half"]= "rbxassetid://7734068258",
	["minus"]= "rbxassetid://7734000129",
	["mountain"]= "rbxassetid://7734008868",
	["volume"]= "rbxassetid://7743877487",
	["mouse-pointer-2"]= "rbxassetid://7734010405",
	["package-x"]= "rbxassetid://8997386545",
	["indian-rupee"]= "rbxassetid://7733964536",
	["speaker"]= "rbxassetid://7734063416",
	["flame"]= "rbxassetid://7733798747",
	["circle-slashed"]= "rbxassetid://8997383530",
	["crop"]= "rbxassetid://7733765140",
	["clock-11"]= "rbxassetid://8997384034",
	["stop-circle"]= "rbxassetid://7734068379",
	["align-horizontal-justify-end"]= "rbxassetid://8997381549",
	["power-off"]= "rbxassetid://7734042423",
	["bell-minus"]= "rbxassetid://7733675028",
	["undo"]= "rbxassetid://7743874974",
	["link-2"]= "rbxassetid://7743869163",
	["lightbulb"]= "rbxassetid://7733975185",
	["shrink"]= "rbxassetid://7734056971",
	["mail"]= "rbxassetid://7733992732",
	["pause"]= "rbxassetid://7734021897",
	["bold"]= "rbxassetid://7733687211",
	["calendar"]= "rbxassetid://7733919198",
	["x-octagon"]= "rbxassetid://7743878618",
	["russian-ruble"]= "rbxassetid://7734052248",
	["file-code"]= "rbxassetid://7733779730",
	["life-buoy"]= "rbxassetid://7733973479",
	["import"]= "rbxassetid://7733964240",
	["video"]= "rbxassetid://7743876610",
	["clock-7"]= "rbxassetid://8997385147",
	["align-center-horizontal"]= "rbxassetid://8997380477",
	["bell"]= "rbxassetid://7733911828",
	["move-diagonal-2"]= "rbxassetid://7734013178",
	["message-circle"]= "rbxassetid://7733993311",
	["skull"]= "rbxassetid://7734058599",
	["battery-charging"]= "rbxassetid://7733674402",
	["ruler"]= "rbxassetid://7734052157",
	["binary"]= "rbxassetid://7733678388",
	["cloud-rain-wind"]= "rbxassetid://7733746456",
	["briefcase"]= "rbxassetid://7733919017",
	["terminal-square"]= "rbxassetid://7734079055",
	["scale"]= "rbxassetid://7734052454",
	["lasso"]= "rbxassetid://7733967892",
	["piggy-bank"]= "rbxassetid://7734034513",
	["battery-low"]= "rbxassetid://7733674589",
	["arrow-up"]= "rbxassetid://7733673717",
	["list-plus"]= "rbxassetid://7733984995",
	["bookmark-plus"]= "rbxassetid://7734111084",
	["box-select"]= "rbxassetid://7733696665",
	["filter"]= "rbxassetid://7733798407",
	["play"]= "rbxassetid://7743871480",
	["align-vertical-space-around"]= "rbxassetid://8997382708",
	["calculator"]= "rbxassetid://7733919105",
	["bell-ring"]= "rbxassetid://7733675275",
	["plane"]= "rbxassetid://7734037723",
	["plus-circle"]= "rbxassetid://7734040271",
	["power"]= "rbxassetid://7734042493",
	["phone-missed"]= "rbxassetid://7734029465",
	["percent"]= "rbxassetid://7743870852",
	["jersey-pound"]= "rbxassetid://7733965029",
	["mouse-pointer"]= "rbxassetid://7743870392",
	["box"]= "rbxassetid://7733917120",
	["separator-vertical"]= "rbxassetid://7734053213",
	["snowflake"]= "rbxassetid://7734059180",
	["sort-desc"]= "rbxassetid://7743871973",
	["flag-triangle-right"]= "rbxassetid://7733798634",
	["bar-chart-2"]= "rbxassetid://7733674239",
	["hand-metal"]= "rbxassetid://7733955664",
	["map"]= "rbxassetid://7733992829",
	["eye-off"]= "rbxassetid://7733774495",
	["align-end-horizontal"]= "rbxassetid://8997380820",
	["cloud-rain"]= "rbxassetid://7733746651",
	["contact"]= "rbxassetid://7743866666",
	["signal"]= "rbxassetid://8997387546",
	["mouse-pointer-click"]= "rbxassetid://7734010488",
	["settings-2"]= "rbxassetid://8997386997",
	["sidebar-open"]= "rbxassetid://7734058165",
	["unlink-2"]= "rbxassetid://7743875069",
	["pause-octagon"]= "rbxassetid://7734021827",
	["user-minus"]= "rbxassetid://7743875629",
	["cloud"]= "rbxassetid://7733746980",
	["arrow-right-circle"]= "rbxassetid://7733673229",
	["align-horizonal-distribute-center"]= "rbxassetid://8997381028",
	["fast-forward"]= "rbxassetid://7743867090",
	["volume-2"]= "rbxassetid://7743877250",
	["grab"]= "rbxassetid://7733954884",
	["arrow-right"]= "rbxassetid://7733673345",
	["chevron-down"]= "rbxassetid://7733717447",
	["volume-x"]= "rbxassetid://7743877381",
	["cloud-snow"]= "rbxassetid://7733746798",
	["car"]= "rbxassetid://7733708835",
	["bluetooth-connected"]= "rbxassetid://7734110952",
	["CD"]= "rbxassetid://7734110220",
	["cookie"]= "rbxassetid://8997385628",
	["message-square"]= "rbxassetid://7733993369",
	["repeat-1"]= "rbxassetid://7734051342",
	["codepen"]= "rbxassetid://7733920768",
	["voicemail"]= "rbxassetid://7743876916",
	["text-cursor-input"]= "rbxassetid://8997388094",
	["package-check"]= "rbxassetid://8997386143",
	["shopping-cart"]= "rbxassetid://7734056813",
	["corner-down-right"]= "rbxassetid://7733764385",
	["folder-open"]= "rbxassetid://8997386062",
	["charge"]= "rbxassetid://8997383136",
	["layout-grid"]= "rbxassetid://7733970390",
	["clock"]= "rbxassetid://7733734848",
	["corner-up-left"]= "rbxassetid://7733764800",
	["align-horizontal-justify-start"]= "rbxassetid://8997381652",
	["git-merge"]= "rbxassetid://7733952195",
	["verified"]= "rbxassetid://7743876142",
	["redo"]= "rbxassetid://7743871739",
	["hexagon"]= "rbxassetid://7743868527",
	["square"]= "rbxassetid://7743872181",
	["align-horizontal-justify-center"]= "rbxassetid://8997381461",
	["chevrons-up-down"]= "rbxassetid://7733723321",
	["bus"]= "rbxassetid://7733701715",
	["file-plus-2"]= "rbxassetid://7733788816",
	["alarm-plus"]= "rbxassetid://7733658066",
	["divide-square"]= "rbxassetid://7733769261",
	["pie-chart"]= "rbxassetid://7734034378",
	["signal-zero"]= "rbxassetid://8997387434",
	["hammer"]= "rbxassetid://7733955511",
	["history"]= "rbxassetid://7733960880",
	["align-vertical-justify-start"]= "rbxassetid://8997382639",
	["flask-round"]= "rbxassetid://7733798957",
	["wifi-off"]= "rbxassetid://7743878056",
	["zoom-out"]= "rbxassetid://7743879082",
	["toggle-right"]= "rbxassetid://7743873539",
	["monitor"]= "rbxassetid://7734002839",
	["x"]= "rbxassetid://7743878857",
	["align-horizonal-distribute-end"]= "rbxassetid://8997381144",
	["user"]= "rbxassetid://7743875962",
	["sprout"]= "rbxassetid://7743872071",
	["move"]= "rbxassetid://7743870731",
	["gavel"]= "rbxassetid://7733800044",
	["package-minus"]= "rbxassetid://8997386266",
	["drumstick"]= "rbxassetid://8997385789",
	["forward"]= "rbxassetid://7733799371",
	["sidebar-close"]= "rbxassetid://7734058092",
	["electricity"]= "rbxassetid://7733771628",
	["plus"]= "rbxassetid://7734042071",
	["pipette"]= "rbxassetid://7743871384",
	["cloud-lightning"]= "rbxassetid://7733741741",
	["lasso-select"]= "rbxassetid://7743868832",
	["phone-call"]= "rbxassetid://7734027264",
	["droplet"]= "rbxassetid://7733770982",
	["key"]= "rbxassetid://7733965118",
	["map-pin"]= "rbxassetid://7733992789",
	["navigation-2"]= "rbxassetid://7734020942",
	["list-minus"]= "rbxassetid://7733980795",
	["chevron-up"]= "rbxassetid://7733919605",
	["layout-template"]= "rbxassetid://7733970494",
	["no_entry"]= "rbxassetid://7734021118",
	["scan"]= "rbxassetid://8997386861",
	["arrow-big-up"]= "rbxassetid://7733671663",
	["bookmark-minus"]= "rbxassetid://7733689754",
	["activity"]= "rbxassetid://7733655755",
	["grid"]= "rbxassetid://7733955179",
	["user-x"]= "rbxassetid://7743875879",
	["alert-circle"]= "rbxassetid://7733658271",
	["menu"]= "rbxassetid://7733993211",
	["form-input"]= "rbxassetid://7733799275",
	["rss"]= "rbxassetid://7734052075",
	["loader"]= "rbxassetid://7733992358",
	["align-vertical-distribute-end"]= "rbxassetid://8997382326",
	["strikethrough"]= "rbxassetid://7734068425",
	["mic"]= "rbxassetid://7743869805",
	["landmark"]= "rbxassetid://7733965184",
	["crosshair"]= "rbxassetid://7733765307",
	["alert-octagon"]= "rbxassetid://7733658335",
	["anchor"]= "rbxassetid://7733911490",
	["separator-horizontal"]= "rbxassetid://7734053146",
	["chevron-left"]= "rbxassetid://7733717651",
	["flask-conical"]= "rbxassetid://7733798901",
	["wallet"]= "rbxassetid://7743877573",
	["euro"]= "rbxassetid://7733771891",
	["trash-2"]= "rbxassetid://7743873772",
	["check-circle"]= "rbxassetid://7733919427",
	["layout"]= "rbxassetid://7733970543",
	["droplets"]= "rbxassetid://7733771078",
	["align-start-vertical"]= "rbxassetid://8997382085",
	["rotate-cw"]= "rbxassetid://7734051957",
	["minimize"]= "rbxassetid://7733997941",
	["arrow-down-left"]= "rbxassetid://7733672282",
	["signal-medium"]= "rbxassetid://8997387319",
	["align-vertical-distribute-center"]= "rbxassetid://8997382212",
	["image-off"]= "rbxassetid://7733963907",
	["cloudy"]= "rbxassetid://7733747106",
	["align-left"]= "rbxassetid://7733911357",
	["film"]= "rbxassetid://7733942579",
	["chevrons-down"]= "rbxassetid://7733720604",
	["pointer"]= "rbxassetid://7734042307",
	["folder"]= "rbxassetid://7733799185",
	["chevrons-left"]= "rbxassetid://7733720701",
	["shield-off"]= "rbxassetid://7734056540",
	["wrench"]= "rbxassetid://7743878358"
}

local Themes = {
	Red = {
		Background = Color3.fromRGB(40, 10, 10),
		Sidebar = Color3.fromRGB(55, 15, 15),
		Accent = Color3.fromRGB(255, 80, 80),
		Text = Color3.fromRGB(255, 200, 200),
		TextDark = Color3.fromRGB(150, 70, 70),
		Element = Color3.fromRGB(50, 15, 15),
		Stroke = Color3.fromRGB(70, 25, 25),
		toggleActive = Color3.fromRGB(255, 100, 100),
		toggleInActive = Color3.fromRGB(255, 150, 150),
	},
	Orange = {
		Background = Color3.fromRGB(30, 15, 5),
		Sidebar = Color3.fromRGB(45, 25, 10),
		Accent = Color3.fromRGB(255, 150, 50),
		Text = Color3.fromRGB(255, 220, 180),
		TextDark = Color3.fromRGB(150, 100, 50),
		Element = Color3.fromRGB(40, 20, 10),
		Stroke = Color3.fromRGB(60, 35, 20),
		toggleActive = Color3.fromRGB(255, 150, 50),
		toggleInActive = Color3.fromRGB(255, 180, 100),
	},
	Yellow = {
		Background = Color3.fromRGB(40, 40, 10),
		Sidebar = Color3.fromRGB(55, 55, 15),
		Accent = Color3.fromRGB(255, 255, 80),
		Text = Color3.fromRGB(255, 255, 200),
		TextDark = Color3.fromRGB(150, 150, 70),
		Element = Color3.fromRGB(50, 50, 15),
		Stroke = Color3.fromRGB(70, 70, 25),
		toggleActive = Color3.fromRGB(255, 255, 80),
		toggleInActive = Color3.fromRGB(255, 255, 150),
	},
	Green = {
		Background = Color3.fromRGB(10, 30, 10),
		Sidebar = Color3.fromRGB(15, 45, 15),
		Accent = Color3.fromRGB(80, 255, 80),
		Text = Color3.fromRGB(200, 255, 200),
		TextDark = Color3.fromRGB(70, 150, 70),
		Element = Color3.fromRGB(15, 40, 15),
		Stroke = Color3.fromRGB(25, 60, 25),
		toggleActive = Color3.fromRGB(80, 255, 80),
		toggleInActive = Color3.fromRGB(150, 255, 150),
	},
	Aqua = {
		Background = Color3.fromRGB(10, 20, 20),
		Sidebar = Color3.fromRGB(15, 25, 25),
		Accent = Color3.fromRGB(0, 255, 200),
		Text = Color3.fromRGB(240, 255, 250),
		TextDark = Color3.fromRGB(100, 150, 150),
		Element = Color3.fromRGB(20, 35, 35),
		Stroke = Color3.fromRGB(30, 50, 50),
		toggleActive = Color3.fromRGB(0, 255, 200),
		toggleInActive = Color3.fromRGB(150, 200, 200),
	},
	Blue = {
		Background = Color3.fromRGB(15, 15, 40),
		Sidebar = Color3.fromRGB(25, 25, 55),
		Accent = Color3.fromRGB(100, 125, 255),
		Text = Color3.fromRGB(220, 220, 255),
		TextDark = Color3.fromRGB(140, 140, 150),
		Element = Color3.fromRGB(28, 28, 35),
		Stroke = Color3.fromRGB(45, 45, 55),
		toggleActive = Color3.fromRGB(100, 125, 255),
		toggleInActive = Color3.fromRGB(30,30,40),
	},
	Purple = {
		Background = Color3.fromRGB(30, 15, 40),
		Sidebar = Color3.fromRGB(45, 25, 55),
		Accent = Color3.fromRGB(200, 100, 255),
		Text = Color3.fromRGB(255, 230, 255),
		TextDark = Color3.fromRGB(150, 120, 150),
		Element = Color3.fromRGB(35, 20, 50),
		Stroke = Color3.fromRGB(60, 40, 70),
		toggleActive = Color3.fromRGB(200, 100, 255),
		toggleInActive = Color3.fromRGB(255, 200, 255),
	},
	Dark = {
		Background = Color3.fromRGB(25, 25, 25),
		Sidebar = Color3.fromRGB(35, 35, 35),
		Accent = Color3.fromRGB(200, 200, 200),
		Text = Color3.fromRGB(240, 240, 240),
		TextDark = Color3.fromRGB(160, 160, 160),
		Element = Color3.fromRGB(45, 45, 45),
		Stroke = Color3.fromRGB(60, 60, 60),
		toggleActive = Color3.fromRGB(100, 125, 255),
		toggleInActive = Color3.fromRGB(25, 25, 25),
	},
	Light = {
		Background = Color3.fromRGB(245, 245, 245),
		Sidebar = Color3.fromRGB(230, 230, 230),
		Accent = Color3.fromRGB(60, 60, 60),
		Text = Color3.fromRGB(40, 40, 40),
		TextDark = Color3.fromRGB(100, 100, 100),
		Element = Color3.fromRGB(215, 215, 215),
		Stroke = Color3.fromRGB(190, 190, 190),
		toggleActive = Color3.fromRGB(100, 125, 255),
		toggleInActive = Color3.fromRGB(25, 25, 25),
	}
}
local CurrentTheme = Themes.Dark

function module:importTheme(theme)
	if typeof(theme) == "table" then
		for name, values in pairs(theme) do
			if typeof(values) == "table" then
				Themes[name] = values
			end
		end
	end
end

local isSaveble = false

function module:Init(UId)
	module.UName = string.format("%s|PId-%s|V-%s", UId, game.PlaceId, module.I.Version)
	
	if not writefile and not readfile then return end
	
	local fold = false
	if isfolder and not isfolder(folderName) then
		make_folder(folderName)
		fold = true
	elseif not listfiles()[folderName] then
		make_folder(folderName)
		fold = true
	end
	local configPath = fold and folderName..module.UName or module.UName
	isSaveble = true
end

-- HELPERS

local function roundToStep(value, step)
	local precision = 0
	if step < 1 then
		precision = math.ceil(math.abs(math.log10(step)))
	end
	local mult = 10 ^ precision
	return math.floor(value * mult + 0.5) / mult
end

local function addUICorner(instance, radius)
	local c = Instance.new("UICorner", instance)
	c.CornerRadius = UDim.new(0, radius)
end
local function rippleEffect(button)
	if not button then return end

	button.ClipsDescendants = true
	local debounce = false

	button.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if debounce then return end
		debounce = true

		local ripple = Instance.new("Frame", button)
		ripple.BackgroundColor3 = CurrentTheme.Accent
		ripple.BackgroundTransparency = 0.6
		ripple.BorderSizePixel = 0
		ripple.AnchorPoint = Vector2.new(0.5,0.5)
		ripple.Size = UDim2.fromOffset(0,0)

		local clickPos = input.Position
		local relativeX = clickPos.X - button.AbsolutePosition.X
		local relativeY = clickPos.Y - button.AbsolutePosition.Y

		ripple.Position = UDim2.fromOffset(relativeX, relativeY)

		addUICorner(ripple, 999)

		local sizeX = math.max(relativeX, button.AbsoluteSize.X - relativeX)
		local sizeY = math.max(relativeY, button.AbsoluteSize.Y - relativeY)
		local diameter = math.sqrt(sizeX^2 + sizeY^2) * 2

		tweenService:Create(
			ripple,
			TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{
				Size = UDim2.fromOffset(diameter, diameter),
				BackgroundTransparency = 1
			}
		):Play()

		task.delay(0.45, function()
			if ripple then
				ripple:Destroy()
			end
			debounce = false
		end)
	end)
end
local function addUIStroke(instance, color, thickness)
	local s = Instance.new("UIStroke", instance)
	s.Color = color or CurrentTheme.Stroke
	s.Thickness = thickness or 1
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s:SetAttribute("ThemeColor", "Stroke")
	return s
end
local function tween(obj, time, props, style, dir)
	return tweenService:Create(
		obj,
		TweenInfo.new(time or 0.25, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out),
		props
	)
end
local function addHover(frame, target, original)
	local function getColor(val)
		if type(val) == "string" then
			return CurrentTheme[val] or Color3.new(1, 1, 1)
		elseif type(val) == "userdata" then 
			return val
		end
		return val
	end

	frame.MouseEnter:Connect(function()
		tween(frame, 0.15, {BackgroundColor3 = getColor(target)}):Play()
	end)

	frame.MouseLeave:Connect(function()
		tween(frame, 0.15, {BackgroundColor3 = getColor(original)}):Play()
	end)
end

local flags = {}
local saveDebounce = false

local function saveConfig()
	if not isSaveble then return end
	if type(writefile) ~= "function" then return end

	if saveDebounce then return end
	saveDebounce = true

	task.spawn(function()
		local success, err = pcall(function()
			local encoded = httpService:JSONEncode(flags)
			local fileName = tostring(module.UName):gsub("%W", "") .. ".json"
			writefile(fileName, encoded)
		end)

		if not success then
			warn("Save Error: " .. tostring(err))
		end

		task.wait(0.5)
		saveDebounce = false
	end)
end

------------------------------------------------------------------
-- WINDOW
------------------------------------------------------------------

--[[
Themes:
Red; Orange; Yellow; Green; Blue; Purple; Aqua; Dark; Light
]]
function module:CreateWindow(options)
	local title = options.Title or "Non UI"
	local theme = Themes[options.Theme] or Themes.Dark
	CurrentTheme = theme or Themes.Dark

	local fileName = tostring(module.UName):gsub("%W", "") .. ".json"
	flags = {}

	if isSaveble and type(readfile) == "function" then
		if isfile(fileName) then
			local success, decoded = pcall(function()
				return httpService:JSONDecode(readfile(fileName))
			end)
			if success and type(decoded) == "table" then
				flags = decoded 
			end
		end
	end

	local gui = Instance.new("ScreenGui", (gethui and gethui()) or game.CoreGui or plr.PlayerGui)
	gui.Name = httpService:GenerateGUID(false)
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = true

	------------------------------------------------
	-- MAIN FRAME
	------------------------------------------------
	local isMobile = inputService.TouchEnabled and not inputService.KeyboardEnabled

	local main = Instance.new("CanvasGroup", gui)
	main.Size = isMobile and UDim2.new(.85,0,.75,0) or UDim2.new(0,720,0,500)
	main.AnchorPoint = isMobile and Vector2.new(.5,.0) or Vector2.new(.5,0,0,0)
	main.Position = isMobile and UDim2.new(0.5,0,0.15,0) or UDim2.new(0.5,0,0.1,0)
	main.BackgroundColor3 = CurrentTheme.Background
	main.GroupTransparency = 1
	main:SetAttribute("ThemeBackground","Background")

	addUICorner(main, 14)
	addUIStroke(main)

	local targetSize = isMobile and UDim2.new(.85,0,.75,0) or UDim2.new(0, 720, 0, 500)
	tween(main, 0.35, {Size = targetSize}):Play()
	tween(main, 0.35, {GroupTransparency = 0}):Play()

	------------------------------------------------
	-- HEADER
	------------------------------------------------

	local header = Instance.new("Frame", main)
	header.Size = UDim2.new(1,0,0,55)
	header.BackgroundTransparency = 1
	header:SetAttribute("ThemeRole","None")

	local titleL = Instance.new("TextLabel", header)
	titleL.Size = UDim2.new(1,-140,1,0)
	titleL.Position = UDim2.new(0,20,0,0)
	titleL.Text = title
	titleL.Font = Enum.Font.GothamBold
	titleL.TextSize = 20
	titleL.TextColor3 = CurrentTheme.Accent
	titleL.BackgroundTransparency = 1
	titleL.TextXAlignment = Enum.TextXAlignment.Left
	titleL:SetAttribute("ThemeText","Accent")

	local contentGroup = Instance.new("CanvasGroup", main)
	contentGroup.Size = UDim2.new(1,0,1,-55)
	contentGroup.Position = UDim2.new(0,0,0,55)
	contentGroup.BackgroundTransparency = 1
	contentGroup.GroupTransparency = 0

	------------------------------------------------
	-- DRAG SYSTEM
	------------------------------------------------

	local dragging = false
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end

	header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	inputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			update(input)
		end
	end)

	inputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)


	local closeBtn = Instance.new("TextButton", header)
	closeBtn.Size = UDim2.new(0,40,0,40)
	closeBtn.Position = UDim2.new(1,-45,0,7)
	closeBtn.Text = "×"
	closeBtn.TextSize = 28
	closeBtn.TextColor3 = Color3.fromRGB(255,100,100)
	closeBtn.BackgroundTransparency = 1
	closeBtn:SetAttribute("ThemeRole","None")

	closeBtn.MouseButton1Click:Connect(function()
		tween(main,0.25,{GroupTransparency = 1}):Play()
		tween(main,0.25,{Size = UDim2.new(0,720,0,0)}):Play()
		task.wait(0.25)
		gui:Destroy()
	end)
	
	local minBtn = Instance.new("TextButton", header)
	minBtn.Name = "min_btn"
	minBtn.Size = UDim2.new(0,40,0,40)
	minBtn.Position = UDim2.new(1,-90,0,7)
	minBtn.Text = "−"
	minBtn.TextSize = 24
	minBtn.TextColor3 = CurrentTheme.TextDark
	minBtn.BackgroundTransparency = 1
	minBtn.AutoButtonColor = false
	minBtn:SetAttribute("ThemeText","TextDark")
	
	local searchBtn = Instance.new("ImageButton", header)
	searchBtn.Name = "search_btn"
	searchBtn.Size = UDim2.new(0,40,0,40)
	searchBtn.Position = UDim2.new(1,-155,0,7)
	searchBtn.Image = module.lucide_icons.search
	searchBtn.ImageColor3 = CurrentTheme.TextDark
	searchBtn.BackgroundTransparency = 1
	searchBtn.AutoButtonColor = false

	------------------------------------------------
	-- PREMIUM MINIMIZE SYSTEM (PC + MOBILE)
	------------------------------------------------

	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local TextService = game:GetService("TextService")

	local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

	local minimized = false
	local animating = false

	main.AnchorPoint = Vector2.new(0.5, 0)

	local storedSize = main.Size
	local storedPosition = main.Position

	main.ClipsDescendants = true

	------------------------------------------------
	-- TWEEN HELPER
	------------------------------------------------
	local function tween(obj,time,props,style,direction)
		style = style or Enum.EasingStyle.Quint
		direction = direction or Enum.EasingDirection.Out

		local info = TweenInfo.new(time,style,direction)
		local tw = TweenService:Create(obj,info,props)
		tw:Play()
		return tw
	end

	------------------------------------------------
	-- FLOATING OPEN BUTTON (MOBILE)
	------------------------------------------------
	local openBtn = Instance.new("TextButton", gui)
	openBtn.AnchorPoint = Vector2.new(0.5,0.5)
	openBtn.Position = UDim2.new(0.5,0,0.5,0)
	openBtn.Size = UDim2.new(0,0,0,0)
	openBtn.BackgroundColor3 = CurrentTheme.Accent
	openBtn.Text = "UI"
	openBtn.TextColor3 = Color3.new(1,1,1)
	openBtn.TextSize = 18
	openBtn.Font = Enum.Font.GothamBold
	openBtn.Visible = false
	openBtn.AutoButtonColor = false
	openBtn:SetAttribute("ThemeBackground","Accent")

	addUICorner(openBtn, 30)
	addUIStroke(openBtn)
	rippleEffect(openBtn)

	------------------------------------------------
	-- MOBILE DRAG SYSTEM
	------------------------------------------------
	do
		local dragging = false
		local dragStart
		local startPos

		openBtn.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				dragStart = input.Position
				startPos = openBtn.Position
			end
		end)

		inputService.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
				local delta = input.Position - dragStart

				local newX = startPos.X.Offset + delta.X
				local newY = startPos.Y.Offset + delta.Y


				local parentSize = gui.AbsoluteSize
				newX = math.clamp(newX, -openBtn.AbsolutePosition.X + openBtn.Position.X.Offset, parentSize.X - openBtn.AbsoluteSize.X)
				newY = math.clamp(newY, -openBtn.AbsolutePosition.Y + openBtn.Position.Y.Offset, parentSize.Y - openBtn.AbsoluteSize.Y)

				openBtn.Position = UDim2.new(startPos.X.Scale, newX, startPos.Y.Scale, newY)
			end
		end)

		inputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
			end
		end)
	end

	

	------------------------------------------------
	-- MOBILE OPEN LOGIC
	------------------------------------------------
	openBtn.MouseButton1Click:Connect(function()
		if animating then return end
		animating = true

		openBtn.Visible = false
		main.Visible = true

		main.Position = UDim2.new(
			storedPosition.X.Scale,
			storedPosition.X.Offset,
			1.2,0
		)

		contentGroup.GroupTransparency = 1

		tween(main,0.4,{
			Position = storedPosition
		},Enum.EasingStyle.Back,Enum.EasingDirection.Out)

		tween(contentGroup,0.3,{
			GroupTransparency = 0
		})

		task.wait(0.4)
		minimized = false
		animating = false
	end)

	------------------------------------------------
	-- MAIN MINIMIZE LOGIC
	------------------------------------------------
	minBtn.MouseButton1Click:Connect(function()
		if animating then return end
		animating = true

		if not minimized then
			minimized = true

			if isMobile then
				storedPosition = main.Position

				tween(main,0.35,{
					Position = UDim2.new(
						storedPosition.X.Scale,
						storedPosition.X.Offset,
						1.2,0
					)
				},Enum.EasingStyle.Back,Enum.EasingDirection.In)

				tween(contentGroup,0.25,{
					GroupTransparency = 1
				})

				task.wait(0.35)
				main.Visible = false

				openBtn.Size = UDim2.new(0,0,0,0)
				openBtn.Visible = true

				tween(openBtn,0.3,{
					Size = UDim2.new(0,70,0,70)
				},Enum.EasingStyle.Back,Enum.EasingDirection.Out)

			else
				------------------------------------
				-- PC TRUE HEADER COLLAPSE
				------------------------------------
				storedSize = main.Size
				local headerHeight = header.AbsoluteSize.Y
				local textLabel = titleL
				local originalTextSize = textLabel.TextSize

				tween(contentGroup,0.18,{
					GroupTransparency = 1
				})

				local textBounds = TextService:GetTextSize(
					textLabel.Text,
					textLabel.TextSize,
					textLabel.Font,
					Vector2.new(storedSize.X.Offset, headerHeight)
				)

				local buttonAreaWidth = 200
				local textWidth = TextService:GetTextSize(
					textLabel.Text,
					textLabel.TextSize,
					textLabel.Font,
					Vector2.new(storedSize.X.Offset - buttonAreaWidth, headerHeight)
				).X

				local targetWidth = math.max(textWidth + 20 + buttonAreaWidth, 150) 
				tween(main,0.25,{
					Size = UDim2.new(0, targetWidth, 0, headerHeight)
				},Enum.EasingStyle.Cubic,Enum.EasingDirection.Out)

				tween(minBtn,0.15,{
					Rotation = 180
				})
				minBtn.Text = "+"
			end
		else
			minimized = false

			if isMobile then
				------------------------------------
				-- MOBILE RESTORE
				------------------------------------
				openBtn.Visible = false
				main.Visible = true

				tween(main,0.4,{
					Position = storedPosition
				},Enum.EasingStyle.Back,Enum.EasingDirection.Out)

				tween(contentGroup,0.3,{
					GroupTransparency = 0
				})

			else
				------------------------------------
				-- PC RESTORE
				------------------------------------
				local restoreSize = isMobile and UDim2.new(.85,0,.75,0) or UDim2.new(0, 720, 0, 500)
				tween(main, 0.3, {
					Size = restoreSize
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

				tween(contentGroup,0.22,{
					GroupTransparency = 0
				})

				tween(minBtn,0.15,{
					Rotation = 0
				})

				minBtn.Text = "−"
			end
		end

		task.wait(0.35)
		animating = false
	end)

	------------------------------------------------
	-- BODY
	------------------------------------------------


	local sidebar = Instance.new("ScrollingFrame", contentGroup)
	sidebar.Name = "Sidebar"
	sidebar.Size = UDim2.new(0,200,1,0)
	sidebar.Position = UDim2.new(0,0,0,0)
	sidebar.BackgroundColor3 = CurrentTheme.Sidebar
	sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
	sidebar.CanvasSize = UDim2.new(0,0,0,0)
	sidebar.ScrollBarThickness = 1
	sidebar:SetAttribute("ThemeBackground","Sidebar")
	addUICorner(sidebar, 12)

	local lgLayout = Instance.new("UIListLayout", sidebar)
	lgLayout.Name = "layout"
	lgLayout.FillDirection = Enum.FillDirection.Vertical
	lgLayout.Padding = UDim.new(0,6)
	lgLayout:SetAttribute("ThemeRole","None")
	
	local excFolder = Instance.new("Folder", sidebar)
	excFolder.Name = "excludeFold"
	
	local accentBar = Instance.new("Frame", excFolder)
	accentBar.Name = "accentBar"
	accentBar.BackgroundColor3 = CurrentTheme.Accent
	accentBar:SetAttribute("ThemeBackground", "Accent")
	accentBar.Size = UDim2.new(0,8,0,25)
	accentBar.Position = UDim2.new(0,5,0,10)
	addUICorner(accentBar, 12)

	local container = Instance.new("Frame", contentGroup)
	container.Name = "Container"
	container.Size = UDim2.new(1,-200,1,0)
	container.Position = UDim2.new(0,203,0,0)
	container.BackgroundTransparency = 1
	container.ClipsDescendants = true
	lgLayout:SetAttribute("ThemeRole","container")


	local pageLayout = Instance.new("UIPageLayout", container)
	pageLayout.Name = "pageLayout"
	pageLayout.Padding = UDim.new(0,5)
	pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	pageLayout.TweenTime = 0.25
	pageLayout.EasingStyle = Enum.EasingStyle.Quint
	pageLayout.EasingDirection = Enum.EasingDirection.Out
	pageLayout:SetAttribute("ThemeRole","None")


	------------------------------------------------
	-- NOTIFY HOLDER
	------------------------------------------------

	local notifyHolder = Instance.new("Frame", gui)
	notifyHolder.Name = "NotifyHolder"
	notifyHolder.Size = UDim2.new(0,300,1,-20)
	notifyHolder.Position = UDim2.new(1,-320,0,10)
	notifyHolder.BackgroundTransparency = 1
	notifyHolder:SetAttribute("ThemeRole","None")


	local layout = Instance.new("UIListLayout", notifyHolder)
	layout.Name = "layout" 
	layout.Padding = UDim.new(0,10)
	layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	layout:SetAttribute("ThemeRole","None")


	------------------------------------------------
	-- WINDOW OBJECT
	------------------------------------------------

	local window = {}
	window._gui = gui
	window._main = main
	window._titleLabel = titleL
	window._sidebar = sidebar
	window._container = container
	window._storedSize = main.Size
	window._minimized = false
	window._ActiveDropdown = nil
	window._objsCount = 0
	window._ActiveTab = nil

	function window:SetTitle(text)

		local label = window._titleLabel
		if not label then return end

		tween(label,0.15,{
			TextTransparency = 1
		}):Play()

		task.wait(0.15)

		label.Text = text

		tween(label,0.15,{
			TextTransparency = 0
		}):Play()
	end

	function window.Notify(text, duration, options)
		duration = duration or 3
		options = options or {}

		local iconImage = options.icon or "rbxassetid://10734950309"
		local link = options.link or nil

		task.spawn(function()

			local sound = Instance.new("Sound", game:GetService("SoundService"))
			sound.SoundId = "rbxassetid://139162619516355"
			sound.Volume = 0.5
			sound:Play()
			game:GetService("Debris"):AddItem(sound,2)

			local n = Instance.new("Frame", notifyHolder)
			n.Size = UDim2.new(1,0,0,0)
			n.Position = UDim2.new(1,30,0,0)
			n.BackgroundColor3 = CurrentTheme.Element
			n.BackgroundTransparency = 1
			n.AutomaticSize = Enum.AutomaticSize.Y
			n.ClipsDescendants = true
			n:SetAttribute("ThemeBackground","Element")

			addUICorner(n,10)

			local stroke = addUIStroke(n)
			stroke.Transparency = 1
			stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

			local padding = Instance.new("UIPadding", n)
			padding.PaddingTop = UDim.new(0,5)
			padding.PaddingBottom = UDim.new(0,14)
			padding.PaddingLeft = UDim.new(0,12)
			padding.PaddingRight = UDim.new(0,12)

			local icon = Instance.new("ImageLabel", n)
			icon.Size = UDim2.new(0,20,0,20)
			icon.Position = UDim2.new(0,12,0,10)
			icon.BackgroundTransparency = 1
			icon.ImageColor3 = CurrentTheme.Accent
			icon.ImageTransparency = 1
			icon.Image = iconImage

			local lbl = Instance.new("TextLabel", n)
			lbl.Size = UDim2.new(1,-50,0,0)
			lbl.Position = UDim2.new(0,42,0,12)
			lbl.BackgroundTransparency = 1
			lbl.Text = text
			lbl.TextWrapped = true
			lbl.Font = Enum.Font.GothamMedium
			lbl.TextSize = 13
			lbl.TextColor3 = CurrentTheme.Text
			lbl.TextTransparency = 1
			lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.AutomaticSize = Enum.AutomaticSize.Y
			lbl:SetAttribute("ThemeText","Text")

			local barBg = Instance.new("Frame", n)
			barBg.Size = UDim2.new(1,0,0,2)
			barBg.Position = UDim2.new(0,0,1,5)
			barBg.BackgroundColor3 = CurrentTheme.Accent
			barBg.BackgroundTransparency = 0.8
			barBg.BorderSizePixel = 0

			local bar = Instance.new("Frame", barBg)
			bar.Size = UDim2.new(1,0,1,0)
			bar.BackgroundColor3 = CurrentTheme.Accent
			bar.BorderSizePixel = 0
			bar:SetAttribute("ThemeBackground","Accent")

			local hover = false

			n.MouseEnter:Connect(function()
				hover = true
				tween(n,0.2,{BackgroundTransparency = 0}):Play()
			end)

			n.MouseLeave:Connect(function()
				hover = false
				tween(n,0.2,{BackgroundTransparency = 0.05}):Play()
			end)

			if link then
				n.InputBegan:Connect(function(i)
					if i.UserInputType == Enum.UserInputType.MouseButton1 then
						setclipboard(link)
					end
				end)
			end

			tween(n,0.35,{
				BackgroundTransparency = 0.05,
				Position = UDim2.new(0,0,0,0)
			}):Play()

			tween(lbl,0.35,{TextTransparency = 0}):Play()
			tween(icon,0.35,{ImageTransparency = 0}):Play()
			tween(stroke,0.35,{Transparency = 0.7}):Play()

			local start = tick()

			while tick() - start < duration do
				if not hover then
					bar.Size = UDim2.new(
						1 - ((tick() - start)/duration),
						0,
						1,
						0
					)
				end
				task.wait()
			end

			local close = tween(n,0.35,{
				BackgroundTransparency = 1,
				Position = UDim2.new(1,30,0,0)
			})

			tween(lbl,0.25,{TextTransparency = 1}):Play()
			tween(icon,0.25,{ImageTransparency = 1}):Play()
			tween(stroke,0.25,{Transparency = 1}):Play()

			close:Play()
			close.Completed:Wait()

			n:Destroy()

		end)
	end

	function window:GetFlags()
		return flags
	end

	function window:SetFlag(name, value)
		flags[name] = value
		saveConfig()
	end

	function window:ResetConfig()
		flags = {}
		saveConfig()
	end

	function window:SetTheme(themeName)
		local newTheme = Themes[themeName]
		if not newTheme then return end

		CurrentTheme = newTheme

		for _, obj in ipairs(window._gui:GetDescendants()) do
			
			if obj:HasTag("SliderBar") then
				if CurrentTheme ~= Themes.Light then
					obj.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
				else
					obj.BackgroundColor3 = CurrentTheme.Sidebar
				end
			end
			
			if obj:GetAttribute("ThemeBackground") then
				tween(obj,1,{
					BackgroundColor3 = newTheme[obj:GetAttribute("ThemeBackground")]
				}):Play()
			end
			
			if obj:GetAttribute("ThemeText") then
				if window._ActiveTab == obj then
					tween(obj,1,{
						TextColor3 = newTheme.Accent
					}):Play()
				else
					tween(obj,1,{
						TextColor3 = newTheme[obj:GetAttribute("ThemeText")]
					}):Play()
				end
				
			end
			
			if obj:GetAttribute("ThemeColor") then
				tween(obj,1,{
					Color = newTheme[obj:GetAttribute("ThemeColor")]
				}):Play()
			end
			
			if obj:GetAttribute("ThemeScrollbar") then
				tween(obj,1,{
					ScrollBarImageColor3 = newTheme[obj:GetAttribute("ThemeScrollbar")]
				}):Play()
			end
			
		end
	end
	
	searchBtn.MouseButton1Click:Connect(function()
		window.Notify("Coming in a future updates!", 5, {icon = module.lucide_icons.info})
	end)
	
	local isfirst = true
	function window:AddTab(name)
		local tBtn = Instance.new("TextButton", sidebar)
		tBtn.Size = UDim2.new(1, -10, 0, 45)
		tBtn.TextSize = 17
		tBtn.BackgroundTransparency = 1
		tBtn.Text = "  " .. name
		tBtn.TextColor3 = isfirst and CurrentTheme.Accent or CurrentTheme.TextDark
		tBtn.Font = Enum.Font.GothamMedium
		tBtn.TextXAlignment = "Left"
		tBtn:SetAttribute("ThemeText","TextDark")
		if isfirst then
			isfirst = false
			window._ActiveTab = tBtn
		end
		
		local padding = Instance.new("UIPadding", tBtn)
		padding.PaddingLeft = UDim.new(0,10)
		
		local page = Instance.new("ScrollingFrame", container)
		page.Size = UDim2.new(.985, 0, 1, 0)
		page.BackgroundTransparency = 1
		page.ScrollBarThickness = 2
		page.ScrollBarImageColor3 = CurrentTheme.Accent
		page.AutomaticCanvasSize = Enum.AutomaticSize.Y
		page.ClipsDescendants = true
		page:SetAttribute("ThemeScrollbar","Accent")
		
		local offset = Instance.new("Frame", page)
		offset.Size = UDim2.new(0.05, 0, 0, 10)
		offset.Interactable = false
		offset.LayoutOrder = -666
		offset.BackgroundTransparency = 1
		offset.Name = "tabOffset"
		
		local pList = Instance.new("UIListLayout", page)
		pList.Padding = UDim.new(.01, 5)
		pList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		pList.SortOrder = Enum.SortOrder.LayoutOrder

		pList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			page.CanvasSize = UDim2.new(0, 0, 0, pList.AbsoluteContentSize.Y + 10)
		end)

		tBtn.MouseButton1Click:Connect(function()
			pageLayout:JumpTo(page)
			for _, v in ipairs(sidebar:GetChildren()) do
				if v:IsA("TextButton") then v.TextColor3 = CurrentTheme.TextDark end
			end
			tBtn.TextColor3 = CurrentTheme.Accent

			local relativeY = (tBtn.AbsolutePosition.Y - sidebar.AbsolutePosition.Y) + sidebar.CanvasPosition.Y
			local centerOffsetY = (tBtn.AbsoluteSize.Y / 2) - (accentBar.Size.Y.Offset / 2)

			tweenService:Create(accentBar, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Position = UDim2.new(0, 5, 0, relativeY + centerOffsetY)
			}):Play()
			
			window._ActiveTab = tBtn
		end)

		local elements = {}
		function elements:AddLabel(text: string)
			local parent = self.Container or page

			local label = Instance.new("TextLabel", parent)
			label.Name = "Label_" .. text:sub(1, 10)
			label.Text = text
			label.Size = UDim2.new(1, -10, 0, 0)
			label.BackgroundTransparency = 0
			label.BackgroundColor3 = CurrentTheme.Element
			label.TextColor3 = CurrentTheme.Text
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.Font = Enum.Font.GothamBold
			label.TextSize = 20
			label.TextWrapped = true
			label.AutomaticSize = Enum.AutomaticSize.Y
			label:SetAttribute("ThemeText", "Text")
			label:SetAttribute("ThemeBackground", "Element")
			
			addUICorner(label, 5)
			addUIStroke(label, CurrentTheme.Stroke)


			local padding = Instance.new("UIPadding", label)
			padding.PaddingLeft = UDim.new(0, 8)
			padding.PaddingRight = UDim.new(0, 8)
			
			local accentBar = Instance.new("Frame", label)
			accentBar.Size = UDim2.new(0, 4, 1, 0)
			accentBar.Position = UDim2.new(0, -9, 0, 0)
			accentBar.BackgroundColor3 = CurrentTheme.Accent
			accentBar.BorderSizePixel = 0
			accentBar.BackgroundTransparency = 0.1
			accentBar:SetAttribute("ThemeBackground","Accent")

			addUICorner(accentBar, 3)

			local grad = Instance.new("UIGradient",accentBar)
			grad.Rotation = 90
			grad.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, CurrentTheme.Accent),
				ColorSequenceKeypoint.new(1, CurrentTheme.Accent:Lerp(Color3.new(1,1,1), 0.25))
			})
			local labObj = {
				Object = label,
				Text = text
			}

			function labObj:Set(newText)
				for i = 1, #newText do
					label.Text = newText:sub(1, i)
					task.wait(0.05)
				end
			end

			return labObj
		end
		
		function elements:AddButton(text, callback)
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -10, 0, 40)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = text
			b.Font = Enum.Font.GothamMedium
			b.TextColor3 = CurrentTheme.Text
			b.TextSize = 20
			b:SetAttribute("ThemeBackground","Element")
			b:SetAttribute("ThemeText","Text")


			addUICorner(b, 8)
			addUIStroke(b)
			rippleEffect(b)
			if typeof(callback) == "function" then
				b.MouseButton1Click:Connect(callback) 
			end
		end

		function elements:AddInput(text, placeholder, callback)
			window._objsCount += 1
			local objId = "input_" .. text:gsub("%s+", "") .. window._objsCount
			callback = typeof(callback) == "function" and callback or function() end
			local currentVal = flags[objId.. "_text"] or ""
			
			local parent = self.Container or page
			local iFrame = Instance.new("Frame", parent)
			iFrame.Size = UDim2.new(1, -20, 0, 70)
			iFrame.BackgroundColor3 = CurrentTheme.Element
			iFrame:SetAttribute("ThemeBackground","Element")
			addUICorner(iFrame, 12)
			addUIStroke(iFrame)

			addHover(iFrame, "Sidebar", "Element")

			local label = Instance.new("TextLabel", iFrame)
			label.Size = UDim2.new(1, -20, 0, 22)
			label.Position = UDim2.new(0, 15, 0, 8)
			label.Text = text
			label.TextColor3 = CurrentTheme.TextDark
			label.Font = Enum.Font.GothamMedium
			label.TextSize = 16
			label.BackgroundTransparency = 1
			label.TextXAlignment = Enum.TextXAlignment.Left
			label:SetAttribute("ThemeText","TextDark")

			local box = Instance.new("TextBox", iFrame)
			box.Size = UDim2.new(1, -30, 0, 32)
			box.Position = UDim2.new(0, 15, 0, 32)
			box.BackgroundColor3 = CurrentTheme.Background
			box.Text = currentVal
			box.PlaceholderText = placeholder or "Enter value..."
			box.PlaceholderColor3 = Color3.fromRGB(140,140,150)
			box.TextColor3 = CurrentTheme.Text
			box.Font = Enum.Font.Gotham
			box.TextSize = 16
			box.ClearTextOnFocus = false
			box.TextXAlignment = Enum.TextXAlignment.Left
			box:SetAttribute("ThemeBackground","Background")
			box:SetAttribute("ThemeText","Text")
			addUICorner(box, 8)
			addUIStroke(box)

			box.Focused:Connect(function()
				tweenService:Create(box, TweenInfo.new(0.15), {
					BackgroundColor3 = CurrentTheme.Background
				}):Play()
			end)

			box.FocusLost:Connect(function()
				tweenService:Create(box, TweenInfo.new(0.15), {
					BackgroundColor3 = Color3.fromRGB(30,30,35)
				}):Play()

				flags[objId.. "_text"] = box.Text
				saveConfig()
				if typeof(callback) == "function" then
					callback(box.Text)
				end
			end)

			if currentVal ~= "" then
				callback(currentVal)
			end
		end

		function elements:AddToggle(text, callback)
			window._objsCount += 1
			local objId = "toggle_" .. text:gsub("%s+", "") .. window._objsCount

			callback = typeof(callback) == "function" and callback or function() end
			local state = flags[objId.. "_state"] or false
			
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -10, 0, 52)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = "   " .. text
			b.Font = Enum.Font.GothamMedium
			b.TextSize = 18
			b.TextColor3 = CurrentTheme.Text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.AutoButtonColor = false
			b:SetAttribute("ThemeBackground","Element")
			b:SetAttribute("ThemeText","Text")
			addUICorner(b, 12)
			addUIStroke(b)
			
			addHover(b, "Sidebar", "Element")

			local switch = Instance.new("Frame", b)
			switch.Size = UDim2.new(0, 44, 0, 24)
			switch.Position = UDim2.new(1, -65, 0.5, -12)
			switch.BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
			switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
			addUICorner(switch, 20)

			local dot = Instance.new("Frame", switch)
			dot.Size = UDim2.new(0, 18, 0, 18)
			dot.Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
			dot.BackgroundColor3 = Color3.new(1,1,1)
			addUICorner(dot, 20)

			local function update()
				tweenService:Create(switch, TweenInfo.new(0.2), {
					BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
				}):Play()

				tweenService:Create(dot, TweenInfo.new(0.2), {
					Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
				}):Play()

				flags[objId.. "_state"] = state
				saveConfig()
				if typeof(callback) == "function" then
					callback(state)
				end
			end

			b.MouseButton1Click:Connect(function()
				state = not state
				switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
				update()
			end)

			task.defer(function()
				callback(state)
			end)
		end

		function elements:AddToggleKeybind(text, defaultKey, callback)
			window._objsCount += 1
			local objId = "toggleKeybind_" .. text:gsub("%s+", "") .. window._objsCount
			callback = typeof(callback) == "function" and callback or function() end

			local state = flags[objId.. "_state"] or false
			local key = flags[objId .. "_key"] or defaultKey
			local listening = false
			
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -20, 0, 52)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = "   " .. text
			b.Font = Enum.Font.GothamMedium
			b.TextSize = 18
			b.TextColor3 = CurrentTheme.Text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.AutoButtonColor = false
			b:SetAttribute("ThemeBackground","Element")
			b:SetAttribute("ThemeText","Text")
			addUICorner(b, 12)
			addUIStroke(b)

			addHover(b, "Sidebar", "Element")

			--------------------------------------------------
			-- TOGGLE
			--------------------------------------------------

			local switch = Instance.new("Frame", b)
			switch.Size = UDim2.new(0, 44, 0, 24)
			switch.Position = UDim2.new(1, -170, 0.5, -12)
			switch.BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
			switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
			addUICorner(switch, 20)

			local dot = Instance.new("Frame", switch)
			dot.Size = UDim2.new(0, 18, 0, 18)
			dot.Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
			dot.BackgroundColor3 = Color3.new(1,1,1)
			dot:SetAttribute("ThemeRole","None")

			addUICorner(dot, 20)

			--------------------------------------------------
			-- KEYBIND BOX
			--------------------------------------------------

			local keyLabel = Instance.new("TextLabel", b)
			keyLabel.Size = UDim2.new(0, 80, 0, 28)
			keyLabel.Position = UDim2.new(1, -100, 0.5, -14)
			keyLabel.BackgroundColor3 = CurrentTheme.Background
			keyLabel.Text = key.Name
			keyLabel.Font = Enum.Font.GothamBold
			keyLabel.TextSize = 16
			keyLabel.TextColor3 = CurrentTheme.Accent
			keyLabel.TextXAlignment = Enum.TextXAlignment.Center
			keyLabel:SetAttribute("ThemeBackground","Background")
			keyLabel:SetAttribute("ThemeText","Accent")
			addUICorner(keyLabel, 8)
			addUIStroke(keyLabel)

			--------------------------------------------------
			-- UPDATE FUNCTION
			--------------------------------------------------

			local function update()
				tweenService:Create(switch, TweenInfo.new(0.2), {
					BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
				}):Play()

				tweenService:Create(dot, TweenInfo.new(0.2), {
					Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
				}):Play()

				flags[objId.. "_state"] = state
				saveConfig()
				if typeof(callback) == "function" then
					callback(state)
				end
			end

			--------------------------------------------------
			-- TOGGLE CLICK
			--------------------------------------------------

			b.MouseButton1Click:Connect(function()
				if listening then return end
				state = not state
				switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
				update()
			end)

			--------------------------------------------------
			-- KEY SELECT MODE
			--------------------------------------------------

			keyLabel.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then

					listening = true
					keyLabel.Text = "..."

					tweenService:Create(keyLabel, TweenInfo.new(0.2), {
						BackgroundColor3 = CurrentTheme.Accent
					}):Play()
				end
			end)

			--------------------------------------------------
			-- INPUT LISTENER
			--------------------------------------------------

			inputService.InputBegan:Connect(function(i, gpe)
				if gpe then return end

				if listening and i.UserInputType == Enum.UserInputType.Keyboard then
					key = i.KeyCode
					keyLabel.Text = key.Name
					listening = false

					tweenService:Create(keyLabel, TweenInfo.new(0.2), {
						BackgroundColor3 = CurrentTheme.Background
					}):Play()

					flags[objId.. "_key"] = key
					saveConfig()

				elseif not listening and i.KeyCode == key then
					state = not state
					switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
					update()
				end
			end)

			task.defer(function()
				callback(state)
			end)
		end

		function elements:AddSlider(text, min, max, defaultValue, step, callback)
			step = step or 1
			
			window._objsCount += 1
			local objId = "slider_" .. text:gsub("%s+", "") .. window._objsCount

			local isMobile = inputService.TouchEnabled and not inputService.KeyboardEnabled
			local buttonSize = isMobile and 50 or 40
			local textSize = isMobile and 20 or 18
			local height = isMobile and 110 or 95
			
			
			local val = flags[objId.. "_val"] or defaultValue
			val = math.clamp(val, min, max)
			
			local parent = self.Container or page
			local sFrame = Instance.new("Frame", parent)
			sFrame.Size = UDim2.new(1, -10, 0, height)
			sFrame.BackgroundColor3 = CurrentTheme.Element
			sFrame:SetAttribute("ThemeBackground", "Element")
			addUICorner(sFrame, 12)
			addUIStroke(sFrame)

			local label = Instance.new("TextLabel", sFrame)
			label.Size = UDim2.new(1, -20, 0, 30)
			label.Position = UDim2.new(0, 10, 0, 5)
			label.BackgroundTransparency = 1
			label.Text = text
			label.TextColor3 = CurrentTheme.Text
			label.Font = Enum.Font.GothamMedium
			label.TextSize = textSize
			label.TextXAlignment = Enum.TextXAlignment.Left
			label:SetAttribute("ThemeText", "Text")

			local controls = Instance.new("Frame", sFrame)
			controls.Size = UDim2.new(1, -20, 0, buttonSize)
			controls.Position = UDim2.new(0, 10, 0, 35)
			controls.BackgroundTransparency = 1

			local minus = Instance.new("TextButton", controls)
			minus.Size = UDim2.new(0, buttonSize, 1, 0)
			minus.Text = "-"
			minus.Font = Enum.Font.GothamBold
			minus.TextSize = textSize + 2
			minus.BackgroundColor3 = CurrentTheme.Sidebar
			minus.TextColor3 = CurrentTheme.Text
			minus:SetAttribute("ThemeBackground", "Sidebar")
			minus:SetAttribute("ThemeText", "Text")
			addUICorner(minus, 10)

			local valueBox = Instance.new("TextBox", controls)
			valueBox.Size = UDim2.new(1, -(buttonSize * 2 + 20), 1, 0)
			valueBox.Position = UDim2.new(0, buttonSize + 10, 0, 0)
			valueBox.BackgroundColor3 = CurrentTheme.Background
			valueBox.Text = tostring(val)
			valueBox.TextColor3 = CurrentTheme.Text
			valueBox.Font = Enum.Font.GothamMedium
			valueBox.TextSize = textSize
			valueBox.ClearTextOnFocus = false
			valueBox:SetAttribute("ThemeBackground", "Background")
			valueBox:SetAttribute("ThemeText", "Text")
			addUICorner(valueBox, 10)

			local plus = Instance.new("TextButton", controls)
			plus.Size = UDim2.new(0, buttonSize, 1, 0)
			plus.Position = UDim2.new(1, -buttonSize, 0, 0)
			plus.Text = "+"
			plus.Font = Enum.Font.GothamBold
			plus.TextSize = textSize + 2
			plus.BackgroundColor3 = CurrentTheme.Sidebar
			plus.TextColor3 = CurrentTheme.Text
			plus:SetAttribute("ThemeBackground", "Sidebar")
			plus:SetAttribute("ThemeText", "Text")
			addUICorner(plus, 10)

			local bar = Instance.new("Frame", sFrame)
			bar.Size = UDim2.new(1, -20, 0, isMobile and 10 or 8)
			bar.Position = UDim2.new(0, 10, 1, -15)
			if CurrentTheme ~= Themes.Light then
				bar.BackgroundColor3 = Color3.fromRGB(50,50,60)
			else
				bar.BackgroundColor3 = CurrentTheme.Sidebar
			end
			bar:AddTag("SliderBar")
			
			addUIStroke(bar, CurrentTheme.Stroke, 1)

			addUICorner(bar, 5)

			local fill = Instance.new("Frame", bar)
			fill.BackgroundColor3 = CurrentTheme.Accent
			fill:SetAttribute("ThemeBackground", "Accent")
			addUICorner(fill, 5)

			local function updateVisual(animated)
				local percent = (val - min) / (max - min)

				if animated then
					tweenService:Create(fill, TweenInfo.new(0.15), {
						Size = UDim2.new(percent,0,1,0)
					}):Play()
				else
					fill.Size = UDim2.new(percent,0,1,0)
				end

				valueBox.Text = tostring(val)

				flags[objId.. "_val"] = val
				saveConfig()
				if typeof(callback) == "function" then
					callback(val)
				end
			end

			updateVisual(false)

			local dragging = false

			bar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
				end
			end)

			inputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					dragging = false
				end
			end)

			inputService.InputChanged:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
					or input.UserInputType == Enum.UserInputType.Touch) then

					local percent = math.clamp(
						(input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
						0,1
					)

					local raw = min + (max - min) * percent
					local steppedVal = math.floor(raw / step + 0.5) * step
					val = math.clamp(roundToStep(steppedVal, step), min, max)

					updateVisual(false)
				end
			end)

			local function hold(button, direction)
				local holding = true

				local function change()
					val = math.clamp(roundToStep(val + (step * direction), step), min, max)
					updateVisual(true)
				end

				change()

				task.spawn(function()
					task.wait(0.4)
					while holding do
						change()
						task.wait(0.08)
					end
				end)

				button.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1
						or input.UserInputType == Enum.UserInputType.Touch then
						holding = false
					end
				end)
			end

			minus.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					hold(minus, -1)
				end
			end)

			plus.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					hold(plus, 1)
				end
			end)

			valueBox.FocusLost:Connect(function()
				local number = tonumber(valueBox.Text)
				if number then
					local steppedVal = math.floor(number / step + 0.5) * step
					val = math.clamp(roundToStep(steppedVal, step), min, max)
					updateVisual(true)
				else
					valueBox.Text = tostring(val)
				end
			end)

			task.spawn(function()
				if typeof(callback) == "function" then
					callback(val)
				end
			end)
		end

		function elements:AddKeybind(text, defaultKey, callback)
			window._objsCount += 1
			local objId = "keybind_" .. text:gsub("%s+", "") .. window._objsCount

			callback = typeof(callback) == "function" and callback or function() end
			local key = flags[objId.. "_key"] or defaultKey
			
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -20, 0, 52)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = "   " .. text
			b.Font = Enum.Font.Gotham
			b.TextSize = 18
			b.TextColor3 = CurrentTheme.Text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.AutoButtonColor = false
			b:SetAttribute("ThemeBackground", "Element")
			b:SetAttribute("ThemeText", "Text")
			addUICorner(b, 12)
			addUIStroke(b)

			addHover(b, "Sidebar", "Element")

			local keyLabel = Instance.new("TextLabel", b)
			keyLabel.Size = UDim2.new(0, 80, 0, 28)
			keyLabel.Position = UDim2.new(1, -100, 0.5, -14)
			keyLabel.BackgroundColor3 = CurrentTheme.Background
			keyLabel.Text = key.Name
			keyLabel.Font = Enum.Font.GothamBold
			keyLabel.TextSize = 16
			keyLabel.TextColor3 = CurrentTheme.Accent
			keyLabel.TextXAlignment = Enum.TextXAlignment.Center
			keyLabel:SetAttribute("ThemeBackground", "Background")
			keyLabel:SetAttribute("ThemeText", "Accent")
			addUICorner(keyLabel, 8)
			addUIStroke(keyLabel)

			local listening = false

			b.MouseButton1Click:Connect(function()
				listening = true
				keyLabel.Text = "..."
				tweenService:Create(keyLabel, TweenInfo.new(0.2), {
					BackgroundColor3 = CurrentTheme.Accent
				}):Play()
			end)

			inputService.InputBegan:Connect(function(i, gpe)
				if gpe then return end

				if listening and i.UserInputType == Enum.UserInputType.Keyboard then
					key = i.KeyCode
					keyLabel.Text = key.Name
					listening = false

					tweenService:Create(keyLabel, TweenInfo.new(0.2), {
						BackgroundColor3 = CurrentTheme.Background
					}):Play()

					flags[objId.."_key"] = key

				elseif not listening and i.KeyCode == key then
					callback()
				end
			end)
		end

		function elements:AddDropdown(text : string, list : {}, callback)
			window._objsCount += 1
			local drop = {}
			drop.objId = "dropdown_" .. text:gsub("%s+", "") .. window._objsCount
			local selected = nil
			local isOpen = false
	
			
			if typeof(list) == "string" then
				local t = {}
				for item in string.gmatch(list,"[^,]+") do
					table.insert(t,item:match("^%s*(.-)%s*$"))
				end
				list = t
			end

			local ITEM_HEIGHT = 32
			local MAX_VISIBLE = 6
			
			local parent = self.Container or page
			local dFrame = Instance.new("Frame", parent)
			dFrame.Size = UDim2.new(1,-10,0,45)
			dFrame.BackgroundColor3 = CurrentTheme.Element
			dFrame:SetAttribute("ThemeBackground", "Element")
			addUICorner(dFrame,10)
			addUIStroke(dFrame)

			local mainB = Instance.new("TextButton", dFrame)
			mainB.Size = UDim2.new(1,0,1,0)
			mainB.BackgroundTransparency = 1
			mainB.Text = "  "..text
			mainB.TextColor3 = CurrentTheme.Text
			mainB.Font = Enum.Font.GothamMedium
			mainB.TextSize = 17
			mainB.TextXAlignment = Enum.TextXAlignment.Left
			mainB:SetAttribute("ThemeText", "Text")

			local arrow = Instance.new("TextLabel", mainB)
			arrow.Size = UDim2.new(0,30,1,0)
			arrow.Position = UDim2.new(1,-35,0,0)
			arrow.BackgroundTransparency = 1
			arrow.Text = "▼"
			arrow.Font = Enum.Font.GothamBold
			arrow.TextSize = 16
			arrow.TextColor3 = CurrentTheme.Text
			arrow:SetAttribute("ThemeText", "Text")

			local holder = Instance.new("Frame", gui)
			holder.BackgroundTransparency = 1
			holder.Visible = false
			holder.ZIndex = 50

			local container = Instance.new("ScrollingFrame", holder)
			container.BackgroundColor3 = CurrentTheme.Element
			container.BorderSizePixel = 0
			container.ScrollBarThickness = 4
			container.AutomaticCanvasSize = Enum.AutomaticSize.Y
			container.ZIndex = 51
			container:SetAttribute("ThemeBackground", "Element")
			addUICorner(container,10)
			addUIStroke(container)
			
			local searchBox

			if #list >= 10 then
				searchBox = Instance.new("TextBox",holder)
				searchBox.Position = UDim2.new(0,0,-.2,0)
				searchBox.Size = UDim2.new(1,0,0,30)
				searchBox.BackgroundColor3 = CurrentTheme.Element
				searchBox.PlaceholderText = "Search..."
				searchBox.Text = ""
				searchBox.Name = "SearchBox"
				searchBox.Font = Enum.Font.Gotham
				searchBox.TextSize = 15
				searchBox.TextColor3 = CurrentTheme.Text
				searchBox:SetAttribute("ThemeBackground", "Element")
				searchBox:SetAttribute("ThemeText", "Text")
				addUICorner(searchBox,8)
				addUIStroke(searchBox)

				container.Position = UDim2.new(0,0,0,34)

			end

			local layout = Instance.new("UIListLayout", container)
			layout.Padding = UDim.new(0,4)

			local function updatePosition()

				local pos = dFrame.AbsolutePosition
				local size = dFrame.AbsoluteSize
				local screen = workspace.CurrentCamera.ViewportSize

				local dropdownHeight = math.min(#list,MAX_VISIBLE)*(ITEM_HEIGHT+4)

				local spaceBelow = screen.Y - (pos.Y + size.Y) - 100
				local spaceAbove = pos.Y

				local openUp = spaceBelow < dropdownHeight and spaceAbove > dropdownHeight

				holder.Size = UDim2.fromOffset(size.X, dropdownHeight)

				if openUp then

					holder.Position = UDim2.fromOffset(
						pos.X,
						pos.Y
					)

					container.AnchorPoint = Vector2.new(0,1)
					container.Position = UDim2.new(0,0,1,0)

				else

					holder.Position = UDim2.fromOffset(
						pos.X,
						pos.Y + size.Y + 15
					)

					container.AnchorPoint = Vector2.new(0,0)
					container.Position = UDim2.new(0,0,0,0)

				end

				container.Size = UDim2.new(1,0,1,0)

			end
			
			local function refresh(filter)

				for _,v in ipairs(container:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end

				for _,val in ipairs(list) do

					if filter and not string.find(
						string.lower(val),
						string.lower(filter)
						) then
						continue
					end

					local b = Instance.new("TextButton",container)
					b.Size = UDim2.new(1,-8,0,ITEM_HEIGHT)
					b.BackgroundColor3 = CurrentTheme.Element
					b.Text = tostring(val)
					b.Font = Enum.Font.Gotham
					b.TextSize = 16
					b.TextColor3 = CurrentTheme.Text
					b.ZIndex = 52
					b:SetAttribute("ThemeBackground", "Element")
					b:SetAttribute("ThemeText", "Text")
					addUICorner(b,8)

					rippleEffect(b)

					b.MouseButton1Click:Connect(function()

						selected = val
						mainB.Text = "  "..text..": "..val

						if callback then
							callback(val)
						end

						isOpen = false
						holder.Visible = false
						arrow.Text = "▼"

					end)

				end

			end

			refresh()
			
			if searchBox then

				searchBox:GetPropertyChangedSignal("Text"):Connect(function()
					refresh(searchBox.Text)
				end)

			end

			mainB.MouseButton1Click:Connect(function()

				isOpen = not isOpen

				if isOpen then
					if window._ActiveDropdown and window._ActiveDropdown.objId ~= drop.objId then
						window._ActiveDropdown:Close()
					end
					window._ActiveDropdown = drop
					container.Size = UDim2.new(
						1,0,
						0,math.min(#list,MAX_VISIBLE)*(ITEM_HEIGHT+4)
					)

					task.wait()
					updatePosition()

					holder.Visible = true
					container.Size = UDim2.new(1,0,0,0)

					local target = math.min(#list,MAX_VISIBLE)*(ITEM_HEIGHT+4)

					tweenService:Create(container,TweenInfo.new(.2),{
						Size = UDim2.new(1,0,0,target)
					}):Play()

					arrow.Text = "▲"

				else

					tweenService:Create(container,TweenInfo.new(.15),{
						Size = UDim2.new(1,0,0,0)
					}):Play()

					task.delay(.15,function()
						holder.Visible = false
					end)

					arrow.Text = "▼"

				end

			end)

			inputService.InputBegan:Connect(function(i,gpe)

				if gpe or not isOpen then return end
				if i.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

				local mouse = inputService:GetMouseLocation()
				local pos = holder.AbsolutePosition
				local size = holder.AbsoluteSize

				if not (
					mouse.X > pos.X and mouse.X < pos.X + size.X and
						mouse.Y > pos.Y and mouse.Y < pos.Y + size.Y
					) then

					isOpen = false
					holder.Visible = false
					arrow.Text = "▼"

				end

			end)

			function drop:Set(value)

				selected = value
				mainB.Text = "  "..text..": "..value

			end

			function drop:Update(newList)

				list = newList
				refresh()

			end
			
			function drop:Close()
				isOpen = false
				tweenService:Create(container,TweenInfo.new(.15),{
					Size = UDim2.new(1,0,0,0)
				}):Play()

				task.delay(.15,function()
					holder.Visible = false
				end)

				arrow.Text = "▼"
			end
			
			window._ActiveDropdown = drop
			
			return drop

		end
		
		function elements:AddSection(title)

			local section = {}

			local parent = self.Container or page
			local frame = Instance.new("Frame", parent)
			frame.Name = title
			frame.Size = UDim2.new(1, -10, 0, 0)
			frame.AutomaticSize = Enum.AutomaticSize.Y
			frame.BackgroundColor3 = CurrentTheme.Element
			frame.ClipsDescendants = true
			frame:SetAttribute("ThemeBackground","Element")
			addUICorner(frame, 10)
			addUIStroke(frame)

			local layout = Instance.new("UIListLayout", frame)
			layout.Name = "UIListLayout"
			layout.Padding = UDim.new(0,8)
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			
			local padding0 = Instance.new("UIPadding", frame)
			padding0.Name = "padding0"
			padding0.PaddingBottom = UDim.new(0,10)

			local titleLabel = Instance.new("TextLabel", frame)
			titleLabel.Name = "Title"
			titleLabel.Size = UDim2.new(1,-20,0,34)
			titleLabel.BackgroundTransparency = 1
			titleLabel.Text = title
			titleLabel.Font = Enum.Font.GothamBold
			titleLabel.TextSize = 25
			titleLabel.TextColor3 = CurrentTheme.Accent
			titleLabel.TextXAlignment = Enum.TextXAlignment.Left
			titleLabel.LayoutOrder = 1
			titleLabel:SetAttribute("ThemeText","Accent")
			
			local padding1 = Instance.new("UIPadding", titleLabel)
			padding1.PaddingLeft = UDim.new(0,10)
			padding1.Name = "textPadding"
			
			local separator = Instance.new("Frame", frame)
			separator.Name = "Separator"
			separator.Size = UDim2.new(1.2,-20,0,1)
			separator.BackgroundColor3 = Color3.fromRGB(60,60,70)
			separator.BorderSizePixel = 0
			separator.LayoutOrder = 2

			local container = Instance.new("Frame", frame)
			container.Name = "Container"
			container.Size = UDim2.new(1,0,0,0)
			container.AutomaticSize = Enum.AutomaticSize.Y
			container.BackgroundTransparency = 1
			container.LayoutOrder = 3

			local containerLayout = Instance.new("UIListLayout", container)
			containerLayout.Name = "UIListLayout"
			containerLayout.Padding = UDim.new(0,6)
			containerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			containerLayout.SortOrder = Enum.SortOrder.LayoutOrder

			section.Container = container

			setmetatable(section, {__index = elements})

			return section
		end
		
		return elements
	end

	return window
end

return module
