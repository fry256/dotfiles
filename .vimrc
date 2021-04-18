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
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
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

" Map commentary
xmap <leader>c <Plug>Commentary

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Fix vue files highlighting 
autocmd FileType vue syntax sync fromstart

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_debug_windows = {
      \ 'vars':  'leftabove 35vnew',
      \ 'stack': 'botright 10new',
\ }

let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 0

let g:go_autodetect_gopath = 1
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'errcheck']

let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

" Vim-go settings
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_fmt_command = "goimports"
" let g:go_metalinter_enabled = ['vet', 'errcheck'] ", 'errcheck', 'deadcode', 'gosec', 'staticcheck'
" let g:go_metalinter_autosave_enabled = ['vet', 'errcheck'] ", 'errcheck', 'deadcode', 'gosec', 'staticcheck'
" let g:go_list_type = 'quickfix'
" let g:go_metalinter_autosave = 1
" command debug:
" let g:go_debug=['shell-commands', 'lsp']
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_guru_scope = []

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 1
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Enable deoplete at startup
" let g:deoplete#enable_at_startup = 1
" let g:yats_host_keyword = 1
" set re=0
