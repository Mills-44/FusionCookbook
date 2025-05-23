--I know different from most formats but I enjoy redoing my art sicne I am pob gonna update decently often once I get better
--If you are intrested in aty feel free to reach out :)

--Cards that are 71x95
local atlas_keys = { --This will set up a local loop of all atlas keys
'apple_of_jacks_eye',
'cookie',
'curly',
'enhanc_fus',
'enhanc_sw',
'everlasting_pollenstopper',
'flayfluff_sub',
'fusion',
'gloopwich',
'golden_crunch',
'joker',
'kinder_egg',
'misc_jokers',
'mr_pb_and_jelly',
'munch',
'nom',
'pepper_jokers',
'snack',
'sweet',
'sweet_jokers',
-- 'seal',
'snack_merchant',
'snack_pack',
'snack_pack_jumbo',
'snack_pack_mega',
'snack_tycoon',
-- "spectral",
'tarot'
}

for _, key in ipairs(atlas_keys) do --Pulls all keys in list
  SMODS.Atlas {
    key  = key, -- pulls the key name like 'pretzel'
    path = key .. '.png', -- Adds .png to it for it to know its an image ofc for 'pretzel.png'
    px   = 71, -- Size of horizontal direction for game cards in 1x
    py   = 95, -- Size of vertical direction for game cards in 1x
  }
end
