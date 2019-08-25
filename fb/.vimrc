"Display
set shell=/bin/zsh
set belloff=all
set nocompatible
set encoding=utf-8
set ruler
set laststatus=2
set number
set hidden
set nocursorline
set lazyredraw
set title "Show the filename in the window title bar
set nostartofline "Make j/k respect the columns
set re=1
set bs=2
set autoindent
set autoread
set backspace=indent,eol,start
set display+=lastline
set foldmethod=syntax
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set nofoldenable
set completeopt-=preview "Disable the preview window for completions.
set expandtab
set smarttab
set splitbelow splitright "Pane splitting
set noshowmode "The status line will show the mode.
set nowrap
set nrformats-=octal


" Highlight 80 characters
set colorcolumn=80 " absolute columns to highlight

" Scrolling.
set scrolljump=5    " scroll five lines at a time vertically
set sidescroll=10   " minumum columns to scroll horizontally

"indent style; override these explicitly to turn them off.
set wildmenu
set wildmode=longest:full
set shiftwidth=2
set softtabstop=2
set tabstop=2
set incsearch
set ignorecase
set smartcase
set modelines=0

let &t_SI = "\<Esc>]50;CursorShape=1\x7" "Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" "Block in normal mode

" Highlight after 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

runtime! macros/matchit.vim
inoremap <C-U> <C-G> u<C-U> "Improve CTRL-U in insert mode.

"let mapleader = "\<Space>"
"let g:mapleader = "\<Space>"

" Buffers
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <leader><leader> :xa<cr>


"Save common keystrokes
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr> 
"save and exit
nnoremap <C-d> :wq!<cr>
"quit discarding changes
inoremap <C-q> <esc>:qa!<cr>          
nnoremap <C-q> :qa!<cr>

noremap <Leader>y "*y
noremap <Leader>p "*p
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

"FZF silver searcher
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

"Clear current-search highlighting by hitting <CR> in normal mode.
nnoremap <silent> <CR> :nohlsearch<CR><CR>

"Exit terminal mode
tnoremap <Esc> <C-\><C-n>


"Autoreload external changes
au FocusGained,BufEnter * :checktime

"Customize viminfo and directories.
set viminfo='100,f1,<50,s10,h,n~/.config/nvim/viminfo
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swap//

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Update with :call dein#update()
let dein_installation_directory = '~/.config/nvim/dein'
let dein_source_directory = dein_installation_directory . '/repos/github.com/Shougo/dein.vim'
let fb_vim_path = dein_installation_directory . '/dein/repos/github.com/Shougo/fbvim.vim'


let &runtimepath = &runtimepath . ',' . dein_source_directory
if dein#load_state(dein_installation_directory)
  call dein#begin(dein_installation_directory)

  "fb stuff
  call dein#add('phacility/arcanist')
  call dein#add('hhvm/vim-hack')
  "Basics
  call dein#add(dein_source_directory) " Let dein manage dein.
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('roxma/nvim-yarp')
	call dein#add('tpope/vim-eunuch')

  "Completions and Linting
  call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': 'bash install.sh' })
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax') " syntax source for deoplete
  call dein#add('w0rp/ale')
  call dein#add('tell-k/vim-autopep8')
  call dein#add('jiangmiao/auto-pairs')
	call dein#add('tpope/vim-surround') " selection surroundings
  call dein#add('scrooloose/nerdcommenter') " code commenting
  call dein#add('mileszs/ack.vim')
  "Visuals
  call dein#add('flazz/vim-colorschemes')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ap/vim-css-color') " CSS Vim color preview
	call dein#add('styled-components/vim-styled-components', { 'branch': 'main' })

  "Language-Specific (alphabetical by package-identifier)
  call dein#add('chr4/nginx.vim') " nginx configs
  call dein#add('mxw/vim-jsx') " JSX highlighter (depends on underlying JS highlighter)
  call dein#add('pangloss/vim-javascript') " JS highlighter ('official' dependency of vim-jsx)
  call dein#add('reasonml-editor/vim-reason-plus') " ReasonML syntax highlighting
  call dein#add('tpope/vim-rails')

  "FZF Fuzzy Search
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  "Markdown Preview
  call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
					\ 'build': 'cd app & yarn install' })

  call dein#end()
  call dein#save_state()
endif

"On startup, install not-installed plugins.
if dein#check_install()
  call dein#install()
endif

" Stuff from $ADMIN_SCRIPTS/.master.vimrc
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath

if !exists("g:fb_source_admin") | let g:fb_source_admin = 1 | endif

if $admin_scripts == ""
  let $admin_scripts = "/home/engshare/admin/scripts/vim"
endif

if $local_admin_scripts == ""
  let $local_admin_scripts = "/usr/facebook/ops/rc/"
endif

if g:fb_source_admin
   set runtimepath^=$local_admin_scripts/vim
   set runtimepath+=$local_admin_scripts/vim/after
endif

autocmd FileType php setlocal iskeyword+=:,-
autocmd FileType html set textwidth=0

"Manually sourcing fb scripts
source $local_admin_scripts/vim/plugin/hack.vim
source $admin_scripts/biggrep.vim
source $admin_scripts/filetype.vim
source $admin_scripts/gitgrep.vim
source $admin_scripts/omnicommit.vim
source $admin_scripts/php-doc.vim
source $admin_scripts/pyre.vim
source $admin_scripts/supertab.vim
source $admin_scripts/toggle_comment.vim

