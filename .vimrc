""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible   "Get rid of vi compatibility mode... this needs to be set first

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01 Plugines                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call pathogen#infect()
set nowrap
set showmatch
set autoindent
"filetype indent on
set textwidth=150
set ignorecase
set smartcase
set incsearch
syn on
set hlsearch
set hidden

" Highlight cursor line and column
set cursorline
set cursorcolumn

" Search land location
set scrolloff=3
set sidescrolloff=3

" Adding line numbers and setting to relative for convenient line jumping
set number
set relativenumber

"detect indent auto switch between tab and space indentation
set tabstop=2
set shiftwidth=2
set noexpandtab
:let g:detectindent_preferred_indent = 4
:let g:detectindent_max_lines_to_analyse = 100
autocmd FileType python DetectIndent
autocmd FileType javascript DetectIndent

"highlight bash scripts posix compliant
let g:is_posix = 1

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

syntax enable
set t_Co=16

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors=16
colorscheme solarized
"hi Search cterm=NONE ctermfg=grey ctermbg=red
highlight  CursorLine ctermbg=0
highlight  CursorColumn ctermbg=0

" hide highlights to start
function! ToggleSolarized()
	if(&background == 'dark')
		set background=light
		highlight  CursorLine ctermbg=7
		highlight  CursorColumn ctermbg=7
	else
		" for light mode
		set background=dark
		highlight  CursorLine ctermbg=0
		highlight  CursorColumn ctermbg=0
	endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"swaps
"set dir=~/.vimswp

autocmd QuickFixCmdPost *grep* cwindow

"highligh matching curlies
map ,c Vf{%

set formatoptions-=t

" enable code completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
au BufRead,BufNewFile *.yml set ft=ansible
au BufRead,BufNewFile *.yaml set ft=ansible

" a better htmldjango detection
augroup filetypedetect
  " removes current htmldjango detection located at $VIMRUNTIME/filetype.vim
  au! BufNewFile,BufRead *.html
  au  BufNewFile,BufRead *.html   call FThtml()
 
  func! FThtml()
    let n = 1
    while n < 10 && n < line("$")
      if getline(n) =~ '\<DTD\s\+XHTML\s'
        setf xhtml
        return
      endif
      if getline(n) =~ '{%\|{{\|{#'
        setf htmldjango
        return
      endif
      let n = n + 1
    endwhile
    setf html
  endfunc
augroup END

" close the scratch window from code complete
" when leaving insert mode
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

highlight! Folded cterm=NONE ctermfg=magenta

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Key Mappings                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pagedown with spacebar
noremap <Space> <PageDown>

"make the Y yank equivalent to D and C mappings not really...should be default
noremap Y y$
inoremap jk <esc>

"comment and uncomment a line
"map ,c ^i#<ESC>
"map ,u ^x

"make backspace work like other applications
set backspace=indent,eol,start
