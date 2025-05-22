SMODS.Enhancement {
  key = "cookiesimo",
  atlas = 'enhanc_sw',
  consumable = true,
  pos = {
      x = 0,
      y = 1
  },
  order = 2,
  config = {
      extra = {
      bonus = 100,
      mult = 20,
      xmult = 3,
      p_dollars = 5,
      }
  },
  loc_vars = function(self, info_queue, card)
      return {
        vars = {card.ability.extra.bonus, card.ability.extra.mult, card.ability.extra.p_dollars, (G.GAME.probabilities.normal or 1), card.ability.extra.odd}
      }
  end,
  set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly & Mills", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
  calculate = function(self, card, context)
          if context.cardarea == G.play and context.main_scoring then
              if MILLS.random_chance(.4) then
              bonus = card.ability.extra.bonus
            elseif MILLS.random_chance(.5) then
              mult = card.ability.extra.mult
            elseif MILLS.random_chance(.6) then
             -- xmult = card.ability.extra.xmult
            elseif MILLS.random_chance(.7) then
              ease_dollars(5)
           elseif MILLS.random_chance(.8) then
              G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                  play_sound('mills_nice')
                  local card = create_card('Tarot', G.consumeables,  nil, nil, nil, nil, 'c_' )
                  card:add_to_deck()
                  G.consumeables:emplace(card)
                  card:juice_up(0.3, 0.5)
                      return true end }))
           -- elseif MILLS.random_chance(.9) then
          --    G.E_MANAGER:add_event(Event({
           --     trigger = 'after', 
            --    delay = 0.4, 
             --   func = function()
             --     play_sound('mills_nice')
             --     local card = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )
             --     card:add_to_deck()
              --    G.consumeables:emplace(card)
             --         card:juice_up(0.3, 0.5)
              --          return true end }))
        --    elseif MILLS.random_chance(.95) then
         --     G.E_MANAGER:add_event(Event({
           --     trigger = 'after', 
            --    delay = 0.4, 
            --    func = function()
             --     play_sound('mills_nice')
             --     local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'c_' )
             --     card:add_to_deck()
            --      G.consumeables:emplace(card)
            --      card:juice_up(0.3, 0.5)
           --             return true end }))
          --  else
          --    G.E_MANAGER:add_event(Event({
          --      trigger = 'after', 
           --     delay = 0.4, 
           --     func = function()
           --       play_sound('mills_nice')
           --       local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'c_' )
           --       card:add_to_deck()
          --        G.consumeables:emplace(card)
          --        card:juice_up(0.3, 0.5)
          --              return true end }))
              end
              return {
                  chips = bonus,
                  mult = mult,
                  xmult = xmult,
              }
          end
        end
      }
