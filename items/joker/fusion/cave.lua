SMODS.Joker {
    key = 'cave',
    config = {},
    rarity = 3,
    atlas = 'joker',
    in_pool = function(self, args) 
        return false
      end,
    pos = { x = 1, y = 0 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
    if context.setting_blind and not card.getting_sliced then
        G.E_MANAGER:add_event(Event({
            func = function() 
                local enhancement_keys = {'m_mills_sapph', 'm_mills_cob', 'm_mills_ori', 'm_mills_ruby', 'm_mills_cinna', 'm_mills_red', 'm_steel', 'm_gold', 'm_stone'}  -- These are your actual keys
                local random_key = pseudorandom_element(enhancement_keys, pseudoseed('cave'))
                local front = pseudorandom_element(G.P_CARDS, pseudoseed('front'))
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS[random_key], {playing_card = G.playing_card})
                card:start_materialize({G.C.SECONDARY_SET.Enhanced})
                G.play:emplace(card)
                table.insert(G.playing_cards, card)
                return true
            end}))
        card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_ore'), colour = G.C.SECONDARY_SET.Enhanced})

        G.E_MANAGER:add_event(Event({
            func = function() 
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                return true
            end}))
            draw_card(G.play,G.deck, 90,'up', nil)  
        end
    end}

    
-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_cave"] = { -- Pulls definition from the localization file
    reminder_text = {
        { text = "(" },
        { text = "When Blind Selected"},
        { text = ")" },
    },
     text = {
        { text = "Fusion Cards", colour = G.C.FILTER },
     }
    }
    end