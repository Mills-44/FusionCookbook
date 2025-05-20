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
    config = {
        extra = {
        x_mult = 4
    }},
    loc_vars = function(self, info_queue, card)
        return {vars={card.ability.extra.x_mult}}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Glass + Glass", 
        MILLS.COLORS.FUSION, 
        G.C.WHITE, 
        1.2 )
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
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = .3,
            func = function()
            card:shatter()
            return true
            end
        }))
    end
end
}