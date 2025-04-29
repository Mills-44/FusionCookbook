-- Safely selects a random item from a table
function safe_random_choice(tbl, fallback)
    if not tbl or type(tbl) ~= "table" then
        return fallback
    end
    if #tbl == 0 then
        return fallback
    end
    return tbl[math.random(#tbl)]
end

function register_joker_to_pool(pool_key, joker_key)
    local full_key = "j_mills_" .. joker_key

    -- Create ObjectType if missing
    if not SMODS.ObjectTypes[pool_key] then
        SMODS.ObjectType{
            object_type = "ObjectType",
            key = pool_key,
            default = full_key,
            cards = {},
            rarities = {}
        }
    end

    -- Add joker to the pool
    SMODS.ObjectTypes[pool_key].cards[full_key] = true
end
