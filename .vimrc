syntax enable
filetype plugin indent on
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"	vim plugins
filetype plugin on
call plug#begin('~/.vim/autoload/') " :PlugInstall and :PlugUpdate and :PlugClean
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/tagbar'
call plug#end()

"	colorscheme solarized_dark
hi Normal guibg=NONE ctermbg=NONE
set number relativenumber
hi LineNr ctermbg=NONE

let s:light_blue = 'lightblue'
let g:airline#themes#light#palette = {}
let g:airline#themes#light#palette.normal = '[' . s:light_blue . ',black]' . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ',' .
    \ '[' . 'white' . ',black]' . s:light_blue . ']'

let g:airline#extensions#whitespace#enabled = 0


nnoremap <C-x> :NERDTreeToggle %<CR>

" reloads .vimrc whenever we write
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" allows reading of .pdf files
au BufRead *.pdf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!

set cursorline
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=white

set tabstop=4
set softtabstop=4 "deletes 4 spaces as tab
set expandtab "universal tabs

set autoindent

set ignorecase "ignore capital letters during search
set showmode "show the current mode on last line
set showmatch "show matching words during a search

set wildmenu "auto completion menu when pressing TAB
set wildmode=list:longest "wildmenu behaving like Bash completion

" Define key mapping for opening a vertical terminal inside Vim
nnoremap <silent> $mod+v :vertical terminal<CR>

" Define key mapping for opening a horizontal terminal inside Vim
nnoremap <silent> $mod+h :terminal<CR>

" Enable line wrapping
set wrap

" Highlight search matches
set hlsearch

" Enable incremental search
set incsearch

" Enable syntax highlighting
syntax enable
" Set the leader key
let mapleader = ","

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Save the current file
nnoremap <leader>s :w<CR>

" Save&Exit the current file
nnoremap <leader>p :wq<CR>


" Toggle line numbers
nnoremap <leader>l :set relativenumber!<CR>

" Compile and run C++ code
nnoremap <leader>r :!g++ % -o %< && ./%<<CR>

" Comment/uncomment selected lines
vnoremap <leader>c :s/^/\/\/<CR>

" Open VimWiki index
nnoremap <leader>w :VimwikiIndex<CR>

" Open tagbar
nnoremap <leader>t :TagbarToggle<CR>

" Open terminal vertically
nnoremap <leader>v :vertical terminal<CR>

" Open terminal horizontally
nnoremap <leader>h :terminal<CR>

"Reach end of a line"
nnoremap <leader>e $

"Reach begining of a line" 
nnoremap <leader>b ^
