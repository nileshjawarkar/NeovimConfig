local M = {}

local function init_dap()
	local util = require('util')
	local config = require('core.config')
	local dap = require('dap')

	util.set_sign('DapBreakpoint', {text='*', texthl='', linehl='', numhl=''})
	util.set_sign('DapStopped', {text='>', texthl='', linehl='', numhl=''})

    util.exec_cmd({
		'command! DapToggleBreakpoint lua require"dap".toggle_breakpoint()',
    	'command! DapStart lua require"dap".continue()',
    	'command! DapContinue lua require"dap".continue()',
    	'command! DapStop lua require"dap".stop()',
    	'command! DapRestart lua require"dap".restart()',
    	'command! DapPause lua require"dap".pause()',
    	'command! DapStepOver lua require"dap".step_over()',
    	'command! DapStepOut lua require"dap".step_out()',
    	'command! DapStepInto lua require"dap".step_into()',
    	'command! DapToggleTray lua require"dapui".toggle("tray")',
	})

	local kop = {noremap = false, silent = true}
	util.map_gkey({
		{ 'n', "<Leader>dd", "<Cmd>DapToggleBreakpoint<CR>", kop}, -- Toggle breakpoint
		{ 'n', "<F5>", "<Cmd>DapStart<CR>", kop}, -- Start / continue
		{ 'n', "<Leader>ds", "<Cmd>DapStop<CR>", kop}, -- Stop
		{ 'n', "<Leader>dr", "<Cmd>DapRestart<CR>", kop}, -- Restart
		{ 'n', "<F8>", "<Cmd>DapStepOver<CR>", kop}, -- Step over
		{ 'n', "<F7>", "<Cmd>DapStepInto<CR>", kop}, -- Step into
		{ 'n', "<F9>", "<Cmd>DapStepOut<CR>", kop}, -- Step out
		{ 'n', "<Leader>dp", "<Cmd>DapPause<CR>", kop}, -- Pause
		{ 'n', "<Leader>dt", "<Cmd>DapToggleTray<CR>", kop}, -- Toggle repl
	})

	local py_path = config.get_rt_path('python')
	dap.adapters.python = {
	  type = 'executable',
	  command = py_path,
	  args = { '-m', 'debugpy.adapter' }
	}

	dap.configurations.python = {{
	    type = 'python';
	    request = 'launch';
	    name = "Launch file";
	    program = "${file}";
	    pythonPath = function()
			return py_path
	    end;
	}}

	require("dapui").setup({
		icons = {
			expanded = "▾",
			collapsed = "▸"
		},
		mappings = {
			-- Use a table to apply multiple mappings
			expand = {"<CR>", "<2-LeftMouse>"},
			open = "o",
			remove = "d",
			edit = "e",
		},
		sidebar = {
			open_on_start = true,
			elements = {
				-- You can change the order of elements in the sidebar
				"scopes",
				"stacks",
			},
			width = 38,
			position = "left" -- Can be "left" or "right"
		},
		tray = {
			open_on_start = false,
			elements = {
				"repl",
				"watches"
			},
			height = 10,
			position = "bottom" -- Can be "bottom" or "top"
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil   -- Floats will be treated as percentage of your screen.
		}
	})
end
M.init_dap = init_dap;
return M