nnoremap \ :Ack!  \| sed -e 's:^www/::'<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
let g:ackprg = "tbgs"
let g:jsx_ext_required = 0 "jsx highlighting "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown Preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable
set termguicolors
set background=dark

let g:jellybeans_use_lowcolor_black = 1
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\              'ctermfg': 'Black', 'ctermbg': 'Yellow',
\              'attr': 'bold' },
\    'Comment': { 'guifg': 'cccccc' },
\}

let g:jellybeans_overrides = {
\    'MatchParen': { 'guifg': 'dd0093', 'guibg': '000000',
\                    'ctermfg': 'Magenta', 'ctermbg': '' },
\}
colorscheme jellybeans

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autopair Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
let g:AutoPairsShortcutJump = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'custom-lineinfo' ],
      \              [ 'custom-fileinfo' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'custom-lineinfo' ],
      \              [ 'custom-fileinfo' ] ],
      \ },
      \ 'component': {
      \   'custom-lineinfo': ' %3p%% ┃ %4l/%L :%3c',
      \ },
      \ 'component_function': {
      \   'custom-fileinfo': 'LightlineFileInfo',
      \   'readonly': 'LightlineReadonly',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ ],
      \ },
\ }

function! LightlineReadonly()
  return &readonly ? '∄' : ''
endfunction

function! LightlineFileInfo()
  let displayFiletype = &filetype !=# '' ? &filetype : 'no ft'
  return ' ' . displayFiletype . ' ┃  ' . &fileencoding . '[' . &fileformat . '] '
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_serverCommands = {
  \ 'reason': ['/Users/laujonat/reason-language-server/reason-language-server.exe'],
  \ }

let g:LanguageClient_hoverPreview = 'Never'

"Speed Improvements for Deoplete
let g:python3_host_prog = '/home/jjlau/.brew/homebrew/bin/python3'
let g:deoplete#enable_at_startup = 1

autocmd InsertEnter * call deoplete#enable()
augroup vimrc
   autocmd!
   autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

"Autocomplete and cycle from top-to-bottom of suggestions using <Tab>.
inoremap <expr><TAB> pumvisible() ? "\<c-n>" : "\<TAB>"

"<TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"<S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

"additional useful key-bindings
inoremap <expr><C-g>  deoplete#refresh()
inoremap <expr><C-e>  deoplete#cancel_popup()
inoremap <silent><expr><C-l>  deoplete#complete_common_string()

"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#cancel_popup() . "\<CR>"
endfunction

call deoplete#custom#option('camel_case', v:true)
call deoplete#custom#option('auto_complete_delay', 0)
call deoplete#custom#option('smart_case', v:true)
call deoplete#custom#option('min_pattern_length', 1)

call deoplete#custom#option('sources', {
      \ '_': ['tag', 'buffer', 'file', 'LanguageClient', 'syntax'],
      \ 'ruby': ['tag', 'solargraph', 'buffer', 'file', 'syntax'],
\})


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Autopep 8 Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autopep8_max_line_length=79
let g:autopep8_ignore="E501,W293,C0321"
let g:autopep8_disable_show_diff=0
let g:autopep8_on_save=1 " Autosave on save



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic Whitespace Trimming and Formatting (for select filetypes)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Kill any trailing whitespace on save.
if !exists("g:fb_kill_whitespace") | let g:fb_kill_whitespace = 1 | endif
if g:fb_kill_whitespace
  fu! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfu
  au FileType c,cabal,cpp,haskell,javascript,php,python,ruby,readme,tex,text,thrift
    \ au BufWritePre <buffer>
    \ :call <SID>StripTrailingWhitespaces()
endif

" Automatically load svn-commit template.
if !exists("g:fb_svn_template") | let g:fb_svn_template = 1 | endif
if g:fb_svn_template
  if $SVN_COMMIT_TEMPLATE == ""
    let $SVN_COMMIT_TEMPLATE = "$ADMIN_SCRIPTS/templates/svn-commit-template.txt"
  endif
  autocmd BufNewFile,BufRead svn-commit.*tmp :0r $SVN_COMMIT_TEMPLATE
endif

" Error log, hzhao's nemo.
if !exists("g:fb_hzhao_nemo") | let g:fb_hzhao_nemo = 1 | endif
if g:fb_hzhao_nemo
  set errorformat+=%.%#PHP:\ %m\ \(in\ %f\ on\ line\ %l\)%.%#,
    \%E%[0-9]%#.%m:%f?rev=%.%##L%l\ %.%#,%C%.%#
endif


" Hack
let g:hack#enable = 1
let g:hack#omnifunc=1

nnoremap <c-t> :HackSearch
cnoremap <c-t> <CR>:copen<CR><CR>

nnoremap <c-]> :HackGotoDef<CR>
nnoremap <silent> K :ALEHover<CR>
" Type `gd` to go to definition
nnoremap <silent> gd :ALEGoToDefinition<CR>
" Meta-click (command-click) to go to definition
nnoremap <M-LeftMouse> <LeftMouse>:ALEGoToDefinition<CR>

autocmd BufNewFile,BufRead *.php setl omnifunc=hackcomplete#Complete

let g:ale_linters = {'hack': ['hack', 'hhast']}
let g:ale_echo_msg_format = "[%linter%]%[ code]% %s"
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint', 'flow'],
\   'ruby': ['rubocop'],
\}
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
