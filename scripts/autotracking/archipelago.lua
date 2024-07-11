ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

TAB_SWITCH_KEY = ""

TAB_MAPPING = {
    [00] = "Stage Select",
    [01] = "Intro Stage",
    [02] = "Maverick Stages/Morph Moth",
    [03] = "Maverick Stages/Wire Sponge",
    [04] = "Maverick Stages/Bubble Crab", --also Dr. Cain cutscene
    [05] = "Maverick Stages/Flame Stag",
    [06] = "Maverick Stages/Magna Centipede", --x hunters cutscene
    [07] = "Maverick Stages/Crystal Snail",
    [08] = "Maverick Stages/Overdrive Ostrich",
    [09] = "Maverick Stages/Wheel Gator",
    [10] = "X Hunter Base/X Hunter Base 1",
    [11] = "X Hunter Base/X Hunter Base 2",
    [12] = "X Hunter Base/X Hunter Base 3",
    [13] = "X Hunter Base/X Hunter Base 4",
    [14] = "X Hunter Base/X Hunter Base 5",
    [15] = "", --weapon get
    [16] = "",
    [17] = "",
}

function onSetReply(key, value, old)
    return
end

function set_if_exists(slot_data, slotname)
    if slot_data[slotname] then
        Tracker:FindObjectForCode(slotname).AcquiredCount = slot_data[slotname]
    end
end
function enable_if_exists(slot_data, slotname)
    if slot_data[slotname] then
        obj = Tracker:FindObjectForCode(slotname)
        if slot_data[slotname] == 0 then
            obj.Active = false
        else
            obj.Active = true
        end
    end
end
function enable_progressive_if_exists(slot_data, slotname)
    if slot_data[slotname] then
        obj = Tracker:FindObjectForCode(slotname)
        if slot_data[slotname] == 0 then
            obj.CurrentStage = 0
        else
            obj.CurrentStage = 1
        end
    end
end
function set_stage_state_unlocked(stagecode)
    local state = Tracker:FindObjectForCode(stagecode)
    if state then
        if state.CurrentStage == 0 then state.CurrentStage = 1 end
    else
        print(string.format("set_stage_state_unlocked called with %s, invalid object"), stagecode)
    end
end

function zero_item(itemstr)
    Tracker:FindObjectForCode(itemstr).AcquiredCount = 0
end


function set_ap_base_access(slot_data)
    --option_medals = 1
    --option_weapons = 2
    --option_armor_upgrades = 4
    --option_heart_tanks = 8
    --option_sub_tanks = 16
    --option_all = 31

    if (slot_data['base_open']) then
        local so = slot_data['base_open']
        Tracker:FindObjectForCode("base_open").AcquiredCount = so
        if (so & 1) > 0 then
            set_if_exists(slot_data, 'base_medal_count')
        else
            zero_item('base_medal_count')
        end

        if (so & 2) > 0 then
            set_if_exists(slot_data, 'base_weapon_count')
        else
            zero_item('base_weapon_count')
        end

        if (so & 4) > 0 then
            set_if_exists(slot_data, 'base_upgrade_count')
        else
            zero_item('base_upgrade_count')
        end

        if (so & 8) > 0 then
            set_if_exists(slot_data, 'base_heart_tank_count')
        else
            zero_item('base_heart_tank_count')
        end

        if (so & 16) > 0 then
            set_if_exists(slot_data, 'base_sub_tank_count')
        else
            zero_item('base_sub_tank_count')
        end
    end
end

function tab_switch_handler(tab_id)
    if tab_id then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("tab_switch_handler(), tab_id=%d", tab_id))
        end
        if Tracker:FindObjectForCode('auto_tab_switch').CurrentStage == 1 then
            if TAB_MAPPING[tab_id] == "" then return end
            for str in string.gmatch(TAB_MAPPING[tab_id], "([^/]+)") do
                print(string.format("On stage %x, switching to tab %s",tab_id,str))
                Tracker:UiHint("ActivateTab", str)
            end
        end
    end
end

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, v in pairs(LOCATION_MAPPING) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end

    enable_progressive_if_exists(slot_data, 'pickupsanity')
    enable_progressive_if_exists(slot_data, 'jammed_buster')

    set_ap_base_access(slot_data)

    enable_progressive_if_exists(slot_data, 'base_all_levels')
    enable_if_exists(slot_data, 'logic_boss_weakness')
    set_if_exists(slot_data, 'x_hunters_medal_count')

    set_if_exists(slot_data, 'base_boss_rematch_count')

    Tracker:FindObjectForCode('boss_weakness_strictness').CurrentStage = slot_data['boss_weakness_strictness']
    enable_if_exists(slot_data, 'logic_boss_weakness')

    if Tracker:FindObjectForCode('logic_boss_weakness').Active then
            Tracker:FindObjectForCode('setting_weakness').CurrentStage = 1
    end

    if slot_data['jammed_buster'] > 0 then
        Tracker:FindObjectForCode('arms').CurrentStage = 0
    end

    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}

    PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0

    if Archipelago.PlayerNumber>-1 then
		TAB_SWITCH_KEY="mmx2_level_id_"..TEAM_NUMBER.."_"..PLAYER_ID
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("SET NOTIFY %s",TAB_SWITCH_KEY))
        end
		Archipelago:SetNotify({TAB_SWITCH_KEY})
		Archipelago:Get({TAB_SWITCH_KEY})
	end
    BOSS_WEAKNESSES = slot_data['boss_weaknesses']

end


