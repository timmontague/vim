let mapleader=","

" toggle line numbers between absolute/relative with ,n
nnoremap <silent> <Leader>n :call NumberToggle()<CR>

" Adds indented text blocks as a text object
" ii selects current indented text block
" ai selects all indented text blocks, even if seperated by blank lines
" Press: vai, vii to select indented blocks
" Press: vii, yii, dii, cii to select/yank/delete/change an indented block.
onoremap <silent>ai :<C-u>call IndTxtObj(0)<CR>
onoremap <silent>ii :<C-u>call IndTxtObj(1)<CR>
vnoremap <silent>ai <Esc>:call IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii <Esc>:call IndTxtObj(1)<CR><Esc>gv

" typing Ctrl-Space in edit mode autocompletes
:imap <C-Space> <C-X><C-O>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" toggle hex mode by ctrl-x
nnoremap <C-X> :Hexmode<CR>

" toggle Tag Bar with ctrl-t
map <C-T> :TagbarToggle<CR>

" toggle NERD Tree
nmap <C-N> :NERDTreeToggle<CR>

" new split with ,s vertical split with ,v
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>

" Move between split windows by using the four directions H, L, I, M
" (note that I use I and M instead of J and K because J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> H <C-w>h
nnoremap <silent> L <C-w>l
nnoremap <silent> I <C-w>k
nnoremap <silent> M <C-w>j

" New tab with ,t
nnoremap <silent> <Leader>t :tabnew<cr>
" Move between tabs with arrows
noremap <silent> <Left> :tabprevious<cr>
noremap <silent> <Right> :tabnext<cr>

" Scoll up and down with arrows
nnoremap <silent> <Up> <C-y>
nnoremap <silent> <Down> <C-e>
nnoremap <silent> <S-Up> <C-u>
nnoremap <silent> <S-Down> <C-d>

" Move back and forth through previous and next buffers
" with shift and arrows
nnoremap <silent> <S-Left> :bp<CR>
nnoremap <silent> <S-Right> :bn<CR>

" cursor moves correctly if lines are auto-wrapped
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

