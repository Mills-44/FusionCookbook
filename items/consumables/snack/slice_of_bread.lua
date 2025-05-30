SMODS.Consumable  {
  object_type = "Consumable",
  key = 'slice_of_bread',
  set = "Snack",
  atlas = 'snack',
  pos = { 
	x = 4, 
	y = 2 
 },
  config = {},
  cost = 3,
  unlocked = true,
  discovered = true,
  pools = { 
    Snack = true
  },
  set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
  can_use = function(self)
    if #G.jokers.highlighted ~= 2 then
            return false
    end
    if G.jokers.highlighted[1].config.center.key  == 'j_mills_jammin_jelly' and
       G.jokers.highlighted[2].config.center.key == 'j_mills_nutty_buddy'  or
       G.jokers.highlighted[2].config.center.key  == 'j_mills_jammin_jelly' and
       G.jokers.highlighted[1].config.center.key == 'j_mills_nutty_buddy'  or

      G.jokers.highlighted[1].config.center.key  == 'j_mills_jammin_jelly' and
      G.jokers.highlighted[2].config.center.key == 'j_mills_stay_puft'  or
      G.jokers.highlighted[2].config.center.key  == 'j_mills_jammin_jelly' and
      G.jokers.highlighted[1].config.center.key == 'j_mills_stay_puft'  or

      G.jokers.highlighted[1].config.center.key  == 'j_mills_barry_b' and
      G.jokers.highlighted[2].config.center.key == 'j_mills_stay_puft'  or
      G.jokers.highlighted[2].config.center.key  == 'j_mills_barry_b' and
      G.jokers.highlighted[1].config.center.key == 'j_mills_stay_puft'  or

      G.jokers.highlighted[1].config.center.key  == 'j_mills_barry_b' and
      G.jokers.highlighted[2].config.center.key == 'j_mills_wonkas_chocolate_bar'  or
      G.jokers.highlighted[2].config.center.key  == 'j_mills_barry_b' and
      G.jokers.highlighted[1].config.center.key == 'j_mills_wonkas_chocolate_bar'  or

      G.jokers.highlighted[1].config.center.key  == 'j_mills_nutty_buddy' and
      G.jokers.highlighted[2].config.center.key == 'j_mills_wonkas_chocolate_bar'  or
      G.jokers.highlighted[2].config.center.key  == 'j_mills_nutty_buddy' and
      G.jokers.highlighted[1].config.center.key == 'j_mills_wonkas_chocolate_bar'  
       
       then 
            return true
        end
  end,
use = function(self, card, area, copier)

  -- PB & Jelly
  if G.jokers.highlighted[1].config.center.key == 'j_mills_jammin_jelly' and
     G.jokers.highlighted[2].config.center.key == 'j_mills_nutty_buddy'  or 
     G.jokers.highlighted[2].config.center.key == 'j_mills_jammin_jelly' and
     G.jokers.highlighted[1].config.center.key == 'j_mills_nutty_buddy'then
        G.jokers.highlighted[1]:start_dissolve()
        G.jokers.highlighted[2]:start_dissolve()
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_mr_pb_and_jelly')
              card:add_to_deck()
              G.jokers:emplace(card)
              card:juice_up(0.3, 0.5)
              return true
            end
            }))
            end
    
    -- Wonka & Barry
  if G.jokers.highlighted[1].config.center.key == 'j_mills_wonkas_chocolate_bar' and
     G.jokers.highlighted[2].config.center.key == 'j_mills_barry_b'  or 
     G.jokers.highlighted[2].config.center.key == 'j_mills_wonkas_chocolate_bar' and
     G.jokers.highlighted[1].config.center.key == 'j_mills_barry_b'then
        G.jokers.highlighted[1]:start_dissolve()
        G.jokers.highlighted[2]:start_dissolve()
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_everlasting_pollenstopper')
              card:add_to_deck()
              G.jokers:emplace(card)
              card:juice_up(0.3, 0.5)
              return true
            end
            }))
            end
      
      -- Barry & Puft
  if G.jokers.highlighted[1].config.center.key == 'j_mills_barry_b' and
     G.jokers.highlighted[2].config.center.key == 'j_mills_stay_puft'  or 
     G.jokers.highlighted[2].config.center.key == 'j_mills_barry_b' and
     G.jokers.highlighted[1].config.center.key == 'j_mills_stay_puft'then
        G.jokers.highlighted[1]:start_dissolve()
        G.jokers.highlighted[2]:start_dissolve()
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_flayfluff_sub')
              card:add_to_deck()
              G.jokers:emplace(card)
              card:juice_up(0.3, 0.5)
              return true
            end
            }))
          end

      -- Jelly & Puft
  if G.jokers.highlighted[1].config.center.key == 'j_mills_stay_puft' and
     G.jokers.highlighted[2].config.center.key == 'j_mills_jammin_jelly'  or 
     G.jokers.highlighted[2].config.center.key == 'j_mills_stay_puft' and
     G.jokers.highlighted[1].config.center.key == 'j_mills_jammin_jelly'then
        G.jokers.highlighted[1]:start_dissolve()
        G.jokers.highlighted[2]:start_dissolve()
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_gloopwich')
              card:add_to_deck()
              G.jokers:emplace(card)
              card:juice_up(0.3, 0.5)
              return true
            end
            }))
            end
          
      -- PB & Wonka
  if G.jokers.highlighted[1].config.center.key == 'j_mills_wonkas_chocolate_bar' and
     G.jokers.highlighted[2].config.center.key == 'j_mills_nutty_buddy'  or 
     G.jokers.highlighted[2].config.center.key == 'j_mills_wonkas_chocolate_bar' and
     G.jokers.highlighted[1].config.center.key == 'j_mills_nutty_buddy'then
        G.jokers.highlighted[1]:start_dissolve()
        G.jokers.highlighted[2]:start_dissolve()
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            local card = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_golden_crunch')
              card:add_to_deck()
              G.jokers:emplace(card)
              card:juice_up(0.3, 0.5)
              return true
            end
            }))
            end
            
		end
}