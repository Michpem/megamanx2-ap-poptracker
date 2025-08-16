
function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
        return count > 0
    else
        return count >= amount
    end
end

function can_charge()
    local arms = Tracker:FindObjectForCode("arms").CurrentStage
    return arms >= 2
end
function is_active(item)
    return Tracker:FindObjectForCode(item).Active
end

function boss_weaknesses_not_required()
    local setting_weakness = Tracker:FindObjectForCode('setting_weakness').CurrentStage == 1
    return not setting_weakness
end

function boss_buster_damage_possible()
    local strictness = Tracker:FindObjectForCode("boss_weakness_strictness").CurrentStage
    if strictness == 3 then return false end
    if strictness == 2 then
        return can_charge()
    end
    return true
end

function get_weapons_count()
    local weapons = 0
    if Tracker:FindObjectForCode("spin_wheel").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("bubble_splash").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("speed_burner").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("silk_shot").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("magnet_mine").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("crystal_hunter").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("sonic_slicer").Active then weapons = weapons + 1 end
    if Tracker:FindObjectForCode("strike_chain").Active then weapons = weapons + 1 end
    return weapons
end
function get_upgrades_count()
    local upgrades = 0
    upgrades = upgrades + Tracker:FindObjectForCode("helmet").CurrentStage
    upgrades = upgrades + Tracker:FindObjectForCode("body").CurrentStage
    upgrades = upgrades + Tracker:FindObjectForCode("legs").CurrentStage
    local arms = Tracker:FindObjectForCode("arms").CurrentStage
    if Tracker:FindObjectForCode('jammed_buster').CurrentStage == 0 then
        upgrades = upgrades + arms - 1
    else
        upgrades = upgrades + arms
    end
    return upgrades
end


function base_codes_req_met()
    return Tracker:FindObjectForCode("stage_x_hunter").Active
end
function base_medals_req_met()
    local mavericks = Tracker:ProviderCountForCode("maverick_medal")
    local mavericks_needed = Tracker:ProviderCountForCode("base_medal_count")
    return mavericks >= mavericks_needed
end
function base_weapons_req_met()
    local weapons = get_weapons_count()
    local weapons_needed = Tracker:ProviderCountForCode("base_weapon_count")
    return weapons >= weapons_needed
end
function base_upgrade_req_met()
    local upgrades = get_upgrades_count()
    local upgrades_needed = Tracker:ProviderCountForCode("base_upgrade_count")
    return upgrades >= upgrades_needed
end
function base_heart_tanks_req_met()
    local heart_tanks = Tracker:ProviderCountForCode("heart_tank")
    local heart_tanks_needed = Tracker:ProviderCountForCode("base_heart_tank_count")
    return heart_tanks >= heart_tanks_needed
end
function base_sub_tanks_req_met()
    local sub_tanks = Tracker:ProviderCountForCode("sub_tank")
    local sub_tanks_needed = Tracker:ProviderCountForCode("base_sub_tank_count")
    return sub_tanks >= sub_tanks_needed
end
function base_all_req_met()
    return base_medals_req_met() and base_weapons_req_met() and base_upgrade_req_met() and base_heart_tanks_req_met() and base_sub_tanks_req_met()
end

function is_base_open()
    local allreqs = Tracker:ProviderCountForCode("base_sub_tank_count") + Tracker:ProviderCountForCode("base_heart_tank_count") + Tracker:ProviderCountForCode("base_upgrade_count") + Tracker:ProviderCountForCode("base_weapon_count") + Tracker:ProviderCountForCode("base_medal_count")

    if allreqs == 0 then
        return base_codes_req_met()
    end
    return base_all_req_met()

end
-- function update_base_state()
--     local basestate = Tracker:FindObjectForCode('base_state')
--     if Tracker:FindObjectForCode('base_1_cleared').Active and Tracker:FindObjectForCode('base_2_cleared').Active and Tracker:FindObjectForCode('base_3_cleared').Active and Tracker:FindObjectForCode('base_4_cleared').Active then
--         basestate.CurrentStage = 2
--     elseif is_base_open() then
--         basestate.CurrentStage = 1
--     else
--         basestate.CurrentStage = 0
--     end
-- end
function is_base_two_and_three_and_four_open()
    if Tracker:FindObjectForCode('base_all_levels').CurrentStage > 0 then
        return Tracker:FindObjectForCode('base_state').CurrentStage > 0
    end
    return false
