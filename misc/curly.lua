---@diagnostic disable: duplicate-index

--Curly go boioioing

SMODS.DrawStep({
key = "floaty_sprite",
order = 59,
func = function(self)
    if self.ability.name == "j_mills_curly" and (self.config.center.discovered or self.bypass_discovery_center) then
        local scale_mod = 0.05 + 0.05*math.sin(1.8*G.TIMERS.REAL) + 0.03*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*11)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
        local rotate_mod = 0.1*math.sin(1.219*G.TIMERS.REAL) + 0.07*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2

        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
        self.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
    end
end
})

-- card itself

SMODS.Joker {
    key = 'curly',
    config = {},
    rarity = 3,
    atlas = 'joker',
    in_pool = function(self, args) 
        return false
      end,
    pos = { x = 3, y = 0 },
    cost = 5,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
    end
}