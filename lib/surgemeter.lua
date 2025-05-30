-- Patch to override shop UI and insert a custom button
local old_shop = G.UIDEF.shop
function G.UIDEF.shop()
    local t = old_shop()

    local main_container = t.nodes[1].nodes[1] -- UIBox_dyn_container root
    local section_column = main_container.nodes[1].nodes[1] -- {n=G.UIT.C,...} that wraps the button rows
    local button_column = section_column.nodes[1] -- {n=G.UIT.R,...} that wraps next/reroll buttons
    local button_stack = button_column.nodes[1] -- {n=G.UIT.C,...} inside button_column

    -- Resize 'Next Round' and 'Reroll' buttons
    for _, node in ipairs(button_stack.nodes) do
        if node.config and node.config.id == 'next_round_button' then
            node.config.minw = 2.5
            node.config.minh = 1.2
        elseif node.config and node.config.button == 'reroll_shop' then
            node.config.minw = 2.5
            node.config.minh = 1.2
        end
    end

    -- Find index of reroll button
    local reroll_index = nil
    for i, node in ipairs(button_stack.nodes) do
        if node.config and node.config.button == 'reroll_shop' then
            reroll_index = i
            break
        end
    end

    -- Insert button directly under reroll
    if reroll_index then
        table.insert(button_stack.nodes, reroll_index + 1, {
            n=G.UIT.R,
            config={align = "cm", 
            minw = 2.5, 
            minh = 1.0, r=0.15, 
            colour = G.C.BLUE, 
            button = 'custom_shop_button',
            hover = true, 
            shadow = true},
            nodes = {
                {n=G.UIT.R, 
                config={align = "cm"}, 
                nodes={
                    {n=G.UIT.T, config={
                        text = 'Surge', 
                        scale = 0.4, 
                        colour = G.C.WHITE, 
                        shadow = true
                    }}
                }}
            }
        })
    end

      -- Surge button logic to open empty menu
    G.FUNCS.open_surge_menu = function()
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                G.OVERLAY_MENU = {
                    close = true,
                    UI = UIBox({
                        definition = {
                            n=G.UIT.ROOT,
                            config = {align = 'cm', colour = G.C.DYN_UI.MAIN, r = 0.1, padding = 0.15, emboss = 0.05},
                            nodes = {
                                {n=G.UIT.R, config = {
                                    align = "cm", 
                                    r=0.1, 
                                    colour = G.C.DYN_UI.DARK, 
                                    padding = 0.2, 
                                    minw = 5, 
                                    minh = 3}, 
                                    nodes = {
                                    {n=G.UIT.T, 
                                    config={
                                     text = 'Surge Menu', 
                                    colour = G.C.WHITE, 
                                    scale = 0.6, 
                                    shadow = true}}
                                }}
                            }
                        }
                    })
                }
                return true
            end
        }))
    end

    return t
end
