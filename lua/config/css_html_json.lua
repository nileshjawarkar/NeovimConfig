local function setup( on_attach_callback )
	local util = require('util')
	local lspconfig = require('lspconfig')

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local vscode_ls = util.get_ls_path('vscode-langservers-extracted')

    lspconfig['cssls'].setup({
		on_attach = on_attach_callback,
		capabilities = capabilities,
		cmd = { 'node', vscode_ls .. '/dist/css-language-server/node/cssServerMain.js', '--stdio' }
	})

    lspconfig['html'].setup({
		on_attach = on_attach_callback,
		capabilities = capabilities,
		cmd = { 'node', vscode_ls .. '/dist/html-language-server/node/htmlServerMain.js', '--stdio' }
	})

    lspconfig['jsonls'].setup({
		on_attach = on_attach_callback,
		capabilities = capabilities,
		cmd = { 'node', vscode_ls .. '/dist/json-language-server/node/jsonServerMain.js' , "--stdio"},
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
				end
			}
		}
	})
end

M = {
	setup = setup
}

return M
