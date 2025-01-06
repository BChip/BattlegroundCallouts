-- Battleground-specific button configurations
local bgButtons = {
    ["Arathi Basin"] = {
        { text = "INC Mines",   message = "Incoming at Mines!",       clear = "Mines Clear!",       tooltip = "Report incoming enemies at Mines" },
        { text = "INC LM",      message = "Incoming at Lumber Mill!", clear = "Lumber Mill Clear!", tooltip = "Report incoming enemies at Lumber Mill" },
        { text = "INC Stables", message = "Incoming at Stables!",     clear = "Stables Clear!",     tooltip = "Report incoming enemies at Stables" },
        { text = "INC BS",      message = "Incoming at Blacksmith!",  clear = "Blacksmith Clear!",  tooltip = "Report incoming enemies at Blacksmith" },
        { text = "INC Farm",    message = "Incoming at Farm!",        clear = "Farm Clear!",        tooltip = "Report incoming enemies at Farm" },
    },
    ["Silverwing Hold"] = {
        { text = "EFC Mid",    message = "Enemy Flag Carrier is at Mid!",           tooltip = "Report Enemy Flag Carrier at Mid" },
        { text = "EFC Tunnel", message = "Enemy Flag Carrier is in our Tunnel!",    tooltip = "Report Enemy Flag Carrier in our Tunnel" },
        { text = "EFC Roof",   message = "Enemy Flag Carrier is on our Roof!",      tooltip = "Report Enemy Flag Carrier on our Roof" },
        { text = "EFC Ramp",   message = "Enemy Flag Carrier is on our Ramp!",      tooltip = "Report Enemy Flag Carrier on our Ramp" },
        { text = "EFC GY",     message = "Enemy Flag Carrier is in our Graveyard!", tooltip = "Report Enemy Flag Carrier in our Graveyard" },
    },
    ["Warsong Lumber Mill"] = {
        { text = "EFC Mid",    message = "Enemy Flag Carrier is at Mid!",           tooltip = "Report Enemy Flag Carrier at Mid" },
        { text = "EFC Tunnel", message = "Enemy Flag Carrier is in our Tunnel!",    tooltip = "Report Enemy Flag Carrier in our Tunnel" },
        { text = "EFC Roof",   message = "Enemy Flag Carrier is on our Roof!",      tooltip = "Report Enemy Flag Carrier on our Roof" },
        { text = "EFC Ramp",   message = "Enemy Flag Carrier is on our Ramp!",      tooltip = "Report Enemy Flag Carrier on our Ramp" },
        { text = "EFC GY",     message = "Enemy Flag Carrier is in our Graveyard!", tooltip = "Report Enemy Flag Carrier in our Graveyard" },
    },
    ["Eye of the Storm"] = {
        { text = "INC BE", message = "Incoming at Blood Elf Tower!",  clear = "Blood Elf Tower Clear!",  tooltip = "Report incoming enemies at Blood Elf Tower" },
        { text = "INC FR", message = "Incoming at Fel Reaver Ruins!", clear = "Fel Reaver Ruins Clear!", tooltip = "Report incoming enemies at Fel Reaver Ruins" },
        { text = "INC MT", message = "Incoming at Mage Tower!",       clear = "Mage Tower Clear!",       tooltip = "Report incoming enemies at Mage Tower" },
        { text = "INC DR", message = "Incoming at Draenei Ruins!",    clear = "Draenei Ruins Clear!",    tooltip = "Report incoming enemies at Draenei Ruins" },
    },
    ["The Battle for Gilneas"] = {
        { text = "INC Mines", message = "Incoming at Mines!",      clear = "Mines Clear!",      tooltip = "Report incoming enemies at Mines" },
        { text = "INC LH",    message = "Incoming at Lighthouse!", clear = "Lighthouse Clear!", tooltip = "Report incoming enemies at Lighthouse" },
        { text = "INC WW",    message = "Incoming at Waterworks!", clear = "Waterworks Clear!", tooltip = "Report incoming enemies at Waterworks" },
    },
    ["Wildhammer Stronghold"] = {
        { text = "EFC Mid",           message = "Enemy Flag Carrier is at Mid!",           tooltip = "Report Enemy Flag Carrier at Mid" },
        { text = "EFC Enemy Base",    message = "Enemy Flag Carrier is at enemy base!",    tooltip = "Report Enemy Flag Carrier at enemy base" },
        { text = "EFC Friendly Base", message = "Enemy Flag Carrier is at friendly base!", tooltip = "Report Enemy Flag Carrier at friendly base" },
    },
    ["Silvershard Mines"] = {
        { text = "INC Center", message = "Incoming at Center Track!",    clear = "Center Track Clear!",    tooltip = "Report incoming enemies at Center Track" },
        { text = "INC Lava",   message = "Incoming at Lava Track!",      clear = "Lava Track Clear!",      tooltip = "Report incoming enemies at Lava Track" },
        { text = "INC Water",  message = "Incoming at Waterfall Track!", clear = "Waterfall Track Clear!", tooltip = "Report incoming enemies at Waterfall Track" },
    },
    ["Temple of Kotmogu"] = {
        { text = "Blue",   message = "Incoming at Blue Orb!",   tooltip = "Report incoming enemies at Blue Orb" },
        { text = "Green",  message = "Incoming at Green Orb!",  tooltip = "Report incoming enemies at Green Orb" },
        { text = "Orange", message = "Incoming at Orange Orb!", tooltip = "Report incoming enemies at Orange Orb" },
        { text = "Purple", message = "Incoming at Purple Orb!", tooltip = "Report incoming enemies at Purple Orb" },
    },
    ["Deepwind Gorge"] = {
        { text = "INC Shrine", message = "Incoming at Shrine!", clear = "Shrine Clear!", tooltip = "Report incoming enemies at Shrine" },
        { text = "INC Ruins",  message = "Incoming at Ruins!",  clear = "Ruins Clear!",  tooltip = "Report incoming enemies at Ruins" },
        { text = "INC Market", message = "Incoming at Market!", clear = "Market Clear!", tooltip = "Report incoming enemies at Market" },
        { text = "INC Farm",   message = "Incoming at Farm!",   clear = "Farm Clear!",   tooltip = "Report incoming enemies at Farm" },
        { text = "INC Quary",  message = "Incoming at Quary!",  clear = "Quary Clear!",  tooltip = "Report incoming enemies at Quary" },
    },
    ["Deephaul Ravine"] = {
        { text = "Crystal Spawn", message = "Crystal has spawned in the middle!",                                       tooltip = "Notify team that the crystal is at the center of the map." },
        { text = "Alliance Cart", message = "Alliance cart is moving along the tracks from bottom right to upper mid!", tooltip = "Report the Alliance cart's path and progress." },
        { text = "Horde Cart",    message = "Horde cart is moving along the tracks from upper left to bottom center!",  tooltip = "Report the Horde cart's path and progress." },
    }
}

