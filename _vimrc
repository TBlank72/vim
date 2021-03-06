"Vundle------------
set nocompatible
filetype off

"SET runtime path to include Vundle and Initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/vimfiles/bundle')

" Plugins- Add plugins below
Plugin 'VundleVim/Vundle.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'L9'

call vundle#end()
filetype plugin indent on

:cd C:\users\Todd\
" End Vundle----------------
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"color schemes
colo torte

"indent guides
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkred   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkblue ctermbg=4


"set line numbers and relative numbers
set rnu
function ToggleNumbersOn()
  set rnu!
  set nu
endfunction
function ToggleRelativeOn()
  set nu!
  set rnu
endfunction
autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn()
autocmd InsertLeave * call ToggleRelativeOn()

"Set font
if has ('gui_running')
	set guifont=Lucida_Console:h11
endif

"Pathogen settings
execute pathogen#infect()
syntax on
filetype plugin indent on

"NERD_tree
autocmd vimenter * NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"EASY-MOTION
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap S <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap S <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"VIM-POWERLINE DEPRECATED FOR POWERLINE WHEN READY 
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set laststatus=2

"SET TABS and Indents
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab


"SET jj to escape in insert mode
imap jj <Esc>

"SET Beginning / End of Line normal mode 
nmap B ^
nmap E $

"Set ; to : & : to ;
nnoremap  ;  :
nnoremap  :  ;

"SET Leader key
let mapleader = ","

"quick pairs
inoremap <leader>' ''<Esc>i
inoremap <leader>" ""<Esc>i
inoremap <leader>( ()<Esc>i
inoremap <leader>[ []<Esc>i
inoremap <leader>{ {}<Esc>i

"Auto-Center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"Set default window size
if has("gui_running")
  set lines=999 columns=88
else
  if exists("+lines")
    set lines=60
  endif
  if exists("+columns")
    set columns=100
  endif
endif
'

"Set ColorColumn 81
hi ColorColumn guibg=Magenta
"set colorcolumn=81 "full column
call matchadd('ColorColumn', '\%81v', 100)

"change windows command
nmap W <C-W><C-W> 

"=========Fuzzy Finder============
"Find File w/o Dir path (def cwd)
command Fcf FufCoverageFile
" Find in Buffer
command Fb FufBuffer
"Find through Dir path
command Ff FufFile
"Find Line in current File
command Fl FufLine
"Find and change current Dir (with .)
command Fd FufDir
"Find a Bookmarked Dir
command Fbmd FufBookmarkDir
"Add a Bookmarked Dir
command Fabmd FufBookmarkDirAdd
" press <Ctrl-]> to delete the selected Bookmarked Dir
"===========Fuzzy Finder============

"Popup menu colors
hi Pmenu guibg=#220000
hi Pmenu guifg=SeaGreen
hi PmenuSel guibg=SlateBlue
hi PmenuSel guifg=Yellow

"Popu menu remap Next / Prev to J / K
inoremap <expr> J pumvisible() ? "\<C-N>" : "J"
inoremap <expr> K pumvisible() ? "\<C-P>" : "K"









"===============notes=================
" . repeats previous command
" <C-r> redo from an undo
" <C-p> autocompletion word
" <C-x> Special autocompletion
" <C-x><C-l> autocomplete line
" <C-x><C-p> autocomplete line, word by word
" <C-x><C-p> autocomplete line, word by word
" normal f<letter> jump to letter; F jumps back
" normal t<letter> jump till letter; T jump till back
" ; semicolon cycles through next letters when using fFtT

