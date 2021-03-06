local function init_config()
	local config = require('core.config')
	local util = require('util')
	local vim_config = util.get_cfgpath()
	local yarn_bin = vim_config .. '/yarn_lsp'
	config.set_lsp_paths({
		{"python", yarn_bin .. '/node_modules/pyright'},
		{"javascript", yarn_bin .. '/node_modules/typescript-language-server'},
		{"html", yarn_bin .. '/node_modules/vscode-langservers-extracted'},
		{"css", yarn_bin .. '/node_modules/vscode-langservers-extracted'},
		{"json", yarn_bin .. '/node_modules/vscode-langservers-extracted'},
		{"yaml", yarn_bin .. '/node_modules/yaml-language-server'},
		{"sh", yarn_bin .. '/node_modules/bash-language-server'},
		{"docker", yarn_bin .. '/node_modules/dockerfile-language-server-nodejs'}
	})

	config.set_rt_paths({
		{"python", "python3"},
		{"java", "java"}
	})
end

local init_done = false
if init_done == false then
	init_done = true
	init_config()
end

local m = {
	init_config = init_config
}
return m
