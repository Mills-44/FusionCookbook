SMODS.Enhancement {
    key = "mirror",
    atlas = "enhanc_fus",
    pos = {
    x = 4, 
    y = 3
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            x_mult = 1.5, 
            odd = 4
        }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
            card.ability.extra.x_mult, 
            card.ability.extra.odd, 
            (G.GAME.probabilities.normal or 1)
        }}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Glass + Steel", 
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
    if context.cardarea == G.play and context.repetition then
        if (pseudorandom('mirror_odd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
            return {
                repetitions = 1
            }
        end
    end
end
}
