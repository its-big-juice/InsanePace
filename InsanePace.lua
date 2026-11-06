local ADDON = "InsanePace"
local SOUND_DIR = "Interface\\AddOns\\InsanePace\\sounds\\"
local PREFIX = "|cff33ff99Insane Pace|r: "

-- Short ids are what /ip play accepts. Files keep the names already in sounds/.
local CLIPS = {
    { id = "never", file = "ive never seen a 113 and I never will.ogg", line = "I've never seen a 113, and I never fucking will.", seconds = 3.08 },
    { id = "rutzou", file = "me and mark rutzou.ogg", line = "Me and Mark Rutzou.", seconds = 3.62 },
    { id = "watch", file = "watch this.ogg", line = "Watch this.", seconds = 2.84 },
    { id = "line", file = "look at this line I take.ogg", line = "Look at this line I take.", seconds = 6.03 },
    { id = "head", file = "right in the fucking head.ogg", line = "Right in the fucking head.", seconds = 2.46 },
    { id = "fast", file = "see how fast my pace is.ogg", line = "See how fast my pace is.", seconds = 1.88 },
    { id = "insane", file = "my insane pace.ogg", line = "My insane pace.", seconds = 1.38 },
    { id = "pace", file = "look at the fucking pace.ogg", line = "Look at the fucking pace.", seconds = 1.69 },
    { id = "two", file = "two quick ones.ogg", line = "Two quick ones.", seconds = 2.72 },
    { id = "thisone", file = "yeah its this one.ogg", line = "Yeah, it's this one.", seconds = 0.99 },
    { id = "righthere", file = "right here its this one.ogg", line = "Right here, it's this one.", seconds = 1.27 },
    { id = "the112", file = "right here this is the 112.ogg", line = "Right here, this is the 112.", seconds = 1.83 },
    { id = "thought", file = "I thought it might be 112 and it is.ogg", line = "I thought it might be 112, and it is.", seconds = 11.47 },
    { id = "fuckingit", file = "right here yes this is fucking it.ogg", line = "Right here, yes, this is fucking it.", seconds = 2.49 },
    { id = "yes", file = "YES.ogg", line = "YES.", seconds = 0.92 },
    { id = "baby", file = "112 baby till the day I die.ogg", line = "112, baby, till the day I die.", seconds = 3.21 },
    { id = "rush", file = "dude what a rush.ogg", line = "Dude, what a rush.", seconds = 5.11 },
    { id = "fifty", file = "50 49 47 thats fucking right.ogg", line = "50, 49, 47, that's fucking right.", seconds = 5.87 },
    { id = "lucky", file = "about time I get a lucky break.ogg", line = "About time I get a lucky break.", seconds = 6.85 },
    { id = "streets", file = "dude I just got streets 112.ogg", line = "Dude, I just got Streets 112.", seconds = 3.85 },
    { id = "skipped", file = "yes I did thats right I skipped 113.ogg", line = "Yes I did, that's right, I skipped 113.", seconds = 6.59 },
    { id = "skipped113", file = "I skipped 113 im a fucking legend.ogg", line = "I skipped 113. I'm a fucking legend.", seconds = 3.85 },
    { id = "legend", file = "i am a legend.ogg", line = "I am a legend.", seconds = 5.26 },
    { id = "fuckinglegend", file = "I am a fucking legend.ogg", line = "I am a fucking legend.", seconds = 2.23 },
    { id = "mr", file = "an mr rl time.ogg", line = "An MR/RL time.", seconds = 1.99 },
    { id = "clutch", file = "clutch.ogg", line = "Got a fucking 112, baby. I am fucking clutch.", seconds = 5.58 },
    { id = "typing", file = "typing a storm.ogg", line = "Look at me typing. I'm typing a storm.", seconds = 4.81 },
}

-- Forever route bands from NaowhForever_QoL's generated ZoneLevelsData.lua.
-- One level early still counts. Past the top is backward.
local ROUTE = {
    [1411] = { 5, 10 },  -- Durotar
    [1412] = { 5, 10 },  -- Mulgore
    [1413] = { 10, 25 }, -- The Barrens
    [1416] = { 27, 39 }, -- Alterac Mountains
    [1417] = { 30, 40 }, -- Arathi Highlands
    [1418] = { 36, 45 }, -- Badlands
    [1419] = { 46, 55 }, -- Blasted Lands
    [1420] = { 5, 12 },  -- Tirisfal Glades
    [1421] = { 10, 20 }, -- Silverpine Forest
    [1422] = { 46, 57 }, -- Western Plaguelands
    [1423] = { 54, 59 }, -- Eastern Plaguelands
    [1424] = { 20, 31 }, -- Hillsbrad Foothills
    [1425] = { 41, 49 }, -- The Hinterlands
    [1426] = { 4, 12 },  -- Dun Morogh
    [1427] = { 43, 48 }, -- Searing Gorge
    [1428] = { 50, 59 }, -- Burning Steppes
    [1429] = { 5, 10 },  -- Elwynn Forest
    [1430] = { 50, 60 }, -- Deadwind Pass
    [1431] = { 19, 30 }, -- Duskwood
    [1432] = { 10, 18 }, -- Loch Modan
    [1433] = { 15, 25 }, -- Redridge Mountains
    [1434] = { 30, 44 }, -- Stranglethorn Vale
    [1435] = { 36, 43 }, -- Swamp of Sorrows
    [1436] = { 9, 18 },  -- Westfall
    [1437] = { 20, 30 }, -- Wetlands
    [1438] = { 5, 11 },  -- Teldrassil
    [1439] = { 11, 19 }, -- Darkshore
    [1440] = { 19, 30 }, -- Ashenvale
    [1441] = { 24, 35 }, -- Thousand Needles
    [1442] = { 15, 25 }, -- Stonetalon Mountains
    [1443] = { 30, 39 }, -- Desolace
    [1444] = { 41, 60 }, -- Feralas
    [1445] = { 36, 43 }, -- Dustwallow Marsh
    [1446] = { 40, 50 }, -- Tanaris
    [1447] = { 42, 55 }, -- Azshara
    [1448] = { 47, 54 }, -- Felwood
    [1449] = { 48, 55 }, -- Un'Goro Crater
    [1451] = { 55, 59 }, -- Silithus
    [1452] = { 55, 60 }, -- Winterspring
    [2521] = { 3, 12 },  -- Zephras Isle
    [2548] = { 36, 44 }, -- Riverglades
}

-- These capital-only maps are intentionally excluded from route announcements.
-- Zephras Isle is also tagged as a capital by the installed data, but remains
-- in ROUTE because Forever explicitly assigns it a 3-12 leveling band.
local CAPITALS = {
    [1453] = true, [1454] = true, [1455] = true, [1456] = true, [1457] = true, [1458] = true,
    [2482] = true, -- Mount Hyjal
}

local LEVEL_CLIPS = {
    [12] = "thought",
    [14] = "never",
    [40] = "lucky",
    [47] = "fifty",
    [49] = "fifty",
    [50] = "fifty",
}
local SILENT_LEVEL = 13
-- The streak follows the run. "Two quick ones" is the second beat because that
-- is what the line says, and "look at the pace" is the next line in the video.
-- The fourth is the "this is fucking it" that lands after the pace shout.
-- A ding that opens a streak uses the louder "right here" instead.
local BEAT_WINDOW = 60
local BURST_GAP = 2
local LADDER = { "thisone", "two", "pace", "fuckingit" }
local DING_OPENER = "righthere"
local FAT_TURNIN = 0.08
local RUSH_TURNIN = 0.15
local RUSH_CD = 10 * 60
local LUCKY_CD = 30 * 60
local PACE_WINDOW = 10 * 60
local PACE_KEEP = PACE_WINDOW + 10
local HEAD_GAP = 5
local CLUTCH_CD = 10 * 60
local TYPE_CD = 10 * 60
-- First time each line is said in the video. Lines held for the end of a
-- streak play in this order. Level lines keep the order they were queued.
local VIDEO_ORDER = {
    mr = 5, rutzou = 10, skipped = 20, fuckinglegend = 30, never = 40, baby = 50,
    yes = 60, lucky = 70, thisone = 80, righthere = 90, insane = 100,
    the112 = 110, fuckingit = 120, rush = 130, watch = 140, fast = 150,
    head = 160, clutch = 165, line = 170, two = 180, pace = 190, fifty = 200,
    thought = 210, typing = 215, streets = 220, skipped113 = 230, legend = 240,
}
local HEARTH_SPELLS = { [8690] = true, [556] = true }
local UNCOMMON = (Enum and Enum.ItemQuality and Enum.ItemQuality.Uncommon) or 2
local RARE = (Enum and Enum.ItemQuality and Enum.ItemQuality.Rare) or 3
local EPIC = (Enum and Enum.ItemQuality and Enum.ItemQuality.Epic) or 4
local GREEN_LEVEL = 30
local GAP = 0.15

-- PlaySoundFile takes a channel and no loudness. The clip uses that
-- channel's own slider. Dialog is the voice slider.
local CHANNELS = {
    { id = "Master", cvar = "Sound_MasterVolume", enable = "Sound_EnableAllSound", global = "MASTER_VOLUME" },
    { id = "SFX", cvar = "Sound_SFXVolume", enable = "Sound_EnableSFX", global = "FX_VOLUME" },
    { id = "Music", cvar = "Sound_MusicVolume", enable = "Sound_EnableMusic", global = "MUSIC_VOLUME" },
    { id = "Ambience", cvar = "Sound_AmbienceVolume", enable = "Sound_EnableAmbience", global = "AMBIENCE_VOLUME" },
    { id = "Dialog", cvar = "Sound_DialogVolume", enable = "Sound_EnableDialog", global = "DIALOG_VOLUME" },
}
local DEFAULTS = {
    enabled = true,
    debug = false,
    channel = "Dialog",
    subtitles = false,
    login = true,
    showMinimap = true,
    showBar = true,
    honorMute = true,
    muteCombat = false,
    muteInstance = false,
    muteGroup = false,
    minimapAngle = 225,
    barShadow = false,
    barFont = "Arial Narrow",
    barOutline = "None",
    barTexture = "Blizzard",
    barFontSize = 11,
    barWidth = 168,
    barHeight = 5,
    barFastR = 0.2, barFastG = 1, barFastB = 0.6,
    barUnderR = 0.953, barUnderG = 0.925, barUnderB = 0.875,
    barMarkR = 1, barMarkG = 0.82, barMarkB = 0,
    triggers = {
        level = true,
        turnin = true,
        pace = true,
        zone = true,
        dungeon = true,
        kill = true,
        loot = true,
        group = true,
        typing = true,
        finalboss = true,
    },
}
local DB_SCHEMA_VERSION = 2
local BOOLEAN_DEFAULTS = {
    enabled = true,
    debug = false,
    subtitles = false,
    login = true,
    showMinimap = true,
    showBar = true,
    barShadow = false,
    honorMute = true,
    muteCombat = false,
    muteInstance = false,
    muteGroup = false,
}
local CHANNEL_IDS = {}
for i = 1, #CHANNELS do
    CHANNEL_IDS[CHANNELS[i].id] = true
end
local FRAME_POINTS = {
    TOPLEFT = true, TOP = true, TOPRIGHT = true,
    LEFT = true, CENTER = true, RIGHT = true,
    BOTTOMLEFT = true, BOTTOM = true, BOTTOMRIGHT = true,
}
-- Client faces. Arial Narrow is the Classic number and chat font.
local BAR_FONTS = {
    { name = "Arial Narrow", file = "Fonts\\ARIALN.TTF" },
    { name = "Friz Quadrata", file = "Fonts\\FRIZQT__.TTF" },
    { name = "Morpheus", file = "Fonts\\MORPHEUS.TTF" },
    { name = "Skurri", file = "Fonts\\SKURRI.TTF" },
}
local BAR_TEXTURES = {
    { name = "Blizzard", file = "Interface\\TargetingFrame\\UI-StatusBar" },
    { name = "Raid", file = "Interface\\RaidFrame\\Raid-Bar-Hp-Fill" },
    { name = "Flat", file = "Interface\\ChatFrame\\ChatFrameBackground" },
}
local BAR_OUTLINES = {
    { name = "None", flag = "" },
    { name = "Outline", flag = "OUTLINE" },
    { name = "Thick", flag = "THICKOUTLINE" },
    { name = "Monochrome", flag = "MONOCHROME,OUTLINE" },
}
local BAR_QUOTES = {
    "I've never seen a 1:13 and I never fucking will.",
    "This is fucking it.",
    "Look at that, see how fast my pace is?",
    "LOOK AT THE FUCKING PACE!",
}
local BAR_FONT_FILES = {}
for i = 1, #BAR_FONTS do
    BAR_FONT_FILES[BAR_FONTS[i].name] = BAR_FONTS[i].file
end
local BAR_TEXTURE_FILES = {}
for i = 1, #BAR_TEXTURES do
    BAR_TEXTURE_FILES[BAR_TEXTURES[i].name] = BAR_TEXTURES[i].file
end
local BAR_OUTLINE_FLAGS = {}
for i = 1, #BAR_OUTLINES do
    BAR_OUTLINE_FLAGS[BAR_OUTLINES[i].name] = BAR_OUTLINES[i].flag
end
local DEBUG_EVENTS = {
    "UPDATE_EXHAUSTION",
    "PLAYER_UPDATE_RESTING",
    "DISABLE_XP_GAIN",
    "ENABLE_XP_GAIN",
    "QUEST_ACCEPTED",
    "QUEST_REMOVED",
    "QUEST_COMPLETE",
    "QUEST_FINISHED",
    "QUEST_PROGRESS",
    "QUEST_DETAIL",
    "QUEST_WATCH_UPDATE",
    "QUEST_AUTOCOMPLETE",
    "MAP_EXPLORATION_UPDATED",
    "LEARNED_SPELL_IN_SKILL_LINE",
    "PLAYER_ALIVE",
    "PLAYER_UNGHOST",
}

