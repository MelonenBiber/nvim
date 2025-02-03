" Save all undo files in a single location (less messy, more risky)...
set undodir=$HOME/.local/share/nvim/.vimhis
" Save a lot of back-history...
set undolevels=500
" Actually switch on persistent undo
set undofile
" Disable F1 help screen shit hopefully
" nmap <F1> :echo<CR>
" imap <F1> <C-o>:echo<CR>
nmap <f1> <nop>
imap <f1> <nop>
map <f1> <nop>
noremap <f1> <nop>

" Remap quit, save
nmap <leader>qq :q!<cr>
nmap <leader>w :noa :w!<cr>

" c-g Remap macro key so it doesn't overlap with quit
nnoremap Q q
noremap q <nop>

" Vim magic to disable automatically making new lines comments 
au BufEnter * set fo-=c fo-=r fo-=o

" highlight all matches while searching
set is

" glove80
"noremap t l
"noremap e k
"noremap n j
"noremap s h

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=

set nu
set relativenumber

set nohlsearch
set incsearch

set scrolloff=16

set updatetime=50
set termguicolors

set colorcolumn="80"

" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
