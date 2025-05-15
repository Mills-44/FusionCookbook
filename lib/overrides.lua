function snack_spawn(_key, _type)
if not G.GAME.first_shop_snack and not G.GAME.banned_keys['c_mills_bubblegum'] then
        G.GAME.first_shop_snack = true
        return G.P_CENTERS['c_mills_'..(math.random(1, #MILLS.SNACKS))]
    end
    local cume, it, center = 0, 0, nil
	local temp_in_pool = {}
    for k, v in ipairs(G.P_CENTER_POOLS['Snack']) do
		local add
		v.current_weight = v.get_weight and v:get_weight() or v.weight or 1
        if (not _type or _type == v.kind) then add = true end
		if v.in_pool and type(v.in_pool) == 'function' then
			local res, pool_opts = v:in_pool()
			pool_opts = pool_opts or {}
			add = res and (add or pool_opts.override_base_checks)
		end
		if add and not G.GAME.banned_keys[v.key] then cume = cume + (v.current_weight or 1); temp_in_pool[v.key] = true end
    end
    local poll = pseudorandom(pseudoseed((_key or 'consumable_generic')..G.GAME.round_resets.ante))*cume
    for k, v in ipairs(G.P_CENTER_POOLS['Snack']) do
        if temp_in_pool[v.key] then
            it = it + (v.current_weight or 1)
            if it >= poll and it - (v.current_weight or 1) <= poll then center = v; break end
        end
    end
   if not center then center = G.P_CENTERS['c_mills_bubblegum'] end  return center
end
