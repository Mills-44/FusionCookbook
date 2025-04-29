if not MILLS then
	MILLS = {}
end

mills = SMODS.current_mod

local atlas_keys = {
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
    -- 
  }
  
for _, key in ipairs(atlas_keys) do
    SMODS.Atlas {
      key  = key,
      path = key .. '.png',
      px   = 71,
      py   = 95,
    }
  end
  
-- ||       SOUNDS         ||
local sound_keys = {
    'tangy',
    'sayonara',
    'piquant',
    'bye',
    'spicy',
    'adios',
    'sizziling',
    'fiery',
    'later',
    'death',
    'scorching',
    'crunch',
    'goopy',
    'doh',
    'munch',
    'wonka',
    'jack',
    'honey',
    'nutty',
    'puft',
    'minty',
    'gummy',
    'jam',
    'koolaid'
}
for _, key in ipairs(sound_keys) do
    SMODS.Sound{
      key    = key,
      path   = key .. '.ogg',
      volume = 1.0,
      pitch  = 1.0,
    }
  end

--assert(SMODS.load_file("lib/utility.lua"))()

assert(SMODS.load_file("items/snack.lua"))()
assert(SMODS.load_file("items/jokers/peppers.lua"))()
assert(SMODS.load_file("items/jokers/sweet.lua"))()
assert(SMODS.load_file("items/jokers/sandwiches.lua"))()
assert(SMODS.load_file("items/modifiers.lua"))()
assert(SMODS.load_file("items/spectrals.lua"))()
assert(SMODS.load_file("items/seals.lua"))()

   -- Grab the original
   local orig_init = Sprite.init

   function Sprite:init(x, y, w, h, atlas, pos, ...)
       if not atlas then
           local fallback_key, fallback_atlas
           for k,a in pairs(G.ASSET_ATLAS) do
               fallback_key, fallback_atlas = k, a
               break
           end
           atlas = fallback_atlas
           pos   = pos or { x = 0, y = 0 }
       end

       -- now call the original with a non‐nil atlas
       orig_init(self, x, y, w, h, atlas, pos, ...)
   end
