-- Same as atlas just took the idea for it highly suggest doing same unless you want certain pitches for sounds
-- Just set this loop up for any sound that you want that to have more explained in loop

local sound_files = { -- loop of all soinds implemented in game
    "adios", "bye", "crunch", "death", "doh", "fiery",
    "goopy", "gummy", "honey", "jam", "jazz", "koolaid",
    "later", "minty", "nutty", "piquant", "puft",
    "sayonara", "scorching", "sizzling", "spicy", "tangy", "wonka",
    "jack", "cookie", "bob", "gingy", "candy", "nice", "mrpb"
}

for _, key in ipairs(sound_files) do -- Pulls all sounds in local loop
    SMODS.Sound{
        key  = key, -- Pulls key of sound
        path = key .. '.ogg', -- Format Balatro uses and what I would do --> "bye.ogg" 
        volume = 1.0, -- Volume of Sound
        pitch = 1.0 -- Pitch Of Sound
    }
end

--Copy this loop and just change volume/pitch if you want different settings for certain sounds :)