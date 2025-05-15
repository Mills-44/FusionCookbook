SMODS.Joker {
    key = 'honey_nut_cheerios',
    config = {},
    atlas = 'honey_nut_cheerios',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Sweet = true
     },        
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
   calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
            local other_card = context.other_card
            G.E_MANAGER:add_event(Event({
                   trigger = 'after',
                        delay = 0.15,
                        func = function()
                        other_card:flip()
                        other_card:juice_up(.3,.5)
                        return true
                        end}))
                    other_card:set_ability('m_gold',nil,true) 
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = .3,
                        func = function()
                        other_card:flip()
                        return true
                        end}))
                end
            end
} 

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_honey_nut_cheerios"] = { -- Pulls definition from the localization file
      reminder_text = {
      { text = "(" },
      { ref_table = "card.joker_display_values", ref_value = "suit", colour = G.C.SUITS.Spades },
      { text = ")" },
    },
     text = {
        { text = "Gold Cards", colour = G.C.FILTER },
     },
     calc_function = function(card)
      card.joker_display_values.hand = localize("Spades", 'base_suits')
    end,
    }   
end