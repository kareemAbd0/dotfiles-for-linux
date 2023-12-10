
require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use  "ellisonleao/gruvbox.nvim" 
   use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
   use  "nvim-tree/nvim-tree.lua" 
   use "nvim-tree/nvim-web-devicons"
   use "neovim/nvim-lspconfig"
    use 'hrsh7th/nvim-compe'
    use 'github/copilot.vim'
    use 'doums/darcula'
    -- Additional plugins for C/C++
     use 'dense-analysis/ale'
    use 'preservim/tagbar'
end)

--require("plugin_config.gruvbox")

--theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme darcula]])

--data types has no color I want fix 
vim.cmd([[highlight link TSKeyword Function]])
vim.cmd([[highlight link TSKeywordFunction Function]])
vim.cmd([[highlight link TSKeywordOperator Function]])
vim.cmd([[highlight link TSKeywordReturn Function]])
vim.cmd([[highlight link TSKeywordRepeat Function]])
vim.cmd([[highlight link TSKeywordCase Function]])
vim.cmd([[highlight link TSKeywordConstant Function]])
vim.cmd([[highlight link TSKeywordLabel Function]])

    
    
    
    
    
    
    






--require("plugin_config.nvim-tree")

--nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
vim.keymap.set('n','<c-n>', ':NvimTreeFindFileToggle<CR>')


vim.opt.clipboard = 'unnamedplus'



--treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp" ,"python"},
  highlight = {
    enable = true,              -- Enable Treesitter highlighting
  },
}


--lsp

require('lspconfig').clangd.setup{}

--remove this if you want to see the diagnostics (errors and warnings) in your code
vim.diagnostic.config({ 
  underline = false,
  virtual_text = false,
  signs = false,
  update_in_insert = false,

})


require('lspconfig').pyright.setup{}

--compe
require'compe'.setup {
  enabled = true,
  autocomplete = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
  },
}



vim.api.nvim_command 'let g:ale_linters = { "c": ["clang"] }'  

vim.api.nvim_command 'let g:tagbar_type_cpp = { "kinds": [ "m:members", "c:classes", "i:includes", "g:enums" ], "ctags_bin" : "clangd" }'


vim.api.nvim_command 'let g:ale_linters = { "python": ["pylint"] }'

vim.api.nvim_command 'let g:ale_enabled = 0 '


