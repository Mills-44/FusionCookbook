SMODS.Enhancement {
    key = "crack",
    atlas = "enhanc_fus",
    pos = {
        x = 3,
        y = 3
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {x_mult = 4, odds = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars={card.ability.extra.x_mult}}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self,card,context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
        if context.destroy_card and context.cardarea == G.play and context.main_scoring then
            return { 
                remove = true 
            }
        end
end
}