local LOOT_PATTERNS = {}
local function AddLootPattern(fmt)
    if type(fmt) ~= "string" then
        return
    end
    local pattern = fmt:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
    pattern = pattern:gsub("%%%%s", "(.+)"):gsub("%%%%d", "(%%d+)")
    LOOT_PATTERNS[#LOOT_PATTERNS + 1] = "^" .. pattern .. "$"
end
AddLootPattern(LOOT_ITEM_SELF_MULTIPLE)
AddLootPattern(LOOT_ITEM_SELF)
AddLootPattern(LOOT_ITEM_PUSHED_SELF_MULTIPLE)
AddLootPattern(LOOT_ITEM_PUSHED_SELF)

local killPattern
local function KillPattern()
    if killPattern ~= nil then
        return killPattern
    end
    local fmt = _G.ERR_QUEST_ADD_KILL_SII
    if type(fmt) ~= "string" then
        killPattern = false
        return nil
    end
    local pattern = fmt:gsub("([%(%)%.%%%+%-%*%?%[%]%^%$])", "%%%1")
    pattern = pattern:gsub("%%%%s", ".+"):gsub("%%%%d", "(%%d+)")
    killPattern = "^" .. pattern
    return killPattern
end

local byId = {}
for index, clip in ipairs(CLIPS) do
    clip.index = index
    byId[clip.id] = clip
end

-- Runtime state is one table so this chunk stays under Lua's 200-local limit.
local state = {
    db = nil,
    char = nil,
    lastXP = nil,
    lastXPMax = nil,
    lastXPLevel = nil,
    pendingXPLevel = nil,
    recentGain = nil,
    pendingTurnIn = nil,
    turnToken = 0,
    pending = {},
    busy = false,
    activeClip = nil,
    activeHandle = nil,
    playbackSerial = 0,
    quietUntil = 0,
    lastGroupAt = 0,
    lastRushAt = 0,
    lastHeadAt = 0,
    lastClutchAt = 0,
    lastTypeAt = 0,
    lastLootLink = nil,
    lastLootAt = 0,
    lastXpAt = 0,
    invitesHooked = false,
    chatHooked = false,
    ahOpen = false,
    hearthSkip = false,
    ready = false,
    currentMap = nil,
    wasDungeon = false,
    xpSamples = {},
    loginBest = nil,
    sessionRecord = false,
    sessionSkip = false,
    floorAnnounced = false,
    aboveSince = nil,
    sessionHeld = false,
    turnInDing = false,
    beatCount = 0,
    announcedRung = 0,
    lastBeatAt = 0,
    chainFat = false,
    deferredLong = {},
    chainToken = 0,
    burstToken = 0,
    burstXp = 0,
    burstMax = 1,
    burstDing = false,
    activeRole = nil,
    activeForce = false,
    activeEntry = nil,
    pendingLevel = nil,
    levelSerial = 0,
    finalEncounterIds = nil,
    pendingFinalBoss = {},
    pendingSixty = false,
    sixtyDecided = false,
    playedTotal = nil,
    playedAt = nil,
    askingPlayed = false,
    playedRequestSerial = 0,
    suppressPlayedChat = false,
    playedFilterInstalled = false,
    pendingSplit = nil,
}
local PlayedNow
local RefreshBar
local splitsFrame
local RefreshSplits
local ToggleSplits
local frame = CreateFrame("Frame")

local function Print(text)
    DEFAULT_CHAT_FRAME:AddMessage(PREFIX .. text)
end

local function FiniteNumber(value)
    local number = tonumber(value)
    if not number or number ~= number or number == math.huge or number == -math.huge then
        return nil
    end
    return number
end

local function NormalizeNumber(value, minimum, maximum, default, integer)
    local number = FiniteNumber(value)
    if not number then
        return default
    end
    if minimum and number < minimum then
        number = minimum
    end
    if maximum and number > maximum then
        number = maximum
    end
    if integer then
        number = math.floor(number + 0.5)
    end
    return number
end

local function NormalizeOptionalNumber(value, minimum, maximum, integer)
    if value == nil then
        return nil
    end
    local number = FiniteNumber(value)
    if not number or (minimum and number < minimum) or (maximum and number > maximum) then
        return nil
    end
    return integer and math.floor(number + 0.5) or number
end

local function NormalizeCharacterRecord(record)
    record.bestRate = NormalizeOptionalNumber(record.bestRate, 1)

    if type(record.zones) == "table" then
        local zones = {}
        for key, value in pairs(record.zones) do
            local map = NormalizeOptionalNumber(key, 1, nil, true)
            if map and value == true then
                zones[tostring(map)] = true
            end
        end
        record.zones = zones
    elseif record.zones ~= nil then
        record.zones = nil
    end
    record.slowZones = nil

    if type(record.splits) == "table" then
        local splits = {}
        for level = 1, 60 do
            local seconds = record.splits[level]
            if seconds == nil then
                seconds = record.splits[tostring(level)]
            end
            seconds = NormalizeOptionalNumber(seconds, 0, nil, true)
            if seconds then
                splits[level] = seconds
            end
        end
        record.splits = splits
    elseif record.splits ~= nil then
        record.splits = nil
    end
end

local function NormalizeDB()
    local loadedSchema = NormalizeOptionalNumber(state.db.schemaVersion, 0, nil, true) or 0
    if type(state.db.triggers) ~= "table" then
        state.db.triggers = {}
    end
    for key, default in pairs(BOOLEAN_DEFAULTS) do
        if type(state.db[key]) ~= "boolean" then
            state.db[key] = default
        end
    end
    for key, default in pairs(DEFAULTS.triggers) do
        if type(state.db.triggers[key]) ~= "boolean" then
            state.db.triggers[key] = default
        end
    end

    if not CHANNEL_IDS[state.db.channel] then
        state.db.channel = DEFAULTS.channel
    end
    state.db.minimapAngle = NormalizeNumber(state.db.minimapAngle, nil, nil, DEFAULTS.minimapAngle) % 360
    if type(state.db.barFont) ~= "string" or state.db.barFont == "" then
        state.db.barFont = DEFAULTS.barFont
    end
    if BAR_OUTLINE_FLAGS[state.db.barOutline] == nil then
        state.db.barOutline = DEFAULTS.barOutline
    end
    if type(state.db.barTexture) ~= "string" or state.db.barTexture == "" then
        state.db.barTexture = DEFAULTS.barTexture
    end
    state.db.barFontSize = NormalizeNumber(state.db.barFontSize, 8, 32, DEFAULTS.barFontSize, true)
    state.db.barWidth = NormalizeNumber(state.db.barWidth, 64, 400, DEFAULTS.barWidth, true)
    state.db.barHeight = NormalizeNumber(state.db.barHeight, 2, 24, DEFAULTS.barHeight, true)
    state.db.barFastR = NormalizeNumber(state.db.barFastR, 0, 1, DEFAULTS.barFastR)
    state.db.barFastG = NormalizeNumber(state.db.barFastG, 0, 1, DEFAULTS.barFastG)
    state.db.barFastB = NormalizeNumber(state.db.barFastB, 0, 1, DEFAULTS.barFastB)
    state.db.barUnderR = NormalizeNumber(state.db.barUnderR, 0, 1, DEFAULTS.barUnderR)
    state.db.barUnderG = NormalizeNumber(state.db.barUnderG, 0, 1, DEFAULTS.barUnderG)
    state.db.barUnderB = NormalizeNumber(state.db.barUnderB, 0, 1, DEFAULTS.barUnderB)
    state.db.barMarkR = NormalizeNumber(state.db.barMarkR, 0, 1, DEFAULTS.barMarkR)
    state.db.barMarkG = NormalizeNumber(state.db.barMarkG, 0, 1, DEFAULTS.barMarkG)
    state.db.barMarkB = NormalizeNumber(state.db.barMarkB, 0, 1, DEFAULTS.barMarkB)
    state.db.goal60 = NormalizeOptionalNumber(state.db.goal60, 1, nil, true)
    state.db.fastest60 = NormalizeOptionalNumber(state.db.fastest60, 1, nil, true)
    state.db.turnInStreak = NormalizeOptionalNumber(state.db.turnInStreak, 0, nil, true)
    state.db.lastTurnIn = NormalizeOptionalNumber(state.db.lastTurnIn, 0, nil, true)
    state.db.luckyUntil = NormalizeOptionalNumber(state.db.luckyUntil, 0, nil, true)
    if type(state.db.lastFinalBossKey) ~= "string" or state.db.lastFinalBossKey == "" then
        state.db.lastFinalBossKey = nil
    end
    state.db.lastFinalBossAt = NormalizeOptionalNumber(state.db.lastFinalBossAt, 0, nil, true)
    if not state.db.lastFinalBossKey or not state.db.lastFinalBossAt then
        state.db.lastFinalBossKey = nil
        state.db.lastFinalBossAt = nil
    end

    if type(state.db.showSplits) ~= "boolean" then
        state.db.showSplits = nil
    end
    if type(state.db.splitsPoint) == "table" then
        local point = state.db.splitsPoint[1]
        local relative = state.db.splitsPoint[2]
        local x = NormalizeOptionalNumber(state.db.splitsPoint[3], -10000, 10000)
        local y = NormalizeOptionalNumber(state.db.splitsPoint[4], -10000, 10000)
        if FRAME_POINTS[point] and (relative == nil or FRAME_POINTS[relative]) and x and y then
            state.db.splitsPoint = { point, relative or point, x, y }
        else
            state.db.splitsPoint = nil
        end
    elseif state.db.splitsPoint ~= nil then
        state.db.splitsPoint = nil
    end

    if type(state.db.barPoint) == "table" then
        local point = state.db.barPoint[1]
        local relative = state.db.barPoint[2]
        local x = NormalizeOptionalNumber(state.db.barPoint[3], -10000, 10000)
        local y = NormalizeOptionalNumber(state.db.barPoint[4], -10000, 10000)
        if FRAME_POINTS[point] and (relative == nil or FRAME_POINTS[relative]) and x and y then
            state.db.barPoint = { point, relative or point, x, y }
        else
            state.db.barPoint = nil
        end
    elseif state.db.barPoint ~= nil then
        state.db.barPoint = nil
    end

    if type(state.db.chars) ~= "table" then
        state.db.chars = {}
    else
        local chars = {}
        for key, record in pairs(state.db.chars) do
            if type(key) == "string" and type(record) == "table" then
                NormalizeCharacterRecord(record)
                chars[key] = record
            end
        end
        state.db.chars = chars
    end
    -- Unknown keys and future schema numbers survive so an older copy of the
    -- addon cannot silently downgrade otherwise valid newer data.
    state.db.schemaVersion = math.max(loadedSchema, DB_SCHEMA_VERSION)
end

local function LoadDB()
    if type(InsanePaceDB) ~= "table" then
        InsanePaceDB = {}
    end
    state.db = InsanePaceDB
    if type(state.db.triggers) ~= "table" then
        state.db.triggers = {}
    end
    for key, value in pairs(DEFAULTS) do
        if key ~= "triggers" and state.db[key] == nil then
            state.db[key] = value
        end
    end
    for key, value in pairs(DEFAULTS.triggers) do
        if state.db.triggers[key] == nil then
            state.db.triggers[key] = value
        end
    end
    NormalizeDB()
end

local function TriggerOn(key)
    return state.db.triggers[key] ~= false
end

local function ChannelById(id)
    for i = 1, #CHANNELS do
        if CHANNELS[i].id == id then
            return CHANNELS[i]
        end
    end
    return CHANNELS[1]
end

local function OutputChannel()
    return ChannelById(state.db.channel)
end

local function CVarOn(name)
    if type(GetCVar) ~= "function" then
        return true
    end
    local value = GetCVar(name)
    if value == nil then
        return true
    end
    return value == "1"
end

local function InGroup()
    if IsInGroup then
        return IsInGroup()
    end
    return GetNumGroupMembers and GetNumGroupMembers() > 0
end

-- Movies and a muted game are quiet unless that switch is off.
-- Combat, instances, and groups are quiet only when their own switch is on.
local function GameQuiet()
    if state.db.honorMute == false then
        return false
    end
    if not CVarOn("Sound_EnableAllSound") then
        return true
    end
    local channel = OutputChannel()
    if channel.id ~= "Master" and not CVarOn(channel.enable) then
        return true
    end
    if CinematicFrame and CinematicFrame.IsShown and CinematicFrame:IsShown() then
        return true
    end
    if MovieFrame and MovieFrame.IsShown and MovieFrame:IsShown() then
        return true
    end
    if InCinematic and InCinematic() then
        return true
    end
    if TalkingHeadFrame and TalkingHeadFrame.IsShown and TalkingHeadFrame:IsShown() then
        return true
    end
    return false
end

local function CombatQuiet()
    if state.db.muteCombat and UnitAffectingCombat("player") then
        return true
    end
    return false
end

local function NonCombatSituationQuiet()
    if state.db.muteInstance then
        local inside, kind = IsInInstance()
        if inside and kind and kind ~= "none" then
            return true
        end
    end
    if state.db.muteGroup and InGroup() then
        return true
    end
    return false
end

local function Character()
    if state.char then
        return state.char
    end
    local name, realm = UnitName("player"), GetRealmName()
    local key = (name or "?") .. "-" .. (realm or "?")
    state.db.chars = state.db.chars or {}
    if type(state.db.chars[key]) ~= "table" then
        state.db.chars[key] = {}
    end
    state.char = state.db.chars[key]
    return state.char
end

local function NoteXP()
    state.lastXP = UnitXP("player")
    state.lastXPMax = UnitXPMax("player")
    state.lastXPLevel = UnitLevel("player")
    state.pendingXPLevel = nil
end

local function Dead()
    return UnitIsDeadOrGhost and UnitIsDeadOrGhost("player")
end

local function SoundsAllowed()
    return GetTime() >= state.quietUntil
end

local function Blocked()
    return Dead() or state.ahOpen or not SoundsAllowed()
end

local function ClipPending(id)
    if state.activeClip and state.activeClip.id == id then
        return true
    end
    for i = 1, #state.pending do
        local clip = state.pending[i].clip
        if clip and clip.id == id then
            return true
        end
    end
    return false
end

local function DiscardEntry(entry)
    if entry and entry.onDiscarded then
        local ok, err = pcall(entry.onDiscarded)
        if not ok then
            Print("Discard callback failed: " .. tostring(err))
        end
    end
end

-- ChainOpen is the 60 second clock, including a small hand-in that only armed
-- the next line. ChainHot means a streak line is actually in that window, so
-- a style bark can join it and a long line waits.
local function ChainOpen()
    return state.beatCount > 0 and state.lastBeatAt > 0 and (GetTime() - state.lastBeatAt) < BEAT_WINDOW
end

local function ChainHot()
    return state.announcedRung > 0 and state.lastBeatAt > 0 and (GetTime() - state.lastBeatAt) < BEAT_WINDOW
end

local function DeferLong(entry)
    if not entry or not entry.clip then
        return
    end
    for i = 1, #state.deferredLong do
        if state.deferredLong[i].clip.id == entry.clip.id then
            state.deferredLong[i] = entry
            return
        end
    end
    state.deferredLong[#state.deferredLong + 1] = entry
end

local function ResetChain()
    state.beatCount = 0
    state.announcedRung = 0
    state.lastBeatAt = 0
    state.chainFat = false
    state.turnInDing = false
    state.burstXp = 0
    state.burstDing = false
    state.burstToken = state.burstToken + 1
    state.chainToken = state.chainToken + 1
    state.deferredLong = {}
    if state.db then
        state.db.turnInStreak = 0
    end
end

local function ClearActive()
    state.activeClip = nil
    state.activeHandle = nil
    state.activeRole = nil
    state.activeForce = false
    state.activeEntry = nil
    state.busy = false
end

local function CanInterrupt(role)
    if not state.busy or state.activeForce then
        return false
    end
    if role == "ladder" then
        return state.activeRole ~= "level" and state.activeRole ~= "spree"
    end
    if role == "spree" then
        return state.activeRole == "style" or state.activeRole == "long" or state.activeRole == "queue"
            or state.activeRole == "follow" or state.activeRole == nil
    end
    return false
end

local function InterruptActive()
    local entry = state.activeEntry
    local role = state.activeRole
    state.playbackSerial = state.playbackSerial + 1
    if state.activeHandle and StopSound then
        StopSound(state.activeHandle)
    end
    ClearActive()
    -- A long line cut off by the streak still belongs at the end of it.
    -- Rush is that ending, so cutting it does not schedule another.
    if role == "long" and entry and entry.clip and entry.clip.id ~= "rush" then
        DeferLong(entry)
    end
end

local function StripForLadder()
    local kept = {}
    for i = 1, #state.pending do
        local entry = state.pending[i]
        if entry.role == "long" then
            DeferLong(entry)
        elseif entry.role == "ladder" or entry.role == "style" or entry.role == "follow" then
            DiscardEntry(entry)
        else
            kept[#kept + 1] = entry
        end
    end
    state.pending = kept
end

local function EntryDisposition(entry)
    if entry.force then
        return "play"
    end
    if state.db.enabled == false then
        return "discard"
    end
    if entry.trigger and not TriggerOn(entry.trigger) then
        return "discard"
    end
    if GameQuiet() or NonCombatSituationQuiet() or Dead() or state.ahOpen or not SoundsAllowed() then
        return "discard"
    end
    if CombatQuiet() then
        return entry.deferCombat and "wait" or "discard"
    end
    return "play"
end

local PlayNext
PlayNext = function()
    if state.busy or (not SoundsAllowed() and not (state.pending[1] and state.pending[1].force)) then
        return
    end
    local entry = table.remove(state.pending, 1)
    if not entry then
        return
    end
    local disposition = EntryDisposition(entry)
    if disposition == "wait" then
        table.insert(state.pending, 1, entry)
        return
    elseif disposition == "discard" then
        DiscardEntry(entry)
        PlayNext()
        return
    end
    local clip = entry.clip
    state.busy = true
    state.activeClip = clip
    state.activeRole = entry.role or "queue"
    state.activeForce = entry.force and true or false
    state.activeEntry = entry
    state.playbackSerial = state.playbackSerial + 1
    local serial = state.playbackSerial
    local played, handle = PlaySoundFile(SOUND_DIR .. clip.file, OutputChannel().id)
    if not played then
        ClearActive()
        Print("The client rejected " .. clip.file .. ".")
        DiscardEntry(entry)
        PlayNext()
        return
    end
    state.activeHandle = handle
    if entry.onPlayed then
        local ok, err = pcall(entry.onPlayed)
        if not ok then
            Print("Playback callback failed: " .. tostring(err))
        end
    end
    if entry.force or state.db.subtitles ~= false then
        Print(clip.line)
    end
    C_Timer.After((clip.seconds or 2) + GAP, function()
        if serial ~= state.playbackSerial then
            return
        end
        local finished = state.activeEntry
        ClearActive()
        if finished and finished.onFinished then
            local ok, err = pcall(finished.onFinished)
            if not ok then
                Print("Finish callback failed: " .. tostring(err))
            end
        end
        PlayNext()
    end)
end

local function PlayClip(clip, trigger, force, onPlayed, deferCombat, onDiscarded, role, onFinished)
    if not clip then
        return false
    end
    if not force and (state.db.enabled == false or (trigger and not TriggerOn(trigger)) or Blocked()
        or GameQuiet() or NonCombatSituationQuiet() or (CombatQuiet() and not deferCombat)) then
        if onDiscarded then
            onDiscarded()
        end
        return false
    end
    role = role or "queue"
    local entry = {
        clip = clip,
        trigger = trigger,
        force = force and true or false,
        onPlayed = onPlayed,
        deferCombat = deferCombat and true or false,
        onDiscarded = onDiscarded,
        onFinished = onFinished,
        role = role,
    }
    if role == "long" and ChainHot() then
        DeferLong(entry)
        return true
    end
    if role == "ladder" then
        if CanInterrupt(role) then
            InterruptActive()
        end
        StripForLadder()
        if state.busy then
            table.insert(state.pending, 1, entry)
        else
            state.pending[#state.pending + 1] = entry
        end
    elseif role == "spree" and CanInterrupt(role) then
        InterruptActive()
        local kept = {}
        for i = 1, #state.pending do
            local queued = state.pending[i]
            if queued.role == "style" or queued.role == "follow" then
                DiscardEntry(queued)
            else
                kept[#kept + 1] = queued
            end
        end
        state.pending = kept
        state.pending[#state.pending + 1] = entry
    elseif role == "spree" and state.busy then
        table.insert(state.pending, 1, entry)
    else
        state.pending[#state.pending + 1] = entry
    end
    PlayNext()
    return true
end

local function Silence(preserveDeferred)
    state.quietUntil = GetTime() + 1
    local kept = {}
    for i = 1, #state.pending do
        local entry = state.pending[i]
        if preserveDeferred and entry.deferCombat then
            kept[#kept + 1] = entry
        else
            DiscardEntry(entry)
        end
    end
    state.pending = kept
    state.playbackSerial = state.playbackSerial + 1
    if state.activeHandle and StopSound then
        StopSound(state.activeHandle)
    end
    ClearActive()
end

local ReleaseChain

local function RetryRelease()
    state.chainToken = state.chainToken + 1
    local token = state.chainToken
    C_Timer.After(1, function()
        if token ~= state.chainToken then
            return
        end
        ReleaseChain()
    end)
end

ReleaseChain = function()
    if ChainOpen() then
        return
    end
    if state.db.enabled == false then
        state.deferredLong = {}
        state.chainFat = false
        return
    end
    local waiting = state.chainFat or #state.deferredLong > 0
    if not waiting then
        return
    end
    if Dead() or state.ahOpen or not SoundsAllowed() or GameQuiet() or NonCombatSituationQuiet() or CombatQuiet() then
        RetryRelease()
        return
    end
    local items = state.deferredLong
    state.deferredLong = {}
    local fat = state.chainFat
    state.chainFat = false
    if fat and (GetTime() - state.lastRushAt) >= RUSH_CD and not ClipPending("rush") then
        items[#items + 1] = {
            clip = byId.rush,
            trigger = "turnin",
            role = "long",
            onFinished = function()
                state.lastRushAt = GetTime()
            end,
        }
    end
    table.sort(items, function(a, b)
        local left = VIDEO_ORDER[a.clip.id] or 0
        local right = VIDEO_ORDER[b.clip.id] or 0
        return left < right
    end)
    for i = 1, #items do
        local entry = items[i]
        PlayClip(entry.clip, entry.trigger, false, entry.onPlayed, entry.deferCombat, entry.onDiscarded, entry.role or "long", entry.onFinished)
    end
end

local function TouchChainTimer()
    state.chainToken = state.chainToken + 1
    local token = state.chainToken
    local delay = BEAT_WINDOW - (GetTime() - state.lastBeatAt)
    if delay < 0.05 then
        delay = 0.05
    end
    C_Timer.After(delay, function()
        if token ~= state.chainToken then
            return
        end
        if ChainOpen() then
            TouchChainTimer()
            return
        end
        ReleaseChain()
    end)
end

local function RestoreChain()
    local elapsed = state.db.lastTurnIn and (time() - state.db.lastTurnIn)
    if not elapsed or elapsed < 0 or elapsed >= BEAT_WINDOW or not state.db.turnInStreak or state.db.turnInStreak < 1 then
        state.beatCount = 0
        state.announcedRung = 0
        state.lastBeatAt = 0
        return
    end
    state.beatCount = state.db.turnInStreak
    state.announcedRung = math.min(state.beatCount, #LADDER)
    state.lastBeatAt = GetTime() - elapsed
    TouchChainTimer()
end

-- Forever exposes final-boss ordering through the Encounter Journal, but has
-- no universal "is final" flag. The last listed encounter is the supported
-- source of truth; instances absent from the journal are intentionally skipped.
local function BuildFinalEncounterIndex()
    if type(EJ_GetNumTiers) ~= "function"
        or type(EJ_SelectTier) ~= "function"
        or type(EJ_GetInstanceByIndex) ~= "function"
        or type(EJ_GetEncounterInfoByIndex) ~= "function" then
        return false
    end

    local ok, tierCount = pcall(EJ_GetNumTiers)
    if not ok or type(tierCount) ~= "number" or tierCount < 1 then
        return false
    end

    local oldTier
    if type(EJ_GetCurrentTier) == "function" then
        local gotTier, tier = pcall(EJ_GetCurrentTier)
        if gotTier then
            oldTier = tier
        end
    end

    local found = {}
    for tier = 1, tierCount do
        local selected = pcall(EJ_SelectTier, tier)
        if selected then
            for _, isRaid in ipairs({ false, true }) do
                local instanceIndex = 1
                while true do
                    local gotInstance, instanceID = pcall(EJ_GetInstanceByIndex, instanceIndex, isRaid)
                    if not gotInstance or not instanceID then
                        break
                    end

                    local lastEncounter
                    local encounterIndex = 1
                    while true do
                        local gotEncounter, _, _, _, _, _, _, encounterID =
                            pcall(EJ_GetEncounterInfoByIndex, encounterIndex, instanceID)
                        if not gotEncounter or not encounterID then
                            break
                        end
                        lastEncounter = encounterID
                        encounterIndex = encounterIndex + 1
                    end
                    if lastEncounter then
                        found[lastEncounter] = true
                    end
                    instanceIndex = instanceIndex + 1
                end
            end
        end
    end

    if oldTier then
        pcall(EJ_SelectTier, oldTier)
    end
    if not next(found) then
        return false
    end
    state.finalEncounterIds = found
    return true
end

local function OnFinalBossEnded(encounterID, _, difficultyID, _, success)
    if issecretvalue and (issecretvalue(encounterID) or issecretvalue(difficultyID) or issecretvalue(success)) then
        return
    end
    if success ~= 1 or type(encounterID) ~= "number" then
        return
    end

    local _, instanceType, eventDifficulty, _, _, _, _, instanceID = GetInstanceInfo()
    if instanceType ~= "party" and instanceType ~= "raid" then
        return
    end
    if not state.finalEncounterIds and not BuildFinalEncounterIndex() then
        return
    end
    if not state.finalEncounterIds[encounterID] then
        return
    end

    difficultyID = difficultyID or eventDifficulty or 0
    local key = table.concat({ tostring(instanceID or 0), tostring(encounterID), tostring(difficultyID) }, ":")
    if state.pendingFinalBoss[key] then
        return
    end
    local now = time()
    if state.db.lastFinalBossKey == key and state.db.lastFinalBossAt and now >= state.db.lastFinalBossAt
        and now - state.db.lastFinalBossAt < 30 then
        return
    end

    state.pendingFinalBoss[key] = true
    local function Release()
        state.pendingFinalBoss[key] = nil
    end
    local function Commit()
        Release()
        state.db.lastFinalBossKey = key
        state.db.lastFinalBossAt = time()
    end
    PlayClip(byId.fuckinglegend, "finalboss", false, Commit, true, Release, "level")
end

local function MapId()
    if C_Map and C_Map.GetBestMapForUnit then
        return C_Map.GetBestMapForUnit("player")
    end
end

-- Cumulative /played, in seconds.
-- Levels 1-15 are a fast Classic pace, not a world record: 2:00:00 to 10,
-- then that same experience rate through 15. Each level's share is the
-- vanilla XP required to reach it. A current 1-10 record is about an hour.
-- From 16 on, Joana's 4d 20h 49m hunter, from the chapter times on
-- joanasworld.com/speedruns. The skipped 35-36 chapter is the remainder
-- of that published record.
-- Fast is 80% of this speed, so the allowed time is the benchmark divided by 0.80.
local FAST_SPEED = 0.80
local BENCH = {
    0, 104, 339, 704, 1252, 1983,
    2922, 4096, 5504, 7200, 9183, 11478,
    14113, 17087, 20452, 26808, 30216, 33624,
    37032, 40440, 44460, 46500, 52500, 56490,
    60480, 65640, 74100, 78990, 82860, 91200,
    94380, 101820, 110250, 118680, 130500, 135240,
    143400, 148980, 165930, 173400, 184200, 195420,
    205140, 216420, 222420, 228420, 244140, 257460,
    267300, 276180, 289320, 306360, 309960, 322740,
    342960, 355020, 365100, 379500, 413460, 420540,
}

local function FastPlayed(level)
    local bench = BENCH[level]
    if bench == nil then
        return nil
    end
    return bench / FAST_SPEED
end

local function IsFast(level, played)
    local limit = FastPlayed(level)
    if not limit or played == nil then
        return false
    end
    return played <= limit
end

local function OnFastPace()
    local now = PlayedNow()
    if not now then
        return false
    end
    local level = UnitLevel("player") or 1
    local target = level >= 60 and 60 or (level + 1)
    return IsFast(target, now)
end

local function AddSample(amount)
    local now = GetTime()
    state.xpSamples[#state.xpSamples + 1] = { now, amount }
    local cut = now - PACE_KEEP
    if state.xpSamples[1][1] >= cut then
        return
    end
    local kept = {}
    for i = 1, #state.xpSamples do
        if state.xpSamples[i][1] >= cut then
            kept[#kept + 1] = state.xpSamples[i]
        end
    end
    state.xpSamples = kept
end

-- Nil until the oldest sample is a full ten minutes old. One quest cannot look like a record.
local function CurrentRate()
    if #state.xpSamples == 0 then
        return nil
    end
    local now = GetTime()
    if (now - state.xpSamples[1][1]) < PACE_WINDOW then
        return nil
    end
    local sum = 0
    local start = now - PACE_WINDOW
    for i = 1, #state.xpSamples do
        if state.xpSamples[i][1] >= start then
            sum = sum + state.xpSamples[i][2]
        end
    end
    return (sum / PACE_WINDOW) * 3600
end

local function ConsiderPace()
    local rate = CurrentRate()
    if not rate then
        return
    end
    local record = Character()
    local fastNow = OnFastPace()
    if not state.loginBest then
        state.loginBest = record.bestRate
    end
    local announcedRecord = ClipPending("insane") or ClipPending("skipped113")
    if record.bestRate and rate > record.bestRate then
        local half = state.loginBest and rate >= state.loginBest * 1.5
        if half and not state.sessionSkip then
            if not state.sessionRecord and not ClipPending("insane") then
                announcedRecord = PlayClip(byId.insane, "pace", false, function()
                    state.sessionRecord = true
                    if fastNow then
                        state.floorAnnounced = true
                    end
                end, false, nil, "spree") or announcedRecord
            end
            if not ClipPending("skipped113") then
                announcedRecord = PlayClip(byId.skipped113, "pace", false, function()
                    state.sessionSkip = true
                    if fastNow then
                        state.floorAnnounced = true
                    end
                end, false, nil, "spree") or announcedRecord
            end
        elseif not state.sessionRecord and not ClipPending("insane") then
            announcedRecord = PlayClip(byId.insane, "pace", false, function()
                state.sessionRecord = true
                if fastNow then
                    state.floorAnnounced = true
                end
            end, false, nil, "spree") or announcedRecord
        end
        record.bestRate = rate
    elseif not record.bestRate then
        record.bestRate = rate
        state.loginBest = rate
        if state.db.debug then
            Print(string.format("Pace baseline set to %.0f XP/hour.", rate))
        end
    end

    if fastNow then
        if not state.aboveSince then
            state.aboveSince = GetTime()
        end
        if not state.floorAnnounced then
            if not announcedRecord and not ClipPending("fast") then
                PlayClip(byId.fast, "pace", false, function()
                    state.floorAnnounced = true
                end, false, nil, "spree")
            end
        elseif not state.sessionHeld and (GetTime() - state.aboveSince) >= PACE_WINDOW
            and not ClipPending("the112") then
            -- "Right here, this is the 112" is the line that names the time.
            -- The pace shout itself belongs to the streak.
            PlayClip(byId.the112, "pace", false, function()
                state.sessionHeld = true
            end, false, nil, "spree")
        end
    else
        state.aboveSince = nil
        state.floorAnnounced = false
        state.sessionHeld = false
    end
end

-- PLAYER_XP_UPDATE carries no amount. Use the level snapshot and the
-- PLAYER_LEVEL_UP payload so a residual XP value above the old value still
-- counts as a ding. For the extremely unusual multi-level case, a known quest
-- reward is exact; otherwise the result is the observable lower bound because
-- the client does not expose the skipped levels' XP maxima here.
local function ReadXPGain(knownGain)
    local before, beforeMax, beforeLevel = state.lastXP, state.lastXPMax, state.lastXPLevel
    local xp = UnitXP("player")
    local max = UnitXPMax("player")
    local level = UnitLevel("player")
    local reachedLevel = level
    if state.pendingXPLevel and (not reachedLevel or state.pendingXPLevel > reachedLevel) then
        reachedLevel = state.pendingXPLevel
    end
    local gained = 0
    local dings = false
    if before and beforeMax then
        local exactKnown = NormalizeOptionalNumber(knownGain, 0)
        if beforeLevel and reachedLevel and reachedLevel > beforeLevel then
            gained = math.max(0, beforeMax - before) + math.max(0, xp)
            dings = true
            if reachedLevel > beforeLevel + 1 then
                if exactKnown and exactKnown >= gained then
                    gained = exactKnown
                end
            end
        elseif exactKnown and beforeMax > 0 and exactKnown >= (beforeMax - before) then
            gained = exactKnown
            dings = true
            reachedLevel = beforeLevel and (beforeLevel + 1) or reachedLevel
        elseif xp >= before then
            gained = xp - before
        else
            gained = (beforeMax - before) + xp
            dings = true
            reachedLevel = beforeLevel and (beforeLevel + 1) or reachedLevel
        end
    end
    state.lastXP, state.lastXPMax, state.lastXPLevel = xp, max, reachedLevel or level
    if state.pendingXPLevel and state.lastXPLevel and state.lastXPLevel >= state.pendingXPLevel then
        state.pendingXPLevel = nil
    end
    return gained, xp, max, dings, beforeMax
end

local function PlayedChatFilter()
    if state.suppressPlayedChat then
        return true
    end
end

local function InstallPlayedFilter()
    if not state.playedFilterInstalled and type(ChatFrame_AddMessageEventFilter) == "function" then
        ChatFrame_AddMessageEventFilter("TIME_PLAYED_MSG", PlayedChatFilter)
        state.playedFilterInstalled = true
    end
end

local function AskPlayed()
    if state.askingPlayed or type(RequestTimePlayed) ~= "function" then
        return
    end
    InstallPlayedFilter()
    state.askingPlayed = true
    state.suppressPlayedChat = state.playedFilterInstalled
    state.playedRequestSerial = state.playedRequestSerial + 1
    local serial = state.playedRequestSerial
    RequestTimePlayed()
    C_Timer.After(5, function()
        if state.askingPlayed and serial == state.playedRequestSerial then
            state.askingPlayed = false
            state.suppressPlayedChat = false
        end
    end)
end

local function FormatPlayed(seconds)
    seconds = math.floor(seconds or 0)
    local days = math.floor(seconds / 86400)
    seconds = seconds % 86400
    local hours = math.floor(seconds / 3600)
    seconds = seconds % 3600
    local minutes = math.floor(seconds / 60)
    local parts = {}
    if days > 0 then
        parts[#parts + 1] = days .. "d"
    end
    if hours > 0 or days > 0 then
        parts[#parts + 1] = hours .. "h"
    end
    parts[#parts + 1] = minutes .. "m"
    return table.concat(parts, " ")
end

local function FormatSplit(seconds)
    if not seconds then
        return "..."
    end
    seconds = math.floor(seconds)
    if seconds < 0 then
        seconds = 0
    end
    local days = math.floor(seconds / 86400)
    seconds = seconds % 86400
    local hours = math.floor(seconds / 3600)
    seconds = seconds % 3600
    local minutes = math.floor(seconds / 60)
    local secs = seconds % 60
    if days > 0 then
        return string.format("%dd %d:%02d:%02d", days, hours, minutes, secs)
    end
    if hours > 0 then
        return string.format("%d:%02d:%02d", hours, minutes, secs)
    end
    return string.format("%d:%02d", minutes, secs)
end

PlayedNow = function()
    if not state.playedTotal or not state.playedAt then
        return nil
    end
    return state.playedTotal + (GetTime() - state.playedAt)
end

-- Lap is the time since the previous level. Level 2 starts from zero because
-- /played does too. A later level with no stored previous ding has no lap.
local function SplitLap(level, at, previous)
    if not at then
        return nil
    end
    if previous ~= nil then
        local lap = at - previous
        if lap < 0 then
            return nil
        end
        return lap
    end
    if level == 2 then
        return at
    end
end

local function StoredSplit(splits, level)
    if not splits then
        return nil
    end
    return tonumber(splits[level] or splits[tostring(level)])
end

-- A split is /played at the moment this level was reached. Only a ding this
-- addon sees is stored, so the first character fills in from the next level.
local function RememberSplit(level)
    level = tonumber(level)
    if not level or level < 1 or level > 60 then
        return
    end
    local total = PlayedNow()
    if not total then
        state.pendingSplit = level
        AskPlayed()
        return
    end
    local record = Character()
    record.splits = record.splits or {}
    if StoredSplit(record.splits, level) ~= nil then
        state.pendingSplit = nil
        return
    end
    record.splits[level] = math.floor(total + 0.5)
    state.pendingSplit = nil
    if RefreshSplits then
        RefreshSplits()
    end
end

local function DecideSixty(total)
    if state.sixtyDecided or not total then
        return
    end
    state.sixtyDecided = true
    state.pendingSixty = false
    local goal = state.db.goal60
    local fastest = state.db.fastest60
    local record = (goal and total <= goal) or (fastest and total < fastest)
    if record then
        -- The end of the video: skipped 113, I am a legend, I am a fucking legend.
        PlayClip(byId.skipped, "level", false, nil, false, nil, "level")
        PlayClip(byId.legend, "level", false, nil, false, nil, "level")
        PlayClip(byId.fuckinglegend, "level", false, nil, false, nil, "level")
    end
    if not fastest or total < fastest then
        state.db.fastest60 = total
    end
    if state.db.debug then
        Print("Level 60 played " .. FormatPlayed(total) .. (record and ", record lines queued." or "."))
    end
end

local function PlayLevelClip(level)
    if state.db.enabled == false or not TriggerOn("level") then
        return
    end
    if level == 60 then
        PlayClip(byId.baby, "level", false, nil, false, nil, "level")
        PlayClip(byId.streets, "level", false, nil, false, nil, "level")
        state.pendingSixty = true
        AskPlayed()
        C_Timer.After(3, function()
            if state.pendingSixty and state.playedTotal and state.playedAt then
                DecideSixty(state.playedTotal + (GetTime() - state.playedAt))
            end
        end)
        return
    end
    local id = LEVEL_CLIPS[level] or "insane"
    if id == "insane" and ClipPending("insane") then
        return
    end
    PlayClip(byId[id], "level", false, id == "lucky" and function()
        state.db.luckyUntil = time() + LUCKY_CD
    end or nil, false, nil, "level")
end

-- One beat is a hand-in or a collapsed burst of experience. Several beats in
-- the same instant cut each other, so a stack of turn-ins leaves the latest
-- line. Spaced beats play the video's sequence.
local function AddBeat(opts)
    opts = opts or {}
    local now = GetTime()
    if state.beatCount > 0 and state.lastBeatAt > 0 and (now - state.lastBeatAt) >= BEAT_WINDOW then
        ReleaseChain()
        state.beatCount = 0
        state.announcedRung = 0
    end
    state.beatCount = state.beatCount + (opts.count or 1)
    state.lastBeatAt = now
    if state.db then
        state.db.turnInStreak = state.beatCount
        state.db.lastTurnIn = time()
    end
    if opts.fat then
        state.chainFat = true
    end
    local rung = math.min(state.beatCount, #LADDER)
    if opts.speak and rung > state.announcedRung and TriggerOn("turnin") then
        state.announcedRung = rung
        local id = LADDER[rung]
        if rung == 1 and opts.dingLevel then
            id = DING_OPENER
        end
        PlayClip(byId[id], "turnin", false, nil, false, nil, "ladder")
        if state.db.debug then
            Print(string.format("Streak %d plays %s.", state.beatCount, id))
        end
    end
    if opts.dingLevel then
        PlayLevelClip(opts.dingLevel)
    end
    TouchChainTimer()
end

local function FlushBurst()
    local gained, max, sawDing = state.burstXp, state.burstMax, state.burstDing
    state.burstXp = 0
    state.burstDing = false
    local pct = (max and max > 0) and (gained / max) or 0
    local level
    if sawDing and state.pendingLevel then
        level = state.pendingLevel.level
        state.pendingLevel = nil
        state.levelSerial = state.levelSerial + 1
    end
    if level == SILENT_LEVEL then
        ResetChain()
        Silence()
        return
    end
    if not (level or pct >= FAT_TURNIN) then
        return
    end
    AddBeat({
        count = 1,
        speak = true,
        fat = pct >= RUSH_TURNIN,
        dingLevel = level,
    })
end

local function NoteBurst(gained, max, dings)
    if not TriggerOn("turnin") then
        return
    end
    state.burstXp = state.burstXp + (gained or 0)
    if max and max > 0 then
        state.burstMax = max
    end
    if dings then
        state.burstDing = true
    end
    state.burstToken = state.burstToken + 1
    local token = state.burstToken
    C_Timer.After(BURST_GAP, function()
        if token ~= state.burstToken then
            return
        end
        FlushBurst()
    end)
end

local function OnLevelUp(level)
    level = tonumber(level)
    if level and (not state.lastXPLevel or level > state.lastXPLevel) then
        state.pendingXPLevel = math.max(state.pendingXPLevel or level, level)
    end
    RememberSplit(level)
    if state.db.enabled == false or not TriggerOn("level") then
        state.pendingLevel = nil
        state.turnInDing = false
        return
    end
    if level == SILENT_LEVEL then
        state.pendingLevel = nil
        state.levelSerial = state.levelSerial + 1
        state.turnInDing = false
        ResetChain()
        Silence()
        return
    end
    if state.turnInDing then
        state.turnInDing = false
        PlayLevelClip(level)
        return
    end
    state.levelSerial = state.levelSerial + 1
    local serial = state.levelSerial
    state.pendingLevel = { level = level, serial = serial }
    C_Timer.After(BURST_GAP + 0.3, function()
        if state.pendingLevel and state.pendingLevel.serial == serial then
            state.pendingLevel = nil
            PlayLevelClip(level)
        end
    end)
end

local function ResolveGain(xpReward)
    -- Only the gain that landed with this hand-in. An earlier kill stays out of it.
    if state.recentGain and (GetTime() - state.recentGain.at) < 0.3 then
        return state.recentGain.gained, state.recentGain.max, state.recentGain.dings
    end
    local max = state.lastXPMax or UnitXPMax("player") or 1
    local xp = state.lastXP or UnitXP("player") or 0
    if xpReward > 0 and max > 0 then
        local remain = max - xp
        return xpReward, max, remain > 0 and xpReward >= remain
    end
    return 0, max, false
end

-- A hand-in joins the streak. Eight percent of the bar, a ding, or a hand-in
-- while the streak is open will speak. A smaller one only arms the next line.
-- The streak line plays before the level clip. What a rush waits until it cools.
local function FinishTurnIn(xpReward)
    -- Experience that arrived just before the hand-in belongs to it, not to a second beat.
    state.burstToken = state.burstToken + 1
    state.burstXp = 0
    state.burstDing = false
    local gained, max, dings = ResolveGain(xpReward)
    local pct = (max and max > 0) and (gained / max) or 0
    local open = ChainOpen()
    local level
    if dings then
        if state.pendingLevel then
            level = state.pendingLevel.level
            state.pendingLevel = nil
            state.levelSerial = state.levelSerial + 1
        end
        -- Level 13 already cleared the queue. Don't leave the next ding waiting on this one.
        if not level and not SoundsAllowed() then
            return
        end
        if level == SILENT_LEVEL then
            if TriggerOn("level") then
                ResetChain()
                Silence()
            end
            return
        end
        if not level then
            state.turnInDing = true
        end
    elseif pct < FAT_TURNIN and not open then
        if state.db.debug then
            Print(string.format("Turn-in quiet (%.1f%% of the bar).", pct * 100))
        end
        AddBeat({ count = 1, speak = false })
        return
    end
    AddBeat({
        count = 1,
        speak = true,
        fat = pct >= RUSH_TURNIN,
        dingLevel = level,
    })
end

local function OnQuestTurnedIn(xpReward)
    xpReward = tonumber(xpReward) or 0
    state.turnToken = state.turnToken + 1
    local token = state.turnToken
    state.pendingTurnIn = { xpReward = xpReward, token = token }
    -- The XP event usually arrives in this same moment. If the quest paid nothing, resolve anyway.
    C_Timer.After(0.2, function()
        if state.pendingTurnIn and state.pendingTurnIn.token == token then
            state.pendingTurnIn = nil
            FinishTurnIn(xpReward)
        end
    end)
end

local function OnXP()
    local knownGain = state.pendingTurnIn and state.pendingTurnIn.xpReward
    local gained, _, _, dings, beforeMax = ReadXPGain(knownGain)
    if gained > 0 and not Dead() then
        state.recentGain = { gained = gained, max = beforeMax, dings = dings, at = GetTime() }
        state.lastXpAt = state.recentGain.at
        AddSample(gained)
        ConsiderPace()
        if RefreshBar then
            RefreshBar()
        end
        if not state.pendingTurnIn then
            NoteBurst(gained, beforeMax, dings)
        end
    end
    if state.pendingTurnIn then
        local turn = state.pendingTurnIn
        state.pendingTurnIn = nil
        state.turnToken = state.turnToken + 1
        FinishTurnIn(turn.xpReward)
    end
    return gained
end

local function OnEnter()
    local map = MapId()
    local _, kind = IsInInstance()
    local dungeon = kind == "party"
    if not state.ready or not state.currentMap then
        if map or dungeon then
            state.ready = true
            state.currentMap = map
            state.wasDungeon = dungeon
        end
        return
    end
    if dungeon and not state.wasDungeon then
        PlayClip(byId.watch, "dungeon", false, nil, false, nil, "style")
    end
    state.wasDungeon = dungeon
    if not map or map == state.currentMap then
        return
    end
    state.currentMap = map
    if state.hearthSkip or dungeon or CAPITALS[map] or not ROUTE[map] then
        state.hearthSkip = false
        return
    end
    local range = ROUTE[map]
    local level = UnitLevel("player")
    if level < (range[1] - 1) or level > range[2] then
        return
    end
    if (GetTime() - state.lastXpAt) > PACE_WINDOW then
        return
    end
    local record = Character()
    record.zones = record.zones or {}
    local key = tostring(map)
    if record.zones[key] or Blocked() then
        return
    end
    PlayClip(byId.line, "zone", false, nil, false, nil, "long", function()
        record.zones[key] = true
    end)
end

local function OnHearth(...)
    for i = 1, select("#", ...) do
        local arg = select(i, ...)
        if HEARTH_SPELLS[arg] or arg == "Hearthstone" or arg == "Astral Recall" then
            state.hearthSkip = true
            C_Timer.After(60, function()
                state.hearthSkip = false
            end)
            return
        end
    end
end

local function OnKillCredit(message)
    if type(message) ~= "string" then
        return
    end
    local pattern = KillPattern()
    local first, second
    if pattern then
        first, second = message:match(pattern)
    end
    first, second = tonumber(first), tonumber(second)
    if not first or not second then
        first, second = message:match("(%d+)%s*/%s*(%d+)")
        first, second = tonumber(first), tonumber(second)
    end
    if not first or not second or first < second then
        return
    end
    if (GetTime() - state.lastHeadAt) < HEAD_GAP or ClipPending("head") then
        return
    end
    if not OnFastPace() and not ChainHot() then
        return
    end
    PlayClip(byId.head, "kill", false, function()
        state.lastHeadAt = GetTime()
    end, false, nil, "style")
    -- The clutch line is the 1:12 claim that follows the headshot in the video.
    if OnFastPace() and (GetTime() - state.lastClutchAt) >= CLUTCH_CD and not ClipPending("clutch") then
        PlayClip(byId.clutch, "kill", false, function()
            state.lastClutchAt = GetTime()
        end, false, nil, "follow")
    end
end

local function OnInfo(...)
    local message, name
    local first, second = ...
    if issecretvalue and (issecretvalue(first) or issecretvalue(second)) then
        return
    end
    if type(first) == "number" and GetGameMessageInfo then
        name = GetGameMessageInfo(first)
        message = second
    elseif type(first) == "string" then
        message = first
    elseif type(second) == "string" then
        message = second
    end
    if name == "ERR_QUEST_ADD_KILL_SII" or name == "ERR_QUEST_ADD_PLAYER_KILL_SII" then
        OnKillCredit(message)
        return
    end
    if type(message) == "string" and KillPattern() and message:match(KillPattern()) then
        OnKillCredit(message)
    end
end

local function ItemQuality(link)
    if type(link) ~= "string" then
        return nil
    end
    if C_Item and C_Item.GetItemInfo then
        local _, _, quality = C_Item.GetItemInfo(link)
        if quality then
            return quality
        end
    end
    if GetItemInfo then
        local _, _, quality = GetItemInfo(link)
        if quality then
            return quality
        end
    end
    local hex = link:match("|c%x%x(%x%x%x%x%x%x)")
    if not hex or not ITEM_QUALITY_COLORS then
        return nil
    end
    hex = hex:lower()
    for quality = UNCOMMON, 7 do
        local row = ITEM_QUALITY_COLORS[quality]
        local color = row and row.hex
        if color and color:lower():find(hex, 1, true) then
            return quality
        end
    end
end

local function OnLoot(text)
    if type(text) ~= "string" then
        return
    end
    for _, pattern in ipairs(LOOT_PATTERNS) do
        local link = text:match(pattern)
        if link then
            local quality = ItemQuality(link)
            local level = UnitLevel("player") or 1
            local epic = quality and quality >= EPIC
            local worth = epic or (quality and quality >= RARE) or (quality == UNCOMMON and level < GREEN_LEVEL)
            if not worth then
                return
            end
            -- A purple always gets the line. A green or a blue shares the quiet.
            if not epic and time() < (state.db.luckyUntil or 0) then
                return
            end
            local now = GetTime()
            if (link ~= state.lastLootLink or (now - state.lastLootAt) > 1) and not ClipPending("lucky") then
                PlayClip(byId.lucky, "loot", false, nil, false, nil, "long", function()
                    state.lastLootLink, state.lastLootAt = link, GetTime()
                    state.db.luckyUntil = time() + LUCKY_CD
                end)
            end
            return
        end
    end
end

local function PlayGroup()
    local now = GetTime()
    if now - state.lastGroupAt < 1 or ClipPending("mr") or ClipPending("rutzou") then
        return
    end
    -- The video opens with the MR/RL time, then the Rutzou line.
    PlayClip(byId.mr, "group", false, function()
        state.lastGroupAt = GetTime()
    end, false, nil, "style")
    PlayClip(byId.rutzou, "group", false, nil, false, nil, "follow")
end

local function HookInvites()
    if state.invitesHooked then
        return
    end
    state.invitesHooked = true
    if type(InviteUnit) == "function" then
        hooksecurefunc("InviteUnit", PlayGroup)
    end
    if C_PartyInfo and type(C_PartyInfo.InviteUnit) == "function" then
        hooksecurefunc(C_PartyInfo, "InviteUnit", PlayGroup)
    end
end

local function OnChatSend(msg)
    if issecretvalue and issecretvalue(msg) then
        return
    end
    if type(msg) ~= "string" or not msg:match("%S") then
        return
    end
    if not OnFastPace() then
        return
    end
    if (GetTime() - state.lastTypeAt) < TYPE_CD or ClipPending("typing") then
        return
    end
    PlayClip(byId.typing, "typing", false, function()
        state.lastTypeAt = GetTime()
    end, false, nil, "style")
end

local function HookChat()
    if state.chatHooked then
        return
    end
    state.chatHooked = true
    if type(SendChatMessage) == "function" then
        hooksecurefunc("SendChatMessage", OnChatSend)
    end
end

local function OnTimePlayed(total)
    total = tonumber(total)
    if not total then
        return
    end
    state.playedTotal, state.playedAt = total, GetTime()
    state.askingPlayed = false
    C_Timer.After(0, function()
        state.suppressPlayedChat = false
    end)
    if state.pendingSixty then
        DecideSixty(total)
    end
    if state.pendingSplit then
        RememberSplit(state.pendingSplit)
    elseif RefreshSplits then
        RefreshSplits()
    end
end

local function OnWatch(event, ...)
    if event == "PLAYER_LEVEL_UP" then
        OnLevelUp(select(1, ...))
    elseif event == "QUEST_TURNED_IN" then
        OnQuestTurnedIn(select(2, ...))
    elseif event == "GROUP_JOINED" then
        PlayGroup()
    elseif event == "CHAT_MSG_LOOT" then
        local text = select(1, ...)
        if not (issecretvalue and issecretvalue(text)) then
            OnLoot(text)
        end
    elseif event == "PLAYER_DEAD" then
        ResetChain()
        -- The held-pace clock starts over. The "see how fast" line stays put
        -- until a real drop off the pace, then it can speak again on the way back.
        state.aboveSince = nil
        state.sessionHeld = false
        Silence()
    elseif event == "AUCTION_HOUSE_SHOW" then
        state.ahOpen = true
    elseif event == "AUCTION_HOUSE_CLOSED" then
        state.ahOpen = false
    elseif event == "TIME_PLAYED_MSG" then
        OnTimePlayed(select(1, ...))
    elseif event == "ZONE_CHANGED_NEW_AREA" then
        OnEnter()
    elseif event == "PLAYER_ENTERING_WORLD" then
        OnEnter()
        if TriggerOn("finalboss") then
            state.finalEncounterIds = nil
            BuildFinalEncounterIndex()
        end
    elseif event == "ENCOUNTER_END" then
        OnFinalBossEnded(...)
    elseif event == "PLAYER_REGEN_ENABLED" then
        local delay = state.quietUntil - GetTime()
        if delay > 0 then
            C_Timer.After(delay, PlayNext)
        else
            PlayNext()
        end
    elseif event == "UI_INFO_MESSAGE" then
        OnInfo(...)
    elseif event == "CINEMATIC_START" or event == "PLAY_MOVIE" or event == "TALKINGHEAD_REQUESTED" then
        if state.db.honorMute ~= false then
            Silence()
        end
        return
    elseif event == "PLAYER_REGEN_DISABLED" and state.db.muteCombat then
        Silence(true)
    end

    if event == "PLAYER_XP_UPDATE" then
        local gained = OnXP()
        if state.db.debug then
            local xp, max = UnitXP("player"), UnitXPMax("player")
            local pct = max > 0 and (gained / max * 100) or 0
            local rate = CurrentRate()
            local rateText = rate and string.format(", %.0f XP/hour", rate) or ""
            Print(string.format("PLAYER_XP_UPDATE +%d XP (%.1f%% of this level), now %d/%d%s", gained, pct, xp, max, rateText))
        end
        return
    end

    if not state.db.debug then
        return
    end

    local args = {}
    for i = 1, select("#", ...) do
        local value = select(i, ...)
        if not (issecretvalue and issecretvalue(value)) then
            args[#args + 1] = tostring(value)
        end
    end
    local text = table.concat(args, ", ")
    Print(text ~= "" and (event .. " (" .. text .. ")") or event)
end

local function FindClip(token)
    if not token or token == "" then
        return nil
    end
    local asNumber = tonumber(token)
    if asNumber then
        return CLIPS[asNumber]
    end
    return byId[token:lower()]
end

local function ListClips()
    Print("Clips. Play one with /ip play <id> or /ip play <number>.")
    for _, clip in ipairs(CLIPS) do
        Print(string.format("%d. %s - %s", clip.index, clip.id, clip.line))
    end
end

-- Returns seconds, false to clear, or nil when the text is not a duration.
local function ParseDuration(text)
    text = (text or ""):lower():gsub("%s+", "")
    if text == "clear" or text == "none" or text == "off" then
        return false
    end
    local seconds, any = 0, false
    for value, unit in text:gmatch("(%d+)([dhms])") do
        any = true
        value = tonumber(value)
        if unit == "d" then
            seconds = seconds + value * 86400
        elseif unit == "h" then
            seconds = seconds + value * 3600
        elseif unit == "m" then
            seconds = seconds + value * 60
        else
            seconds = seconds + value
        end
    end
    if not any or seconds <= 0 then
        return nil
    end
    return seconds
end

local panel
local minimapButton
local refreshers = {}
local listeningXP = false
local RefreshPanel
local RefreshMinimap
local PlaceMinimap

local function SetEvent(event, on)
    if on then
        pcall(frame.RegisterEvent, frame, event)
    else
        pcall(frame.UnregisterEvent, frame, event)
    end
end

local function SetUnitSpell(on)
    if on then
        if frame.RegisterUnitEvent then
            frame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
        else
            SetEvent("UNIT_SPELLCAST_SUCCEEDED", true)
        end
    else
        SetEvent("UNIT_SPELLCAST_SUCCEEDED", false)
    end
end

local function SyncEvents()
    local enabled = state.db.enabled ~= false
    local function On(key)
        return enabled and TriggerOn(key)
    end
    local xp = On("pace") or On("turnin") or On("zone") or On("kill")
    if xp and not listeningXP then
        NoteXP()
    end
    listeningXP = xp
    SetEvent("PLAYER_XP_UPDATE", xp or state.db.debug)
    SetEvent("PLAYER_LEVEL_UP", true)
    SetEvent("QUEST_TURNED_IN", On("turnin"))
    SetEvent("GROUP_JOINED", On("group"))
    SetEvent("CHAT_MSG_LOOT", On("loot"))
    local place = On("zone") or On("dungeon")
    SetEvent("ZONE_CHANGED_NEW_AREA", place)
    SetEvent("PLAYER_ENTERING_WORLD", place or On("finalboss"))
    SetEvent("ENCOUNTER_END", On("finalboss"))
    SetEvent("UI_INFO_MESSAGE", On("kill"))
    SetEvent("PLAYER_DEAD", enabled)
    SetEvent("AUCTION_HOUSE_SHOW", enabled)
    SetEvent("AUCTION_HOUSE_CLOSED", enabled)
    SetEvent("TIME_PLAYED_MSG", true)
    SetEvent("PLAYER_REGEN_DISABLED", state.db.muteCombat or state.db.debug)
    SetEvent("PLAYER_REGEN_ENABLED", On("finalboss") or state.db.debug)
    SetEvent("CINEMATIC_START", state.db.honorMute ~= false)
    SetEvent("PLAY_MOVIE", state.db.honorMute ~= false)
    SetEvent("TALKINGHEAD_REQUESTED", state.db.honorMute ~= false)
    SetUnitSpell(On("zone"))
    for i = 1, #DEBUG_EVENTS do
        SetEvent(DEBUG_EVENTS[i], state.db.debug and true or false)
    end
    PlayNext()
end

local function ResetSettings()
    local keep = {
        chars = state.db.chars,
        goal60 = state.db.goal60,
        fastest60 = state.db.fastest60,
        turnInStreak = state.db.turnInStreak,
        lastTurnIn = state.db.lastTurnIn,
        luckyUntil = state.db.luckyUntil,
    }
    state.db.triggers = {}
    for key, value in pairs(DEFAULTS) do
        if key == "triggers" then
            for inner, innerValue in pairs(value) do
                state.db.triggers[inner] = innerValue
            end
        else
            state.db[key] = value
        end
    end
    for key, value in pairs(keep) do
        state.db[key] = value
    end
end

local function SetEnabled(on)
    state.db.enabled = on and true or false
    if state.db.enabled then
        state.quietUntil = 0
    else
        Silence()
    end
    SyncEvents()
    if RefreshPanel then
        RefreshPanel()
    end
    if RefreshMinimap then
        RefreshMinimap()
    end
end

function InsanePace_ToggleMute()
    if not state.db then
        return
    end
    SetEnabled(state.db.enabled == false)
    Print(state.db.enabled and "Clips on." or "Clips off.")
end

local function TogglePanel()
    if not panel then
        return
    end
    if panel:IsShown() then
        panel:Hide()
    else
        RefreshPanel()
        panel:Show()
    end
end

local function ChannelText()
    local channel = OutputChannel()
    local label = _G[channel.global]
    if type(label) ~= "string" or label == "" then
        label = channel.id == "SFX" and "Effects" or channel.id
    end
    return label
end

local function BuildSplits()
    local ROW = 15
    local rows = {}
    local pinned = true
    local elapsed = 0

    splitsFrame = CreateFrame("Frame", "InsanePaceSplits", UIParent, "BackdropTemplate")
    splitsFrame:SetSize(332, 268)
    splitsFrame:SetFrameStrata("MEDIUM")
    splitsFrame:SetClampedToScreen(true)
    splitsFrame:EnableMouse(true)
    splitsFrame:SetMovable(true)
    splitsFrame:Hide()
    if splitsFrame.SetBackdrop then
        splitsFrame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
    end

    local function PlaceSplits()
        splitsFrame:ClearAllPoints()
        local saved = state.db.splitsPoint
        if type(saved) == "table" and type(saved[1]) == "string" and type(saved[3]) == "number" and type(saved[4]) == "number" then
            splitsFrame:SetPoint(saved[1], UIParent, saved[2] or saved[1], saved[3], saved[4])
        else
            splitsFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -40, -180)
        end
    end
    PlaceSplits()

    local drag = CreateFrame("Frame", nil, splitsFrame)
    drag:SetPoint("TOPLEFT", 12, -12)
    drag:SetPoint("TOPRIGHT", -28, -12)
    drag:SetHeight(22)
    drag:EnableMouse(true)
    drag:RegisterForDrag("LeftButton")
    drag:SetScript("OnDragStart", function()
        splitsFrame:StartMoving()
    end)
    drag:SetScript("OnDragStop", function()
        splitsFrame:StopMovingOrSizing()
        local point, _, rel, x, y = splitsFrame:GetPoint(1)
        if point and x and y then
            state.db.splitsPoint = { point, rel, x, y }
        end
    end)

    local close = CreateFrame("Button", nil, splitsFrame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -2, -2)
    close:SetScript("OnClick", function()
        state.db.showSplits = false
        splitsFrame:Hide()
    end)

    local title = splitsFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    title:SetPoint("TOPLEFT", 16, -14)
    title:SetText("Splits")

    local nowText = splitsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    nowText:SetPoint("TOPLEFT", 16, -34)
    nowText:SetText("Now ...")

    local scroll = CreateFrame("ScrollFrame", nil, splitsFrame)
    scroll:SetPoint("TOPLEFT", 16, -74)
    scroll:SetSize(300, 176)

    local child = CreateFrame("Frame", nil, scroll)
    child:SetSize(300, ROW)
    scroll:SetScrollChild(child)

    local function Header(text, x, justify)
        local font = splitsFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        font:SetTextColor(0.5, 0.5, 0.5)
        font:SetPoint("BOTTOMLEFT", scroll, "TOPLEFT", x, 4)
        font:SetText(text)
        font:SetJustifyH(justify)
        return font
    end
    Header("Lv", 4, "LEFT")
    local splitHeader = Header("Split", 40, "RIGHT")
    splitHeader:SetWidth(70)
    local playedHeader = Header("Played", 114, "RIGHT")
    playedHeader:SetWidth(88)
    local fastHeader = Header("Fast", 206, "RIGHT")
    fastHeader:SetWidth(88)

    local function Wheel(_, delta)
        local range = scroll:GetVerticalScrollRange()
        local y = scroll:GetVerticalScroll() - delta * ROW * 3
        if y < 0 then
            y = 0
        elseif y > range then
            y = range
        end
        scroll:SetVerticalScroll(y)
        pinned = y >= range - 1
    end
    scroll:EnableMouse(true)
    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", Wheel)

    local function Row(index)
        local row = rows[index]
        if row then
            return row
        end
        local y = -((index - 1) * ROW)
        local level = child:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        level:SetPoint("TOPLEFT", 4, y)
        level:SetWidth(32)
        level:SetJustifyH("LEFT")
        local lap = child:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        lap:SetPoint("TOPLEFT", 40, y)
        lap:SetWidth(70)
        lap:SetJustifyH("RIGHT")
        local total = child:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        total:SetPoint("TOPLEFT", 114, y)
        total:SetWidth(88)
        total:SetJustifyH("RIGHT")
        local fast = child:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        fast:SetPoint("TOPLEFT", 206, y)
        fast:SetWidth(88)
        fast:SetJustifyH("RIGHT")
        row = { level = level, lap = lap, total = total, fast = fast }
        rows[index] = row
        return row
    end

    local function Paint(font, live, missing)
        if missing then
            font:SetTextColor(0.55, 0.55, 0.55)
        elseif live then
            font:SetTextColor(0.2, 1, 0.6)
        else
            font:SetTextColor(1, 1, 1)
        end
    end

    RefreshSplits = function()
        if not splitsFrame or not splitsFrame:IsShown() or not state.db then
            return
        end
        local now = PlayedNow()
        local current = UnitLevel("player") or 1
        local line = "Now " .. FormatSplit(now)
        if OnFastPace() then
            line = line .. " fast"
        end
        nowText:SetText(line)
        local record = Character()
        local stored = record.splits
        local function At(level)
            return StoredSplit(stored, level)
        end
        local list = {}
        for level = 1, 60 do
            local total = At(level)
            if total then
                list[#list + 1] = {
                    level = level,
                    lap = SplitLap(level, total, At(level - 1)),
                    total = total,
                    limit = FastPlayed(level),
                    fast = IsFast(level, total),
                }
            end
        end
        if current < 60 then
            local nextLevel = current + 1
            list[#list + 1] = {
                level = nextLevel,
                lap = SplitLap(nextLevel, now, At(current)),
                total = now,
                limit = FastPlayed(nextLevel),
                fast = IsFast(nextLevel, now),
                live = true,
            }
        end
        for i = 1, #list do
            local row = Row(i)
            local item = list[i]
            row.level:SetText(item.level)
            row.lap:SetText(item.lap and FormatSplit(item.lap) or "--")
            row.total:SetText(FormatSplit(item.total))
            row.fast:SetText(FormatSplit(item.limit))
            Paint(row.level, item.fast, false)
            Paint(row.lap, item.fast, item.lap == nil)
            Paint(row.total, item.fast, item.total == nil)
            Paint(row.fast, item.fast, false)
            row.level:Show()
            row.lap:Show()
            row.total:Show()
            row.fast:Show()
        end
        for i = #list + 1, #rows do
            rows[i].level:Hide()
            rows[i].lap:Hide()
            rows[i].total:Hide()
            rows[i].fast:Hide()
        end
        child:SetHeight(math.max(ROW, #list * ROW))
        if pinned then
            scroll:SetVerticalScroll(scroll:GetVerticalScrollRange())
        end
    end

    ToggleSplits = function()
        if not splitsFrame then
            return
        end
        if splitsFrame:IsShown() then
            state.db.showSplits = false
            splitsFrame:Hide()
        else
            state.db.showSplits = true
            splitsFrame:Show()
        end
    end

    splitsFrame:SetScript("OnUpdate", function(_, dt)
        elapsed = elapsed + dt
        if elapsed < 1 then
            return
        end
        elapsed = 0
        RefreshSplits()
    end)
    splitsFrame:SetScript("OnShow", function()
        if not PlayedNow() then
            AskPlayed()
        end
        RefreshSplits()
        C_Timer.After(0, function()
            if pinned and splitsFrame:IsShown() then
                scroll:SetVerticalScroll(scroll:GetVerticalScrollRange())
            end
        end)
    end)

    if state.db.showSplits then
        splitsFrame:Show()
    end
end

local function SharedMedia()
    if LibStub then
        return LibStub("LibSharedMedia-3.0", true)
    end
end

local function NamedChoices(builtin, mediaKind)
    local list = {}
    local seen = {}
    for i = 1, #builtin do
        list[#list + 1] = builtin[i].name
        seen[builtin[i].name] = true
    end
    local media = SharedMedia()
    if media and media.List then
        local extra = media:List(mediaKind)
        if type(extra) == "table" then
            local copy = {}
            for i = 1, #extra do
                copy[i] = extra[i]
            end
            table.sort(copy)
            for i = 1, #copy do
                if not seen[copy[i]] then
                    list[#list + 1] = copy[i]
                    seen[copy[i]] = true
                end
            end
        end
    end
    return list
end

local function FontFile(name)
    if BAR_FONT_FILES[name] then
        return BAR_FONT_FILES[name]
    end
    local media = SharedMedia()
    if media and media.Fetch then
        local file = media:Fetch("font", name, true)
        if type(file) == "string" and file ~= "" then
            return file
        end
    end
    return BAR_FONT_FILES[DEFAULTS.barFont]
end

local function TextureFile(name)
    if BAR_TEXTURE_FILES[name] then
        return BAR_TEXTURE_FILES[name]
    end
    local media = SharedMedia()
    if media and media.Fetch then
        local file = media:Fetch("statusbar", name, true)
        if type(file) == "string" and file ~= "" then
            return file
        end
    end
    return BAR_TEXTURE_FILES[DEFAULTS.barTexture]
end

local function FormatRate(rate)
    if not rate or rate < 0 then
        return "..."
    end
    if rate >= 10000 then
        return string.format("%.0fk", rate / 1000)
    end
    if rate >= 1000 then
        return string.format("%.1fk", rate / 1000)
    end
    return tostring(math.floor(rate + 0.5))
end

-- XP per hour that still finishes this level inside the fast /played line.
local function TargetRate()
    local level = UnitLevel("player") or 1
    local startAt = BENCH[level]
    local finishAt = BENCH[level + 1]
    if startAt == nil or finishAt == nil or finishAt <= startAt then
        return nil
    end
    local xp = UnitXPMax("player")
    if not xp or xp <= 0 then
        return nil
    end
    local allowed = (finishAt - startAt) / FAST_SPEED
    if allowed <= 0 then
        return nil
    end
    return (xp / allowed) * 3600
end

local barFrame
local barWidgets
local barQuote
local barQuoteAt = 0

local function NextQuote()
    local pick = barQuote
    while pick == barQuote do
        pick = BAR_QUOTES[math.random(#BAR_QUOTES)]
    end
    barQuote = pick
    barQuoteAt = GetTime()
end

local function ApplyFace(fs, size)
    local flag = BAR_OUTLINE_FLAGS[state.db.barOutline]
    if flag == "" then
        flag = nil
    end
    local ok = pcall(fs.SetFont, fs, FontFile(state.db.barFont), size, flag)
    if not ok then
        pcall(fs.SetFont, fs, BAR_FONT_FILES[DEFAULTS.barFont], size, flag)
    end
    if state.db.barShadow then
        fs:SetShadowOffset(1, -1)
        fs:SetShadowColor(0, 0, 0, 1)
    else
        fs:SetShadowOffset(0, 0)
    end
end

local function PlaceBar()
    if not barFrame then
        return
    end
    barFrame:ClearAllPoints()
    local saved = state.db.barPoint
    if type(saved) == "table" and FRAME_POINTS[saved[1]] and type(saved[3]) == "number" and type(saved[4]) == "number" then
        barFrame:SetPoint(saved[1], UIParent, saved[2] or saved[1], saved[3], saved[4])
    else
        barFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 8, -8)
    end
end

RefreshBar = function()
    if not barFrame then
        return
    end
    if state.db.showBar == false then
        barFrame:Hide()
        return
    end
    barFrame:Show()
    local size = state.db.barFontSize
    local width = state.db.barWidth
    local barH = state.db.barHeight
    local titleH = size + 3
    local readH = size + 3
    local markH = size + 2
    local lineH = (size + 3) * 2
    barFrame:SetSize(width, titleH + readH + barH + markH + lineH + 4)

    local w = barWidgets
    ApplyFace(w.title, size)
    ApplyFace(w.readout, size)
    ApplyFace(w.mark, math.max(8, size - 1))
    ApplyFace(w.line, size)
    w.title:SetWidth(width)
    w.readout:SetWidth(width)
    w.mark:SetWidth(width)
    w.line:SetWidth(width)
    if w.line.SetMaxLines then
        w.line:SetMaxLines(2)
    end
    w.title:ClearAllPoints()
    w.title:SetPoint("TOPLEFT", barFrame, "TOPLEFT", 0, 0)
    w.readout:ClearAllPoints()
    w.readout:SetPoint("TOPLEFT", barFrame, "TOPLEFT", 0, -titleH)
    w.track:ClearAllPoints()
    w.track:SetPoint("TOPLEFT", barFrame, "TOPLEFT", 0, -(titleH + readH))
    w.track:SetSize(width, barH)
    w.mark:ClearAllPoints()
    w.mark:SetPoint("TOP", w.track, "BOTTOM", 0, -1)
    w.line:ClearAllPoints()
    w.line:SetPoint("TOPLEFT", barFrame, "TOPLEFT", 0, -(titleH + readH + barH + markH))

    local target = TargetRate()
    local rate = CurrentRate()
    local ahead = rate and target and rate >= target
    local fastR, fastG, fastB = state.db.barFastR, state.db.barFastG, state.db.barFastB
    if ahead then
        w.title:SetText("My insane pace")
        w.title:SetTextColor(fastR, fastG, fastB)
        w.readout:SetText(FormatRate(rate) .. " XP/hr")
        w.readout:SetTextColor(fastR, fastG, fastB)
        if not barQuote or (GetTime() - barQuoteAt) >= 2.8 then
            NextQuote()
        end
        w.line:SetText(barQuote)
        w.line:SetTextColor(fastR, fastG, fastB)
    else
        barQuote = nil
        w.title:SetText("Pace")
        w.title:SetTextColor(1, 1, 1)
        if rate then
            w.readout:SetText(FormatRate(rate) .. " XP/hr")
            w.readout:SetTextColor(1, 1, 1)
        else
            w.readout:SetText("... XP/hr")
            w.readout:SetTextColor(0.55, 0.55, 0.55)
        end
        w.line:SetText("")
    end
    w.mark:SetText(target and FormatRate(target) or "")
    w.mark:SetTextColor(state.db.barMarkR, state.db.barMarkG, state.db.barMarkB)

    local file = TextureFile(state.db.barTexture)
    w.trackTex:SetTexture(file)
    w.trackTex:SetVertexColor(0.08, 0.07, 0.05, 1)
    w.underTex:SetTexture(file)
    w.fastTex:SetTexture(file)

    local frac = 0
    if rate and target and target > 0 then
        frac = rate / (target * 2)
        if frac < 0 then
            frac = 0
        elseif frac > 1 then
            frac = 1
        end
    end
    local mid = width * 0.5
    w.tick:ClearAllPoints()
    w.tick:SetPoint("TOPLEFT", w.track, "TOPLEFT", mid - 1, 0)
    w.tick:SetSize(2, barH)
    if target then
        w.tick:SetColorTexture(state.db.barMarkR, state.db.barMarkG, state.db.barMarkB, 1)
        w.tick:Show()
    else
        w.tick:Hide()
    end
    w.underTex:ClearAllPoints()
    w.fastTex:ClearAllPoints()
    if ahead then
        w.underTex:SetPoint("TOPLEFT", w.track, "TOPLEFT", 0, 0)
        w.underTex:SetSize(mid, barH)
        w.underTex:SetVertexColor(0.43, 0.40, 0.37, 1)
        w.underTex:Show()
        local over = width * frac - mid
        if over < 1 then
            over = 1
        end
        w.fastTex:SetPoint("TOPLEFT", w.track, "TOPLEFT", mid, 0)
        w.fastTex:SetSize(over, barH)
        w.fastTex:SetVertexColor(fastR, fastG, fastB, 1)
        w.fastTex:Show()
    elseif frac > 0 then
        w.underTex:SetPoint("TOPLEFT", w.track, "TOPLEFT", 0, 0)
        w.underTex:SetSize(math.max(1, width * frac), barH)
        w.underTex:SetVertexColor(state.db.barUnderR, state.db.barUnderG, state.db.barUnderB, 1)
        w.underTex:Show()
        w.fastTex:Hide()
    else
        w.underTex:Hide()
        w.fastTex:Hide()
    end
end

local function BuildBar()
    if barFrame then
        return
    end
    barFrame = CreateFrame("Frame", "InsanePaceBar", UIParent)
    barFrame:SetFrameStrata("MEDIUM")
    barFrame:SetClampedToScreen(true)
    barFrame:EnableMouse(true)
    barFrame:SetMovable(true)
    barFrame:RegisterForDrag("LeftButton")
    if barFrame.SetClipsChildren then
        barFrame:SetClipsChildren(true)
    end

    local title = barFrame:CreateFontString(nil, "OVERLAY")
    title:SetJustifyH("LEFT")
    title:SetJustifyV("TOP")
    local readout = barFrame:CreateFontString(nil, "OVERLAY")
    readout:SetJustifyH("LEFT")
    readout:SetJustifyV("TOP")
    local track = CreateFrame("Frame", nil, barFrame)
    if track.SetClipsChildren then
        track:SetClipsChildren(true)
    end
    local trackTex = track:CreateTexture(nil, "BACKGROUND")
    trackTex:SetAllPoints()
    local underTex = track:CreateTexture(nil, "ARTWORK")
    local fastTex = track:CreateTexture(nil, "ARTWORK")
    local tick = track:CreateTexture(nil, "OVERLAY")
    local mark = barFrame:CreateFontString(nil, "OVERLAY")
    mark:SetJustifyH("CENTER")
    mark:SetJustifyV("TOP")
    local line = barFrame:CreateFontString(nil, "OVERLAY")
    line:SetJustifyH("LEFT")
    line:SetJustifyV("TOP")
    line:SetWordWrap(true)
    barWidgets = {
        title = title,
        readout = readout,
        track = track,
        trackTex = trackTex,
        underTex = underTex,
        fastTex = fastTex,
        tick = tick,
        mark = mark,
        line = line,
    }

    barFrame:SetScript("OnDragStart", function(self)
        self.dragging = true
        self:StartMoving()
    end)
    barFrame:SetScript("OnDragStop", function(self)
        self.dragging = false
        self:StopMovingOrSizing()
        local point, _, rel, x, y = self:GetPoint(1)
        if point and type(x) == "number" and type(y) == "number" then
            state.db.barPoint = { point, rel, x, y }
        end
    end)
    local elapsed = 0
    barFrame:SetScript("OnUpdate", function(self, dt)
        if self.dragging then
            return
        end
        elapsed = elapsed + dt
        if elapsed < 0.25 then
            return
        end
        elapsed = 0
        RefreshBar()
    end)
    PlaceBar()
    RefreshBar()
end

local function BuildPanel()
    panel = CreateFrame("Frame", "InsanePacePanel", UIParent, "BackdropTemplate")
    panel:SetSize(540, 666)
    panel:SetPoint("CENTER")
    panel:SetFrameStrata("DIALOG")
    panel:SetClampedToScreen(true)
    panel:EnableMouse(true)
    panel:SetMovable(true)
    panel:Hide()
    if panel.SetBackdrop then
        panel:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 32,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
    end
    if UISpecialFrames then
        tinsert(UISpecialFrames, "InsanePacePanel")
    end

    local drag = CreateFrame("Frame", nil, panel)
    drag:SetPoint("TOPLEFT", 12, -12)
    drag:SetPoint("TOPRIGHT", -28, -12)
    drag:SetHeight(28)
    drag:EnableMouse(true)
    drag:RegisterForDrag("LeftButton")
    drag:SetScript("OnDragStart", function()
        panel:StartMoving()
    end)
    drag:SetScript("OnDragStop", function()
        panel:StopMovingOrSizing()
    end)

    local close = CreateFrame("Button", nil, panel, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -2, -2)

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 22, -18)
    title:SetText("Insane Pace")

    local version
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        version = C_AddOns.GetAddOnMetadata(ADDON, "Version")
    elseif GetAddOnMetadata then
        version = GetAddOnMetadata(ADDON, "Version")
    end
    if type(version) == "string" and version ~= "" then
        local ver = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        ver:SetPoint("LEFT", title, "RIGHT", 8, -2)
        ver:SetText(version)
    end

    local function Heading(text, x, y)
        local font = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        font:SetPoint("TOPLEFT", x, y)
        font:SetText(text)
        return font
    end

    local function Check(text, x, y, get, set)
        local cb = CreateFrame("CheckButton", nil, panel, "UICheckButtonTemplate")
        cb:SetSize(26, 26)
        cb:SetPoint("TOPLEFT", x, y)
        local label = cb:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        label:SetPoint("LEFT", cb, "RIGHT", 2, 1)
        label:SetText(text)
        local width = label:GetStringWidth()
        if not width or width < 1 then
            width = 160
        end
        cb:SetHitRectInsets(0, -(width + 8), 0, 0)
        cb:SetScript("OnClick", function(self)
            set(self:GetChecked() and true or false)
        end)
        refreshers[#refreshers + 1] = function()
            cb:SetChecked(get() and true or false)
        end
    end

    Heading("Triggers", 24, -52)
    local triggers = {
        { "Levels", "level" },
        { "Quest hand-ins", "turnin" },
        { "Pace", "pace" },
        { "The right zone", "zone" },
        { "Dungeons", "dungeon" },
        { "Kill credit", "kill" },
        { "Rare loot", "loot" },
        { "Party join", "group" },
        { "Typing", "typing" },
        { "Final bosses", "finalboss" },
    }
    for i, row in ipairs(triggers) do
        local key = row[2]
        local column = (i - 1) % 2
        local triggerRow = math.floor((i - 1) / 2)
        Check(row[1], 20 + column * 130, -70 - triggerRow * 24, function()
            return TriggerOn(key)
        end, function(on)
            state.db.triggers[key] = on
            SyncEvents()
        end)
    end

    Check("Play clips", 286, -48, function()
        return state.db.enabled ~= false
    end, function(on)
        SetEnabled(on)
    end)

    local preview = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    preview:SetSize(88, 22)
    preview:SetPoint("TOPLEFT", 410, -50)
    preview:SetText("Preview")
    preview:SetScript("OnClick", function()
        state.quietUntil = 0
        PlayClip(byId.yes, nil, true)
    end)

    Heading("Quiet", 294, -86)
    Check("Muted game or a movie", 286, -104, function()
        return state.db.honorMute ~= false
    end, function(on)
        state.db.honorMute = on
        if on and GameQuiet() then
            Silence()
        end
        SyncEvents()
    end)
    Check("In combat", 286, -128, function()
        return state.db.muteCombat and true or false
    end, function(on)
        state.db.muteCombat = on
        if on and UnitAffectingCombat("player") then
            Silence()
        end
        SyncEvents()
    end)
    Check("In an instance", 286, -152, function()
        return state.db.muteInstance and true or false
    end, function(on)
        state.db.muteInstance = on
        if on then
            local inside, kind = IsInInstance()
            if inside and kind and kind ~= "none" then
                Silence()
            end
        end
    end)
    Check("In a group", 286, -176, function()
        return state.db.muteGroup and true or false
    end, function(on)
        state.db.muteGroup = on
        if on and InGroup() then
            Silence()
        end
    end)

    Heading("Chat", 294, -212)
    Check("Print the line", 286, -230, function()
        return state.db.subtitles ~= false
    end, function(on)
        state.db.subtitles = on
    end)
    Check("Print when loaded", 286, -254, function()
        return state.db.login ~= false
    end, function(on)
        state.db.login = on
    end)
    Check("Minimap button", 286, -278, function()
        return state.db.showMinimap ~= false
    end, function(on)
        state.db.showMinimap = on
        RefreshMinimap()
    end)

    local output = Heading("Output", 24, -278)
    local channelButton = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    channelButton:SetSize(120, 22)
    channelButton:SetPoint("LEFT", output, "RIGHT", 12, 0)
    channelButton:SetScript("OnClick", function()
        local current = OutputChannel().id
        local nextIndex = 1
        for i = 1, #CHANNELS do
            if CHANNELS[i].id == current then
                nextIndex = (i % #CHANNELS) + 1
                break
            end
        end
        state.db.channel = CHANNELS[nextIndex].id
        channelButton:SetText(ChannelText())
    end)
    channelButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Output")
        GameTooltip:AddLine("Click for the next output. The clip plays at that channel's volume. Dialog is the voice slider.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    channelButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    refreshers[#refreshers + 1] = function()
        channelButton:SetText(ChannelText())
    end

    local menuFrame, menuScroll, menuChild, menuButtons

    local function EnsureMenu()
        if menuFrame then
            return
        end
        menuFrame = CreateFrame("Frame", "InsanePaceMenu", UIParent, "BackdropTemplate")
        menuFrame:SetFrameStrata("FULLSCREEN_DIALOG")
        menuFrame:SetClampedToScreen(true)
        menuFrame:Hide()
        if menuFrame.SetBackdrop then
            menuFrame:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true,
                tileSize = 32,
                edgeSize = 32,
                insets = { left = 8, right = 8, top = 8, bottom = 8 },
            })
        end
        menuScroll = CreateFrame("ScrollFrame", nil, menuFrame)
        menuScroll:SetPoint("TOPLEFT", 12, -12)
        menuScroll:SetPoint("BOTTOMRIGHT", -12, 12)
        menuChild = CreateFrame("Frame", nil, menuScroll)
        menuChild:SetSize(140, 20)
        menuScroll:SetScrollChild(menuChild)
        menuScroll:EnableMouseWheel(true)
        menuScroll:SetScript("OnMouseWheel", function(_, delta)
            local range = menuScroll:GetVerticalScrollRange()
            local y = menuScroll:GetVerticalScroll() - delta * 20
            if y < 0 then
                y = 0
            elseif y > range then
                y = range
            end
            menuScroll:SetVerticalScroll(y)
        end)
        menuButtons = {}
    end

    local function OpenMenu(anchor, items, onChoose)
        EnsureMenu()
        if menuFrame:IsShown() and menuFrame.anchor == anchor then
            menuFrame:Hide()
            return
        end
        menuFrame.anchor = anchor
        local width = math.max(anchor:GetWidth(), 160)
        local shown = math.min(#items, 8)
        if shown < 1 then
            shown = 1
        end
        menuFrame:SetSize(width + 28, shown * 20 + 28)
        menuChild:SetWidth(width)
        menuChild:SetHeight(math.max(20, #items * 20))
        for i = 1, #items do
            local row = menuButtons[i]
            if not row then
                row = CreateFrame("Button", nil, menuChild)
                row:SetHeight(20)
                row:SetPoint("TOPLEFT", menuChild, "TOPLEFT", 0, -((i - 1) * 20))
                row:SetPoint("TOPRIGHT", menuChild, "TOPRIGHT", 0, -((i - 1) * 20))
                local text = row:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
                text:SetPoint("LEFT", 4, 0)
                text:SetPoint("RIGHT", -4, 0)
                text:SetJustifyH("LEFT")
                row.text = text
                row:SetScript("OnClick", function(self)
                    if self.choose then
                        self.choose(self.name)
                    end
                    menuFrame:Hide()
                end)
                row:SetScript("OnEnter", function(self)
                    self.text:SetTextColor(1, 0.82, 0)
                end)
                row:SetScript("OnLeave", function(self)
                    self.text:SetTextColor(1, 1, 1)
                end)
                menuButtons[i] = row
            end
            row.name = items[i]
            row.choose = onChoose
            row.text:SetText(items[i])
            row.text:SetTextColor(1, 1, 1)
            row:Show()
        end
        for i = #items + 1, #menuButtons do
            menuButtons[i]:Hide()
        end
        menuScroll:SetVerticalScroll(0)
        menuFrame:ClearAllPoints()
        menuFrame:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -2)
        menuFrame:Show()
    end

    local function ChoiceButton(anchor, get, choices, set, tipTitle, tipBody)
        local button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
        button:SetSize(168, 22)
        button:SetPoint("LEFT", anchor, "RIGHT", 8, 0)
        button:SetScript("OnClick", function()
            OpenMenu(button, choices(), function(name)
                set(name)
                button:SetText(name)
                RefreshBar()
            end)
        end)
        if tipTitle then
            button:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:AddLine(tipTitle)
                if tipBody then
                    GameTooltip:AddLine(tipBody, 1, 1, 1, true)
                end
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
        end
        refreshers[#refreshers + 1] = function()
            button:SetText(get())
        end
        return button
    end

    local function MakeSlider(label, x, y, minV, maxV, get, set)
        local heading = Heading(label, x, y)
        local valueText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
        valueText:SetPoint("LEFT", heading, "RIGHT", 6, 0)
        local row = CreateFrame("Slider", nil, panel)
        row:SetOrientation("HORIZONTAL")
        row:SetSize(150, 16)
        row:SetPoint("TOPLEFT", heading, "BOTTOMLEFT", 4, -6)
        row:SetMinMaxValues(minV, maxV)
        row:SetValueStep(1)
        if row.SetObeyStepOnDrag then
            row:SetObeyStepOnDrag(true)
        end
        local rowTrack = row:CreateTexture(nil, "BACKGROUND")
        rowTrack:SetColorTexture(0, 0, 0, 0.7)
        rowTrack:SetHeight(4)
        rowTrack:SetPoint("LEFT")
        rowTrack:SetPoint("RIGHT")
        row:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
        local rowThumb = row:GetThumbTexture()
        if rowThumb then
            rowThumb:SetSize(24, 24)
        end
        local guard = false
        row:SetScript("OnValueChanged", function(_, value)
            value = math.floor(value + 0.5)
            valueText:SetText(value)
            if guard then
                return
            end
            set(value)
            RefreshBar()
        end)
        refreshers[#refreshers + 1] = function()
            guard = true
            row:SetValue(get())
            guard = false
            valueText:SetText(get())
        end
    end

    local function PickColor(r, g, b, apply)
        if not ColorPickerFrame then
            return
        end
        local function cancel(a, b2, c)
            if type(a) == "table" then
                apply(a.r or r, a.g or g, a.b or b)
            elseif type(a) == "number" then
                apply(a, b2 or g, c or b)
            else
                apply(r, g, b)
            end
        end
        if ColorPickerFrame.SetupColorPickerAndShow then
            ColorPickerFrame:SetupColorPickerAndShow({
                r = r,
                g = g,
                b = b,
                hasOpacity = false,
                swatchFunc = function()
                    local nr, ng, nb = ColorPickerFrame:GetColorRGB()
                    apply(nr, ng, nb)
                end,
                cancelFunc = cancel,
            })
            return
        end
        ColorPickerFrame.hasOpacity = false
        ColorPickerFrame.func = function()
            local nr, ng, nb = ColorPickerFrame:GetColorRGB()
            apply(nr, ng, nb)
        end
        ColorPickerFrame.cancelFunc = cancel
        ColorPickerFrame:SetColorRGB(r, g, b)
        ColorPickerFrame:Hide()
        ColorPickerFrame:Show()
    end

    local function Swatch(text, x, y, get, set)
        local button = CreateFrame("Button", nil, panel)
        button:SetSize(18, 18)
        button:SetPoint("TOPLEFT", x, y)
        local backing = button:CreateTexture(nil, "BACKGROUND")
        backing:SetPoint("TOPLEFT", -1, 1)
        backing:SetPoint("BOTTOMRIGHT", 1, -1)
        backing:SetColorTexture(0, 0, 0, 0.85)
        local tex = button:CreateTexture(nil, "ARTWORK")
        tex:SetAllPoints()
        tex:SetColorTexture(1, 1, 1)
        local name = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        name:SetPoint("LEFT", button, "RIGHT", 4, 0)
        name:SetText(text)
        button:SetScript("OnClick", function()
            local cr, cg, cb = get()
            PickColor(cr, cg, cb, function(nr, ng, nb)
                set(nr, ng, nb)
                tex:SetColorTexture(nr, ng, nb)
                RefreshBar()
            end)
        end)
        refreshers[#refreshers + 1] = function()
            local cr, cg, cb = get()
            tex:SetColorTexture(cr, cg, cb)
        end
    end

    Heading("Pace bar", 24, -318)
    Check("Show bar", 110, -314, function()
        return state.db.showBar ~= false
    end, function(on)
        state.db.showBar = on
        RefreshBar()
    end)

    local fontLabel = Heading("Font", 24, -354)
    ChoiceButton(fontLabel, function()
        return state.db.barFont
    end, function()
        return NamedChoices(BAR_FONTS, "font")
    end, function(name)
        state.db.barFont = name
    end, "Font", "Arial Narrow is the Classic number font. Friz Quadrata, Morpheus, and Skurri are the other client fonts. Fonts from LibSharedMedia show up here when another addon has registered them.")
    MakeSlider("Size", 310, -354, 8, 32, function()
        return state.db.barFontSize
    end, function(value)
        state.db.barFontSize = value
    end)

    local outlineLabel = Heading("Outline", 24, -414)
    ChoiceButton(outlineLabel, function()
        return state.db.barOutline
    end, function()
        local list = {}
        for i = 1, #BAR_OUTLINES do
            list[i] = BAR_OUTLINES[i].name
        end
        return list
    end, function(name)
        state.db.barOutline = name
    end, "Outline", "None, a thin outline, a thick outline, or monochrome. Same flags a nameplate bar uses.")
    Check("Shadow", 300, -410, function()
        return state.db.barShadow and true or false
    end, function(on)
        state.db.barShadow = on
        RefreshBar()
    end)

    local textureLabel = Heading("Texture", 24, -458)
    ChoiceButton(textureLabel, function()
        return state.db.barTexture
    end, function()
        return NamedChoices(BAR_TEXTURES, "statusbar")
    end, function(name)
        state.db.barTexture = name
    end, "Texture", "Fill for the bar. Blizzard is the default status bar. Raid and Flat are built in, and statusbar textures from LibSharedMedia are listed with them.")

    MakeSlider("Width", 24, -510, 64, 400, function()
        return state.db.barWidth
    end, function(value)
        state.db.barWidth = value
    end)
    MakeSlider("Height", 310, -510, 2, 24, function()
        return state.db.barHeight
    end, function(value)
        state.db.barHeight = value
    end)

    Heading("Colors", 24, -574)
    Swatch("Fast", 90, -572, function()
        return state.db.barFastR, state.db.barFastG, state.db.barFastB
    end, function(r, g, b)
        state.db.barFastR, state.db.barFastG, state.db.barFastB = r, g, b
    end)
    Swatch("Under", 190, -572, function()
        return state.db.barUnderR, state.db.barUnderG, state.db.barUnderB
    end, function(r, g, b)
        state.db.barUnderR, state.db.barUnderG, state.db.barUnderB = r, g, b
    end)
    Swatch("Mark", 290, -572, function()
        return state.db.barMarkR, state.db.barMarkG, state.db.barMarkB
    end, function(r, g, b)
        state.db.barMarkR, state.db.barMarkG, state.db.barMarkB = r, g, b
    end)

    local reset = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    reset:SetSize(148, 22)
    reset:SetPoint("BOTTOMLEFT", 24, 18)
    reset:SetText("Reset switches")
    reset:SetScript("OnClick", function()
        ResetSettings()
        SyncEvents()
        RefreshPanel()
        RefreshMinimap()
        RefreshBar()
        Print("Switches restored. Pace records, level splits, and the level 60 goal stayed.")
    end)

    local splitsButton = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    splitsButton:SetSize(88, 22)
    splitsButton:SetPoint("LEFT", reset, "RIGHT", 8, 0)
    splitsButton:SetText("Splits")
    splitsButton:SetScript("OnClick", function()
        if ToggleSplits then
            ToggleSplits()
        end
    end)
    splitsButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Splits")
        GameTooltip:AddLine("Played time at each level. Through 15, fast is 80% of a 2 hour level 10. After that, 80% of Joana's pace. Green means this run is still that fast.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    splitsButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    RefreshPanel = function()
        for i = 1, #refreshers do
            refreshers[i]()
        end
    end
    panel:SetScript("OnShow", RefreshPanel)
    panel:SetScript("OnHide", function()
        if menuFrame then
            menuFrame:Hide()
        end
    end)
end

local function BuildMinimap()
    if not Minimap then
        return
    end
    local button = CreateFrame("Button", "InsanePaceMinimapButton", Minimap)
    minimapButton = button
    button:SetSize(31, 31)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(8)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:RegisterForDrag("LeftButton")
    button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    local icon = button:CreateTexture(nil, "BACKGROUND")
    icon:SetTexture("Interface\\AddOns\\InsanePace\\InsanePace")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER", 0, 1)

    local border = button:CreateTexture(nil, "ARTWORK")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetSize(53, 53)
    border:SetPoint("TOPLEFT")

    local atan2 = math.atan2 or math.atan
    PlaceMinimap = function()
        if not minimapButton or not Minimap then
            return
        end
        local angle = math.rad(state.db.minimapAngle or 225)
        local x, y = math.cos(angle), math.sin(angle)
        local radius = (Minimap:GetWidth() / 2) + 8
        if GetMinimapShape and GetMinimapShape() == "SQUARE" then
            local limit = math.max(math.abs(x), math.abs(y))
            if limit > 0 then
                x, y = x / limit, y / limit
            end
        end
        minimapButton:ClearAllPoints()
        minimapButton:SetPoint("CENTER", Minimap, "CENTER", x * radius, y * radius)
    end

    button:SetScript("OnDragStart", function(self)
        self.dragging = true
        self:SetScript("OnUpdate", function()
            local mx, my = Minimap:GetCenter()
            local scale = Minimap:GetEffectiveScale()
            local cx, cy = GetCursorPosition()
            cx, cy = cx / scale, cy / scale
            state.db.minimapAngle = math.deg(atan2(cy - my, cx - mx))
            PlaceMinimap()
        end)
    end)
    button:SetScript("OnDragStop", function(self)
        self:SetScript("OnUpdate", nil)
        C_Timer.After(0, function()
            self.dragging = false
        end)
    end)
    button:SetScript("OnClick", function(self, buttonName)
        if self.dragging then
            return
        end
        if buttonName == "RightButton" then
            InsanePace_ToggleMute()
        else
            TogglePanel()
        end
    end)
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("Insane Pace")
        GameTooltip:AddLine("Left-click opens options.", 1, 1, 1)
        GameTooltip:AddLine("Right-click mutes.", 1, 1, 1)
        GameTooltip:AddLine("Drag to move.", 1, 1, 1)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    RefreshMinimap = function()
        if not minimapButton then
            return
        end
        if state.db.showMinimap == false then
            minimapButton:Hide()
            return
        end
        minimapButton:Show()
        minimapButton:SetAlpha(state.db.enabled == false and 0.45 or 1)
        PlaceMinimap()
    end
    RefreshMinimap()
end

local function BuildSettingsEntry()
    local canvas = CreateFrame("Frame")
    canvas.name = "Insane Pace"
    canvas:SetSize(400, 80)
    local hint = canvas:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    hint:SetPoint("TOPLEFT", 16, -16)
    hint:SetText("Switches, the pace bar, and a preview are in the Insane Pace window.")
    local open = CreateFrame("Button", nil, canvas, "UIPanelButtonTemplate")
    open:SetSize(160, 22)
    open:SetPoint("TOPLEFT", hint, "BOTTOMLEFT", 0, -12)
    open:SetText("Open Insane Pace")
    open:SetScript("OnClick", TogglePanel)
    if Settings and Settings.RegisterCanvasLayoutCategory and Settings.RegisterAddOnCategory then
        local category = Settings.RegisterCanvasLayoutCategory(canvas, canvas.name)
        Settings.RegisterAddOnCategory(category)
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(canvas)
    end
end

BINDING_NAME_INSANEPACE_MUTE = "Mute clips"

local function OnSlash(msg)
    local command, rest = (msg or ""):match("^%s*(%S*)%s*(.-)%s*$")
    command = (command or ""):lower()

    if command == "" or command == "options" or command == "config" then
        TogglePanel()
        return
    end

    if command == "help" then
        Print(" /ip opens the window. /ip on, /ip off, and /ip reset.")
        Print(" /ip list")
        Print(" /ip play <id or number>")
        Print(" /ip debug - print leveling events while you play.")
        Print(" /ip goal <time> - level 60 played time that unlocks the legend lines. Example: /ip goal 4d or 96h. /ip goal clear removes it.")
        Print(" /ip splits - played time at each level. Through 15, fast is 80% of a 2 hour level 10. After that, 80% of Joana's pace.")
        Print(" /ip bar - show or hide the pace bar. Font, outline, texture, size, and colors are in /ip.")
        Print("Dings, quests, zones, dungeons, loot, party joins, and typing each have a line. Pace lines and the pace bar are for a fast run.")
        Print("Level 12 plays the cinema line. Level 13 plays nothing. Level 14 plays I've never seen a 113 and I never will.")
        Print("Level 40 plays the lucky break. Levels 47, 49, and 50 play 50-49-47. Any other ding plays my insane pace.")
        Print("Level 60 plays 112 baby, then Streets 112. A goal or a faster 60 adds I skipped 113, I am a legend, and I am a fucking legend.")
        Print("Hand-ins and a real burst of experience share a 60 second streak: yeah it's this one, two quick ones, look at the pace, then this is fucking it. A new step cuts the line before it. A ding plays that line, then the level clip. The first ding says right here it's this one.")
        Print("A hand-in worth 15% of the bar plays what a rush once that streak cools, once per 10 minutes. Dying clears the streak.")
        Print("Once pace has a ten minute sample, a fast run plays see how fast my pace is. Holding it ten minutes plays right here this is the 112. Dying starts that hold over. Falling off the pace starts both over.")
        Print("Typing in chat on a fast run plays look at me typing, once per 10 minutes.")
        Print("A new best pace plays my insane pace. Beating the best you logged in with by half also plays I skipped 113. Those can land during a streak.")
        Print("The right zone, once, plays the line. A dungeon plays watch this. A finished kill on a fast run, or during a streak, plays right in the head. On a fast run that kill also plays got a fucking 112, once per 10 minutes. A streak line cuts those off.")
        Print("A blue or better plays the lucky break, once per 30 minutes. A green before level 30 does too. An epic ignores that quiet.")
        Print("Joining or inviting plays an MR/RL time, then me and Mark Rutzou. Deaths, ghosts, and the auction house stay quiet.")
        Print("A muted game, a movie, or a talking head stays quiet. Combat, an instance, or a group can be set quiet in the window.")
        return
    end

    if command == "on" or command == "off" or command == "toggle" then
        if command == "on" then
            SetEnabled(true)
        elseif command == "off" then
            SetEnabled(false)
        else
            SetEnabled(state.db.enabled == false)
        end
        Print(state.db.enabled and "Clips on." or "Clips off.")
        return
    end

    if command == "reset" then
        ResetSettings()
        SyncEvents()
        if RefreshPanel then
            RefreshPanel()
        end
        if RefreshMinimap then
            RefreshMinimap()
        end
        if RefreshBar then
            RefreshBar()
        end
        Print("Switches restored. Pace records, level splits, and the level 60 goal stayed.")
        return
    end

    if command == "list" then
        ListClips()
        return
    end

    if command == "play" then
        local clip = FindClip(rest)
        if not clip then
            Print("Unknown clip \"" .. rest .. "\". /ip list shows the ids.")
            return
        end
        state.quietUntil = 0
        PlayClip(clip, nil, true)
        return
    end

    if command == "bar" then
        state.db.showBar = state.db.showBar == false
        if RefreshBar then
            RefreshBar()
        end
        if RefreshPanel then
            RefreshPanel()
        end
        Print(state.db.showBar ~= false and "Pace bar shown." or "Pace bar hidden.")
        return
    end

    if command == "splits" then
        if ToggleSplits then
            ToggleSplits()
        end
        return
    end

    if command == "goal" then
        if rest == "" then
            if state.db.goal60 then
                Print("Level 60 goal is " .. FormatPlayed(state.db.goal60) .. " played.")
            else
                Print("No level 60 goal. /ip goal 4d sets one.")
            end
            if state.db.fastest60 then
                Print("Fastest 60 on this account is " .. FormatPlayed(state.db.fastest60) .. " played.")
            end
            return
        end
        local parsed = ParseDuration(rest)
        if parsed == false then
            state.db.goal60 = nil
            Print("Level 60 goal cleared.")
            return
        end
        if not parsed then
            Print("Use /ip goal 4d, /ip goal 96h, or /ip goal 3d12h.")
            return
        end
        state.db.goal60 = parsed
        Print("Level 60 goal set to " .. FormatPlayed(parsed) .. " played.")
        return
    end

    if command == "debug" then
        state.db.debug = not state.db.debug
        SyncEvents()
        if state.db.debug then
            NoteXP()
            Print("Event log on. Level, turn in a quest, or pull a mob and watch this chat.")
        else
            Print("Event log off.")
        end
        return
    end

    Print("Unknown command. /ip help")
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(_, event, ...)
    if event == "ADDON_LOADED" then
        if select(1, ...) == ADDON then
            LoadDB()
        end
        return
    end

    if event == "PLAYER_LOGIN" then
        LoadDB()
        Character()
        NoteXP()
        RestoreChain()
        HookInvites()
        HookChat()
        local function Try(fn)
            local ok, err = pcall(fn)
            if not ok then
                Print(tostring(err))
            end
        end
        SyncEvents()
        Try(BuildSplits)
        Try(BuildPanel)
        Try(BuildBar)
        Try(BuildMinimap)
        Try(BuildSettingsEntry)
        AskPlayed()
        if state.db.login ~= false then
            Print("Loaded. /ip opens options.")
        end
        return
    end

    if event == "UNIT_SPELLCAST_SUCCEEDED" then
        OnHearth(...)
        return
    end

    OnWatch(event, ...)
end)

SLASH_INSANEPACE1 = "/insane"
SLASH_INSANEPACE2 = "/ip"
SlashCmdList["INSANEPACE"] = OnSlash
