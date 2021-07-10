local function setup( on_attach_callback )
	-- packages
	local util = require('util')
	local lspconfig = require('lspconfig')

	-- variables
	local root_path = util.get_ls_path('lua')
	local system_name = util.get_os()
	local binary_path = root_path.."/bin/"..system_name.."/lua-language-server"

	local runtime_path = vim.split(package.path, ';')
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

    lspconfig['sumneko_lua'].setup({
		on_attach = on_attach_callback,
		cmd = {binary_path, "-E", root_path .. "/main.lua"},
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized 
				-- but unique identifier
				telemetry = {
					enable = false,
				}
			}
		}
		
	}) 

end

M = {
	setup = setup
}
return M

