--makes sweet joker a type 
if not SMODS.ObjectTypes.Sweet then
  SMODS.ObjectType {
    key = 'Sweet',
    default = 'j_mills_apple_of_jacks_eye',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
    end
  }
end

---Checks if a provided card is classified as a "Sweet Joker"
---@param card table | string a center key or a card
---@return boolean
function MILLS.is_sweet(card)
  local center = nil
  if type(card) == 'string' then
    center = G.P_CENTERS[card]
  elseif type(card) == 'table' and card.config then
    center = card.config.center or G.P_CENTERS[card.config.center_key]
  end

  return center and center.pools and center.pools.Sweet or false
end

---Returns a table of all the Jokers classified as "Sweet Jokers" in the G.jokers cardarea
---@return table
function MILLS.get_sweet()
  local res = {}

  if G.jokers then
    for _, v in ipairs(G.jokers.cards) do
      if MILLS.is_sweet(v) then
        res[#res + 1] = v
      end
    end
  end
  return res
end

---Registers a list of items in a custom order
---@param items table
---@param path string
function MILLS.register_items(items, path)
  for i = 1, #items do
    SMODS.load_file(path .. "/" .. items[i] .. ".lua")()
  end
end

---Returns true with probability `chance` (0.0 to 1.0)
---@param chance number
---@return boolean
function MILLS.random_chance(chance)
  return math.random() < chance
end

---Weighted random selection
---@param choices table<string, number>
---@return string | nil
function MILLS.random_weighted_choice(choices)
  local total = 0
  for _, weight in pairs(choices) do
    total = total + weight
  end
  local roll = math.random() * total
  local cumulative = 0
  for item, weight in pairs(choices) do
    cumulative = cumulative + weight
    if roll <= cumulative then return item end
  end
end

---Returns a random joker/snack key from any matching pool
---@param pool_table table
---@return string | nil
function MILLS.random_choice_from_pool(pool_table)
  local jokers = {}
  local sources = {SMODS.Jokers, SMODS.Consumables}

  for _, source in ipairs(sources) do
    for key, def in pairs(source or {}) do
      if type(def) == "table" and def.pools then
        for pool, enabled in pairs(pool_table or {}) do
          if enabled and def.pools[pool] then
            table.insert(jokers, key)
            break
          end
        end
      end
    end
  end

  if #jokers > 0 then
    return jokers[math.random(1, #jokers)]
  end
  return nil
end

---Check if deck has non-standard suit cards
---@return boolean
function MILLS.has_modded_suit_in_deck()
  for _, v in ipairs(G.playing_cards or {}) do
    local is_modded = true
    for _, suit in ipairs(MILLS.base_suits) do
      if v.base.suit == suit then
        is_modded = false
      end
    end
    if not SMODS.has_no_suit(v) and is_modded then
      return true
    end
  end
  return false
end

-- Inject mod colors into global G.C
for name, color in pairs(MILLS.COLORS or {}) do
  G.C[name:upper()] = color
end

-- Seed RNG once
if not MILLS._rng_seeded then
  math.randomseed(os.time())
  MILLS._rng_seeded = true
end

-- Weight Utility for spawn rates for consumables
function MILLS.consumable_rate(args)
   args = args or {}
    local key = args.key or 'std_consumable'
    local mod = args.mod or 1
    local guaranteed = args.guaranteed or false
    local options = args.options or get_current_pool("Consumable")
    if args.no_replace then
        for i, k in pairs(options) do
            if G.P_CENTERS[k] and G.P_CENTERS[k].replace_base_card then
                options[i] = 'UNAVAILABLE'
            end
        end
    local type_key = args.type_key or key.."type"..G.GAME.round_resets.ante
    key = key..G.GAME.round_resets.ante

    local available_consumable = {}
    local total_weight = 0
    for _, v in ipairs(options) do
        if v ~= "UNAVAILABLE" then
            local consumable_option = {}
            if type(v) == 'string' then
                assert(G.P_CENTERS[v])
                consumable_option = { key = v, weight = G.P_CENTERS[v].weight or 5 }
            elseif type(v) == 'table' then
                assert(G.P_CENTERS[v.key])
                consumable_option = { key = v.key, weight = v.weight }
            end
            if consumable_option.weight > 0 then
                table.insert(available_consumable, consumable_option)
                total_weight = total_weight + consumable_option.weight
            end
          end
      end
      total_weight = total_weight + (total_weight / 40 * 60) -- set base rate to 40%

      local type_weight = 0 -- modified weight total
      for _,v in ipairs(available_consumable) do
        v.weight = G.P_CENTERS[v.key].get_weight and G.P_CENTERS[v.key]:get_weight() or v.weight
        type_weight = type_weight + v.weight
    end

    local consumable_poll = pseudorandom(pseudoseed(key))
    if consumable_poll > 1 - (type_weight*mod / total_weight) or guaranteed then 
        local consumable_type_poll = pseudorandom(pseudoseed(type_key))
        local weight_i = 0
        for k, v in ipairs(available_consumable) do
            weight_i = weight_i + v.weight
            if consumable_type_poll > 1 - (weight_i / type_weight) then
                return v.key
            end
        end
    end

  end
end
