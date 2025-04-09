-- ATLAS
SMODS.Atlas {
    key = "pepper_jokers", --For the pepper jokers implemented in mod
    path = "pepper_jokers.png", --image used for peppers
    px = 71, --Sizing of jokers in 1x
    py = 95 --1x y direction
}

-- Load Pepper Jokers
local pepper_jokers = {
"pimento_pepper", --Lvl 1
"anaheim_chile", --Lvl 2
"jalapeno", --Lvl 3
"cayenne", --Lvl 4
"habanero", --Lvl 5
"ghost_pepper", --Lvl 6
"carolina_reaper" --Final Lvl
}

for _, joker in ipairs(pepper_jokers) do
    local path = SMODS.current_mod.path .. "/jokers/peppers/" .. joker .. ".lua"
    local joker_def = dofile(SMODS.current_mod.path .. "/jokers/peppers/" .. joker .. ".lua")
SMODS.Joker(joker_def)

end
