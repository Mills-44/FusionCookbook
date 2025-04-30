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
  local center = type(card) == "string"
      and G.P_CENTERS[card]
      or (card.config and card.config.center)

  if not center then
    return false
  end
  -- If the center has the Sweet pool in its definition
  if center.pools and center.pools.Sweet then
    return true
  end
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

-- Define Calculation
if card then
  SMODS.calculate_effect({
    message = localize('k_balanced'),
    colour  = { 0.8, 0.45, 0.85, 1 },
    instant = true
  }, card)
end

--- @return boolean
function MILLS.has_modded_suit_in_deck()
  for k, v in ipairs(G.playing_cards or {}) do
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

---@return table
--Inject Colors
for name, color in pairs(MILLS.COLORS) do
  G.C[name:upper()] = color
end

-- Safe initialization for RNG (run only once)
if not MILLS._rng_seeded then
  math.randomseed(os.time())
  MILLS._rng_seeded = true
end


---Returns true with probability `chance` (0.0 to 1.0)
---@param chance number
---@return boolean
function MILLS.random_chance(chance)
  return math.random() < chance
end

---Weighted random selection
---@param choices table<string, number> -- key-value pairs of item -> weight (e.g., {a=0.5, b=0.3, c=0.2})
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

---Returns a random joker key from a pool definition table (e.g. {Sweet = true})
---@param pool_table table
---@return string | nil
function MILLS.random_choice_from_pool(pool_table)
  local jokers = {}
  for key, def in pairs(SMODS.Jokers) do
    if def.pools then
      for pool, enabled in pairs(pool_table) do
        if enabled and def.pools[pool] then
          table.insert(jokers, key)
          break
        end
      end
    end
  end
  if #jokers > 0 then
    return jokers[math.random(1, #jokers)]
  end
  return nil
end
