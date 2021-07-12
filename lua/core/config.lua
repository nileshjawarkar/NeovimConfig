local util = require('util')

local inst_paths = {}
local lsp_options = {}
local lsp_paths = {}


local function get_rt_path( rt )
	return inst_paths[ rt ]
end

local function get_lsp_option( op )
	return lsp_options[ op ]
end

local function get_lsp_path( lang )
	return lsp_paths[ lang ]
end

local function set_paths( paths, target )
	if target == nil or 
		type( target ) ~= 'table' or
		type( paths ) ~= 'table' then
		return
	end

	for _, pt in ipairs( paths ) do
		if type( pt ) == 'table' then
			local lang = pt[1]
			local path = pt[2]
			target[ lang ] = path
		end
	end
end

local function set_lsp_paths( paths )
	set_paths( paths, lsp_paths )
	if nil ~= lsp_paths["java"] then
		lsp_options.jdtls = {}
		lsp_options.jdtls.jar = lsp_paths.java .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
		lsp_options.jdtls.config = lsp_paths.java .. "/jdtls/config_linux"
		lsp_options.jdtls.workspace = util.get_cwd()
	end
end

local function set_rt_paths( paths )
	set_paths( paths, inst_paths )
end

local function get_dic_len( dic )
	local count = 0
	for _ in pairs( dic ) do count = count + 1 end
	return count
end

local lsp_status = -1 
local function lsp_required()
	if lsp_status == -1 then
		local len = get_dic_len( lsp_paths )
		if len > 0 then 
			lsp_status = 1
		else
			lsp_status = 0
		end
	end
	if lsp_status == 1 then
		return true
	end
	return false
end


local m = {
	get_lsp_option = get_lsp_option,
	set_lsp_paths = set_lsp_paths,
	get_lsp_path = get_lsp_path,
	set_rt_paths = set_rt_paths,
	get_rt_path = get_rt_path,
	lsp_required = lsp_required
}

return m
