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

" cursor moves correctly if lines are auto-wrapped
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

