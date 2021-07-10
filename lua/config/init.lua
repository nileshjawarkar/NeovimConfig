local util = require('util')

-- For theme
util.exec_cmd({
	[[
		if (empty($TMUX))
		  if (has("nvim"))
		    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
		  endif
		  if (has("termguicolors"))
		    set termguicolors
		  endif
		endif
	]],
	'colorscheme onedark'
})


local startifyop = vim.api.nvim_eval(
		"[{ 'type': 'sessions',  'header': ['   Sessions'] }, { 'type': 'bookmarks', 'header': ['   Bookmarks'] }, { 'type': 'commands',  'header': ['   Commands']  }]"
)

util.set_gvar({
	lightline = { colorscheme = 'onedark' },
	onedark_termcolors = 256,
	-- For Startify
	startify_lists = startifyop,
	-- For vimwiki
	vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}
})

local kop = {noremap = false, silent = true}
util.map_gkey({
	-- For Startify
	{ 'n', '<M-0>', ':Startify<CR>', kop },
	-- For NERD Tree
	{ 'n', '<c-n>', ':NERDTreeToggle<CR>', kop },
    { 'n', '<c-f>', ':NERDTreeFind<CR>', kop },
	-- For vimwiki
	{ 'n', '<Leader>w', ':VimwikiIndex<CR>', kop },
    { 'n', '<Leader>wi', ':VimwikiDiaryIndex<CR>', kop }
})

require('config.compe')
require('config.telescope')

local debugger = require('config.debugger')
debugger.init_dap()
