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