end

function base_1_cleared()
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 1/Neo Violen").AvailableChestCount == 0 then
        return true
    end
    return false
end
function base_2_cleared()
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 2/Serges Tank").AvailableChestCount == 0 then
        return true
    end
    return false
end
function base_3_cleared()
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 3/Agile Flyer").AvailableChestCount == 0 then
        return true
    end
    return false
end
function base_4_cleared()
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Stage Clear").AvailableChestCount == 0 then
        return true
    end
    return false
end

function are_hunters_open()
    local mavericks = Tracker:ProviderCountForCode("maverick_medal")
    local mavericks_needed = Tracker:ProviderCountForCode("x_hunters_medal_count")
    return mavericks >= mavericks_needed
end

function rematch_quota_met()
    local quota = Tracker:ProviderCountForCode("base_boss_rematch_count")
    --local count = Tracker:ProviderCountForCode("rematch_fights")
    local count = 0
    --print(string.format("refight quota: %i, refights done: %i", quota, count))
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Bubble Crab Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Crystal Snail Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Flame Stag Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Magna Centipede Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Morph Moth Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Overdrive Ostrich Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Wheel Gator Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    if Tracker:FindObjectForCode("@Stages/X Hunter Stage 4/Wire Sponge Rematch").AvailableChestCount == 0 then
        count = count + 1
    end
    --print("found refights done: ", count)
    if count >= quota then
        return true
    else
        return false
    end

end

function print_debug_base()
    print("get_weapons_count(): ", get_weapons_count())
    print("get_upgrades_count(): ", get_upgrades_count())
    print("base_codes_req_met(): ", base_codes_req_met())
    print("base_medals_req_met(): ", base_medals_req_met())
    print("base_weapons_req_met(): ", base_weapons_req_met())
    print("base_upgrade_req_met(): ", base_upgrade_req_met())
    print("base_heart_tanks_req_met(): ", base_heart_tanks_req_met())
    print("base_sub_tanks_req_met(): ", base_sub_tanks_req_met())
    print("base_all_req_met(): ", base_all_req_met())
    print("is_base_open(): ", is_base_open())
    print("base_open object: ", Tracker:ProviderCountForCode("base_open"))
end

