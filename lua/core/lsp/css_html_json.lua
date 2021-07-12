local function setup( on_attach_callback )
	local config = require('core.config')
	local lspconfig = require('lspconfig')

	local pkgPath = config.get_lsp_path('html')
	if pkgPath == nil then
		return
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig['cssls'].setup({
		on_attach = on_attach_callback,
		capabilities = capabilities,
		cmd = { 'node', pkgPath .. '/dist/css-language-server/node/cssServerMain.js', '--stdio' }
	})

    lspconfig['html'].setup({
		on_attach = on_attach_callback,
		capabilities = capabilities,
		cmd = { 'node', pkgPath .. '/dist/html-language-server/node/htmlServerMain.js', '--stdio' }
	})

    lspconfig['jsonls'].setup({
		on_attach = on_attach_callback,
		capabilities = capabilities,
		cmd = { 'node', pkgPath .. '/dist/json-language-server/node/jsonServerMain.js' , "--stdio"},
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
