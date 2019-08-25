" Basic
set shell=/bin/zsh
set belloff=all " Annoying bell off
set encoding=utf-8
set nocompatible " Set no compatible with vi

set ruler
set laststatus=2
set number
set hidden
set nocursorline
set lazyredraw
set title "Show the filename in the window title bar
set nostartofline "Make j/k respect the columns

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
set scrolloff=1
set sidescrolloff=5

set re=1 "Force the old regex engine on any version newer
set wildmenu
set wildmode=longest:full "<TAB> displayes longest match first

set shiftwidth=2
set softtabstop=2
set tabstop=2

set incsearch
set ignorecase
set smartcase

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_EI.="\e[1 q"

"Read/Write mappings
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>

" Pressing Ctrl-u deletes text you've typed in the current line
" Ctrl-w deletes the word before the cursor, both undoable.
" This adds Ctrl-g first to start a new change
inoremap <C-U> <C-G>u<C-U>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Clipboard Settings
noremap <Leader>y "*y
noremap <Leader>p "*p

" Uunset highlighting on matches
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Map buffer list
nnoremap <Leader>b :ls<CR>:b<Space>

" fzf fuzzy search
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" Autoreload external changes
au FocusGained,BufEnter * :checktime

" Session storage directories and viminfo
set viminfo='100,f1,<50,s10,h,n~/.config/nvim/viminfo
set backupdir=~/.config/nvim/.backup//
set directory=~/.config/nvim/.swap//

" Find snake_case - '+', '_' to convert
:nnoremap + /\w\+_<CR>
:nnoremap _ f_x~

"Execute %!python -m json.tool to format json
runtime! macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Update plugins with :call dein#update()
let dein_installation_directory = '~/.config/nvim/dein'
let dein_source_directory = dein_installation_directory . '/repos/github.com/Shougo/dein.vim'
let &runtimepath = &runtimepath . ',' . dein_source_directory

if dein#load_state(dein_installation_directory)
  call dein#begin(dein_installation_directory)

  "Basics
  call dein#add(dein_source_directory) " Let dein manage dein.
  call dein#add('roxma/vim-hug-neovim-rpc')
  call dein#add('roxma/nvim-yarp')
  call dein#add('tpope/vim-eunuch')

  "Completions and Linting
  call dein#add('autozimu/LanguageClient-neovim', { 'rev': 'next', 'build': 'bash install.sh' })
  call dein#add('Chiel92/vim-autoformat') " vim autoformat
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neco-syntax') " syntax source for deoplete
  call dein#add('w0rp/ale')
  call dein#add('tell-k/vim-autopep8')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround') " selection surroundings
  call dein#add('scrooloose/nerdcommenter') " code commenting

  "Visuals
  call dein#add('flazz/vim-colorschemes')
  call dein#add('itchyny/lightline.vim')
  call dein#add('ap/vim-css-color') " CSS Vim color preview
  call dein#add('styled-components/vim-styled-components', { 'branch': 'main' })

  "Language-Specific (alphabetical by package-identifier)
  call dein#add('chr4/nginx.vim') " nginx configs
  call dein#add('mxw/vim-jsx') " JSX highlighter (depends on underlying JS highlighter)
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'do': ':!install.sh \| UpdateRemotePlugins'})
  call dein#add('reasonml-editor/vim-reason-plus') " ReasonML syntax highlighting
  call dein#add('tpope/vim-rails')

  "FZF Fuzzy Search
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#end()
  call dein#save_state()
endif

"On startup, install not-installed plugins.
if dein#check_install()
  call dein#install()
endif

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

" Platform MacOs v1.7.1
" Default settings found in .vim/settings.json
let g:LanguageClient_serverCommands = {
  \ 'reason': ['$HOME/rls-macos/reason-language-server.exe'],
  \ }
let g:LanguageClient_hoverPreview = 'Never'

"Speed Improvements for Deoplete
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

autocmd InsertEnter * call deoplete#enable()
augroup vimrc
   autocmd!
   autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completions && Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Adding Deoplete additional key-bindings
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

let g:ale_typescript_tslint_ignore_empty_files = 0
let g:ale_typescript_tsserver_config_path = ''
let g:ale_typescript_tsserver_executable = 'tsserver'
let g:ale_typescript_tsserver_use_global = 0

let g:jsx_ext_required = 0 "jsx highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale Syntax & Language Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'tslint'],
\   'ruby': ['rubocop'],
\}
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
