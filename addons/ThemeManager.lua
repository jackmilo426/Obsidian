local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)
local httpService = cloneref(game:GetService("HttpService"))
local httprequest = (syn and syn.request) or request or http_request or (http and http.request)
local isfolder, isfile, listfiles = isfolder, isfile, listfiles

if typeof(copyfunction) == "function" then
    -- Fix is_____ functions for shitsploits, those functions should never error, only return a boolean.

    local isfolder_copy, isfile_copy, listfiles_copy =
        copyfunction(isfolder), copyfunction(isfile), copyfunction(listfiles)

    local isfolder_success, isfolder_error = pcall(function()
        return isfolder_copy("test" .. tostring(math.random(1000000, 9999999)))
    end)

    if isfolder_success == false or typeof(isfolder_error) ~= "boolean" then
        isfolder = function(folder)
            local success, data = pcall(isfolder_copy, folder)
            return (if success then data else false)
        end

        isfile = function(file)
            local success, data = pcall(isfile_copy, file)
            return (if success then data else false)
        end

        listfiles = function(folder)
            local success, data = pcall(listfiles_copy, folder)
            return (if success then data else {})
        end
    end
end

local ThemeManager = {}
do
    ThemeManager.Folder = "ObsidianLibSettings"
    -- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end

    ThemeManager.Library = nil
    ThemeManager.AppliedToTab = false
    ThemeManager.BuiltInThemes = {
        ["Default"] = {
            1,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"191919","AccentColor":"a2a2a2","BackgroundColor":"000000","OutlineColor":"282828"}]]
            ),
        },
        ["Mspaint"] = {
            2,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"191919","AccentColor":"7d55ff","BackgroundColor":"0f0f0f","OutlineColor":"282828"}]]
            ),
        },
        ["BBot"] = {
            3,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}]]
            ),
        },
        ["Fatality"] = {
            4,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}]]
            ),
        },
        ["Jester"] = {
            5,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
            ),
        },
        ["Mint"] = {
            6,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
            ),
        },
        ["Tokyo Night"] = {
            7,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}]]
            ),
        },
        ["Ubuntu"] = {
            8,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}]]
            ),
        },
        ["Quartz"] = {
            9,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}]]
            ),
        },
        ["Nord"] = {
            10,
            httpService:JSONDecode(
                [[{"FontColor":"eceff4","MainColor":"3b4252","AccentColor":"88c0d0","BackgroundColor":"2e3440","OutlineColor":"4c566a"}]]
            ),
        },
        ["Dracula"] = {
            11,
            httpService:JSONDecode(
                [[{"FontColor":"f8f8f2","MainColor":"44475a","AccentColor":"ff79c6","BackgroundColor":"282a36","OutlineColor":"6272a4"}]]
            ),
        },
        ["Monokai"] = {
            12,
            httpService:JSONDecode(
                [[{"FontColor":"f8f8f2","MainColor":"272822","AccentColor":"f92672","BackgroundColor":"1e1f1c","OutlineColor":"49483e"}]]
            ),
        },
        ["Gruvbox"] = {
            13,
            httpService:JSONDecode(
                [[{"FontColor":"ebdbb2","MainColor":"3c3836","AccentColor":"fb4934","BackgroundColor":"282828","OutlineColor":"504945"}]]
            ),
        },
        ["Solarized"] = {
            14,
            httpService:JSONDecode(
                [[{"FontColor":"839496","MainColor":"073642","AccentColor":"cb4b16","BackgroundColor":"002b36","OutlineColor":"586e75"}]]
            ),
        },
        ["Catppuccin"] = {
            15,
            httpService:JSONDecode(
                [[{"FontColor":"d9e0ee","MainColor":"302d41","AccentColor":"f5c2e7","BackgroundColor":"1e1e2e","OutlineColor":"575268"}]]
            ),
        },
        ["One Dark"] = {
            16,
            httpService:JSONDecode(
                [[{"FontColor":"abb2bf","MainColor":"282c34","AccentColor":"c678dd","BackgroundColor":"21252b","OutlineColor":"5c6370"}]]
            ),
        },
        ["Cyberpunk"] = {
            17,
            httpService:JSONDecode(
                [[{"FontColor":"f9f9f9","MainColor":"262335","AccentColor":"00ff9f","BackgroundColor":"1a1a2e","OutlineColor":"413c5e"}]]
            ),
        },
        ["Oceanic Next"] = {
            18,
            httpService:JSONDecode(
                [[{"FontColor":"d8dee9","MainColor":"1b2b34","AccentColor":"6699cc","BackgroundColor":"16232a","OutlineColor":"343d46"}]]
            ),
        },
        ["Material"] = {
            19,
            httpService:JSONDecode(
                [[{"FontColor":"eeffff","MainColor":"212121","AccentColor":"82aaff","BackgroundColor":"151515","OutlineColor":"424242"}]]
            ),
        },
        ["Solar Flare"] = {
            20,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"4e1609","AccentColor":"ff4500","BackgroundColor":"2b0702","OutlineColor":"6f1e07"}]]
            ),
        },
        ["Aurora"] = {
            21,
            httpService:JSONDecode(
                [[{"FontColor":"e6e6fa","MainColor":"2b303b","AccentColor":"8fa1b3","BackgroundColor":"1c222b","OutlineColor":"3e4755"}]]
            ),
        },
        ["Emerald Dream"] = {
            22,
            httpService:JSONDecode(
                [[{"FontColor":"dfffe0","MainColor":"013220","AccentColor":"7fff00","BackgroundColor":"001a10","OutlineColor":"02442b"}]]
            ),
        },
        ["Sunset Horizon"] = {
            23,
            httpService:JSONDecode(
                [[{"FontColor":"fff5e1","MainColor":"ff6f61","AccentColor":"ffb347","BackgroundColor":"40201a","OutlineColor":"7b3f39"}]]
            ),
        },
        ["Retro Wave"] = {
            24,
            httpService:JSONDecode(
                [[{"FontColor":"f0f8ff","MainColor":"2d033b","AccentColor":"ff2d95","BackgroundColor":"20032a","OutlineColor":"5b114b"}]]
            ),
        },
        ["Forest Mist"] = {
            25,
            httpService:JSONDecode(
                [[{"FontColor":"e0f2f1","MainColor":"2e4d2b","AccentColor":"a8d5ba","BackgroundColor":"1b2f20","OutlineColor":"3c5a3d"}]]
            ),
        },
        ["Deep Space"] = {
            26,
            httpService:JSONDecode(
                [[{"FontColor":"cfd8dc","MainColor":"0d1b2a","AccentColor":"546e7a","BackgroundColor":"081421","OutlineColor":"284259"}]]
            ),
        },
        ["Candy Pop"] = {
            27,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"ff5edf","AccentColor":"04c8de","BackgroundColor":"2b0026","OutlineColor":"660033"}]]
            ),
        },
        ["Vintage Paper"] = {
            28,
            httpService:JSONDecode(
                [[{"FontColor":"3b2f2f","MainColor":"d9c5b2","AccentColor":"b89c73","BackgroundColor":"f3e9d2","OutlineColor":"a68f7c"}]]
            ),
        },
        ["Neon Jungle"] = {
            29,
            httpService:JSONDecode(
                [[{"FontColor":"c0ff33","MainColor":"1a1f27","AccentColor":"ff073a","BackgroundColor":"0d0d0d","OutlineColor":"2a2a2a"}]]
            ),
        },
        ["Midnight Blue"] = {
            30,
            httpService:JSONDecode(
                [[{"FontColor":"e6eaf2","MainColor":"1a2634","AccentColor":"334e68","BackgroundColor":"0f1221","OutlineColor":"2c3e50"}]]
            ),
        },
        ["Rose Quartz"] = {
            31,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"c89fa3","AccentColor":"f7cad0","BackgroundColor":"42262f","OutlineColor":"6f4b57"}]]
            ),
        },
        ["Sandstone"] = {
            32,
            httpService:JSONDecode(
                [[{"FontColor":"3b2f2f","MainColor":"c2b280","AccentColor":"e3c787","BackgroundColor":"f5e6ca","OutlineColor":"a79876"}]]
            ),
        },
        ["Lunar Eclipse"] = {
            33,
            httpService:JSONDecode(
                [[{"FontColor":"dcdcdc","MainColor":"2c2933","AccentColor":"5c5470","BackgroundColor":"1b1823","OutlineColor":"3e3a4e"}]]
            ),
        },
        ["Flame Ember"] = {
            34,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"692423","AccentColor":"ff4500","BackgroundColor":"3b1f1f","OutlineColor":"8b3a3a"}]]
            ),
        },
        ["Glacial"] = {
            35,
            httpService:JSONDecode(
                [[{"FontColor":"e0f7fa","MainColor":"40514e","AccentColor":"16a085","BackgroundColor":"243c42","OutlineColor":"2c5f58"}]]
            ),
        },
        ["Mystic Violet"] = {
            36,
            httpService:JSONDecode(
                [[{"FontColor":"f8f0ff","MainColor":"3e1f47","AccentColor":"9b59b6","BackgroundColor":"2a102f","OutlineColor":"5c3d63"}]]
            ),
        },
        ["Goldenrod"] = {
            37,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"8c7a3f","AccentColor":"f1c40f","BackgroundColor":"4c3d20","OutlineColor":"6e5e3a"}]]
            ),
        },
        ["Canyon Clay"] = {
            38,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"7f5539","AccentColor":"d95763","BackgroundColor":"492f23","OutlineColor":"6c4a3b"}]]
            ),
        },
        ["Iceberg"] = {
            39,
            httpService:JSONDecode(
                [[{"FontColor":"e8f6f3","MainColor":"0b3d91","AccentColor":"00b7ff","BackgroundColor":"071d59","OutlineColor":"174fa8"}]]
            ),
        },
        ["Peach Fuzz"] = {
            40,
            httpService:JSONDecode(
                [[{"FontColor":"2e1a1f","MainColor":"ffdab9","AccentColor":"ff9a8b","BackgroundColor":"3a1f24","OutlineColor":"7f5a56"}]]
            ),
        },
        ["Slate Grey"] = {
            41,
            httpService:JSONDecode(
                [[{"FontColor":"d3d3d3","MainColor":"708090","AccentColor":"b0c4de","BackgroundColor":"2f4f4f","OutlineColor":"4f6f6f"}]]
            ),
        },
        ["Buttercup"] = {
            42,
            httpService:JSONDecode(
                [[{"FontColor":"3b2f2f","MainColor":"fce205","AccentColor":"f7e017","BackgroundColor":"4a4022","OutlineColor":"7a6d28"}]]
            ),
        },
        ["Electric Lime"] = {
            43,
            httpService:JSONDecode(
                [[{"FontColor":"000000","MainColor":"ccff00","AccentColor":"bfff00","BackgroundColor":"1a1a1a","OutlineColor":"3d3d3d"}]]
            ),
        },
        ["Twilight"] = {
            44,
            httpService:JSONDecode(
                [[{"FontColor":"e0e6f8","MainColor":"121212","AccentColor":"836fa9","BackgroundColor":"0a0a0a","OutlineColor":"333444"}]]
            ),
        },
        ["Dusty Rose"] = {
            45,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"c48793","AccentColor":"e8a2a8","BackgroundColor":"3d1f23","OutlineColor":"70454b"}]]
            ),
        },
        ["Mint Chocolate"] = {
            46,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"2d4739","AccentColor":"a1c349","BackgroundColor":"1b2b20","OutlineColor":"3c5a4e"}]]
            ),
        },
        ["Ocean Breeze"] = {
            47,
            httpService:JSONDecode(
                [[{"FontColor":"f0faff","MainColor":"005377","AccentColor":"00a8cc","BackgroundColor":"002d3a","OutlineColor":"014f62"}]]
            ),
        },
        ["Crimson Tide"] = {
            48,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"660000","AccentColor":"cc0000","BackgroundColor":"330000","OutlineColor":"990000"}]]
            ),
        },
        ["Lavender Mist"] = {
            49,
            httpService:JSONDecode(
                [[{"FontColor":"faf0ff","MainColor":"7e5a9b","AccentColor":"b39ddb","BackgroundColor":"44275a","OutlineColor":"71538c"}]]
            ),
        },
        ["Steel Blue"] = {
            50,
            httpService:JSONDecode(
                [[{"FontColor":"f1f5f9","MainColor":"1f3a58","AccentColor":"486189","BackgroundColor":"152439","OutlineColor":"2c526d"}]]
            ),
        },
        ["Peanut Butter"] = {
            51,
            httpService:JSONDecode(
                [[{"FontColor":"3b2f2f","MainColor":"e1a95f","AccentColor":"d49f47","BackgroundColor":"362b21","OutlineColor":"7a6326"}]]
            ),
        },
        ["Ocean Pearl"] = {
            52,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"025955","AccentColor":"42eecf","BackgroundColor":"00363a","OutlineColor":"014f52"}]]
            ),
        },
        ["Berry Smoothie"] = {
            53,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"602040","AccentColor":"b03060","BackgroundColor":"40102b","OutlineColor":"703060"}]]
            ),
        },
        ["Mocha Mist"] = {
            54,
            httpService:JSONDecode(
                [[{"FontColor":"f5e1da","MainColor":"6b4c3b","AccentColor":"a67858","BackgroundColor":"3c2b24","OutlineColor":"795b48"}]]
            ),
        },
        ["Celestial"] = {
            55,
            httpService:JSONDecode(
                [[{"FontColor":"eaeaf2","MainColor":"1f1c3c","AccentColor":"6a5acd","BackgroundColor":"0b0928","OutlineColor":"362e61"}]]
            ),
        },
        ["Opal Glow"] = {
            56,
            httpService:JSONDecode(
                [[{"FontColor":"f0fff0","MainColor":"567572","AccentColor":"9fffc0","BackgroundColor":"213837","OutlineColor":"2b4f3c"}]]
            ),
        },
        ["Copper Canyon"] = {
            57,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"7c2d12","AccentColor":"d2691e","BackgroundColor":"38190a","OutlineColor":"5c321d"}]]
            ),
        },
        ["Vodka Lime"] = {
            58,
            httpService:JSONDecode(
                [[{"FontColor":"000000","MainColor":"ccff66","AccentColor":"99ff33","BackgroundColor":"e6ffe6","OutlineColor":"aaff99"}]]
            ),
        },
        ["Stormy Night"] = {
            59,
            httpService:JSONDecode(
                [[{"FontColor":"d9d9d9","MainColor":"2f3e4e","AccentColor":"627d98","BackgroundColor":"1b232f","OutlineColor":"34455b"}]]
            ),
        },
        ["Sunrise Glow"] = {
            60,
            httpService:JSONDecode(
                [[{"FontColor":"2f1b0c","MainColor":"ff9e2c","AccentColor":"ffd166","BackgroundColor":"40200a","OutlineColor":"8c5200"}]]
            ),
        },
        ["Marshmallow"] = {
            61,
            httpService:JSONDecode(
                [[{"FontColor":"3b2f2f","MainColor":"f8eae8","AccentColor":"e1cfcf","BackgroundColor":"4a2f2f","OutlineColor":"7a5555"}]]
            ),
        },
        ["Jade Forest"] = {
            62,
            httpService:JSONDecode(
                [[{"FontColor":"f0fff0","MainColor":"0a2c2a","AccentColor":"3bbf9b","BackgroundColor":"081d1b","OutlineColor":"205752"}]]
            ),
        },
        ["Midnight Orchid"] = {
            63,
            httpService:JSONDecode(
                [[{"FontColor":"f8f8ff","MainColor":"2a1e3b","AccentColor":"a4379e","BackgroundColor":"1a0c27","OutlineColor":"4f2b55"}]]
            ),
        },
        ["Desert Storm"] = {
            64,
            httpService:JSONDecode(
                [[{"FontColor":"3b2f2f","MainColor":"e8ddcb","AccentColor":"cdb79e","BackgroundColor":"392d24","OutlineColor":"7a6858"}]]
            ),
        },
        ["Tropical Punch"] = {
            65,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"ff3366","AccentColor":"ffcc33","BackgroundColor":"331a2e","OutlineColor":"662a4b"}]]
            ),
        },
        ["Graphite"] = {
            66,
            httpService:JSONDecode(
                [[{"FontColor":"d1d1d1","MainColor":"2b2b2b","AccentColor":"555555","BackgroundColor":"1a1a1a","OutlineColor":"444444"}]]
            ),
        },
        ["Peacock Feather"] = {
            67,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"004953","AccentColor":"008891","BackgroundColor":"002f3d","OutlineColor":"006370"}]]
            ),
        },
        ["Candy Cane"] = {
            68,
            httpService:JSONDecode(
                [[{"FontColor":"ff0000","MainColor":"ffffff","AccentColor":"008000","BackgroundColor":"000000","OutlineColor":"660000"}]]
            ),
        },
        ["Dust Bowl"] = {
            69,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"5c4537","AccentColor":"9e7f66","BackgroundColor":"3b3024","OutlineColor":"7a6d58"}]]
            ),
        },
        ["Inferno"] = {
            70,
            httpService:JSONDecode(
                [[{"FontColor":"ffffff","MainColor":"4b000f","AccentColor":"ff3300","BackgroundColor":"2e0005","OutlineColor":"7a0011"}]]
            ),
        },
    }

    function ThemeManager:SetLibrary(library)
        self.Library = library
    end

    --// Folders \\--
    function ThemeManager:GetPaths()
        local paths = {}

        local parts = self.Folder:split("/")
        for idx = 1, #parts do
            paths[#paths + 1] = table.concat(parts, "/", 1, idx)
        end

        paths[#paths + 1] = self.Folder .. "/themes"

        return paths
    end

    function ThemeManager:BuildFolderTree()
        local paths = self:GetPaths()

        for i = 1, #paths do
            local str = paths[i]
            if isfolder(str) then
                continue
            end
            makefolder(str)
        end
    end

    function ThemeManager:CheckFolderTree()
        if isfolder(self.Folder) then
            return
        end
        self:BuildFolderTree()

        task.wait(0.1)
    end

    function ThemeManager:SetFolder(folder)
        self.Folder = folder
        self:BuildFolderTree()
    end

    --// Apply, Update theme \\--
    function ThemeManager:ApplyTheme(theme)
        local customThemeData = self:GetCustomTheme(theme)
        local data = customThemeData or self.BuiltInThemes[theme]

        if not data then
            return
        end

        local scheme = data[2]
        for idx, val in pairs(customThemeData or scheme) do
            if idx == "VideoLink" then
                continue
            elseif idx == "FontFace" then
                self.Library:SetFont(Enum.Font[val])

                if self.Library.Options[idx] then
                    self.Library.Options[idx]:SetValue(val)
                end
            else
                self.Library.Scheme[idx] = Color3.fromHex(val)

                if self.Library.Options[idx] then
                    self.Library.Options[idx]:SetValueRGB(Color3.fromHex(val))
                end
            end
        end

        self:ThemeUpdate()
    end

    function ThemeManager:ThemeUpdate()
        local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
        for i, field in pairs(options) do
            if self.Library.Options and self.Library.Options[field] then
                self.Library.Scheme[field] = self.Library.Options[field].Value
            end
        end

        self.Library:UpdateColorsUsingRegistry()
    end

    --// Get, Load, Save, Delete, Refresh \\--
    function ThemeManager:GetCustomTheme(file)
        local path = self.Folder .. "/themes/" .. file .. ".json"
        if not isfile(path) then
            return nil
        end

        local data = readfile(path)
        local success, decoded = pcall(httpService.JSONDecode, httpService, data)

        if not success then
            return nil
        end

        return decoded
    end

    function ThemeManager:LoadDefault()
        local theme = "Default"
        local content = isfile(self.Folder .. "/themes/default.txt") and readfile(self.Folder .. "/themes/default.txt")

        local isDefault = true
        if content then
            if self.BuiltInThemes[content] then
                theme = content
            elseif self:GetCustomTheme(content) then
                theme = content
                isDefault = false
            end
        elseif self.BuiltInThemes[self.DefaultTheme] then
            theme = self.DefaultTheme
        end

        if isDefault then
            self.Library.Options.ThemeManager_ThemeList:SetValue(theme)
        else
            self:ApplyTheme(theme)
        end
    end

    function ThemeManager:SaveDefault(theme)
        writefile(self.Folder .. "/themes/default.txt", theme)
    end

    function ThemeManager:SetDefaultTheme(theme)
        assert(self.Library, "Must set ThemeManager.Library first!")
        assert(not self.AppliedToTab, "Cannot set default theme after applying ThemeManager to a tab!")

        local FinalTheme = {}
        local LibraryScheme = {}
        local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
        for _, field in pairs(fields) do
            if typeof(theme[field]) == "Color3" then
                FinalTheme[field] = `#{theme[field]:ToHex()}`
                LibraryScheme[field] = theme[field]
            elseif typeof(theme[field]) == "string" then
                FinalTheme[field] = if theme[field]:sub(1, 1) == "#" then theme[field] else `#{theme[field]}`
                LibraryScheme[field] = Color3.fromHex(theme[field])
            else
                FinalTheme[field] = ThemeManager.BuiltInThemes["Default"][2][field]
                LibraryScheme[field] = Color3.fromHex(ThemeManager.BuiltInThemes["Default"][2][field])
            end
        end

        if typeof(theme["FontFace"]) == "EnumItem" then
            FinalTheme["FontFace"] = theme["FontFace"].Name
            LibraryScheme["Font"] = Font.fromEnum(theme["FontFace"])
        elseif typeof(theme["FontFace"]) == "string" then
            FinalTheme["FontFace"] = theme["FontFace"]
            LibraryScheme["Font"] = Font.fromEnum(Enum.Font[theme["FontFace"]])
        else
            FinalTheme["FontFace"] = "Gotham"
            LibraryScheme["Font"] = Font.fromEnum(Enum.Font.Gotham)
        end

        for _, field in pairs({ "Red", "Dark", "White" }) do
            LibraryScheme[field] = self.Library.Scheme[field]
        end

        self.Library.Scheme = LibraryScheme
        self.BuiltInThemes["Default"] = { 1, FinalTheme }

        self.Library:UpdateColorsUsingRegistry()
    end

    function ThemeManager:SaveCustomTheme(file)
        if file:gsub(" ", "") == "" then
            return self.Library:Notify("Invalid file name for theme (empty)", 3)
        end

        local theme = {}
        local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }

        for _, field in pairs(fields) do
            theme[field] = self.Library.Options[field].Value:ToHex()
        end
        theme["FontFace"] = self.Library.Options["FontFace"].Value

        writefile(self.Folder .. "/themes/" .. file .. ".json", httpService:JSONEncode(theme))
    end

    function ThemeManager:Delete(name)
        if not name then
            return false, "no config file is selected"
        end

        local file = self.Folder .. "/themes/" .. name .. ".json"
        if not isfile(file) then
            return false, "invalid file"
        end

        local success = pcall(delfile, file)
        if not success then
            return false, "delete file error"
        end

        return true
    end

    function ThemeManager:ReloadCustomThemes()
        local list = listfiles(self.Folder .. "/themes")

        local out = {}
        for i = 1, #list do
            local file = list[i]
            if file:sub(-5) == ".json" then
                -- i hate this but it has to be done ...

                local pos = file:find(".json", 1, true)
                local start = pos

                local char = file:sub(pos, pos)
                while char ~= "/" and char ~= "\\" and char ~= "" do
                    pos = pos - 1
                    char = file:sub(pos, pos)
                end

                if char == "/" or char == "\\" then
                    table.insert(out, file:sub(pos + 1, start - 1))
                end
            end
        end

        return out
    end

    --// GUI \\--
    function ThemeManager:CreateThemeManager(groupbox)
        groupbox
            :AddLabel("Background color")
            :AddColorPicker("BackgroundColor", { Default = self.Library.Scheme.BackgroundColor })
        groupbox:AddLabel("Main color"):AddColorPicker("MainColor", { Default = self.Library.Scheme.MainColor })
        groupbox:AddLabel("Accent color"):AddColorPicker("AccentColor", { Default = self.Library.Scheme.AccentColor })
        groupbox
            :AddLabel("Outline color")
            :AddColorPicker("OutlineColor", { Default = self.Library.Scheme.OutlineColor })
        groupbox:AddLabel("Font color"):AddColorPicker("FontColor", { Default = self.Library.Scheme.FontColor })
        groupbox:AddDropdown("FontFace", {
            Text = "Font Face",
            Default = "Gotham",
            Values = { "BuilderSans", "Code", "Fantasy", "Gotham", "Jura", "Roboto", "RobotoMono", "SourceSans" },
        })

        local ThemesArray = {}
        for Name, Theme in pairs(self.BuiltInThemes) do
            table.insert(ThemesArray, Name)
        end

        table.sort(ThemesArray, function(a, b)
            return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1]
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown("ThemeManager_ThemeList", { Text = "Theme list", Values = ThemesArray, Default = 1 })
        groupbox:AddButton("Set as default", function()
            self:SaveDefault(self.Library.Options.ThemeManager_ThemeList.Value)
            self.Library:Notify(
                string.format("Set default theme to %q", self.Library.Options.ThemeManager_ThemeList.Value)
            )
        end)

        self.Library.Options.ThemeManager_ThemeList:OnChanged(function()
            self:ApplyTheme(self.Library.Options.ThemeManager_ThemeList.Value)
        end)

        groupbox:AddDivider()

        groupbox:AddInput("ThemeManager_CustomThemeName", { Text = "Custom theme name" })
        groupbox:AddButton("Create theme", function()
            self:SaveCustomTheme(self.Library.Options.ThemeManager_CustomThemeName.Value)

            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown(
            "ThemeManager_CustomThemeList",
            { Text = "Custom themes", Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 }
        )
        groupbox:AddButton("Load theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            self:ApplyTheme(name)
            self.Library:Notify(string.format("Loaded theme %q", name))
        end)
        groupbox:AddButton("Overwrite theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            self:SaveCustomTheme(name)
            self.Library:Notify(string.format("Overwrote config %q", name))
        end)
        groupbox:AddButton("Delete theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            local success, err = self:Delete(name)
            if not success then
                return self.Library:Notify("Failed to delete theme: " .. err)
            end

            self.Library:Notify(string.format("Deleted theme %q", name))
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddButton("Refresh list", function()
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddButton("Set as default", function()
            if
                self.Library.Options.ThemeManager_CustomThemeList.Value ~= nil
                and self.Library.Options.ThemeManager_CustomThemeList.Value ~= ""
            then
                self:SaveDefault(self.Library.Options.ThemeManager_CustomThemeList.Value)
                self.Library:Notify(
                    string.format("Set default theme to %q", self.Library.Options.ThemeManager_CustomThemeList.Value)
                )
            end
        end)
        groupbox:AddButton("Reset default", function()
            local success = pcall(delfile, self.Folder .. "/themes/default.txt")
            if not success then
                return self.Library:Notify("Failed to reset default: delete file error")
            end

            self.Library:Notify("Set default theme to nothing")
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        self:LoadDefault()
        self.AppliedToTab = true

        local function UpdateTheme()
            self:ThemeUpdate()
        end
        self.Library.Options.BackgroundColor:OnChanged(UpdateTheme)
        self.Library.Options.MainColor:OnChanged(UpdateTheme)
        self.Library.Options.AccentColor:OnChanged(UpdateTheme)
        self.Library.Options.OutlineColor:OnChanged(UpdateTheme)
        self.Library.Options.FontColor:OnChanged(UpdateTheme)
        self.Library.Options.FontFace:OnChanged(function(Value)
            self.Library:SetFont(Enum.Font[Value])
            self.Library:UpdateColorsUsingRegistry()
        end)
    end

    function ThemeManager:CreateGroupBox(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        return tab:AddLeftGroupbox("Themes", "paintbrush")
    end

    function ThemeManager:ApplyToTab(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        local groupbox = self:CreateGroupBox(tab)
        self:CreateThemeManager(groupbox)
    end

    function ThemeManager:ApplyToGroupbox(groupbox)
        assert(self.Library, "Must set ThemeManager.Library first!")
        self:CreateThemeManager(groupbox)
    end

    ThemeManager:BuildFolderTree()
end

getgenv().ObsidianThemeManager = ThemeManager
return ThemeManager
