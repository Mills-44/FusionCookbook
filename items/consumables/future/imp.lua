SMODS.Consumable {
    object_type = "Consumable",
    key = 'imp',
    set = "Future",
    atlas = 'future',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Future = true
     },
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area)
        
        local suit = pseudorandom_element(MILLS.base_suits, pseudoseed('imp_create'))
        local rank =  pseudorandom_element(MILLS.base_ranks, pseudoseed('imp_create')) 
        
        local cen_pool = {}
        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if v.key ~= 'm_stone' then 
                cen_pool[#cen_pool+1] = v
            end
    end

        local card1 = create_playing_card({
            front = G.P_CARDS[suit..'_'..rank], 
            center = pseudorandom_element(cen_pool, pseudoseed('card'))}, 
            G.hand, nil, i ~= 1, {MILLS.COLORS.FUTURE})
        local card2 = create_playing_card({
            front = G.P_CARDS[suit..'_'..rank], 
            center = pseudorandom_element(cen_pool, pseudoseed('card'))}, 
            G.hand, nil, i ~= 1, {MILLS.COLORS.FUTURE})
        if SMODS.get_enhancements(card1, MILLS.FUSION_GOLD_ENHANCEMENTS) then
            local gold_fuse = pseudorandom_element(MILLS.FUSION_GOLD_ENHANCEMENTS, pseudoseed('choice'))
            card1:set_ability('m_mills_' .. gold_fuse,nil,true) 
        end
        if SMODS.get_enhancements(card2, MILLS.FUSION_GOLD_ENHANCEMENTS) then
            local gold_fuse = pseudorandom_element(MILLS.FUSION_GOLD_ENHANCEMENTS, pseudoseed('choice'))
            card2:set_ability('m_mills_' .. gold_fuse,nil,true) 
        end
end
}