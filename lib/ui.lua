
SMODS.current_mod.config_tab = function()
    local scale = 5/6
    return {
    n = G.UIT.ROOT, 
    config = {
        align = "cl", 
        minh = G.ROOM.T.h*0.25, 
        padding = 0.0, 
        r = 0.1, 
        colour = G.C.GREY
    }, 
    nodes = {
        {
        n = G.UIT.R, 
        config = { 
            padding = 0.05 
        }, 
        nodes = {
            {
            n = G.UIT.C, 
            config = { 
                minw = G.ROOM.T.w*0.25, 
                padding = 0.05 
            }, 
            nodes = {
                create_toggle{ 
                label = localize("enable_enhancement_fusions"), 
                active_colour = MILLS.COLORS.FUSION, 
                ref_table = mills.config, 
                ref_value = "enable_enhancement_fusions" 
                },
            }}
        }}
    }}
end

SMODS.current_mod.extra_tabs = function()
    return {
        {

            label = localize("k_mills_instruction_card"),
            tab_definition_function = function()
                local modNodes = {}

                for _, key in ipairs({
            "mills_fusions_glob",
            "mills_fusions_cons",
            "mills_fusions_enh",
            "mills_fusions_edi",
            "mills_fusions_seal",
                            }) do
                    modNodes[#modNodes + 1] = {}
                    local loc_vars = { scale = 1.2 }
                    localize { 
                    type = 'descriptions', 
                    key = key, 
                    set = 'Tabs', 
                    nodes = modNodes[#modNodes], 
                    vars = loc_vars.vars, 
                    scale = loc_vars.scale, 
                    text_colour = loc_vars.text_colour, 
                    shadow = loc_vars.shadow 
                }
                    modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                    modNodes[#modNodes].config.colour = loc_vars.background_colour or modNodes[#modNodes].config.colour
                end

                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = modNodes
                }
            end
        },
        {

            label = localize("k_mills_combos"),
            tab_definition_function = function()
                local modNodes = {}

                for _, key in ipairs({
            "mills_combos_sandwich",
            "mills_combos_sandwichcombo",
                            }) do
                    modNodes[#modNodes + 1] = {}
                    local loc_vars = { scale = 1.2 }
                    localize { type = 'descriptions', key = key, set = 'Tabs', nodes = modNodes[#modNodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow }
                    modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                    modNodes[#modNodes].config.colour = loc_vars.background_colour or modNodes[#modNodes].config.colour
                end

                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = modNodes
                }
            end
       },
        {

            label = localize("k_mills_credits"),
            tab_definition_function = function()
                local modNodes = {}

                for _, key in ipairs({
            "mills_credits_cred",
            "mills_credits_dev",
            "mills_credits_art",
            "mills_credits_local",
                            }) do
                    modNodes[#modNodes + 1] = {}
                    local loc_vars = { scale = 1.2 }
                    localize { 
                        type = 'descriptions', 
                        key = key, 
                        set = 'Tabs', 
                        nodes = modNodes[#modNodes], 
                        vars = loc_vars.vars, 
                        scale = loc_vars.scale, 
                        text_colour = loc_vars.text_colour, 
                        shadow = loc_vars.shadow }
                    modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                    modNodes[#modNodes].config.colour = loc_vars.background_colour or modNodes[#modNodes].config.colour
                end

                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = modNodes
                }
            end
       }
    }
end
          


          
        