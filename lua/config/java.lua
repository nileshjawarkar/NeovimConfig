
local util = require('util')
local opts = { noremap = true }

--[[
nnoremap <A-CR> <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <A-CR> <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>r <Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>

nnoremap <A-o> <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap crv <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap crv <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap crc <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap crc <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap crm <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>

    util.map_bkey({
        { 'n', 'gd', 	'<cmd>lua vim.lsp.buf.definition()<CR>', opts },
        { 'n', 'gi', 	'<cmd>lua vim.lsp.buf.implementation()<CR>', opts },
        { 'n', 'gr', 	'<cmd>lua vim.lsp.buf.references()<CR>', opts },
        { 'n', 'gt', 	'<cmd>lua vim.lsp.buf.type_definition()<CR>', opts },
        { 'n', 'K', 		'<cmd>lua vim.lsp.buf.hover()<CR>', opts },
        { 'n', 'gD',		'<cmd>lua vim.lsp.buf.declaration()<CR>', opts },
        { 'n', '<K>',	'<cmd>lua vim.lsp.buf.signature_help()<CR>', opts },

        { 'n', '<leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts },
        { 'n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts },

        { 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts },
        { 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts },
        { 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts },
        { 'n', '<leader>o', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts },
    })
]]

require('jdtls').start_or_attach({cmd = { util.get_ls_path('jdtls') .. '/start_jdtls.sh'}})
