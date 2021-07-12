local util = require('util')
local actions = require('telescope.actions')

util.map_gkey({
	{ 'n', '<leader><leader>', '<cmd>lua require("telescope.builtin").find_files()<cr>' },
	{ 'n', '<leader>/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>' },
	{ 'n', '<leader>.', '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
	{ 'n', '<leader>,', '<cmd>lua require("telescope.builtin").buffers()<cr>' },
	{ 'n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>' }
})

require('telescope').setup{
    defaults = {
		mappings = {
            i = {
                ["jk"] = actions.close,
            },
        },
		set_env = { ['COLORTERM'] = 'truecolor' }
    },

    pickers = {
        find_files = {
            previewer = false
        },

        buffers = {
            sort_lastused = true,
            previewer = false
        }
    }
}
