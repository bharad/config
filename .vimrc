"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author:
"   Bharad Narayanan
"
" Sections:
"   => No name :/
"   => Colors and Fonts
"   => Text, Tab, Whitespace and indent related
"   => VIM user interface
"   => Status Line
"   => Helper Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set softtabstop=2
set number

" Leader is , and not the default \
let mapleader = ","

""""""
" => VUNDLE
""""""
"set Runtime path to inc vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
"this is the call to begin the vundle plugin operation
call vundle#begin()
  Plugin 'gmarik/vundle.vim'
  Plugin 'derekwyatt/vim-scala'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()

" Autocomplete settings for ruby
autocmd FileType ruby set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

":autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" NERDTree settings (launch with \nt or \\)
let g:NERDTreeQuitOnOpen = 1
nmap <silent> <leader>nt <Esc>:NERDTreeToggle<CR>
nmap <silent> <leader>, <Esc>:NERDTreeToggle<CR>

" Next Tab settings (launch with ctrl tab)
nmap <C-Tab> <ESC>:tabnext<CR>
nmap <C-S-Tab> <ESC>:tabprevious<CR>

" BufferExplorer Shortcut
nmap <silent> <leader>b <ESC>:BufExplorer<CR>

" git grep
nnoremap <silent> <Leader>a :!git-grep --color <cword><CR>

" Format JSON document inside vim
" nmap <silent> <Leader>j <ESC>:!python -m json.tool<CR>
nmap <leader>j <ESC>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

"""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""
" Enable Syntax highlighting
syntax on

colorscheme vividchalk
set background=dark
set t_Co=256
" colorscheme anotherdark

set guifont=Monaco:h12

"""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tab, Whitespace and indent related
"""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set autoindent
set smartindent
set wrap

" The next 2 lines shows up extra white spaces as dots. 
" This way there would be no hidden white space that I would miss
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:%

"""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

"""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set ls=2

" Status Line colors
hi StatusLine guibg=darkgreen ctermbg=darkgreen
hi StatusLine guifg=white ctermfg=white

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
    return ''
endfunction

