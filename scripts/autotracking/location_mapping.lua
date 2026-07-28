-- use this file to map the AP location ids to your locations
-- to reference a location in Pop use @ in the beginning and then path to the section (more info: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#locations)
-- to reference an item use it's code
-- here are the SM locations as an example: https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/location_mapping.lua
X2 = 0x20000000

CLEAR   = 0x00000000
ENEMY   = 0x00010000
HEART   = 0x00020000
UPGRADE = 0x00030000
PICKUP  = 0x00040000
SPECIAL = 0x00060000

INTRO   = 0x00000000
GATOR   = 0x00300000
CRAB    = 0x00800000
STAG    = 0x00600000
MOTH    = 0x00100000
MAGNA   = 0x00700000
SNAIL   = 0x00200000
OSTRICH = 0x00500000
SPONGE  = 0x00400000
BASE1   = 0x00A00000
BASE2   = 0x00B00000
BASE3   = 0x00C00000
BASE4   = 0x00D00000
BASE5   = 0x00E00000
HUNTER  = 0x00F00000

LOCATION_MAPPING = {
    [X2 + HUNTER + ENEMY + 0x08] = {"@Stages/Agile/Agile"},
    [X2 + HUNTER + ENEMY + 0x09] = {"@Stages/Serges/Serges"},
    [X2 + HUNTER + ENEMY + 0x0A] = {"@Stages/Violen/Violen"},

    [X2 + PICKUP + INTRO + 0x00] = {"@Stages/Intro Stage/HP Pickup 1 (Before spike pit)"},
    [X2 + PICKUP + INTRO + 0x01] = {"@Stages/Intro Stage/HP Pickup 2 (Before boss room)"},
    [X2 + ENEMY + INTRO + 0x18] = {"@Stages/Intro Stage/Gigantic Mechaniloid CF-0"},
    [X2 + CLEAR + INTRO + 0x00] = {"@Stages/Intro Stage/Stage Clear"},

    [X2 + CRAB + HEART + 0x40] = {"@Stages/Bubble Crab/Heart Tank"},
    [X2 + CRAB + UPGRADE + 0x80] = {"@Stages/Bubble Crab/Sub Tank"},
    [X2 + CRAB + ENEMY + 0x01] = {"@Stages/Bubble Crab/Bubble Crab"},
    [X2 + CRAB + CLEAR + 0x02] = {"@Stages/Bubble Crab/Stage Clear"},
    [X2 + CRAB + PICKUP + 0x08] = {"@Stages/Bubble Crab/1-Up Pickup (Below Spin Wheel blocks before water section)"},
    [X2 + CRAB + PICKUP + 0x0B] = {"@Stages/Bubble Crab/Weapon Energy Pickup 1 (Top-right ledge in seabed section)"},
    [X2 + CRAB + PICKUP + 0x0E] = {"@Stages/Bubble Crab/Weapon Energy Pickup 2 (Artificial cave in seabed section)"},
    [X2 + CRAB + PICKUP + 0x09] = {"@Stages/Bubble Crab/HP Pickup 1 (Ledge before water section)"},
    [X2 + CRAB + PICKUP + 0x0A] = {"@Stages/Bubble Crab/HP Pickup 2 (Top-right opening above metal floor)"},
    [X2 + CRAB + PICKUP + 0x0C] = {"@Stages/Bubble Crab/HP Pickup 3 (First pit in seabed section)"},
    [X2 + CRAB + PICKUP + 0x0D] = {"@Stages/Bubble Crab/HP Pickup 4 (Artificial cave in seabed section)"},
    [X2 + CRAB + PICKUP + 0x0F] = {"@Stages/Bubble Crab/HP Pickup 5 (Fake wall below Sub Tank)"},
    [X2 + CRAB + PICKUP + 0x10] = {"@Stages/Bubble Crab/HP Pickup 6 (Before boss)"},

    [X2 + SNAIL + HEART + 0x10] = {"@Stages/Crystal Snail/Heart Tank"},
    [X2 + SNAIL + UPGRADE + 0x01] = {"@Stages/Crystal Snail/Helmet Capsule"},
    [X2 + SNAIL + ENEMY + 0x1C] = {"@Stages/Crystal Snail/Magna Quartz"},
    [X2 + SNAIL + ENEMY + 0x05] = {"@Stages/Crystal Snail/Crystal Snail"},
    [X2 + SNAIL + CLEAR + 0x00] = {"@Stages/Crystal Snail/Stage Clear"},
    [X2 + SNAIL + PICKUP + 0x2D] = {"@Stages/Crystal Snail/1-Up Pickup 1 (Under crystal blocks before Magna Quartz)"},
    [X2 + SNAIL + PICKUP + 0x2F] = {"@Stages/Crystal Snail/1-Up Pickup 2 (Fake ceiling next to Helmet Capsule)"},
    [X2 + SNAIL + PICKUP + 0x2B] = {"@Stages/Crystal Snail/Weapon Energy Pickup (Under crystal blocks before X-Hunter room)"},
    [X2 + SNAIL + PICKUP + 0x2A] = {"@Stages/Crystal Snail/HP Pickup 1 (Under crystal blocks before X-Hunter room)"},
    [X2 + SNAIL + PICKUP + 0x4d] = {"@Stages/Crystal Snail/HP Pickup 3 (After X-Hunter room)"},
    [X2 + SNAIL + PICKUP + 0x2C] = {"@Stages/Crystal Snail/HP Pickup 2 (Under crystal blocks before Magna Quartz)"},
    [X2 + SNAIL + PICKUP + 0x2e] = {"@Stages/Crystal Snail/HP Pickup 4 (In giant crystal slide section)"},

    [X2 + STAG + PICKUP + 0x11] = {"@Stages/Flame Stag/1-Up Pickup 1 (Top-right of first Beetron section)"},
    [X2 + STAG + PICKUP + 0x18] = {"@Stages/Flame Stag/1-Up Pickup 2 (Bottom of rising lava section)"},
    [X2 + STAG + PICKUP + 0x1F] = {"@Stages/Flame Stag/1-Up Pickup 3 (Above third pillar in lava cave section)"},
    [X2 + STAG + ENEMY + 0x02] = {"@Stages/Flame Stag/Flame Stag"},
    [X2 + STAG + CLEAR + 0x0E] = {"@Stages/Flame Stag/Stage Clear"},
    [X2 + STAG + PICKUP + 0x13] = {"@Stages/Flame Stag/Weapon Energy Pickup 1 (Cave before first lava section)"},
    [X2 + STAG + PICKUP + 0x15] = {"@Stages/Flame Stag/Weapon Energy Pickup 2 (Cave before first lava section)"},
    [X2 + STAG + PICKUP + 0x1A] = {"@Stages/Flame Stag/Weapon Energy Pickup 3 (Second ledge in rising lava section)"},
    [X2 + STAG + PICKUP + 0x1D] = {"@Stages/Flame Stag/Weapon Energy Pickup 4 (Bottom-left of lava cave section)"},
    [X2 + STAG + HEART + 0x02] = {"@Stages/Flame Stag/Heart Tank"},
    [X2 + STAG + PICKUP + 0x12] = {"@Stages/Flame Stag/HP Pickup 1 (Cave before first lava section)"},
    [X2 + STAG + PICKUP + 0x14] = {"@Stages/Flame Stag/HP Pickup 2 (Cave before first lava section)"},
    [X2 + STAG + PICKUP + 0x16] = {"@Stages/Flame Stag/HP Pickup 3 (Cave before first lava section)"},
    [X2 + STAG + PICKUP + 0x17] = {"@Stages/Flame Stag/HP Pickup 4 (First ledge in rising lava section)"},
    [X2 + STAG + PICKUP + 0x19] = {"@Stages/Flame Stag/HP Pickup 5 (Second ledge in rising lava section)"},
    [X2 + STAG + PICKUP + 0x1B] = {"@Stages/Flame Stag/HP Pickup 6 (After rising lava section)"},
    [X2 + STAG + PICKUP + 0x1C] = {"@Stages/Flame Stag/HP Pickup 7 (Bottom-left of lava cave section)"},
    [X2 + STAG + PICKUP + 0x1E] = {"@Stages/Flame Stag/HP Pickup 8 (Before X-Hunter room)"},
    [X2 + STAG + PICKUP + 0x20] = {"@Stages/Flame Stag/HP Pickup 9 (Ledge in gas pipes section)"},
    [X2 + STAG + UPGRADE + 0x20] = {"@Stages/Flame Stag/Sub Tank"},

    [X2 + MAGNA + ENEMY + 0x04] = {"@Stages/Magna Centipede/Magna Centipede"},
    [X2 + MAGNA + CLEAR + 0x0C] = {"@Stages/Magna Centipede/Stage Clear"},
    [X2 + MAGNA + HEART + 0x08] = {"@Stages/Magna Centipede/Heart Tank"},
    [X2 + MAGNA + PICKUP + 0x28] = {"@Stages/Magna Centipede/HP Pickup 1 (After Chop Register)"},
    [X2 + MAGNA + PICKUP + 0x29] = {"@Stages/Magna Centipede/HP Pickup 2 (Before X-Hunter room)"},
    [X2 + MAGNA + ENEMY + 0x1A] = {"@Stages/Magna Centipede/Chop Register"},
    [X2 + MAGNA + ENEMY + 0x1B] = {"@Stages/Magna Centipede/Raider Killer"},
    [X2 + MAGNA + UPGRADE + 0x10] = {"@Stages/Magna Centipede/Sub Tank"},

    [X2 + MOTH + PICKUP + 0x23] = {"@Stages/Morph Moth/HP Pickup 1 (Before vertical ladder section)"},
    [X2 + MOTH + PICKUP + 0x24] = {"@Stages/Morph Moth/HP Pickup 2 (Left ledge in vertical ladder section)"},
    [X2 + MOTH + PICKUP + 0x25] = {"@Stages/Morph Moth/HP Pickup 3 (Right ledge in vertical ladder section)"},
    [X2 + MOTH + PICKUP + 0x26] = {"@Stages/Morph Moth/HP Pickup 4 (Bottom of magnet ceiling section)"},
    [X2 + MOTH + PICKUP + 0x27] = {"@Stages/Morph Moth/HP Pickup 5 (Bottom of magnet ceiling section)"},
    [X2 + MOTH + PICKUP + 0x21] = {"@Stages/Morph Moth/1-Up Pickup 1 (Left of Heart Tank)"},
    [X2 + MOTH + PICKUP + 0x22] = {"@Stages/Morph Moth/1-Up Pickup 2 (Top-left ledge before Pararoid S-38 #1)"},
    [X2 + MOTH + UPGRADE + 0x04] = {"@Stages/Morph Moth/Body Capsule"},
    [X2 + MOTH + HEART + 0x01] = {"@Stages/Morph Moth/Heart Tank"},
    [X2 + MOTH + ENEMY + 0x19] = {"@Stages/Morph Moth/Pararoid S-38 #1"},
    [X2 + MOTH + ENEMY + 0x1D] = {"@Stages/Morph Moth/Pararoid S-38 #2"},
    [X2 + MOTH + ENEMY + 0x03] = {"@Stages/Morph Moth/Morph Moth"},
    [X2 + MOTH + CLEAR + 0x04] = {"@Stages/Morph Moth/Stage Clear"},

    [X2 + OSTRICH + PICKUP + 0x31] = {"@Stages/Overdrive Ostrich/1-Up Pickup (Top-right ledge in outdoors bike section)"},
    [X2 + OSTRICH + PICKUP + 0x33] = {"@Stages/Overdrive Ostrich/Weapon Energy Pickup 1 (On spikes before Legs Capsule)"},
    [X2 + OSTRICH + PICKUP + 0x35] = {"@Stages/Overdrive Ostrich/Weapon Energy Pickup 2 (On spikes before Legs Capsule)"},
    [X2 + OSTRICH + PICKUP + 0x30] = {"@Stages/Overdrive Ostrich/HP Pickup 1 (Behind Spin Wheel blocks before X-Hunter room)"},
    [X2 + OSTRICH + PICKUP + 0x32] = {"@Stages/Overdrive Ostrich/HP Pickup 2 (On spikes before Legs Capsule)"},
    [X2 + OSTRICH + PICKUP + 0x34] = {"@Stages/Overdrive Ostrich/HP Pickup 3 (On spikes before Legs Capsule)"},
    [X2 + OSTRICH + UPGRADE + 0x08] = {"@Stages/Overdrive Ostrich/Legs Capsule"},
    [X2 + OSTRICH + HEART + 0x04] = {"@Stages/Overdrive Ostrich/Heart Tank"},
    [X2 + OSTRICH + ENEMY + 0x06] = {"@Stages/Overdrive Ostrich/Overdrive Ostrich"},
    [X2 + OSTRICH + CLEAR + 0x08] = {"@Stages/Overdrive Ostrich/Stage Clear"},

    [X2 + PICKUP + GATOR + 0x04] = {"@Stages/Wheel Gator/1-Up Pickup (Top of elevator)"},
    [X2 + PICKUP + GATOR + 0x05] = {"@Stages/Wheel Gator/Weapon Energy Pickup (Ledge in left elevator exit)"},
    [X2 + PICKUP + GATOR + 0x02] = {"@Stages/Wheel Gator/HP Pickup 1 (High ledge after spikes section)"},
    [X2 + PICKUP + GATOR + 0x03] = {"@Stages/Wheel Gator/HP Pickup 2 (Ledge before Ride Armor)"},
    [X2 + PICKUP + GATOR + 0x06] = {"@Stages/Wheel Gator/HP Pickup 3 (Hidden behind top column after X-Hunter room)"},
    [X2 + PICKUP + GATOR + 0x07] = {"@Stages/Wheel Gator/HP Pickup 4 (Ledge before boss room)"},
    [X2 + PICKUP + GATOR + 0x4A] = {"@Stages/Wheel Gator/HP Pickup 5 (Hidden behind metal slope in exterior section)"},
    [X2 + PICKUP + GATOR + 0x4B] = {"@Stages/Wheel Gator/HP Pickup 6 (Hidden behind metal slope in exterior section)"},
    [X2 + PICKUP + GATOR + 0x4C] = {"@Stages/Wheel Gator/HP Pickup 7 (Hidden behind metal slope in exterior section)"},
    [X2 + HEART + GATOR + 0x20] = {"@Stages/Wheel Gator/Heart Tank"},
    [X2 + UPGRADE + GATOR + 0x02] = {"@Stages/Wheel Gator/Arms Capsule"},
    [X2 + ENEMY + GATOR + 0x00] = {"@Stages/Wheel Gator/Wheel Gator"},
    [X2 + CLEAR + GATOR + 0x06] = {"@Stages/Wheel Gator/Stage Clear"},

    [X2 + SPONGE + PICKUP + 0x36] = {"@Stages/Wire Sponge/1-Up Pickup (Above flying platforms in rainy section)"},
    [X2 + SPONGE + PICKUP + 0x37] = {"@Stages/Wire Sponge/HP Pickup 1 (Before X-Hunter room)"},
    [X2 + SPONGE + PICKUP + 0x38] = {"@Stages/Wire Sponge/HP Pickup 2 (Before boss room)"},
    [X2 + SPONGE + UPGRADE + 0x40] = {"@Stages/Wire Sponge/Sub Tank"},
    [X2 + SPONGE + HEART + 0x80] = {"@Stages/Wire Sponge/Heart Tank"},
    [X2 + SPONGE + ENEMY + 0x07] = {"@Stages/Wire Sponge/Wire Sponge"},
    [X2 + SPONGE + CLEAR + 0x0A] = {"@Stages/Wire Sponge/Stage Clear"},

    [X2 + BASE1 + PICKUP + 0x39] = {"@Stages/X Hunter Base Stage 1/1-Up Pickup 1 (Right ledge after start)"},
    [X2 + BASE1 + PICKUP + 0x3B] = {"@Stages/X Hunter Base Stage 1/1-Up Pickup 2 (Below flying platforms section)"},
    [X2 + BASE1 + PICKUP + 0x3A] = {"@Stages/X Hunter Base Stage 1/HP Pickup (Below flying platforms section)"},
    [X2 + BASE1 + ENEMY + 0x0B] = {"@Stages/X Hunter Base Stage 1/Neo Violen"},

    [X2 + BASE2 + PICKUP + 0x3D] = {"@Stages/X Hunter Base Stage 2/1-Up Pickup (Behind Spin Wheel blocks)"},
    [X2 + BASE2 + PICKUP + 0x3C] = {"@Stages/X Hunter Base Stage 2/HP Pickup (Behind Spin Wheel blocks)"},
    [X2 + BASE2 + ENEMY + 0x0C] = {"@Stages/X Hunter Base Stage 2/Serges Tank"},

    [X2 + BASE3 + PICKUP + 0x3E] = {"@Stages/X Hunter Base Stage 3/HP Pickup 1 (In Strike Chain hole after start)"},
    [X2 + BASE3 + PICKUP + 0x40] = {"@Stages/X Hunter Base Stage 3/HP Pickup 2 (Before second moving platform section)"},
    [X2 + BASE3 + PICKUP + 0x41] = {"@Stages/X Hunter Base Stage 3/HP Pickup 3 (Before second moving platform section)"},
    [X2 + BASE3 + PICKUP + 0x42] = {"@Stages/X Hunter Base Stage 3/HP Pickup 4 (Before second moving platform section)"},
    [X2 + BASE3 + PICKUP + 0x43] = {"@Stages/X Hunter Base Stage 3/HP Pickup 5 (Top of second moving platform section)"},
    [X2 + BASE3 + PICKUP + 0x44] = {"@Stages/X Hunter Base Stage 3/HP Pickup 6 (Top of second moving platform section)"},
    [X2 + BASE3 + PICKUP + 0x46] = {"@Stages/X Hunter Base Stage 3/HP Pickup 7 (Ledge before charged Speed Burner + air dash section)"},
    [X2 + BASE3 + PICKUP + 0x47] = {"@Stages/X Hunter Base Stage 3/HP Pickup 8 (Ledge before charged Speed Burner + air dash section)"},
    [X2 + BASE3 + PICKUP + 0x3F] = {"@Stages/X Hunter Base Stage 3/1-Up Pickup 1 (In Strike Chain hole after start)"},
    [X2 + BASE3 + PICKUP + 0x45] = {"@Stages/X Hunter Base Stage 3/1-Up Pickup 2 (Before charged Speed Burner + air dash section)"},
    [X2 + BASE3 + PICKUP + 0x48] = {"@Stages/X Hunter Base Stage 3/1-Up Pickup 3 (After charged Speed Burner + air dash section)"},
    [X2 + BASE3 + PICKUP + 0x49] = {"@Stages/X Hunter Base Stage 3/1-Up Pickup 4 (On spikes after last vertical section)"},
    [X2 + BASE3 + SPECIAL + 0x00] = {"@Stages/X Hunter Base Stage 3/Shoryuken Capsule"},
    [X2 + BASE3 + ENEMY + 0x0D] = {"@Stages/X Hunter Base Stage 3/Agile Flyer"},

    [X2 + BASE4 + ENEMY + 0x0F] = {"@Stages/X Hunter Base Stage 4/Bubble Crab Rematch"},
    [X2 + BASE4 + ENEMY + 0x13] = {"@Stages/X Hunter Base Stage 4/Crystal Snail Rematch"},
    [X2 + BASE4 + ENEMY + 0x10] = {"@Stages/X Hunter Base Stage 4/Flame Stag Rematch"},
    [X2 + BASE4 + ENEMY + 0x12] = {"@Stages/X Hunter Base Stage 4/Magna Centipede Rematch"},
    [X2 + BASE4 + ENEMY + 0x11] = {"@Stages/X Hunter Base Stage 4/Morph Moth Rematch"},
    [X2 + BASE4 + ENEMY + 0x14] = {"@Stages/X Hunter Base Stage 4/Overdrive Ostrich Rematch"},
    [X2 + BASE4 + ENEMY + 0x0E] = {"@Stages/X Hunter Base Stage 4/Wheel Gator Rematch"},
    [X2 + BASE4 + ENEMY + 0x15] = {"@Stages/X Hunter Base Stage 4/Wire Sponge Rematch"},
    [X2 + BASE4 + CLEAR + 0x1F] = {"@Stages/X Hunter Base Stage 4/Stage Clear"},

    [X2 + BASE5 + ENEMY + 0x16] = {"@Stages/X Hunter Base Stage 5/Zero"},
    [X2 + BASE5 + ENEMY + 0x17] = {"@Stages/X Hunter Base Stage 5/Neo Sigma"},
}
