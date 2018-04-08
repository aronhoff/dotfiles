set nocompatible                " put the m im vim
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backup                      " keep a backup file
set history=500                 " keep command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " incremental seach
set inccommand=nosplit          " live substitute
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
set number                      " print current line number
set relativenumber              " print relative line numbers for other lines
set scrolloff=5                 " scroll when less than 5 lines away from the top/bottom of screen
set ignorecase                  " search case-insensitive when all lower-case
set smartcase                   " search case-sensistive when there is at least one upper case char
set colorcolumn=+1              " colour column 'textwidth'+1
set laststatus=2                " always draw status line in last window
set wildignore+=*/tmp/*,*.so,*.sw?,*~
set lazyredraw                  " speeds up scrolling significantly
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
inoremap <leader>pp <C-o>:pc<CR>
nnoremap <leader>pp :pc<CR>

" Easy typing of \
inoremap <leader><leader> <leader>

" Put comma or semicolon at the end of the line
inoremap <leader>; <C-o>m`<C-o>A;<C-o>``
inoremap <leader>, <C-o>m`<C-o>A,<C-o>``
nnoremap <leader>; m`A;<ESC>``
nnoremap <leader>, m`A,<ESC>``

" Replace current word
nnoremap <Leader>s m`:%s/\<<C-r><C-w>\>/<C-r><C-w>

" Alternate source file shortcuts
nnoremap <leader>aa :A<CR>
nnoremap <leader>as :AS<CR>
nnoremap <leader>av :AV<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

function! LcloseAndQuit(w, f)
    if a:w
        write
    endif
    if a:f
        lclose
        q!
    elseif !&mod
        lclose
        q
    else
        q " For the error message
    endif
endfunction
cabbrev q call LcloseAndQuit(0, 0)
cabbrev qf call LcloseAndQuit(0, 1)
cabbrev wq call LcloseAndQuit(1, 0)


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
autocmd BufWinEnter *.* silent! loadview

" Colours
set t_Co=256
hi CursorLine cterm=none ctermbg=234
hi CursorColomn cterm=none ctermbg=234
hi LineNr cterm=none ctermbg=236 ctermfg=white
hi CursorLineNr cterm=none ctermbg=234 ctermfg=darkred
hi Pmenu ctermbg=26 ctermfg=white
hi PmenuSel cterm=bold ctermfg=237
hi colorcolumn ctermbg=235
hi SpellBad ctermbg=052
hi SpellCap ctermbg=208
hi Search ctermbg=18

" Indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd ctermbg=234
hi IndentGuidesEven ctermbg=235

" YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_show_diagnostics_ui = 0
" nnoremap <leader>gg :YcmCompleter GoTo<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1

" NERDTree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['h'] = '7F7F7F' " C/C++ header files
let g:NERDTreeExtensionHighlightColor['tpp'] = '689FB6' " C++ template files

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0
"inoremap <silent> <c-l> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'aronhoff/vim-javascript', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --racer-completer --tern-completer' }
Plug 'w0rp/ale'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'guns/xterm-color-table.vim', { 'on': 'XTermColorTable' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'jiangmiao/auto-pairs'
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }
Plug 'will133/vim-dirdiff'
Plug 'arakashic/chromatica.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-repeat'
Plug 'dzeban/vim-log-syntax'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'tpope/tpope-vim-abolish'
Plug 'lervag/vimtex', { 'for': ['plaintex', 'tex'] }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'PeterRincker/vim-argumentative'
Plug 'machakann/vim-swap'
Plug 'chrisbra/csv.vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'AndrewRadev/linediff.vim'
Plug 'hzchirs/vim-material'
" Plug 'roxma/nvim-completion-manager'
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': ['bash install.sh', ':UpdateRemotePlugins']}
Plug 'roxma/ncm-clang'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
endif
Plug 'tweekmonster/deoplete-clang2'
Plug 'zchee/deoplete-jedi'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-zsh'
Plug 'embear/vim-localvimrc'
Plug 'bfrg/vim-cpp-modern'
Plug 'cohama/lexima.vim'
Plug 'godlygeek/tabular'

" Keep devicons as last!
Plug 'ryanoasis/vim-devicons'
call plug#end()

" LocalVimrc
let g:localvimrc_ask = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_start_length = 1
inoremap <expr><C-g> deoplete#undo_completion()
inoremap <expr><C-space> pumvisible() ? deoplete#refresh() : "\<C-space>"
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

" NVim Completion Manager
" set shortmess+=c
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" imap <C-Space> <Plug>(cm_force_refresh)
" let g:cm_matcher = {'module': 'cm_matchers.abbrev_matcher', 'case': 'smartcase'}

" LanguageClient Neovim
" Required for operations modifying multiple buffers like rename.
" set hidden
" let g:LanguageClient_serverCommands = {
    " \ 'cpp' : ['clangd'],
    " \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    " \ }
" let g:LanguageClient_trace = 'verbose'
" let g:LanguageClient_loggingLevel = 'DEBUG'

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Onedark
colorscheme onedark
let g:onedark_terminal_italics = 1
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

" Latex
let g:polyglot_disabled = ['latex']

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

" Ale
let g:ale_linters = {
\   'tex': ['chktex'],
\   'cpp': ['clang'],
\}
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 1
nmap <silent> <C-a> <Plug>(ale_previous_wrap)
nmap <silent> <C-s> <Plug>(ale_next_wrap)

"EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <Space>f <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Devicons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tpp'] = ''
