" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'airblade/vim-gitgutter'

" Fast search of file
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP support
Plug 'prabirshrestha/vim-lsp'

"Linting
Plug 'dense-analysis/ale'

"Elixir support
Plug 'elixir-editors/vim-elixir'

" Initialize plugin system
call plug#end()

"Colors settings
let g:github_colors_block_diffmark = 0

colorscheme palenight
let g:airline_theme = "palenight"

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

"Editor settings
syntax on               "Enable syntax highlighting
filetype on             "Enable type file detection
filetype plugin on      "Enable plugins for the detected file type
set noswapfile          "Disabling swap file

set number              "add line number
set tabstop=2           "set the size of a TAB as 2 spaces
set softtabstop=2       "set the number of colums for a TAB
set shiftwidth=2        "redefine indent size to be 2 spaces
set expandtab           "Use space characters instead of tabs
set autoindent
set nobackup            "Do not save backup files
set cursorline          "highlight the current line

set wildmenu
set wildmode=longest:list,full       "show the list of commands
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×   "Display invalid characters

set hlsearch            "Highligh when doing search
set incsearch           "Highligh matching characeters as you type in the search
set ignorecase          "Ignore capital letters during search



set encoding=utf-8
set et

"Set the leader key to Space
let mapleader="\<Space>"

"Set background transparent
hi Normal guibg=NONE ctermbg=NONE

"Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"FZF settings
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>


"ALE linting settings
let g:ale_linters = {
\  'elixir': ['elixir-ls'],
\  'javascript': ['eslint']
\}

let g:ale_fixers = {
\  'elixir': ['mix_format']
\}

let g:ale_elixir_elixir_ls_release = expand("/Users/samuelmanzanera/Documents/code/elixir/elixir-ls/rel")

let g:ale_completetion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_linkt_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
set completeopt=menu,menuone,preview,noselect,noinsert

"Autocompletion settings with TAB
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
