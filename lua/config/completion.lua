local util = require('util')

util.set_gvar({
	completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy', 'all' },
	completion_matching_ignore_case = true,
	completion_matching_smart_case = true,
	completion_trigger_character = { '.' },
	completion_timer_cycle = 30
})

local function on_attach(bufnr)
    util.map_bkey({
		{ bufnr, 'i', '<C-space>', [[<plug>(completion_trigger)]] },
	})
end

return {
	on_attach = on_attach
}

