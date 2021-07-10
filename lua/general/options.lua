local util = require("util")

util.set_gop({
	cmdheight = 2,
	-- set the tab size to length of 4 spaces
	-- shiftwidth set the indentation length
    tabstop = 4,
    shiftwidth = 4,

	-- remove highlighting after search is done
	hlsearch = false,

	-- auto code folding when openeing new file at level 1
	foldlevelstart = 4,

	-- auto wrap after 80 characters in the line
	textwidth = 110,

	-- 'backup' 'writebackup'	action	~
	-- off	     off	no backup made
	-- off	     on		backup current file, deleted afterwards (default)
	-- on	     off	delete old backup, backup current file
	-- on	     on		delete old backup, backup current file
	backup = false,
	writebackup = true,
	swapfile = false,

    -- write changes to swap file after "n" ms
	-- for some reason when the updatetime is high, autocompletion in coc nvim
	-- takes a long time
	updatetime = 300,

	-- controls how short messages are displayed in status bar section
	shortmess = vim.o.shortmess .. 'c',

    -- open completion menu even for single item
	-- do not auto insert items from completion menu
	-- @warning - preview is removed. when it's on, default lsp opens a vertical tab
	completeopt = 'menuone,noinsert',

	-- stop showing the current mode
	showmode = false,
	-- stop showing the current line and cursor position in the status bar
	ruler = false,

	-- set the font for GUI clients like neovide
	guifont='Cascadia Code, FiraCode, Nerd Font',

	-- highlight the current cursor line.
	cursorline = true,

	smartcase = true,
	ignorecase = true,

	-- shows the effects of a command incrementally
	inccommand = 'nosplit',

	-- where to place the new split windows
	splitright = true,
	splitbelow = true,

	-- hide unsaved file when closing the buffer
	-- usually vim doesn't allow closing unsaved buffer unless you force it
	-- but with hidden option, buffer will be hidden when you close it
	-- vim will prompt you to save when closing vim editor
	hidden = true,

	background = 'dark',
	termguicolors = true,

	-- assign unnamedplus register to clipboard
	-- anything in the clipboard can be pasted directly
	-- any yanked text will be copied to clipboard
	clipboard ='unnamedplus'

})


util.set_wop({
	-- shows the number bar in left hand side of the window
    number = true,

	-- shows numbers relative to the current cursor position
    relativenumber = true,

	-- code folding method to syntax
	-- common methods will be used such as curly braces 
    -- foldmethod = 'syntax',

	-- error signs and warnings will be displayed in the number line
	-- usually it adds new column when signs, moving buffer to right side.
	-- adding a column create weird effect that's little bit hard for the eye
	signcolumn = 'number',

	-- vim try to keep 100 lines below and above when scrolling
	-- if buffer cannot display more than 200 lines, cursor will stay in center
	-- and scroll the buffer
	scrolloff=15

})

util.set_bop({

	-- set the tab size to length of 4 spaces
	-- shiftwidth set the indentation length
    shiftwidth = 4,
})
