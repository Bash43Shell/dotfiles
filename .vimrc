"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("syntax")
	filetype on
	syntax on
endif

filetype plugin on
filetype indent on

syntax enable

" colorscheme desert
" set background=dark

if has("gui_running")
	" colorscheme desert
	set background=dark
	set linespace=4
	set lines=40 columns=160
	set guifont=Monospace
	set guioptions=aegitM

	if has("winaltkeys")
		set winaltkeys=no
	endif
else
	" colorscheme tfl
	set ttyfast
endif

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed
" set colorcolumn=0
set cmdheight=1
" set cursorcolumn
set cursorline
set encoding=utf-8
set equalalways
" set expandtab
set ffs=unix,dos,mac
set helpheight=30
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set lbr
set magic
set matchtime=0
set modeline
set modelines=1
set mouse=a
set nobackup
set nocompatible
" set noerrorbells
" set nohlsearch
" set nomodeline
set nomore
set noswapfile
set nowb
set nowrap
" set nottyfast
set number
" set omnifunc=syntaxcomplete#Complete
" set path+=**
set relativenumber
set ruler
set scrolloff=9999
set secure
set shiftwidth=3
set showcmd
set showmatch
set showmode
set sidescrolloff=999
set smartcase
set smartindent
set smarttab
set spelllang=us
set splitbelow
set splitright
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set t_Co=256
set t_vb=
" set tabstop=3
set term=rxvt-256color
set termencoding=utf-8
set tm=500
set tw=500
set ttimeout
set ttimeoutlen=0
set ttyfast
set undolevels=100
" set viminfo^=%
set whichwrap+=<,>,h,l
set wildmenu
set wildignore=*.o,*~,*.pyc
" set wildmode=longest, list
" set wrap
" set wrapmargin=0
set wrapscan

vnoremap <C-c> "+y
map <C-v> "+P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='omniverse'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Unicode Symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Airline Symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NerdTree
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeDirArrowCollapsible = '▾'
let NERDTreeDirArrowExpandable = '▸'
let NERDTreeDirArrows=1
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\.mp3', '\.mp4', '\.mkv', '\.avi', '\.jpg', '\.JPG', '\.jpeg', '\.png', '\.svg', '\.gif', '\.rar', '\.zip', '\.tar', '\.tar.bz2', '\.tgz', '\.tar.xz', '\.run', '\.AppImage', '\.pdf', '\.exe', '\.dll', '\.db', '\.msi', '\.blend', '\.blend1', '\.psd', '.out']
let NERDTreeMapJumpFirstChild = 'gK'
let NERDTreeMinimalUI = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden=1
let NERDTreeWinPos="left"
let NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }
map <C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'

" flake8
let g:flake8_show_in_file=1

" snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-s)

" Moving Around
noremap <silent> <C-Down> <C-W>j
noremap <silent> <C-Up> <C-W>k
noremap <silent> <C-Left> <C-W>h
noremap <silent> <C-Right> <C-W>l
noremap <silent> <C-F10> :bd!<CR>