-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    local STARTING_ID = 0xBE0C00
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
        return
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
    -- track local items via snes interface
    if is_local then
        if LOCAL_ITEMS[v[1]] then
            LOCAL_ITEMS[v[1]] = LOCAL_ITEMS[v[1]] + 1
        else
            LOCAL_ITEMS[v[1]] = 1
        end
    else
        if GLOBAL_ITEMS[v[1]] then
            GLOBAL_ITEMS[v[1]] = GLOBAL_ITEMS[v[1]] + 1
        else
            GLOBAL_ITEMS[v[1]] = 1
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
        print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
    end

    if item_id == STARTING_ID + 0x02 then
        set_stage_state_unlocked("wheel_gator_state")
    end
    if item_id == STARTING_ID + 0x03 then
        set_stage_state_unlocked("bubble_crab_state")
    end
    if item_id == STARTING_ID + 0x04 then
        set_stage_state_unlocked("flame_stag_state")
    end
    if item_id == STARTING_ID + 0x05 then
        set_stage_state_unlocked("morph_moth_state")
    end
    if item_id == STARTING_ID + 0x06 then
        set_stage_state_unlocked("magna_centipede_state")
    end
    if item_id == STARTING_ID + 0x07 then
        set_stage_state_unlocked("crystal_snail_state")
    end
    if item_id == STARTING_ID + 0x08 then
        set_stage_state_unlocked("overdrive_ostrich_state")
    end
    if item_id == STARTING_ID + 0x09 then
        set_stage_state_unlocked("wire_sponge_state")
    end
    --if is_doppler_open() then
    --    Tracker:FindObjectForCode('stage_doppler_lab').Active = true
    --end
    --if is_vile_open() then
    --    Tracker:FindObjectForCode('stage_vile').Active = true
    --end
    if are_hunters_open() then
        set_stage_state_unlocked('agile_state')
        set_stage_state_unlocked('serges_state')
        set_stage_state_unlocked('violen_state')
    end
    if item_id == STARTING_ID + 0x1E then
        local arms = Tracker:FindObjectForCode("arms")
        if arms then
            arms.CurrentStage = arms.CurrentStage + 1
        end
    end
    print(string.format("boss_buster_damage_possible: %s",boss_buster_damage_possible()))
    print(string.format("boss_weaknesses_not_required: %s",boss_weaknesses_not_required()))
    --update_base_state()
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
    local STARTING_ID = 0xBE0C00
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end
    if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
        return
    end
    local v = LOCATION_MAPPING[location_id]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
            obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end

    --handle stage clear events
    if location_id == STARTING_ID + 0x00C1 then
        --local obj = Tracker:FindObjectForCode("bubble_crab_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("bubble_crab_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x00C5 then
        --local obj = Tracker:FindObjectForCode("crystal_snail_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("crystal_snail_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x00C2 then
        --local obj = Tracker:FindObjectForCode("flame_stag_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("flame_stag_state")
        state.CurrentStage = 2
    end
    
    if location_id == STARTING_ID + 0x00C4 then
        --local obj = Tracker:FindObjectForCode("magna_centipede_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("magna_centipede_state")
        state.CurrentStage = 2
    end
    
    if location_id == STARTING_ID + 0x00C3 then
        --local obj = Tracker:FindObjectForCode("morph_moth_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("morph_moth_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x00C6 then
        --local obj = Tracker:FindObjectForCode("overdrive_ostrich_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("overdrive_ostrich_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x00C0 then
        --local obj = Tracker:FindObjectForCode("wheel_gator_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("wheel_gator_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x00C7 then
        --local obj = Tracker:FindObjectForCode("wire_sponge_cleared")
        --obj.Active = true
        local state = Tracker:FindObjectForCode("wire_sponge_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x0011 then
        local obj = Tracker:FindObjectForCode("base_1_cleared")
        obj.Active = true
    end
    if location_id == STARTING_ID + 0x0012 then
        local obj = Tracker:FindObjectForCode("base_2_cleared")
        obj.Active = true
    end
    if location_id == STARTING_ID + 0x0013 then
        local obj = Tracker:FindObjectForCode("base_3_cleared")
        obj.Active = true
    end
    if location_id == STARTING_ID + 0x00C9 then
        local obj = Tracker:FindObjectForCode("base_4_cleared")
        obj.Active = true
    end
    if location_id == STARTING_ID + 0x000E then
        local state = Tracker:FindObjectForCode("agile_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x000F then
        local state = Tracker:FindObjectForCode("serges_state")
        state.CurrentStage = 2
    end
    if location_id == STARTING_ID + 0x0010 then
        local state = Tracker:FindObjectForCode("violen_state")
        state.CurrentStage = 2
    end
    --refresh access rules logic
    --update_base_state()
    local o = Tracker:FindObjectForCode("refresh")
    if o then o.Active = not o.Active end
end

-- called when a locations is scouted
-- function onScout(location_id, location_name, item_id, item_name, item_player)
--     if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
--         print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
--             item_player))
--     end
--     -- not implemented yet :(
-- end

-- called when a bounce message is received 
-- function onBounce(json)
--     if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
--         print(string.format("called onBounce: %s", dump_table(json)))
--     end
--     -- your code goes here
-- end

function onNotify(key, value, old_value)
    print(string.format("onNotify called. key=%s value=%s old_value=%s", key, value, old_value))
    if key == TAB_SWITCH_KEY then
        tab_switch_handler(value)
    end
end

function onNotifyLaunch(key, value)
    print(string.format("onNotifyLaunch called. key=%s value=%s", key, value))
    if key == TAB_SWITCH_KEY then
        tab_switch_handler(value)
    end
end

-- add AP callbacks
-- un-/comment as needed
Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    Archipelago:AddLocationHandler("location handler", onLocation)
end
--Archipelago:AddSetReplyHandler("set reply handler", onSetReply)

Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)

--Archipelago:AddScoutHandler("scout handler", onScout)
--Archipelago:AddBouncedHandler("bounce handler", onBounce)
