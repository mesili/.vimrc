set encoding=utf-8

" System clipboard
set clipboard=unnamedplus

" Dropdownmenu like autocomplete
set wildmenu

" Search also into subfolders 
set path+=**
set relativenumber
set nocompatible   " Disable vi-compatibility

" Colors 
let g:solarized_termcolors=256
set t_Co=256
colorscheme gruvbox
set background=dark

set cursorline 

set showmode                    " always show what mode we're currently editing in
set tags=tags

set tabstop=4    " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.

set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab

set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on

set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,

set visualbell           " don't beep
set noerrorbells         " don't beep

set list
set listchars=tab:>-
set mouse=a

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<cr>

" Splits Navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Splits creation
"set splitbelow
"set splitright

nmap <F7> :TagbarToggle<CR>

nnoremap ; :
"Show (partial) command in the status line
set showcmd

set backupdir=~/.vim/cache/backup/
set directory=~/.vim/cache/swap/

filetype plugin on
syntax on

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>
au BufNewFile,BufRead *.sol set filetype=solidity

" Generate PDF from markdown files (custom node app using md-to-pdf)
function GeneratePdfFromMarkdown()
    write
    silent execute "!md-to-pdf -i % -o %:r.pdf"
    redraw!
endfunction
command MarkdownPdf :call GeneratePdfFromMarkdown()

" Save / Restore session easily
command SaveSess mksession! ~/.vim/session.vim
command RestoreSess source ~/.vim/session.vim
set sessionoptions-=options " do not save colorscheme etc

" File browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\ss\)\zs\.\S\+'

" JSX 
let g:jsx_ext_required = 0

" Overriding colorscheme
highlight Search cterm=underline
" My preference for transparent background terminal
highlight Normal guibg=NONE ctermbg=NONE 

" Vundle plugin manager

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" nginx
Plugin 'chr4/nginx.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" Javascript JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'chemzqm/vim-jsx-improve'

" PHP / Html
Bundle 'captbaritone/better-indent-support-for-php-with-html'
" PHP / Blade
Plugin 'jwalton512/vim-blade'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
