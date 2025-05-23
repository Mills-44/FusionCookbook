--For my Util and Define
if not MILLS then
    MILLS = {}
end

if not ANIM then
  ANIM = {}
end
--Loads Mod
mills = SMODS.current_mod
mills_path = SMODS.current_mod.path

--Config Lib
--MILLS.config = SMODS.load_file("config.lua")() -- When I set up UI I this will actually do sum for now its a dummy config 

--Load lib
SMODS.load_file("lib/define.lua")() -- Definitions 
SMODS.load_file("lib/util.lua")() -- Utility functions built
SMODS.load_file("lib/ui.lua")() -- Tabs and stuff
ANIM = SMODS.load_file("lib/animation.lua")()

SMODS.load_file("items/atlas.lua")() -- Pictures
SMODS.load_file("items/sounds.lua")() -- Sounds
SMODS.load_file("lovely/others.toml") -- obsidian

MILLS.register_items(MILLS.PEPPER_JOKERS, "items/joker/pepper")
MILLS.register_items(MILLS.SWEET_JOKERS, "items/joker/sweet")
MILLS.register_items(MILLS.FUSION_JOKERS, "items/joker/fusion")
MILLS.register_items(MILLS.MISC_JOKERS, "items/joker/misc")
MILLS.register_items(MILLS.SANDWICH_JOKERS, "items/joker/sandwich")

-- Register custom ConsumableType: Snack
SMODS.ConsumableType {
  object_type = "ConsumableType",
  key = 'Snack',
  default = 'c_mills_bubblegum',
  collection_rows = { 3,4 },
  primary_colour = HEX("572501"),
  secondary_colour = HEX("D7A450"),
  loc_txt = {
      collection = 'Snack Cards',
      name = 'Snack',
      label = 'Snack',
      },
  shop_rate = 1.0,
  can_stack = true,
	can_divide = true,
}

-- Register custom ConsumableType: Fusion

SMODS.ConsumableType {
  object_type = "ConsumableType",
  key = 'Fusion',
  default = 'c_mills_enh_fus',
  collection_rows = { 4,4 },
  primary_colour = HEX("7164C6"),
  secondary_colour = HEX("31353B"),
  loc_txt = {
      collection = 'Fusion Cards',
      name = 'Fusion',
      label = 'Fusion',
      },
  shop_rate = 0.0,
    }

-- PATCH: Ensure pool is initialized before injection
local orig_insert_pool = SMODS.insert_pool
SMODS.insert_pool = function(pool, center, ...)
  if type(pool) ~= "table" then
    pool = {}
  end
  return orig_insert_pool(pool, center, ...)
end

-- Cards go boioioing

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
    set_spritesref(self, _center, _front) 
    if _center and _center.name == "c_mills_enh_fus" then
        self.children.floating_sprite = Sprite(
            self.T.x,
            self.T.y,
            self.T.w,
            self.T.h,
            G.ASSET_ATLAS[_center.atlas or _center.set],
            { x = 1, y = 1 }
        )
        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite.states.hover.can = false
        self.children.floating_sprite.states.click.can = false
    end
     set_spritesref(self, _center, _front) 
    if _center and _center.name == "j_mills_curly" then
        self.children.floating_sprite = Sprite(
            self.T.x,
            self.T.y,
            self.T.w,
            self.T.h,
            G.ASSET_ATLAS[_center.atlas or _center.set],
            { x = 1, y = 0 }
        )
        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite.states.hover.can = false
        self.children.floating_sprite.states.click.can = false
      end
end




-- register items

MILLS.register_items(MILLS.BOOSTER, "items/boosters")

-- FUSIONS
MILLS.register_items(MILLS.FUSION_BONUS_ENHANCEMENTS, "items/enhancements/fusion/bonus")
MILLS.register_items(MILLS.FUSION_MULT_ENHANCEMENTS, "items/enhancements/fusion/mult")
MILLS.register_items(MILLS.FUSION_WILD_ENHANCEMENTS, "items/enhancements/fusion/wild")
MILLS.register_items(MILLS.FUSION_GLASS_ENHANCEMENTS, "items/enhancements/fusion/glass")
MILLS.register_items(MILLS.FUSION_STEEL_ENHANCEMENTS, "items/enhancements/fusion/steel")
MILLS.register_items(MILLS.FUSION_STONE_ENHANCEMENTS, "items/enhancements/fusion/stone")
MILLS.register_items(MILLS.FUSION_GOLD_ENHANCEMENTS, "items/enhancements/fusion/gold")
MILLS.register_items(MILLS.FUSION_LUCKY_ENHANCEMENTS, "items/enhancements/fusion/lucky")

-- Sweet Enhancements
MILLS.register_items(MILLS.SWEET_ENHANCEMENTS, "items/enhancements/sweet")

-- Consumables
MILLS.register_items(MILLS.SNACKS, "items/consumables/snack")
MILLS.register_items(MILLS.FUSION, "items/consumables/fusion")
MILLS.register_items(MILLS.SPECTRAL, "items/consumables/spectral")
MILLS.register_items(MILLS.TAROT, "items/consumables/tarot")

--Seals
MILLS.register_items(MILLS.SEALS, "items/seals")

-- Tags
MILLS.register_items(MILLS.TAGS, "items/tags")

-- Vouchers
MILLS.register_items(MILLS.VOUCHERS, "items/vouchers")

-- Editions
--MILLS.register_items(MILLS.EDITIONS, "items/editions")