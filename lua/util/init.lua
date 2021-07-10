local function getCommand()
    local Command = {}
    Command.cmd = function(commands)
	    for _, value in ipairs(commands) do
		    vim.cmd(value)
	    end
    end

	Command.autocmds = function( commands, grpname )
		vim.cmd('augroup ' .. grpname)
		vim.cmd('autocmd!')
		for _, value in  ipairs(commands) do
			vim.cmd( 'autocmd ' .. value )
		end
		vim.cmd('augroup END')
	end

	Command.autoattach = function( commands, grpname )
		vim.cmd('augroup ' .. grpname)
		vim.cmd('au!')
		for _, value in  ipairs(commands) do
			vim.cmd( 'au FileType ' .. value )
		end
		vim.cmd('augroup END')
	end
    return Command
end

local function get_cwd()
	return vim.fn.getcwd()
end

local function get_env(var)
	return vim.fn.getenv(var)
end

local function get_userhome()
	local userhome = ''
	if userhome == '' then
		local user = vim.fn.expand('$USER')
		userhome = '/home/' .. user
	end
	return userhome
end


local inst_path = {}
local lsp_options = {}
local function init_config()
	local home = get_userhome()
	lsp_options.jdtls = {}
	lsp_options.jdtls.jar = home .. "/.local/lsp/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
	lsp_options.jdtls.config = home .. "/.local/lsp/jdtls/config_linux"
	lsp_options.jdtls.workspace = get_cwd()

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

local function get_ls_path( rt )
	local home = get_userhome()
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

local function get_os()
	local os = ''
	if os == '' then
		if vim.fn.has("mac") == 1 then
		  os = "macOS"
		elseif vim.fn.has("unix") == 1 then
		  os = "Linux"
		elseif vim.fn.has('win32') == 1 then
		  os = "Windows"
		end
	end
	return os
end

local function set_sign(...)
	vim.fn.sign_define(...)
end

local command = getCommand()
local option = require('util.option')
local keybind = require('util.keybind')
local variable = require('util.variable')

local util = {
	-- Wrapper funcions
	set_gvar = variable.g,
	set_wvar = variable.w,
	set_bvar = variable.b,
	set_tvar = variable.t,
	set_vvar = variable.v,
	set_gop = option.g,
	set_wop = option.w,
	set_bop = option.b,
    map_gkey = keybind.g,
    map_bkey = keybind.b,
    exec_cmd = command.cmd,
	auto_cmds = command.autocmds,
	auto_attach = command.autoattach,

	-- Util function
	set_sign = set_sign,
	get_rt_path = get_rt_path,
	get_ls_path = get_ls_path,
	get_userhome = get_userhome,
	get_os = get_os,
	get_cwd = get_cwd,
	get_env = get_env,
	get_lsp_option = get_lsp_option
}

return util

