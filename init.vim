set number
set autoread

set clipboard=unnamedplus

autocmd TextChanged,TextChangedI <buffer> write
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

"nnoremap <C-e> :Eval<CR>
"nnoremap <C-d> :%Eval<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

map gn :bn<cr>
map gp :bp<cr>
map gx :BD<cr>
map gX :bd<cr>

"nnoremap <leader>d "_d
"xnoremap <leader>d "_d
"xnoremap <leader>p "_dP
map <Leader> <Plug>(easymotion-prefix)

map <Leader>. :call ClojureCommentUncomment()<CR>
function! ClojureCommentUncomment()
  let search_saved = @/
  if getline('.') =~ '^;'
    s/^;//  " remove ';' at beginning of line
  else
    s/^/;/  " insert ';' at beginning of line
  endif
  let @/ = search_saved
endfunction

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'qpkorr/vim-bufkill'
"Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
"Plug 'vim-scripts/AutoComplPop'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'stephpy/vim-yaml'
"Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'}
"Plug 'tpope/vim-classpath'
Plug 'eraserhd/parinfer-rust', {'do':
        \  'cargo build --release', 'for': 'clojure'}
"Plug 'mileszs/ack.vim'
Plug 'aklt/plantuml-syntax'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'vim-scripts/dbext.vim'
"Plug 'tpope/vim-rails'
"Plug 'ecomba/vim-ruby-refactoring'
"Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'Olical/conjure'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'ncm2/float-preview.nvim'
Plug 'bakpakin/fennel.vim'
"Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'bfontaine/zprint.vim'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'guns/vim-sexp', {'for': 'clojure'}
"Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'scrooloose/nerdtree'
Plug 'chase/vim-ansible-yaml'

" JS
" Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Go
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
call deoplete#custom#option('num_processes', 1)
set completeopt-=preview

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

let g:polyglot_disabled = ['clojure']

"vim-iced
"let g:iced_enable_default_key_mappings = v:true

"Gruvbox 
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
syntax enable
colorscheme gruvbox
set background=dark

"Airline
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1
let g:clojure_align_subforms = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^mlet', '^let*', '^when-let', '^loop', '^when', '^cond', '^as->', '^cond->', '^case', '^with-*', '^\.']
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,defservice,let'
syntax on

autocmd vimenter * NERDTree
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>
map <F2> :NERDTreeToggle<CR>
nnoremap <F5> :checktime<CR>
vmap <space> :s!^! !<CR>
nnoremap <Space> i<Space><Esc>
let maplocalleader="c"
