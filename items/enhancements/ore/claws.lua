SMODS.Enhancement {
    key = "claws",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 2
    },
    config = {
        extra = {
            x_mult = 3, 
            uses = 3
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult, 
                card.ability.extra.uses
            }
        }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.uses = card.ability.extra.uses - 1
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
        if card.ability.extra.uses == 0 then
            return { 
                remove = true 
            }
        end
    end
}