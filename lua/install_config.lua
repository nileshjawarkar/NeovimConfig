local util = require('util')

local inst_path = {}
local lsp_options = {}
local function init_config()
	local home = util.get_userhome()
	lsp_options.jdtls = {}
	lsp_options.jdtls.jar = home .. "/.local/lsp/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
	lsp_options.jdtls.config = home .. "/.local/lsp/jdtls/config_linux"
	lsp_options.jdtls.workspace = util.get_cwd()

	inst_path.python = "/usr/bin/python3"
	inst_path.java = home .. "/.local/jdk11/bin/java"
end

init_config()

local function get_rt_path( rt )
	return inst_path[ rt ]
end

local function get_lsp_option( op )
	return lsp_options[ op ]
end

local function get_lsp_path( rt )
	local home = util.get_userhome()
	if rt == 'lua' then
		return home .. '/.local/lsp/lua-language-server'
	end

	if rt == 'clangd' then
		return home .. '/.local/lsp/clangd'
	end

	if rt == 'jdtls' then
		return home .. '/.local/lsp'
	end

	local yarn_bin = home .. '/.config/nvim/yarn_lsp'
	if rt == 'pyright' then
		return yarn_bin .. '/node_modules/pyright'
	end

	if rt == 'typescript-language-server' then
		return yarn_bin .. '/node_modules/typescript-language-server'
	end

	if rt == 'vscode-langservers-extracted' then
		return yarn_bin .. '/node_modules/vscode-langservers-extracted'
	end

	if rt == 'yaml-language-server' then
		return yarn_bin .. '/node_modules/yaml-language-server'
	end

	if rt == 'bash-language-server' then
		return yarn_bin .. '/node_modules/bash-language-server'
	end

	if rt == 'docker-language-server' then
		return yarn_bin .. '/node_modules/dockerfile-language-server-nodejs'
	end
	return ''
end

local m = {
	get_lsp_option = get_lsp_option,
	get_lsp_path = get_lsp_path,
	get_rt_path = get_rt_path
}

return m
