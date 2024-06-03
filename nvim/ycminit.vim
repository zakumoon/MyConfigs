let mapleader =","

" ======================================== PLUGINS ========================================
" Install vimplug
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" Plug sources
call plug#begin('~/.config/nvim/plugged')

" Universal editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'unblevable/quick-scope'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Completion
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do':'./install.py' }

" File tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Status line
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'

" Color schemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dylanaraps/wal.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex', { 'for': ['tex', 'bib'] }

" Frontend development
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'jsx', 'javascriptreact'] }
Plug 'alvan/vim-closetag', { 'for': ['javascript', 'jsx', 'javascriptreact', 'html', 'xml'] }
call plug#end()

" ==================== BASICS ====================
" Quality of life
set background=dark
set mouse=a
set number relativenumber
set hlsearch
set title
set titleold=st
set clipboard=unnamedplus
set undodir=~/.config/nvim/undodir
set undofile
set encoding=UTF-8
set expandtab
set tabstop=8
set softtabstop=0
set shiftwidth=4
set smarttab
set foldmethod=indent
set foldlevel=99
set completeopt-=preview
set splitbelow splitright
set wildmode=list,full
filetype plugin on
syntax on

" ==================== COLORS ====================
color wal
highlight CursorLine ctermbg=9 cterm=none
highlight CursorColumn ctermbg=9
highlight CursorLineNr ctermfg=2
highlight WildMenu ctermfg=0 ctermbg=3
highlight Statusline ctermfg=7 ctermbg=none cterm=none
highlight YcmErrorSign ctermfg=12 ctermbg=0
highlight YcmWarningSign ctermfg=14 ctermbg=0
highlight Pmenu ctermbg=233
highlight PmenuSel ctermfg=0 ctermbg=3
highlight QuickScopePrimary cterm=underline ctermfg=155
highlight QuickScopeSecondary cterm=underline ctermfg=81

" ==================== PLUGIN VARIABLES =====================
" vimtex
let g:vimtex_compiler_progname = 'nvr'

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" quick-scope
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
let g:qs_max_chars=150

" vimwiki
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/Documents/Notebooks/Vimwiki', 'syntax': 'markdown', 'ext': '.rmd'}]

" nerdtree/nerdtree-git-plugin/vim-nerdtree-syntax-highlight
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "☒",
    \ "Unknown"   : "?"
    \ }

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#wordcount#enabled= 1
let g:airline#extensions#wordcount#filetypes=['vimwiki', 'help', 'mail', 'markdown', 'tex', 'text', 'groff', 'rmarkdown']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1

" YouCompleteMe
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = "✘"
let g:ycm_warning_symbol = "⚠"
let g:ycm_global_ycm_extra_conf = '$HOME/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers =  {
    \ 'c': ['->', '.', 're!\w{2}'],
    \ 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
    \ 'ocaml': ['.', '#'],
    \ 'cpp,cuda,objcpp': ['->', '.', '::', 're!\w{2}'],
    \ 'perl': ['->'],
    \ 'php': ['->', '::'],
    \ 'cs,d,elixir,go,groovy,java,javascript,julia,perl6,scala,typescript,vb': ['.'],
    \ 'ruby,rust': ['.', '::'],
    \ 'lua': ['.', ':'],
    \ 'erlang': [':'],
    \ 'python': ['.', 're!\w{2}'],
    \ }
let g:ycm_python_binary_path = 'python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 0

" vim-instant-markdown
let g:instant_markdown_autostart = 0

" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<Leader>>'

" goyo.vim
let g:goyo_width=90

" fzf.vim
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse "
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit',
    \ 'ctrl-r': 'read'
    \ }

" ===================== MAPS ====================
" Quick fzf commands
map <Leader>. :Files<CR>
map <Leader> :Maps<CR>,
map <Leader>m :Buffers<CR>

" Goyo modes
map <Leader>F :Goyo \| set bg=dark \| set linebreak<CR>

" Ycm shortcuts
map <Leader>d :YcmCompleter GoToDefinition<CR>
map <Leader>g :YcmCompleter GoTo<CR>
map <Leader>x :YcmCompleter FixIt<CR>

" Vimwiki
nmap <leader>vw <Plug>VimwikiIndex

" Vim replacement for up and down
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Tmux compatibility
map <C-q> <C-a>

" Toggle interface
map <Leader>l :call LocationToggle()<CR>
map <Leader>n :NERDTreeToggle<CR>

" Toggle spell check
map <Leader>o :setlocal spell! spelllang=en_us<CR>

" Split navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Run shell scripts
map <Leader>s :!clear && shellcheck %<CR>
map <Leader>c :w! \| !compiler "<c-r>%"<CR>
map <Leader>p :!opout "<c-r>%" &<CR><CR>
map <Leader>w :w !detex \| wc -w<CR>

" Navigating with guides
inoremap <Leader><Leader> <Esc>/<++><CR>"_c4l
vnoremap <Leader><Leader> <Esc>/<++><CR>"_c4l
map <Leader><Leader> <Esc>/<++><CR>"_c4l

" Show cursor
nmap + :set cursorline! cursorcolumn!<CR>

" Fix c
nnoremap c "_c

" ==================== AUTOCMDS ====================
" Clean tex junk on exit
autocmd VimLeave *.tex !texclear %

" Recognize files properly
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile *.asm set syntax=nasm

" Deletes trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Set tmux window name
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux setw automatic-rename")

" Close nerdtree on last window
autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable auto commenting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Easy navigation for vimwiki
autocmd BufRead,BufNewFile */Vimwiki/* map J <Plug>VimwikiNextLink
autocmd BufRead,BufNewFile */Vimwiki/* map K <Plug>VimwikiPrevLink

" Recognize comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+
" ==================== COMMANDS OR FUNCTIONS ====================
" Fzf add preview
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)

" Fzf floating window
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Toggle location list
function! LocationToggle()
    if get(getloclist(0, {'winid':0}), 'winid', 0)
        lclose
    else
        lopen
    endif
endfunction
