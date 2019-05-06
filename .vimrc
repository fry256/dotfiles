" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'blueshirts/darcula'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'lxhillwind/leader-clipboard'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'buoto/gotests-vim'
call plug#end()

syntax on
set number " show line numbers

highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" Colorscheme settings
set background=dark
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1
let g:lightline = {
      \ 'colorscheme': 'deepspace',
      \ }
"colorscheme darcula

" NerdTree settings
let NERDTreeShowHidden = 1 " show hidden files by default
let mapleader = ","
nmap <leader>ne :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

" Recursive search in current directory for matches with current word
nnoremap <Leader>f :<C-u>execute "Ack! " . expand("<cword>") <Bar> cw<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Ctrl+s
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

"Save and Close
nmap <leader>s <esc>:w<cr>
nmap <leader>q <esc>:q<cr>

" Tabs settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

" Search
set hlsearch
set ignorecase
set smartcase
nmap <silent> // :nohlsearch<CR>

" Vim-go settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave_enabled = ['vet']
let g:go_metalinter_autosave = 1
