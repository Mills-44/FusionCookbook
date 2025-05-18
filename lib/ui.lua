-- Create config UI
SMODS.current_mod.config_tab = function()
    return {
      n = G.UIT.ROOT,
      config = { align = 'cm', padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
      nodes = {
        {
          n = G.UIT.R,
          config = { align = 'cm', minh = 1 },
          nodes = {
            { n = G.UIT.T, config = { text = localize('mills_ui_requires_restart'), colour = G.C.RED, scale = 0.5 } }
          }
        },
        {
          n = G.UIT.R,
          nodes = {
            {
              n = G.UIT.C,
              nodes = {
                --Another Day
               -- create_toggle {
                --  label = localize('mills_ui_enable_tags'),
                --  ref_table = PB_UTIL.config,
               --   ref_value = 'tags_enabled'
               -- },
                create_toggle {
                  label = localize('mills_ui_enable_jokers'),
                  ref_table = MILLS.config,
                  ref_value = 'jokers_enabled',
                },
                --Another Day
               -- create_toggle {
               --  label = localize('mills_ui_enable_vouchers'),
                -- ref_table = PB_UTIL.config,
                -- ref_value = 'vouchers_enabled'
                },
              }
            },
            {
              n = G.UIT.C,
              nodes = {
                --create_toggle {
                 -- label = localize('mills_ui_enable_editions'),
                 -- ref_table = PB_UTIL.config,
                 -- ref_value = 'editions_enabled'
                --},
                create_toggle {
                  label = localize('mills_ui_enable_enhancements'),
                  ref_table = MILLS.config,
                  ref_value = 'enhancements_enabled',
                },
                }
              }
            }
          }
        }
  end
  
  -- Create Credits tab in our mod UI

  SMODS.current_mod.extra_tabs = function()
    return {
        {
    label = localize('mills_instruction_glob'),
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
    label = localize("k_mills_instruction_cred"),
    tab_definition_function = function()
    local modNodes = {}

    for _, key in ipairs({ "mills_fusions_cred"}) do
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
      label = localize('k_mills_instruction_cons'),
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

  function MILLS.suit_tooltip(type)
    local suits = type == 'light' and MILLS.light_suits or MILLS.dark_suits
    local key = 'mills_' .. type .. '_suits'
    local colours = {}
  
    -- If any modded suits were loaded, we need to dynamically
    -- add them to the localization table
    if #suits > 2 then
      local text = {}
      local line = ""
      local text_parsed = {}
  
      for i = 1, #suits do
        local suit = suits[i]
  
        colours[#colours + 1] = G.C.SUITS[suit] or G.C.IMPORTANT
        line = line .. "{V:" .. i .. "}" .. localize(suit, 'suits_plural') .. "{}"
  
        if i < #suits then
          line = line .. ", "
        end
  
        if #line > 30 then
          text[#text + 1] = line
          line = ""
        end
      end
  
      if #line > 0 then
        text[#text + 1] = line
      end
  
      for _, v in ipairs(text) do
        text_parsed[#text_parsed + 1] = loc_parse_string(v)
      end
  
      G.localization.descriptions.Other[key].text = text
      G.localization.descriptions.Other[key].text_parsed = text_parsed
    end
  
    return {
      set = 'Other',
      key = key,
      vars = {
        colours = colours
      }
    }
  end
