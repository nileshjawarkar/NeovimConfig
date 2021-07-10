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
	"BufWritePost install.lua PackerCompile"
}, 'packerautocompile')

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    use {'joshdick/onedark.vim'}
    use {'itchyny/lightline.vim'}
    use {'preservim/nerdtree' }
	use {'mhinz/vim-startify'}
 	use { 'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		}
	}
	use { 'neovim/nvim-lspconfig',
		ft = { 'python', 'lua', 'html', 'css', 'json',
			'javascript', 'typescript', 'yaml', 'dockerfile', 'Dockerfile',
			'c', 'cpp', 'objc', 'objcpp', 'sh', 'zsh'
		},
		config = function()
			require('config.lsp')
		end
	}
	use { 'mfussenegger/nvim-jdtls'}
	use { 'hrsh7th/nvim-compe' }
	use { 'mfussenegger/nvim-dap'}
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
	use { 'vimwiki/vimwiki' }


--	require('util').exec_cmd({[[
--		augroup lsp
--		au!
--		au FileType java lua require('jdtls').start_or_attach({cmd = {'start_jdtls.sh'}})
--		augroup end
--	]]})

	local util = require('util')
	local jdtlspath = util.get_ls_path('jdtls') .. '/start_jdtls.sh'
	util.auto_attach({
		"java lua require('jdtls').start_or_attach({cmd = {'" .. jdtlspath .. "'}})"
	}, 'jdtls_lsp' )

end)
