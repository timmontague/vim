" Tim Montague's vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to autoload plugins from ~/.vim/bundle/
call pathogen#infect()

" typing Ctrl-Space in edit mode autocompletes
:imap <C-Space> <C-X><C-O>

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

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

set formatoptions+=c	" auto wrap comments
set formatoptions+=n	" autoformat numbered lists
set lbr					" wrap at word

set background=dark
set t_Co=256
colorscheme torte

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

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" Enable file type detection.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" toggle hex mode by ctrl-x
nnoremap <C-X> :Hexmode<CR>
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" Move between split windows by using the four directions H, L, I, N
" (note that I use I and N instead of J and K because J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> H <C-w>h
nnoremap <silent> L <C-w>l
nnoremap <silent> I <C-w>k
nnoremap <silent> M <C-w>j
" Move between tabs with Ctrl-Shift-H and Ctrl-Shift-L
map <silent> <C-H> :tabprevious<cr>
map <silent> <C-L> :tabnext<cr>

" Move back and forth through previous and next buffers
" with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

