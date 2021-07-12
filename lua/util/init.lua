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

local function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

local function loadModule(moduleName)
	if isModuleAvailable(moduleName) then
		return require(moduleName)
	end
	return nil
end


local function get_cwd()
	return vim.fn.getcwd()
end

local function get_env(var)
	return vim.fn.getenv(var)
end

local function get_cfgpath()
	return vim.fn.stdpath("config")
end

local function get_datapath()
	return vim.fn.stdpath("data")
end

local function get_userhome()
	local userhome = ''
	if userhome == '' then
		local user = vim.fn.expand('$USER')
		userhome = '/home/' .. user
	end
	return userhome
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
	get_userhome = get_userhome,
	get_os = get_os,
	get_cwd = get_cwd,
	get_env = get_env,
	get_cfgpath = get_cfgpath,
	get_datapath = get_datapath,
	loadModule = loadModule
}

return util

