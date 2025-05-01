--I know different from most formats but I enjoy redoing my art sicne I am pob gonna update decently often once I get better
--If you are intrested in aty feel free to reach out :)

local atlas_keys = { --This will set up a local loop of all atlas keys
  'pepper_jokers',
  'apple_of_jacks_eye',
  'barry_b',
  'gummibar',
  'honey_nut_cheerios',
  'jammin_jelly',
  'koolaid_man',
  'nutty_buddy',
  'peppermint_butler',
  'stay_puft',
  'wonkas_chocolate_bar',
  'everlasting_pollenstopper',
  'flayfluff_sub',
  'gloopwich',
  'golden_crunch',
  'mr_pb_and_jelly',
  'snack_pack',
  'snack_pack_jumbo',
  'snack_pack_mega',
  'munch',
  'biscoff',
  'bubblegum',
  'butterscotch',
  'cream_puff',
  'homeys_doney',
  'kinder_egg',
  'pretzel',
  'rye_chip',
  'slice_of_bread',
  'candisimo',
  'cookiesimo',
  'cookie',
  'whippisimo',
  'whipping_cream',
  'frosting',

}

for _, key in ipairs(atlas_keys) do --Pulls all keys in list
  SMODS.Atlas {
    key  = key, -- pulls the key name like 'pretzel'
    path = key .. '.png', -- Adds .png to it for it to know its an image ofc for 'pretzel.png'
    px   = 71, -- Size of horizontal direction for game cards in 1x
    py   = 95, -- Size of vertical direction for game cards in 1x
  }
end
