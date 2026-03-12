if 0 | endif
if has('vim_starting')
    if &compatible 
        set nocompatible 
    endif
endif

call plug#begin(expand('~/.vim/bundle/'))
filetype off

"""install vim-plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

""""""""""""""""""""""""""""""""""""""""""
"" plugins base functions
""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/L9'
Plug 'vim-scripts/cecutil'
Plug 'vim-scripts/tlib'
Plug 'vim-scripts/genutils'
Plug 'vim-scripts/DfrankUtil'


""""""""""""""""""""""""""""""""""""""""""
"" plugin for core edit
""""""""""""""""""""""""""""""""""""""""""
" -- add repeat.vim to make (.) works for cs,ds,ys
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'Lokaltog/vim-easymotion'

"Plug 'Align'
"replace algin
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

Plug 'dimasg/vim-mark'
Plug 'dkprice/vim-easygrep'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'

Plug 'mhinz/vim-grepper'



""""""""""""""""""""""""""""""""""""""""""
"" for auto complete
""""""""""""""""""""""""""""""""""""""""""
Plug 'ervandew/supertab'
"YCM can replace others
"Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/AutoComplPop'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/CmdlineComplete'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rizzatti/dash.vim'

Plug 'mattn/emmet-vim'
"textmate like snipptes AutoComplete plugins
"Plug 'xptemplate"
"Plug 'snipMate'
""Plugin 'ZenCoding.vim'
"" more powerful than zencoding written in python
"Plug "rstacruz/sparkup" {'rtp' : 'vim/'}
Plug 'vim-scripts/word_complete.vim'


""""""""""""""""""""""""""""""""""""""""""
"" for filetype 
""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/plasticboy/vim-markdown'
Plug 'vim-scripts/xml.vim'
Plug 'vim-scripts/JSON.vim'
Plug 'fatih/vim-go'
"android development plugin for vim 
"
" android development
Plug 'hsanson/vim-android' 
let g:android_adb_tool=$ANDROID_HOME"/platform-tools/adb"
Plug 'artur-shaik/vim-javacomplete2' 
Plug 'airblade/vim-rooter' 


"Plug 'shawncplus/phpcomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
"Plug 'm2mdas/phpcomplete-extended'
Plug 'spf13/PIV'

"" -- web
Plug 'vim-scripts/JavaScript-Indent'
Plug 'vim-scripts/vim-less'
Plug 'kchmck/vim-coffee-script'
"Plug 'jslint.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/haml.zip'
Plug 'vim-scripts/jsbeautify'

"" -- php
"Plug 'tagbar-phpctags'

"" -- python
"Plug 'vim-django'
""Plugin 'kevinw/pyflakes-vim'
Plug 'vim-scripts/indentpython.vim'




""""""""""""""""""""""""""""""""""""""""""
"" network tools 
""""""""""""""""""""""""""""""""""""""""""
"NeoBundle 'UltraBlog'
" -- edit encrypted files
Plug 'vim-scripts/openssl.vim'
Plug 'vim-scripts/calendar.vim'
"Plug 'vimwiki'
Plug 'vim-scripts/TxtBrowser'


""""""""""""""""""""""""""""""""""""""""""
"" for coding
""""""""""""""""""""""""""""""""""""""""""
" -- commentary.vim to replace nerd-commenter
Plug 'scrooloose/syntastic'
"Plug 'camelcasemotion'
"use tagbar to replace taglist
Plug 'majutsushi/tagbar'
"Plug 'xolox/vim-easytags'
Plug 'oepn/vim-easytags' " fix dectection for universe-ctags
Plug 'xolox/vim-misc'

"Plug 'chazy/cscope_maps'
"Plug 'camelcasemotion'
Plug 'vim-scripts/FencView.vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'tpope/vim-fugitive'
"括号显示增强
Plug 'masukomi/rainbow_parentheses.vim'
Plug 'xuhdev/SingleCompile'
Plug 'bling/vim-airline'
Plug 'metakirby5/codi.vim'


""""""""""""""""""""""""""""""""""""""""""
"" comment, doxygen {{{
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
"" }}}


""""""""""""""""""""""""""""""""""""""""""
"" for vim native settings
""""""""""""""""""""""""""""""""""""""""""
Plug 'Lokaltog/vim-powerline'
Plug 'vim-scripts/Vimball'


""""""""""""""""""""""""""""""""""""""""""
"" for file management and  orgnization
""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/netrw.vim'
" -- user ctrlp to replace FuzzyFinder
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/FuzzyFinder'

"Plug 'vim-scripts/Command-T'
Plug 'scrooloose/nerdtree'
Plug 'danro/rename.vim'
Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'danro/rename.vim'

"project
Plug 'reedboat/project.tar.gz'
Plug 'vim-scripts/Proj'

""""""""""""""""""""""""""""""""""""""""""""""""""
" test
""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'kakkyz81/evervim' " Requires python support
" 快速启用/禁用 箭头/hjkl/pageuppagedown/
"Plug 'wikitopian/hardmode' 
Plug 'takac/vim-hardtime' 
Plug 'Shougo/vimshell.vim'



""""""""""""""""""""""""""""""""""""""""""""""""""
" color
""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'thinkpixellab/flatland'


""""""""""""""""""""""""""""""""""""""""""""""""""
" color
""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/trending?l=vim&since=weekly
"https://github.com/search?q=stars%3A200+stars%3A%3E200&type=Repositories&ref=advsearch&l=VimL"
"Plug 'christoomey/vim-tmux-navigator'



call plug#end()
filetype plugin indent on

" vim: fdm=marker
