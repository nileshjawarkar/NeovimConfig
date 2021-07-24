local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  compile_path = require("packer.util").join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.vim'),
  git = {
    clone_timeout = 300
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

require('util').auto_cmds({
 	"BufWritePost plugins.lua PackerCompile"
}, 'packerautocompile')

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {'joshdick/onedark.vim'}
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

    use {'preservim/nerdtree' }
	use {'mhinz/vim-startify'}
	use { 'vimwiki/vimwiki' }
 	use { 'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		}
	}
	use { 'hrsh7th/nvim-compe' }

	-- debugger configuration
	use { 'mfussenegger/nvim-dap'}
	use { "rcarriga/nvim-dap-ui",
		requires = {"mfussenegger/nvim-dap"}
	}

	-- lsp configuration
	local config = require('core.config')
	if true == config.lsp_required() then
		use { 'neovim/nvim-lspconfig',
			ft = { 'python', 'lua', 'html', 'css', 'json',
				'javascript', 'typescript', 'yaml', 'dockerfile', 'Dockerfile',
				'c', 'cpp', 'objc', 'objcpp', 'sh', 'zsh'
			},
			config = function()
				require('core.lsp').setup()
			end
		}

		local util = require('util')
		local jdtlspath = config.get_lsp_path('java')
		if jdtlspath ~= nil then
			use { 'mfussenegger/nvim-jdtls'}
			jdtlspath = jdtlspath .. '/start_jdtls.sh'
			util.auto_attach({
				"java lua require('jdtls').start_or_attach({cmd = {'" .. jdtlspath .. "'}})"
			}, 'grp_lsp_jdtls' )
		end
	end
end)

