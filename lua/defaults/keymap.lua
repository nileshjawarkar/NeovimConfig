local util = require('util')

local kop = {noremap = true, silent = true};

util.map_gkey({
	--[[
	#------------------------------------------------------------------------------#
	#                                    CONFIG                                    #
	#------------------------------------------------------------------------------#
	--]]
    -- reload nvim configuration file
    { 'n', ',r', ':luafile $MYVIMRC<cr>' },

    -- edit nvim configuration file
    { 'n', ',e', ':vsp $MYVIMRC<cr>' },


	--[[
	#------------------------------------------------------------------------------#
	#                                  CURSOR MOVE                                 #
	#------------------------------------------------------------------------------#
	--]]
    -- [ ctrl + h ] move cursor to left window
    { 'n', '<c-h>', '<c-w>h' },

    -- [ ctrl + l ] move cursor to right window
    { 'n', '<c-l>', '<c-w>l' },

    -- [ ctrl + j ] move cursor to bottom window
    { 'n', '<c-j>', '<c-w>j' },

    -- [ ctrl + k ] move cursor to top window
    { 'n', '<c-k>', '<c-w>k' },

	{ 'n', '<M-k>', ':resize -3<cr>', kop},
	{ 'n', '<M-j>', ':resize +3<cr>', kop},
	{ 'n', '<M-l>', ':vertical resize +3<cr>', kop},
	{ 'n', '<M-h>', ':vertical resize -3<cr>', kop},

	--[[
	#------------------------------------------------------------------------------#
	#                               BUFFER READ WRITE                              #
	#------------------------------------------------------------------------------#
	--]]
    -- [ ctrl + s ] save the current buffer
    { 'n', '<c-s>', ':w<cr>' },

    -- [ ctrl + q ] quite the current buffer
    { 'n', '<c-q>', ':bd<cr>' },


	--[[
	#------------------------------------------------------------------------------#
	#                                CUT COPY PASTE                                #
	#------------------------------------------------------------------------------#
	--]]
    -- [ Y ] copy until the end of the line
    { 'n', 'Y', 'y$' },

    -- [ ctrl + y ] copy current line and paste next line
    { 'n', '<c-y>', 'yyp' },

})

util.map_gkey({
	--[[
	#--------------------------------------------------------------------------------#
	#                          INDENTATION                                           #
	#--------------------------------------------------------------------------------#
	--]]
	{ 'v', '<', '<gv', kop},
	{ 'v', '>', '>gv', kop}
})

util.map_gkey({

	--[[
	#------------------------------------------------------------------------------#
	#                                  CURSOR MOVE                                 #
	#------------------------------------------------------------------------------#
	--]]
    -- [ ctrl + ; ] put a semicolon EOL and go to next line
    { 'i', '<c-;>', '<esc>A;' },

	-- [ ctrl + o ] add new line in insert mode
    { 'i', '<c-o>', '<esc>o' },

    -- [ ctrl + e ] go to end of the line
    { 'i', '<c-e>', '<esc>A' },

    -- [ ctrl + a ] go to beginning of the line
    { 'i', '<c-a>', '<esc>I' },


	--[[
	#------------------------------------------------------------------------------#
	#                                CUT COPY PASTE                                #
	#------------------------------------------------------------------------------#
	--]]
    -- [ ctrl + y ] copy current line and paste next line
    { 'i', '<c-y>', '<esc>yyp' },

    -- [ ctrl + s ] save the current buffer
    { 'i', '<c-s>', '<esc>:w<cr>a' },


	--[[
	#------------------------------------------------------------------------------#
	#                                     OTHER                                    #
	#------------------------------------------------------------------------------#
	--]]
	-- [ ctrl + d ] deletes a character in front of the cursor
    { 'i', '<c-d>', '<delete>' },
})

util.map_gkey({

	--[[
	#------------------------------------------------------------------------------#
	#                                    TERMINAL                                  #
	#------------------------------------------------------------------------------#
	--]]
	{ 't', '<esc>', [[<c-\><c-n>]], {} },

	-- [ ctrl + k ] to change the window from terminal
	{ 't', '<c-k>', [[<c-\><c-n><c-w>k]], {} },

    -- [ ctrl + j ] move cursor to bottom window from terminal
	{ 't', '<c-j>', [[<c-\><c-n><c-w>j]], {} },

    -- [ ctrl + h ] move cursor to left window from terminal
	{ 't', '<c-j>', [[<c-\><c-n><c-w>h]], {} },

    -- [ ctrl + l ] move cursor to right window from terminal
	{ 't', '<c-j>', [[<c-\><c-n><c-w>l]], {} },
})


util.map_gkey({

	--[[
	#------------------------------------------------------------------------------#
	#                                     OTHER                                    #
	#------------------------------------------------------------------------------#
	--]]

    -- [ <F6> ] to go enable spell checker
    { '', '<F6>', ':setlocal spell! spelllang=en_us<cr>', kop },
})