WEAPON_CHECKS = {
    [0x00] = function() return true end, --"Lemon",
    [0x01] = function() return Tracker:FindObjectForCode("arms").CurrentStage >= 1 end, --"Charged Shot (Level 1)",
    --[0x02] = function() return can_charge() end, --"Charged Shot (Level 3, Bullet Stream)",
    [0x03] = function() return Tracker:FindObjectForCode("arms").CurrentStage >= 1 end, --"Charged Shot (Level 2)",
    [0x04] = function() return is_active("shoryuken") end, --"Shoryuken",
    [0x06] = function() return true end, --"Lemon (Dash)",
    [0x07] = function() return is_active("crystal_hunter") end, --"Uncharged Crystal Hunter",
    [0x08] = function() return is_active("bubble_splash") end, --"Uncharged Bubble Splash",
    [0x09] = function() return is_active("silk_shot") end, --"Uncharged Silk Shot (Rocks)",
    [0x0A] = function() return is_active("spin_wheel") end, --"Uncharged Spin Wheel",
    [0x0B] = function() return is_active("sonic_slicer") end, --"Uncharged Sonic Slicer",
    [0x0C] = function() return is_active("strike_chain") end, --"Uncharged Strike Chain",
    [0x0D] = function() return is_active("magnet_mine") end, --"Uncharged Magnet Mine",
    [0x0E] = function() return is_active("speed_burner") end, --"Uncharged Speed Burner",
    [0x0F] = function() return is_active("body") end, --"Giga Crush",
    [0x11] = function() return can_charge() and is_active("bubble_splash") end, --"Charged Bubble Splash",
    [0x12] = function() return can_charge() and is_active("silk_shot") end, --"Charged Silk Shot (Rocks)",
    [0x13] = function() return can_charge() and is_active("spin_wheel") end, --"Charged Spin Wheel",
    [0x14] = function() return can_charge() and is_active("sonic_slicer") end, --"Charged Sonic Slicer",
    [0x15] = function() return can_charge() and is_active("strike_chain") end, --"Charged Strike Chain",
    [0x16] = function() return can_charge() and is_active("magnet_mine") end, --"Charged Magnet Mine",
    [0x17] = function() return can_charge() and is_active("speed_burner") end, --"Charged Speed Burner",
    [0x18] = function() return is_active("silk_shot") end, --"Uncharged Silk Shot (Black Rock)",
    [0x1B] = function() return is_active("silk_shot") end, --"Uncharged Silk Shot (Junk)",
    [0x1C] = function() return is_active("silk_shot") end, --"Uncharged Silk Shot (Leaves)",
    [0x1D] = function() return can_charge() end, --"Charged Shot (Level 3, Shockwave)",
    [0x1E] = function() return is_active("silk_shot") end, --"Uncharged Silk Shot (Crystals)",
    [0x1F] = function() return can_charge() and is_active("silk_shot") end, --"Charged Silk Shot (Black Rock)",
    [0x20] = function() return can_charge() and is_active("silk_shot") end, --"Charged Silk Shot (Junk)",
    [0x21] = function() return can_charge() and is_active("silk_shot") end, --"Charged Silk Shot (Leaves)",
    [0x22] = function() return can_charge() and is_active("silk_shot") end, --"Charged Silk Shot (Crystals)",
    [0x23] = function() return is_active("speed_burner") end, --"Uncharged Speed Burner (Underwater)",
}

--vanilla weaknesses
BOSS_WEAKNESSES = {
    ["Agile Flyer"] =       {[1] = 13,[2] = 22,},
    ["Agile"] =             {[1] = 13,[2] = 22,},
    ["Bubble Crab"] =       {[1] = 10,[2] = 19,},
    ["Chop Register"] =     {[1] = 0,[2] = 1,[3] = 3,[4] = 6,[5] = 29,},
    ["Crystal Snail"] =     {[1] = 13,[2] = 22,},
    ["Flame Stag"] =        {[1] = 8,[2] = 17,},
    ["Magna Centipede"] =   {[1] = 27,[2] = 32,},
    ["Magna Quartz"] =      {[1] = 0,[2] = 1,[3] = 3,[4] = 6,[5] = 29,},
    ["Morph Moth"] =        {[1] = 14,[2] = 23,},
    ["Neo Violen"] =        {[1] = 8,[2] = 17,},
    ["Overdrive Ostrich"] = {[1] = 7,},
    ["Pararoid S-38"] =     {[1] = 0,[2] = 1,[3] = 3,[4] = 6,[5] = 29,},
    ["Raider Killer"] =     {[1] = 0,[2] = 1,[3] = 3,[4] = 6,[5] = 29,},
    ["Serges Tank"] =       {[1] = 27,[2] = 32,},
    ["Serges"] =            {[1] = 11,[2] = 20,},
    ["Sigma Virus"] =       {[1] = 12,[2] = 21,},
    ["Sigma"] =             {[1] = 11,[2] = 20,},
    ["Violen"] =            {[1] = 8,[2] = 17,},
    ["Wheel Gator"] =       {[1] = 12,[2] = 21,},
    ["Wire Sponge"] =       {[1] = 11,[2] = 20,},
    ["Zero"] =              {[1] = 14,[2] = 23,},
}

function has_weakness_for(bossname)
    print(string.format("Checking weaknesses for %s", bossname))
    for _,weapon in ipairs(BOSS_WEAKNESSES[bossname]) do
        local fn = WEAPON_CHECKS[weapon]
        print(string.format("has weakness for weapon 0x%x: %s", weapon, fn()))
        if fn() then return true end
    end
    print("Player does not have weakness")
    return false
end