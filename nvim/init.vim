" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

"Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Initialize pluugin system
call plug#end()

"Editor settings
set number 	   "add line numbers"

" Set leader to Space
let mapleader="\<Space>"

"Fuzzy finder keymap
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
