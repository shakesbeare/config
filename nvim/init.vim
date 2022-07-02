" --- NEOVIM OPTIONS
set noshowmode
set nocompatible
set showmatch
set autoindent
set smartindent
set wildmenu
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set ttyfast
set cursorline
set timeoutlen=500
set hidden
" --- LOAD PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'windwp/nvim-autopairs'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'liuchengxu/vim-which-key'
Plug 'connorholyday/vim-snazzy'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'RRethy/vim-illuminate'
call plug#end()


" --- PLUGIN SETUP
" IMPORTANT: This stuff has to be *after* plug#end is called!
lua << EOF
require('nvim-autopairs').setup {}
require('toggleterm').setup {
    size = 15,
    direction = horizontal,
    open_mapping = [[<C-t>]],
    hide_numebers = true,
    close_on_exit = true,
}
require('nvim-tree').setup()
require('bufferline').setup()
EOF

" --- THEMES AND COLORS
colorscheme snazzy
:highlight Comment ctermfg=green
let g:lightline = {'colorscheme': 'snazzy'}
" --- KEY MAPPINGS
let mapleader = "\<Space>"

nnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
nnoremap H <cmd>tabp<cr>
nnoremap L <cmd> tabn<cr>
" --- WHICH KEY DICTIONARY
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {
            \ 'c': [':bd', 'Close Buffer'],
            \ 'e': [':NvimTreeFocus', 'Toggle Directory Tree'],
            \}
let g:which_key_map['s'] = {
            \ 'name': 'Search',
            \ 'f': [':Telescope find_files', 'Find Files (Telescope)'],
            \ }
let g:which_key_map['O'] = {
            \'name': 'Options',
            \'c': [':tabe ~/.config/nvim/init.vim', 'Open Neovim Configuration']
            \}
" --- AUTO COMMANDS
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
