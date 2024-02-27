set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'tabnine/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lifepillar/vim-solarized8'
" Plugin 'fisadev/vim-isort'
Plugin 'preservim/nerdtree'
" Plugin 'sainnhe/sonokai'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'ghifarit53/tokyonight-vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'voldikss/vim-floaterm'

"Locate powerline
"source /usr/local/lib/python3.8/site-packages/powerline/bindings/vim/plugin/powerline.vim
"source /Users/joycechin/.local/lib/python3.8/site-packages/powerline/bindings/vim/plugin/powerline.vim

" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ale_python_flake8_options = '--max-line-length=110' 
map <C-M> :w<CR> :!clear; make<CR> 
set termguicolors
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
set number relativenumber
set runtimepath^=~/.vim/bundle/ctrlp.vim
set laststatus=2
set backspace=indent,eol,start
set wrap
set linebreak
syntax enable
" auto read file while file change outside vim
set autoread
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

"indent {
  " auto indent on different type
  filetype indent on
  set autoindent
  set smartindent
  " copy indent from last line
  set copyindent
"}

"vim theme
set background=dark
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 0
" colorscheme tokyonight
hi linenr guifg=#FFFBAC

" tab {
    " use space to replace tab
    set expandtab       
    " 4 space while hit tab
    set softtabstop=4 
    set tabstop=4
    " 4 space while auto indent
    set shiftwidth=4
    " set 2 space on these file type
    autocmd FileType html setlocal ts=2 sts=2 sw=2
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2
" }

" current line {
    " show current position, ex 34, 56
    set ruler
    " show current line
    set cursorline
" }

" search {
   " highlight the search, it is default, comment this line is ok
    set hlsearch
    set incsearch
" }

" mouse {
    " let mouse can use in vim
    set mouse=a
" }

" sound {
    " set visual bell
    set visualbell
    " disable beep
    set t_vb=
" }

"some useful mapping
    "let mapleader = "\\"
    " for vimrc {
        " reload vimrc
        nnoremap <leader>r :so $MYVIMRC<CR>:noh<CR>
        " open vimrc vertical
        nnoremap <leader>v :vsplit $MYVIMRC<CR>
    " }
" }

" vim airline configuration
" {
    let g:airline_powerline_fonts = 1
    let g:airline_layout = 'powerline'
    "let g:airline_theme = 'base16_gruvbox_dark_hard'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
" }

" toggle terminal
" {
    nnoremap   <silent>   <Space>n    :FloatermNew<CR>
    tnoremap   <silent>   <Space>n    <C-\><C-n>:FloatermNew<CR>
    nnoremap   <silent>   <Space><Left>    :FloatermPrev<CR>
    tnoremap   <silent>   <Space><Left>    <C-\><C-n>:FloatermPrev<CR>
    nnoremap   <silent>   <Space><Right>    :FloatermNext<CR>
    tnoremap   <silent>   <Space><Right>    <C-\><C-n>:FloatermNext<CR>
    nnoremap   <silent>   <Space>j   :FloatermToggle<CR>
    tnoremap   <silent>   <Space>j   <C-\><C-n>:FloatermToggle<CR>
    nnoremap   <silent>   <Space>x   :FloatermKill<CR>
    tnoremap   <silent>   <Space>x   <C-\><C-n>:FloatermKill<CR>
" }


let g:ale_enabled = 1
let g:ale_fixers = ["autopep8", 'isort', "remove_trailing_lines", 'trim_whitespace']
let g:ale_linters = {
      \   'python': ['flake8'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fix_on_save = 0
let g:ale_python_flake8_options = '--ignore=E402 --max-line-length=140'

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_clear_cache_on_exit = 0

" python3 import sys
" sys.path.append("/home/gridsan/mnadeem/anaconda3/lib/python3.7/site-packages")
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
set showtabline=2 " Always display the tabline, even if there is only one tab
nnoremap <F9> :!%:p<Enter><Enter>
set iskeyword-=_

" autocomplete
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" mapping
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap {<Cr> {<Cr>}<Esc>ko
inoremap /*<Cr> /*<Cr>*/<Esc>ko
inoremap {{ {}<ESC>i

"NerdCommenter setting
map <C-\> <plug>NERDCommenterToggle

"NerdTree setting
nnoremap <C-b> :NERDTreeToggle<CR>
autocmd BufEnter NERD_tree_* | execute 'normal R'


"buffer setting
map <S-Tab> :bnext<CR>