-- Create the main frame
local frame = CreateFrame("Frame", "BGCommunicator", UIParent, BackdropTemplateMixin and "BackdropTemplate")
frame:SetSize(150, 200)
frame:SetPoint("RIGHT", -50, 0)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Add a backdrop
frame:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0, 0, 0, 0.6)
frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 0.8)

-- Create a header for dragging
local header = CreateFrame("Frame", nil, frame)
header:SetHeight(20)
header:SetPoint("TOPLEFT")
header:SetPoint("TOPRIGHT")
header:EnableMouse(true)
header:RegisterForDrag("LeftButton")
header:SetScript("OnDragStart", function() frame:StartMoving() end)
header:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)

local headerText = header:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
headerText:SetPoint("CENTER", header)
headerText:SetText("BG Callouts - Drag to move")

-- Container for buttons
local buttonContainer = CreateFrame("Frame", nil, frame)
buttonContainer:SetPoint("TOP", header, "BOTTOM")
buttonContainer:SetPoint("BOTTOM")
buttonContainer:SetPoint("LEFT")
buttonContainer:SetPoint("RIGHT")

-- Adjust these values to fine-tune the layout
local BUTTON_HEIGHT = 20
local BUTTON_SPACING = 5
local FRAME_PADDING = 10
local HEADER_HEIGHT = 20
local MAIN_BUTTON_WIDTH = 110
local CLEAR_BUTTON_WIDTH = 30

-- Button creation (do this once, then show/hide as needed)
local buttons = {}
for bgName, bgData in pairs(bgButtons) do
    buttons[bgName] = {}
    for i, btnData in ipairs(bgData) do
        local button = CreateFrame("Button", nil, buttonContainer, "UIPanelButtonTemplate")
        button:SetSize(MAIN_BUTTON_WIDTH, BUTTON_HEIGHT)
        button:SetPoint("TOPLEFT", FRAME_PADDING, -FRAME_PADDING - (i - 1) * (BUTTON_HEIGHT + BUTTON_SPACING))
        button:SetText(btnData.text)
        button:SetScript("OnClick", function()
            SendChatMessage(btnData.message, "INSTANCE_CHAT")
            button:SetEnabled(false)
            C_Timer.After(5, function() button:SetEnabled(true) end)
        end)
        button:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            GameTooltip:SetText(btnData.tooltip)
            GameTooltip:Show()
        end)
        button:SetScript("OnLeave", GameTooltip_Hide)
        button:Hide()

        local clearButton
        if btnData.clear then
            clearButton = CreateFrame("Button", nil, buttonContainer, "UIPanelButtonTemplate")
            clearButton:SetSize(CLEAR_BUTTON_WIDTH, BUTTON_HEIGHT)
            clearButton:SetPoint("TOPLEFT", button, "TOPRIGHT", BUTTON_SPACING, 0)
            clearButton:SetText("Clr")
            clearButton:SetScript("OnClick", function()
                SendChatMessage(btnData.clear, "INSTANCE_CHAT")
                clearButton:SetEnabled(false)
                C_Timer.After(5, function() clearButton:SetEnabled(true) end)
            end)
            clearButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_TOP")
                GameTooltip:SetText("Clear " .. btnData.text)
                GameTooltip:Show()
            end)
            clearButton:SetScript("OnLeave", GameTooltip_Hide)
            clearButton:Hide()
        end
        buttons[bgName][i] = { main = button, clear = clearButton }
    end
end

local function HideAllButtons()
    for _, bgButtons in pairs(buttons) do
        for _, btnPair in ipairs(bgButtons) do
            btnPair.main:Hide()
            if btnPair.clear then
                btnPair.clear:Hide()
            end
        end
    end
end

local function UpdateButtons()
    local currentZone = GetZoneText()
    local currentButtons = buttons[currentZone]

    HideAllButtons()

    if currentButtons then
        frame:Show()
        headerText:SetText(currentZone)

        local height = HEADER_HEIGHT + FRAME_PADDING * 2 + (#currentButtons * (BUTTON_HEIGHT + BUTTON_SPACING)) -
            BUTTON_SPACING
        local width = FRAME_PADDING * 2 + MAIN_BUTTON_WIDTH + BUTTON_SPACING + CLEAR_BUTTON_WIDTH
        frame:SetSize(width, height)

        for i, btnPair in ipairs(currentButtons) do
            btnPair.main:Show()
            if btnPair.clear then
                btnPair.clear:Show()
            end
        end
    else
        frame:Hide()
    end
end

-- Register events
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        UpdateButtons()
    end
end)
