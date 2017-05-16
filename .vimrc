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
set wildignore=*.swp,*.bak,*.pyc,*.class,*.png,*.jpg,*.gif,*.so,*.zip,*.exe,

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

" Auto save folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

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
nnoremap H :bp<CR>
nnoremap L :bn<CR>
noremap <Leader>d :bd<CR>:bp<CR>

" Swap Lines with arrow keys
no <down> ddp 
no <up> ddkP

" Simplify quotes
" imap <leader>' ''<ESC>i
" imap <leader>" ""<ESC>i
" imap <leader>( ()<ESC>i
" imap <leader>[ []<ESC>i
" imap <leader>{ {}<ESC>i
" imap <leader>< <><ESC>i

" Insert current date via F5
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

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

" Run python script with F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Set folding method automatically
" augroup vimrc
"   au BufReadPre * setlocal foldmethod=indent
"   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END
" set foldmethod=manual
" set fdm=manual

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
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:bufferline_echo = 0
let g:airline_left_sep=''
let g:airline_right_sep='' " default: <
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
" let g:airline_section_c = '%t'
let g:airline_section_c = '%{getcwd()}/%t'

let g:airline_mode_map = { '__' : '-', 'n' : 'N', 'i' : 'I', 'R' : 'R', 'c' : 'C', 'v' : 'V', 'V' : 'V', 's' : 'S', 'S' : 'S', }

let g:airline#extensions#tmuxline#enabled = 1

let g:tmuxline_preset = {
  \'a' : '#S',
  \'win' : '#I #W',
  \'cwin' : '#I #W',
  \'y' : '%H:%M %a %e.%m.%Y',
  \'z' : '#h'}

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

" ----- vim-ctrl-p
" Open multiple files at once as hidden buffers
let g:ctrlp_open_multiple_files = 'i'
" let g:ctrlp_working_path_mode = 'ra' - Default
let g:ctrlp_working_path_mode = 'c'

" ---- Other Functions

" ---- Folding

function HasFolds()
    "Attempt to move between folds, checking line numbers to see if it worked.
    "If it did, there are folds.

    function! HasFoldsInner()
        let origline=line('.')  
        :norm zk
        if origline==line('.')
            :norm zj
            if origline==line('.')
                return 0
            else
                return 1
            endif
        else
            return 1
        endif
        return 0
    endfunction

    let l:winview=winsaveview() "save window and cursor position
    let foldsexist=HasFoldsInner()
    if foldsexist
        set foldcolumn=1
    else
        "Move to the end of the current fold and check again in case the
        "cursor was on the sole fold in the file when we checked
        if line('.')!=1
            :norm [z
            :norm k
        else
            :norm ]z
            :norm j
        endif
        let foldsexist=HasFoldsInner()
        if foldsexist
            set foldcolumn=1
        else
            set foldcolumn=0
        endif
    end
    call winrestview(l:winview) "restore window/cursor position
endfunction

au CursorHold,BufWinEnter ?* call HasFolds()

" ------- EasyMotion Plugin

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to any 2-character sequence
nmap <Leader>s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1 

" Line motions - Mappings

" Select Line up- or downwards
map <Leader>j  <Plug>(easymotion-j)
map <Leader>k  <Plug>(easymotion-k)
" Beginning of word/WORD forward
map <Leader>w  <Plug>(easymotion-w)
map <Leader>W  <Plug>(easymotion-W)
" Beginning of word/WORD backward
map <Leader>b  <Plug>(easymotion-b)
map <Leader>B  <Plug>(easymotion-B)
" End of word/WORD forward
map <Leader>e  <Plug>(easymotion-e)
map <Leader>E  <Plug>(easymotion-E)
" End of word/WORD backward
map <Leader>ge <Plug>(easymotion-ge)
map <Leader>gE <Plug>(easymotion-gE)

" Vimviki

let personal = {}
let personal.path = '~/Dropbox/Apps/Wikis/Personal'
let personal.path_html = '~/Dropbox/Apps/Wikis/Personal/html'
let personal.index = 'Personal'

let work = {}
let work.path = '~/Documents/Wikis/Bitplaces/'
let personal.path_html = '~/Documents/Wikis/Bitplaces/html'
let work.index = 'Bitplaces'

let g:vimwiki_list = [personal, work]
let g:vimwiki_folding = 'list'

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# ':v$'
    let link = link[:-3]
    exe 'edit ' . link
    return 1
  else
    return 0
  endif

  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'edit ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

" nmap xy <Plug>VimwikiGoBackLink
" nmap xx <Plug>VimwikiNextLink

" Rename3.vim  -  Rename a buffer within Vim and on disk.
"
" Copyright July 2013 by Alex Ehlke <alex.ehlke at gmail.com>
"
" based on Rename2.vim (which couldn't handle spaces in paths)
" Copyright July 2009 by Manni Heumann <vim at lxxi.org>
"
" which is based on Rename.vim
" Copyright June 2007 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Rename[!] {newname}

command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")

function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:curfilepath = expand("%:p:h")
    let l:newname = l:curfilepath . "/" . a:name
    let v:errmsg = ""
    silent! exec "saveas" . a:bang . " " . fnameescape(l:newname)
    if v:errmsg =~# '^$\|^E329'
        if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
            silent exec "bwipe! " . fnameescape(l:curfile)
            if delete(l:curfile)
                echoerr "Could not delete " . l:curfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction


" NEW PLUGIN EXAMPLE

call plug#begin()
Plug 'lervag/vimtex'
Plug 'jreybert/vimagit'
call plug#end()

" Help file
nnoremap t <C-]> " Map follow link to t instead of Ctrl+], move back with Ctrl+t
