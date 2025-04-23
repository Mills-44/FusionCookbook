SMODS.Consumable {
    key = 'slice_of_bread',
    set = 'Snack',
    loc_txt = {
        name = 'Slice Of Bread',
        text = {
             "Combine two compatible Jokers to create a Sandwhich Joker"
            }
    },
    atlas = 'snack_cards',
    pos = {
        x = 5,
        y = 0
    },
    cost = 3,
    discovered = true,
    unlocked = true,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        local fusion_recipes = {
            {
                result = "flayfluff_sub",
                requires = { "stay_puft", "barry_b", "slice_of_bread" }
            },
            {
                result = "mr_pb_and_jelly",
                requires = { "nutty_buddy", "jammin_jelly", "slice_of_bread" }
            },
            {
                result = "everlasting_pollenstopper",
                requires = { "barry_b", "wonkas_chocolate_bar", "slice_of_bread" }
            },
            {
                result = "golden_crunch",
                requires = { "nutty_buddy", "wonkas_chocolate_bar", "slice_of_bread" }
            },
            {
                result = "goopwhich",
                requires = { "stay_puft", "jammin_jelly", "slice_of_bread" }
            }
        }

        local inventory = {}
        for _, j in ipairs(G.jokers.cards) do
            inventory[j.config.center.key] = j
        end

        for _, recipe in ipairs(fusion_recipes) do
            local all_present = true
            for _, req in ipairs(recipe.requires) do
                if not inventory[req] then
                    all_present = false
                    break
                end
            end

            if all_present then
                for _, req in ipairs(recipe.requires) do
                    if inventory[req] then
                        remove_card(inventory[req])
                    end
                end

                local new_joker = SMODS.create_card({
                    key = recipe.result,
                    area = G.jokers
                })
                new_joker:add_to_deck()
                G.jokers:emplace(new_joker)

                play_sound('tarot1')
                return
            end
        end

        -- no match, optional fallback
        play_sound('tarot2')
    end
}
