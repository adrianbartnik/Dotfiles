set nocompatible

filetype indent plugin on " Intelligent auto-indenting by determining Type of file based on name and content
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable auto-continuing a comment
syntax on


" ### ### ### ### ### SETTINGS  ### ### ### ### ###

set encoding=utf8
set backspace=indent,eol,start
set nrformats= " Sets Vims Numberformat to Decimal instead of ocal to ignore leading zeros
set hidden

set number " Display line numbers on the left
set scrolloff=5

set foldmethod=manual    "fold based on indent
set foldnestmax=10       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set hlsearch
" set incsearch " Incremental search during input
set nomodeline
set wildmenu " Better command-line completion
set wildmode=longest,list,full

set laststatus=2
set noshowmode " Dont show commandline
set showcmd " Show partial commands in the last line of the screen

set nobackup
set noswapfile
set nowb
set wildignore=*.swp,*.bak,*.pcy,*.class,*.png,*.jpg,*.gif,*.so,*.zip,*.exe

set splitbelow
set splitright

set ignorecase
set smartcase
set autoindent
set nostartofline
set history=1000 " Store lots of :cmdline history

set confirm " Enable dialog asking if you wish to save changed files

set visualbell
set t_vb=

set mouse=a " Enable mouse in all modes

set notimeout ttimeout ttimeoutlen=200 " Quickly time out on keycodes, but never time out on mappings

set shiftwidth=2
set softtabstop=2
set expandtab
set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines

set clipboard=unnamedplus

set showmatch " Show matching brackets when text indicator is over them
set linebreak " Wrap lines at convenient points

set matchpairs+=<:>

:let g:html_indent_inctags = "html,body,head,tbody"  " Indent this tags

" Smaller indents on css and html files
autocmd! Syntax css,html,htmldjango,js setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ### ### ### ### ### MAPPINGS  ### ### ### ### ###

let mapleader = ","
let maplocalleader = "0"

map Y y$ " Change behaviour of Y. Yank to the end of the current line

" Resume editing at last position if reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
  endif

" Better switching between open splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move between open buffers easier
noremap <C-U> :bp<CR>
noremap <C-I> :bn<CR>
noremap <Leader>d :bd<CR>:bp<CR>

" Swap Lines with arrow keys
no <down> ddp 
no <up> ddkP

" Simplify quotes
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Better moving of code blocks
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR> " Deletes the current file

noremap J }
noremap K {

" Map x to tidy HTML
" :vmap ,x :!tidy -q -i --show-errors 0<CR>
:vmap ,x :!tidy -q -i --show-warnings no --doctype omit --show-body-only yes-ashtml<CR>

" Move up one line even if the line is non-breaking lines spanning multiple visual lines
nnoremap j gj
nnoremap k gk

" ### ### ### ### ### PLUGINS ### ### ### ### ###

" ----- Pathogen
execute pathogen#infect()
 
" ----- Colortheme
" set term=xterm-256color
set t_ut=
set t_Co=256
let base16colorspace=256
set background=dark
colorscheme base16-ocean " or Tomorrow-Night
autocmd VimEnter * redraw!

" ----- Airline 
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_section_warning = ''
let g:bufferline_echo = 0
" let g:airline_section_b = '%{getcwd()}'
" let g:airline_section_c = '%t'
" let g:airline_section_x = '%{strftime("%H:%M %a %e.%m.%Y")}' " Show Time

" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.linenr = '' " Change Linenumber symbol
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#default#layout = [
     \ [ 'a', 'b', 'c' ],
     \ [ 'y', 'z', 'warning' ]
     \ ]

let g:airline_mode_map = { '__' : '-', 'n' : 'N', 'i' : 'I', 'R' : 'R', 'c' : 'C', 'v' : 'V', 'V' : 'V', 's' : 'S', 'S' : 'S', }

let g:airline#extensions#tmuxline#enabled = 1

let g:tmuxline_preset = {
  \'a' : '#S',
  \'win' : '#I #W',
  \'cwin' : '#I #W',
  \'y' : '%H:%M %a %e.%m.%Y',
  \'z' : '#h'}

" ----- NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif " Open NERDTree if no other file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if NERDTree is last open windows
autocmd BufEnter * lcd %:p:h " Open NERDTree in current directory path

map <C-b> :NERDTreeToggle<CR> " Map Ctrl+b to toogle NERDTree

" ----- EmmetVim
" Ctrl-Y,

" ----- Commentary 
" gc

" ----- vim-multiple-cursors
" Ctrl-n

" Surround.vim
" cs"' to Change surrounding inside a text object from " to '
" cst" changes any tag to "
" ds" deletes surrounding "
" ysiw] adds a surrounding to a textobject
" yss to wrap whole line with }}
" in visual line mode S( to wrap all lines
