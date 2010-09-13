" Last Change: 2009-06-12 18:40:48
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Auto Commands 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示 
if('g:autocmd_loaded')
    finish
endif 
let g:autocmd_loaded = 1
if has("autocmd") 
    "delete all autocmd for redefine
    au BufNewFile,BufRead *.plan                    setf plan
    autocmd FileType xml,html,js,css,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby,as,mxml setlocal number 
    autocmd FileType xml,html,php vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o--> 
    autocmd BufRead,BufNewFile *.tpl let g:snippetsEmu_key = "<C-S-Tab>" |
                                    \ setlocal filetype=html
    autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100 
    autocmd BufReadPost * 
                \ if line("'\"") > 0 && line("'\"") <= line("$") | 
                \ exe "normal g`\"" |               
                \ endif
" php autocmd 
    
    autocmd BufRead,BufNewFile *.php 
               \ setlocal makeprg     =/usr/bin/php\ -l\ -d\ html_errors=off\ -f\ %:p |
               \ setlocal errorformat =%m\ in\ %f\ on\ line\ %l |
               "\ setlocal tags       +=$vim/vimfiles/tags/phpunit,$vim/vimfiles/tags/zf |
               "\ setlocal tags       +=$vim/vimfiles/tags/zf |
               "\ setlocal equalprg    =phpCB\ --space-after-switch\ --space-after-while\ --space-after-if\ --space-after-start-bracket\ --space-before-end-bracket\ --space-before-start-angle-bracket\ --space-after-end-angle-bracket\ --extra-padding-for-case-statement\ --change-shell-comment-to-double-slashes-comment\ --force-large-php-code-tag\ --force-true-false-null-contant-lowercase\ --align-equal-statements\ --comment-rendering-style\ PEAR\ --equal-align-position\ 50\ --padding-char-count\ 4 |
    autocmd BufRead,BufNewFile *.as,*.mxml compiler flex |
                \ nnoremap ,mk :!start mxmlc %
    autocmd BufRead,BufNewFile *.as setlocal filetype=actionscript
    autocmd BufRead,BufNewFile *.mxml setlocal filetype=mxml |
                \ nnoremap ,ns :%s/<\/\?\zs\(mx:\)\@!\(\w\+\)\ze/mx:\2/g<CR>

    autocmd BufRead,BufNewFile *.phtml set filetype=php
" xml autocmd
    autocmd BufRead,BufNewFile *.xml,*.mxml
                \ exe 'setlocal equalprg =tidy\ -imq\ -raw\ -xml\ -f\ ' . &errorfile
" html autocmd
    autocmd BufRead,BufNewFile *.html
                \ exe 'setlocal equalprg =tidy\ -imq\ -raw\ -asxhtml\ -f\ ' . &errorfile |
                \ setlocal omnifunc=htmlcomplete#CompleteTags
    " About FileType autocmd BufEnter * call CHANGE_CURR_DIR() " same as ":set autochdir"
    autocmd BufRead,BufNewFile *.c,*.cpp compiler gcc
    autocmd BufRead,BufNewFile *.tcl  compiler tcl
    autocmd BufRead,BufNewFile *.java compiler javac |
      \ setlocal omnifunc=javacomplete#CompleteParamsInfo
      "\ setlocal omnifunc=javacomplete#Complete


    autocmd BufRead,BufNewFile *.viki setlocal filetype=viki |
      \ setlocal makeprg=$vim/program/deplate/deplate\ -m\ lang-zh_CN-autospace\ -c\ code\ -X\ %
    "autocmd BufWritePre,FileWritePre [._]vimrc ks|call LastModified()|'s
    au BufRead,BufNewFile *.js set ft=javascript.jquery

    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP


endif " has("autocmd") 