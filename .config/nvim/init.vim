" Plugins
call plug#begin()
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Lua Line
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" Navic indicator
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'

" File Explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

" Theme Config
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" Other config
set list
set listchars=tab:>-
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=0
set smarttab

" show relative line numbers
" set relativenumber
set number
" Highlight the current line
set cursorline
" do not wrap long lines
set nowrap

:luafile ~/.config/nvim/setup.lua
:NvimTreeOpen

