--For my Util and Define
if not MILLS then
  MILLS = {}
end
--Loads Mod
mills = SMODS.current_mod
mills_path = SMODS.current_mod.path

--Config Lib
MILLS.config = SMODS.load_file("config.lua")() -- When I set up UI I this will actually do sum for now its a dummy config 

--Load lib
SMODS.load_file("lib/define.lua")() -- Definitions 
SMODS.load_file("lib/util.lua")() -- Utility functions built
--SMODS.load_file("lib/ui.lua")() -- Not Today :(

SMODS.load_file("items/atlas.lua")() -- Pictures
SMODS.load_file("items/sounds.lua")() -- Sounds

MILLS.register_items(MILLS.PEPPER_JOKERS, "items/joker/pepper")
--MILLS.register_items(MILLS.SWEET_JOKERS, "items/joker/sweet")
--MILLS.register_items(MILLS.SANDWICH_JOKERS, "items/joker/sandwich")
--MILLS.register_items(MILLS.SNACKBOOSTER, "items/snack/boosters")
--MILLS.register_items(MILLS.SNACKS, "items/snack/snacks")
--MILLS.register_items(MILLS.ENHANCEMENTS, "items/enhancements")
--MILLS.register_items(MILLS.SPECTRAL, "items/spectral")
--MILLS.register_items(MILLS.SEALS, "items/seals")
--MILLS.register_items(MILLS.TAGS, "items/tags")
--MILLS.register_items(MILLS.EDITIONS, "items/editions")



-- Collect valid objects to apply Cookbook config to
local objects = {}

for _, v in pairs(SMODS.Centers) do
objects[#objects + 1] = { obj = v, center = true }
end

for _, v in pairs(SMODS.Tags) do
objects[#objects + 1] = { obj = v, tag = true }
end

-- Apply said config to each valid object
for _, v in ipairs(objects) do
local obj = v.obj
if obj and type(obj) == "table" and obj.mills then
  local func_ref = obj.in_pool or function() return true end
  local config = obj.mills

  config.requirements = {}
  for k, _ in pairs(config) do
    local data = MILLS.requirement_map[k]
    if data then
      table.insert(config.requirements, data)
    end
  end

-- Hook the in_pool function, adding extra logic depending on the
-- config provided by this center
  obj.in_pool = function(self, args)
    local ret, dupes = func_ref(self, args)

    for _, req in ipairs(config.requirements) do
      ret = ret and MILLS.config[req.setting]
    end
    return ret, dupes
  end
end
end
