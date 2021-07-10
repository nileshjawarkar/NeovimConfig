local util = require('util')

local on_attach_callback = function(_, bufnr)
    local opts = { noremap = true }

    util.map_bkey({
        -- code jumps
        { bufnr, 'n', 'gd', 	'<cmd>lua vim.lsp.buf.definition()<CR>', opts },
        { bufnr, 'n', 'gi', 	'<cmd>lua vim.lsp.buf.implementation()<CR>', opts },
        { bufnr, 'n', 'gr', 	'<cmd>lua vim.lsp.buf.references()<CR>', opts },
        { bufnr, 'n', 'gt', 	'<cmd>lua vim.lsp.buf.type_definition()<CR>', opts },
        { bufnr, 'n', 'K', 		'<cmd>lua vim.lsp.buf.hover()<CR>', opts },
        { bufnr, 'n', 'gD',		'<cmd>lua vim.lsp.buf.declaration()<CR>', opts },
        { bufnr, 'n', '<K>',	'<cmd>lua vim.lsp.buf.signature_help()<CR>', opts },

        -- error jumps
        { bufnr, 'n', '<leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts },
        { bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts },

        -- actions
        { bufnr, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts },
        { bufnr, 'n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts },
        { bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts },
        { bufnr, 'n', '<leader>o', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts },
    })

end


local lspconfig = require('lspconfig')
local rootPath = require('lspconfig/util').root_pattern( util.get_cwd() )

local pyrightpath = util.get_ls_path('pyright')
lspconfig['pyright'].setup ({
	on_attach = on_attach_callback,
	cmd = { 'node', pyrightpath .. '/lib/cli.js', '--stdio' },
    filetypes = {
		"python"
    },
	root_dir = rootPath
})


local tserverpath = util.get_ls_path('typescript-language-server')
lspconfig['tsserver'].setup({
	on_attach = on_attach_callback,
	cmd = { 'node', tserverpath .. '/lib/cli.js', '--stdio' },
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },
	root_dir = rootPath
})

local yamlpath = util.get_ls_path('yaml-language-server')
lspconfig['yamlls'].setup({
	on_attach = on_attach_callback,
	cmd = { 'node', yamlpath .. '/out/server/src/server.js', '--stdio' },
    filetypes = { "yaml" },
	root_dir = rootPath
})


local bashpath = util.get_ls_path('bash-language-server')
lspconfig['bashls'].setup({
	on_attach = on_attach_callback,
	cmd = { 'node', bashpath .. '/bin/main.js', 'start' },
    filetypes = { "sh", "zsh" },
	root_dir = rootPath
})

local dockerpath = util.get_ls_path('docker-language-server')
lspconfig['dockerls'].setup({
	on_attach = on_attach_callback,
	cmd = { 'node', dockerpath .. '/lib/server.js', '--stdio' },
    filetypes = { "Dockerfile", "dockerfile" },
	root_dir = rootPath
})

local clangdpath = util.get_ls_path('clangd')
lspconfig['clangd'].setup ({
	on_attach = on_attach_callback,
	cmd = { clangdpath .. "/bin/clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = rootPath
})
--[[
local jdtls_options = util.get_lsp_option('jdtls')
local jdtls_cmd = {
	util.get_rt_path('java'),
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.protocol=true",
	"-Dlog.level=ALL",
	"-Xms1g",
	"-Xmx2G",
	"-jar",
	jdtls_options['jar'],
	"-configuration",
	jdtls_options['config'],
	"-data",
	jdtls_options['workspace'],
	"--add-modules=ALL-SYSTEM",
	"--add-opens java.base/java.util=ALL-UNNAMED",
	"--add-opens java.base/java.lang=ALL-UNNAMED",
}

lspconfig['jdtls'].setup ({
	on_attach = on_attach_callback,
	cmd = jdtls_cmd,
    filetypes = { "java" },
	root_dir = rootPath
})
]]

require('config.lualang').setup( on_attach_callback )
require('config.css_html_json').setup( on_attach_callback )


