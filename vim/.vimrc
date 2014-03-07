set nocompatible
syntax on

let $vim=$HOME 
let $php=system("whereis -b php|awk '{print $2}'")
let $ctags='/usr/bin/ctags'
let $tmp='/tmp'


""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=$HOME/.vim/bundle/vundle/ 
call vundle#rc()
Bundle 'gmarik/vundle'
source $HOME/.vim/config/bundle.vim
source $HOME/.vim/config/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""


source $HOME/.vim/config/base.vim
source $HOME/.vim/config/keymapping.vim
source $HOME/.vim/config/aucmd.vim
source $HOME/.vim/config/functions.vim
source $HOME/.vim/config/abbreviation.vim


""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
set background=dark
colorscheme solarized




""""""""""""""""""""""""""""""""""""""""""""""""""
" project
""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable($HOME . "/project.vim")
    source $HOME/project.vim
endif
""""""""""""""""""""""""""""""""""""""""""""""""""
