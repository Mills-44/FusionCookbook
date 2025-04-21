-- Snack Pack booster 
return {
    key = 'snack_pack',
    loc_txt = {
        name = 'Snack Pack',
        text = {
             "Choose {C:green}1 of 4{} Snack items",
            "to {C:attention}munch{} on"
        }
    },
   cost = 3,
   discovered = true,
   unlocked = true,
   blueprint_compat = false,
   booster_pack = true,
   consumable_choices = {
    'slice_of_bread',
    'cream puff'
},
    no_general_pool = true,
    atlas = 'snack_pack',
    pos = {
        x = 0, 
        y = 0}
}