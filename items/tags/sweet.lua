SMODS.Tag {
    object_type = "Tag",
    name = "Sweet Tag",
    key = 'sweet',
    atlas = 'sweet',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        type = {
            "store_joker_create"
        }
    },
    unlocked = true,
    discovered = true,
    apply = function(self, tag, context)
        if context.type == "store_joker_create" then
          local card = pseudorandom_element(MILLS.SWEET_JOKERS, pseudoseed('choice'))
          local sweet = create_card("Joker", context.area, nil, nil, nil, nil, 'j_mills_'.. card)          
          create_shop_card_ui(sweet, "Joker", context.area)
          sweet.states.visible = false
          tag:yep("+", MILLS.COLORS.SWEET, function()
            sweet:start_materialize()
			sweet.ability.couponed = true
			sweet:set_cost()
			return true
          end)
   tag.triggered = true
			return sweet
		end
    end
}