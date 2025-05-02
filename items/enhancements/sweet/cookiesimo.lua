SMODS.Enhancement {
    key = "cookiesimo",
    atlas = 'enhanc_sw',
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {
        chips = 50,
        dollars = 5,
        mult = 8,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
          vars = {}
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
          local prize = MILLS.random_weighted_choice({
            chips = 0.40,
            mult = 0.25,
            dollars = 0.15,
            tarot = 0.05,
            snack = 0.05,
            spectral = 0.05,
            planet = 0.05
          })
          if prize == 'chips' then
            card.ability.extra.chips = card.ability.extra.chips + 10
            SMODS.calculate_effect { message = "+10 Chips", card = card }
          elseif prize == 'mult' then
            card.ability.extra.mult = card.ability.extra.mult + 2
            SMODS.calculate_effect { message = "+2 Mult", card = card }
          elseif prize == 'dollars' then
            G.GAME.dollars = G.GAME.dollars + 3
            SMODS.calculate_effect { message = "$3 Surprise!", card = card }
          elseif prize == 'tarot' then
            G.E_MANAGER:add_event(Event({
              trigger = 'before', delay = 0,
              func = function()
                local new_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'Tarot', nil)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                return true
              end
            }))
            SMODS.calculate_effect { message = "Tarot Surprise!", card = card }
          elseif prize == 'snack' then
            G.E_MANAGER:add_event(Event({
              trigger = 'before', delay = 0,
              func = function()
                local new_card = create_card('Snack', G.consumeables, nil, nil, nil, nil, 'Snack', nil)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                return true
              end
            }))
            SMODS.calculate_effect { message = "Snack Treat!", card = card }
          elseif prize == 'spectral' then
            G.E_MANAGER:add_event(Event({
              trigger = 'before', delay = 0,
              func = function()
                local new_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'Spectral', nil)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                return true
              end
            }))
            SMODS.calculate_effect { message = "Spectral Boost!", card = card }
          elseif prize == 'planet' then
            G.E_MANAGER:add_event(Event({
              trigger = 'before', delay = 0,
              func = function()
                local new_card = create_card('Planet', G.consumeables, nil, nil, nil, nil, 'Planet', nil)
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                return true
              end
            }))
            SMODS.calculate_effect { message = "Planet Gift!", card = card }
          end
        end
      end
    }