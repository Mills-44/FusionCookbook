--I know different from most formats but I enjoy redoing my art sicne I am pob gonna update decently often once I get better
--If you are intrested in aty feel free to reach out :)

--Cards that are 71x95
local atlas_keys = { --This will set up a local loop of all atlas keys
'animal',
'apple_of_jacks_eye',
'barry_b',
'biscoff',
'blondwie',
'bob',
'bubblegum',
'butterscotch',
'cake_pop',
'cannoli',
'choffle',
'chromlech',
'cookie',
'cream_puff',
'enhanc_fus',
'enhanc_sw',
'everlasting_pollenstopper',
'flayfluff_sub',
'fusion',
'frosting',
'gloopwich',
'golden_crunch',
'gummibar',
'honey_nut_cheerios',
'homeys_doney',
'jammin_jelly',
'joker',
'kinder_egg',
'king_candy',
'koolaid_man',
'm_and_m',
'mr_pb_and_jelly',
'munch',
'nom',
'nutty_buddy',
'omnipotent',
'pepper_jokers',
'peppermint_butler',
'pretzel',
'rock_candy',
'rye_chip',
'sweet',
-- "seal",
'shortbread',
'slice_of_bread',
'snack_merchant',
'snack_pack',
'snack_pack_jumbo',
'snack_pack_mega',
'snack_tycoon',
-- "spectral",
'stay_puft',
-- "taffy",
'take_5',
'whipping_cream',
'wonkas_chocolate_bar',
}

for _, key in ipairs(atlas_keys) do --Pulls all keys in list
  SMODS.Atlas {
    key  = key, -- pulls the key name like 'pretzel'
    path = key .. '.png', -- Adds .png to it for it to know its an image ofc for 'pretzel.png'
    px   = 71, -- Size of horizontal direction for game cards in 1x
    py   = 95, -- Size of vertical direction for game cards in 1x
  }
end
