

require('packer').startup(function(use)

   use 'wbthomason/packer.nvim'
   use  "ellisonleao/gruvbox.nvim" 
   use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
   use  "nvim-tree/nvim-tree.lua" 
   use "nvim-tree/nvim-web-devicons"
   use "neovim/nvim-lspconfig"
    use 'hrsh7th/nvim-compe'
    use 'github/copilot.vim'
--    use 'doums/darcula' 
      use 'rebelot/kanagawa.nvim'
      use 'xiyaowong/transparent.nvim'
    -- Additional plugins for C/C++
     use 'dense-analysis/ale'
    use 'preservim/tagbar'
    use 'psliwka/vim-smoothie'
    end)


--require("plugin_config.gruvbox")

--theme
vim.background = "dark" -- or "light" for light mode
 vim.cmd("colorscheme kanagawa")
   
     
      



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
  update_cwd = true,

update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

disable_netrw = true,
    hijack_netrw = true,
   open_on_tab = false,
    hijack_cursor = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
})
vim.keymap.set('n','<c-n>', ':NvimTreeFindFileToggle<CR>')
-- vim.keymap.set('n','<c-N>', ':NvimTreeFindFileFocus<CR>')

-- Set g:nvim_tree_auto_cd to 1
vim.g.nvim_tree_auto_cd = 1

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
  min_length = 1,

  source = {
    path = true,
    nvim_lsp = true,
    buffer = true,
  },
}



vim.api.nvim_command 'let g:ale_linters = { "c": ["clang"] }'  

vim.api.nvim_command 'let g:tagbar_type_cpp = { "kinds": [ "m:members", "c:classes", "i:includes", "g:enums" ], "ctags_bin" : "clangd" }'


vim.api.nvim_command 'let g:ale_linters = { "python": ["pylint"] }'

vim.api.nvim_command 'let g:ale_enabled = 1 '


vim.api.nvim_command 'set number'

--change cursor shape in insert mode to be a vertical line
vim.api.nvim_command("let &t_SI = '\27[6 q'")
--change cursor shape in normal mode to be a block

vim.api.nvim_command("let &t_SR = '\27[2 q'")
