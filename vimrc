set nocompatible                " put the m im vim
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backup                      " keep a backup file
set history=500                 " keep command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " incremental seach
set hlsearch                    " highlight last search result
set wildmenu                    " tab completion for : mode
set showmatch                   " show matching braces
set shiftwidth=0                " use the value of tabstop
set tabstop=4
set softtabstop=4
set list
set listchars=tab:➜\ 
set expandtab                   " tabs into spaces
set cursorline                  " highlight current line
set relativenumber              " print relative line numbers
set scrolloff=5                 " scroll when less than 5 lines away from the top/bottom of screen
set ignorecase                  " search case-insensitive when all lower-case
set smartcase                   " search case-sensistive when there is at least one upper case char
set colorcolumn=+1              " colour column 'textwidth'+1
set laststatus=2                " always draw status line in last window
set wildignore+=*/tmp/*,*.so,*.sw?,*~
syntax on

" Don't use Ex mode, use Q for formatting
map Q gq

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, so that
" you can undo CTRL-U after inserting a line break.
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Navigate among buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-m> :bprevious<CR>

" gj and gk are not linewise when wrapped
nnoremap j gj
nnoremap k gk

" : is more common, make it easier to type
nnoremap : ;
nnoremap ; :

" Remap escape
imap jk <Esc>
imap kj <Esc>

" Window handling shortcuts
nmap <leader>z <C-w>
imap <leader>z <C-o><C-w>
vmap <leader>z <C-o><C-w>
map <leader>n <C-w><C-w>

" Close documentation
inoremap <leader>p <C-o>:pc<CR>
nnoremap <leader>p :pc<CR>

" Put comma or semicolon at the end of the line
inoremap <leader>; <C-o>m`<C-o>A;<C-o>``
inoremap <leader>, <C-o>m`<C-o>A,<C-o>``
nnoremap <leader>; m`A;<ESC>``
nnoremap <leader>, m`A,<ESC>``

" Start on new line
inoremap <leader><Return> <C-o>o

" Alternate source file shortcuts
nnoremap <leader>aa :A<CR>
nnoremap <leader>as :AS<CR>
nnoremap <leader>av :AV<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

if has('mouse')
  set mouse=a
endif

" Enable file type detection.  Use the default filetype settings, so that mail
" gets 'tw' set to 72, 'cindent' is on in C files, etc.  Also load indent files,
" to automatically do language-dependent indenting.
filetype plugin indent on

autocmd FileType make set noexpandtab
autocmd FileType text setlocal textwidth=100

function AsmFile()
  set ft=asm
  highlight currawong ctermbg=237
  match currawong /^    .*/
endfunction
command AsmFile call AsmFile()

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Colours
set t_Co=256
colorscheme peachpuff
hi CursorLine cterm=none ctermbg=234
hi CursorColomn cterm=none ctermbg=234
hi LineNr cterm=none ctermbg=236 ctermfg=white
hi CursorLineNr cterm=none ctermbg=234 ctermfg=darkred
hi Pmenu ctermbg=26 ctermfg=white
hi PmenuSel cterm=bold ctermfg=237
hi colorcolumn ctermbg=235
hi SpellBad ctermbg=052
hi SpellCap ctermbg=208

" Indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd ctermbg=234
hi IndentGuidesEven ctermbg=235

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'

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
Plugin 'aronhoff/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
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
Plugin 'kburdett/vim-nuuid'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'jreybert/vimagit'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-repeat'
call vundle#end()            " required
filetype plugin indent on    " required

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'

" NERDCommenter
let g:NERDSpaceDelims = 1

" NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['h'] = '7F7F7F' " C/C++ header files

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
