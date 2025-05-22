SMODS.Enhancement {
    key = "pig",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y= 2
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    any_suit = true,
    no_rank = true,
    config = {
        extra = {
            p_dollars = 0, 
            bonus_dollars = 5
        }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.p_dollars, 
                card.ability.extra.bonus_dollars
            }}
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Wild + Gold", 
        MILLS.COLORS.FUSION, 
        G.C.WHITE, 
        1.0 )
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function (self, card, context)
        if context.final_scoring_step and context.cardarea == G.hand then
            card.ability.extra.p_dollars = card.ability.extra.p_dollars + card.ability.extra.bonus_dollars
            return {
                message = "$5? Oink Oink!",
                color = MILLS.COLORS.FUSION
            }
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = card.ability.extra.p_dollars,
                }         
            end
        end
    }