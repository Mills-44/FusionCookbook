--PEPPER UPGRADER
PEPPER_UPGRADES = {
    j_mills_pimento_pepper = "j_mills_anaheim_chile",
    j_mills_anaheim_chile = "j_mills_jalapeno",
    j_mills_jalapeno = "j_mills_cayenne",
    j_mills_cayenne = "j_mills_habanero",
    j_mills_habanero = "j_mills_ghost_pepper",
    j_mills_ghost_pepper = "j_mills_carolina_reaper"
}

function upgrade_pepper_joker(old_card, next_key)
    for i, c in ipairs(G.jokers.cards) do
        if c == old_card then
            table.remove(G.jokers.cards, i)

            local newcard = SMODS.add_card{
                key = next_key,
                set = "Joker",
                area = G.jokers
            }

            newcard.ability.extra = shallow_copy(old_card.ability.extra or {})
            return true
        end
    end
    return false
end
