" Tim Montague's vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to autoload plugins from ~/.vim/bundle/
call pathogen#infect()

source ~/.vim/functions.vim
source ~/.vim/mappings.vim

" move temporary files to seperate directory
set backupdir=~/.vim/tmp/backup//
set dir=~/.vim/tmp//

" set persistent backup
set undodir=~/.vim/tmp/undo//
set undofile

set modeline
set tabstop=4
set shiftwidth=4
set smartindent

set smartcase

set tw=80				" wrap at 80 columns
set formatoptions+=t	" auto wrap text
set formatoptions+=c	" auto wrap comments
set formatoptions+=n	" autoformat numbered lists
set lbr					" wrap at word

set background=dark
set t_Co=256
colorscheme torte

" Switch syntax highlighting on
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Use system clipboard when doing yanks and puts
set clipboard=unnamed

" w!! to write a file as sudo
cmap w!! w !sudo tee % >/dev/null

" Jekyll.vim options
let g:jekyll_path = "/Users/tim/Documents/website/blog"
let g:jekyll_post_created = "%Y-%m-%d %T %z"
let g:jekyll_prompt_categories = "true"

" TagBar options
let g:tagbar_autofocus=1
map <C-T> :TagbarToggle<CR>

" NERDTree options
" open if vim is started with no files
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
nmap <C-N> :NERDTreeToggle<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch	" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=n
endif

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text setlocal textwidth=80

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


