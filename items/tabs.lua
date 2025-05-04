SMODS.current_mod.extra_tabs = function()
    return {
        {
    label = localize("k_mills_instruction_glob"),
    tab_definition_function = function()
    local modNodes = {}

        for _, key in ipairs({ "mills_fusions_glob", "mills_fusions_glob_enh", "mills_fusions_glob_cons"}) do
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
    label = localize("k_mills_instruction_mod"),
    tab_definition_function = function()
    local modNodes = {}

    for _, key in ipairs({ "mills_fusions_enh", "mills_fusions_edi", "mills_fusions_seal"}) do
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
    label = localize("k_mills_instruction_cons"),
    tab_definition_function = function()
    local modNodes = {}

    for _, key in ipairs({ "mills_fusions_tarot", "mills_fusions_spec", "mills_fusions_snack", "mills_fusions_plan"}) do
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
    }
}
end
