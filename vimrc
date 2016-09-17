
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start	" allow backspacing over everything in insert mode

if has("vms")
  set nobackup					" do not keep a backup file, use versions instead
else
  set backup					" keep a backup file
endif
set history=500					" keep 500 lines of command line history
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set incsearch					" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" custom
set wildmenu
set showmatch
set shiftwidth=4
set tabstop=4
vnoremap <silent> * :call VisualSelection('f')<CR>
set cursorline
set number
set scrolloff=5
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
set ignorecase
set smartcase
set relativenumber
set textwidth=80
set colorcolumn=+1

set t_Co=256
colorscheme peachpuff
hi CursorLine cterm=none ctermbg=234
hi CursorColomn cterm=none ctermbg=234
hi LineNr cterm=none ctermbg=236 ctermfg=white
hi CursorLineNr cterm=none ctermbg=234 ctermfg=darkred
hi Pmenu ctermbg=26 ctermfg=white
hi PmenuSel cterm=bold ctermfg=237
hi colorcolumn ctermbg=235

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd ctermbg=234
hi IndentGuidesEven ctermbg=235
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'

nnoremap <C-n> :bnext<CR>
nnoremap <C-m> :bprevious<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'joequery/Stupid-EasyMotion'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'thehoffmann/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'guns/xterm-color-table.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'will133/vim-dirdiff'
Plugin 'jeaye/color_coded'
Plugin 'klen/python-mode'
Plugin 'kburdett/vim-nuuid'
Plugin 'airblade/vim-gitgutter'
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap : ;
nnoremap ; :

map <leader>n <C-w><C-w>

nnoremap <F5> :GundoToggle<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

set wildignore+=*/tmp/*,*.so,*.sw?,*~
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:pymode_rope_completion = 0
let g:pymode_python='python3'

inoremap <leader>; <C-o>m`<C-o>A;<C-o>``
inoremap <leader>, <C-o>m`<C-o>A,<C-o>``
nnoremap <leader>; m`A;<ESC>``
nnoremap <leader>, m`A,<ESC>``
inoremap <leader><Return> <C-o>o

" Close documentation
inoremap <leader>p <C-o>:pc<CR>
nnoremap <leader>p :pc<CR>

function AsmFile()
  set ft=asm
  highlight currawong ctermbg=237
  match currawong /^	.*/
endfunction
command AsmFile call AsmFile()
