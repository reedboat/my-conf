set number
set history       =400
set ignorecase
set tags           +=tags;
set sessionoptions -=curdir
set sessionoptions +=sesdir
"set cul

filetype plugin indent on
set autoindent
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set smarttab
set smartindent

set hidden
set encoding=utf8
set fileencodings=utf-8,gb2312,ucs-bom,cp936,big5,latin1
" termencoding 在 NeoVim 中不支持,已废弃
if !has('nvim')
    set termencoding=utf-8
endif
set laststatus=2
set cmdheight=2
"set acd
set foldmethod=syntax
set foldlevel=6
set foldcolumn=0
set fileformat=unix
set fileformats=unix,dos,mac

set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
set wildmenu
set wildmode=list:longest,full
set path+=$HOME/workspace/,
set relativenumber
