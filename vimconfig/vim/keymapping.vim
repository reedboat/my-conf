" Last Change: 2009-06-28 00:08:09

if exists("g:loaded_keymapping")
    finish
endif
let g:loaded_keymapping = "v100" 

" mapleader setting
if !exists("mapleader")
    let oldleader='\'
    let mapleader=','
else
    let oldleader=mapleader
    let mapleader=','
endif

" Buffers {{{
nnoremap <silent> <leader>bp :bprev<cr>
nnoremap <silent> <leader>bn :bnext<cr>
nnoremap <silent> <leader>bl :blast<cr>
nnoremap <silent> <leader>bf :bfirst<cr>
nnoremap <silent> <leader>b3 :b #<cr>
nnoremap <silent> <leader>bd :bdelete<cr>
" }}}

" Windows {{{
" NeoVim 已经默认映射了 Ctrl-L 用于清屏，所以跳过它
if !has('nvim')
    nnoremap <unique> <c-l> <C-W><Right>
endif
nnoremap <unique> <c-k> <C-W><Up>
nnoremap <unique> <c-j> <C-W><Down>
nnoremap <unique> <c-h> <C-W><Left>
nnoremap <unique> <leader>wl <C-W><Right>
nnoremap <unique> <leader>wk <C-W><Up>
nnoremap <unique> <leader>wj <C-W><Down>
nnoremap <unique> <leader>wh <C-W><Left>
" }}}


" Tabs {{{
nnoremap <leader>tn   :tabnew <CR>
nnoremap g0 :tabfirst <cr>
nnoremap g$ :tablast <cr>
" }}}


" Quickfix {{{
nnoremap <silent> <leader>ms :w<cr>:make %<cr>
nnoremap <silent> <leader>qo :cw<cr>
nnoremap <silent> <leader>ql :cl<cr>
nnoremap <silent> <leader>qn :cn<cr>
nnoremap <silent> <leader>qp :cp<cr>

" }}}


" Paths & File
cnoremap d <c-r>=expand('%:p:h').'/'<cr>
cnoremap p <c-r>=expand('%:p')<cr>

nnoremap <leader>cd   :lcd %:p:h<CR>
"nnoremap gf :e <c-r><c-f><cr>


" special files {{{
nnoremap <silent> <leader>rc :call SwitchToBuf($HOME."/.vimrc")<cr>
nnoremap <silent> <leader>erb :call SwitchToBuf($vim."/config/bundle.vim")<cr>
nnoremap <silent> <leader>erk :call SwitchToBuf($vim."/config/keymapping.vim")<cr>
nnoremap <silent> <leader>erp :call SwitchToBuf($vim."/config/plugin.vim")<cr>
nnoremap <silent> <leader>erh :call SwitchToBuf($vim."/config/help.md")<cr>
nnoremap <silent> <leader>es :call SwitchToBuf($tmp.'/scratch.txt')<cr>
nnoremap <silent> <leader>ec :call SwitchToBuf($HOME.'/cheatsheet.md')<cr>
" }}}

"golang
nnoremap <silent> <leader>gor :GoRun<cr>
nnoremap <silent> <leader>gob :GoBuild<cr>
nnoremap <silent> <leader>got :GoTest<cr>


nnoremap <silent> <leader>nu :call ToogleOption('nu')<cr>
nnoremap <silent> <leader>li :call ToogleOption('list')<cr>
nnoremap <silent> <leader>sw <esc>:set wrap! <cr>0
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>


" vertically split and generate a previewwindow
"map <leader>w :vert split . \| wincmd p \| set previewwindow \| wincmd p \|
":vert resize 15 \| exec "normal m"<cr>



" Save & Exit {{{
nnoremap <leader>qf  :q!<cr>
nnoremap <leader>qa  :qa<cr>
nnoremap <leader>wf  :w!<cr>
nnoremap <leader>zz :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>n :new<cr>
" }}}


" Search
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


" Spell check
nnoremap <leader>sc :setl spell spelllang=en_us

" Search in Files
nnoremap <leader>gr :grep <cword> *<cr>   
nnoremap <leader>Gr :grep <cword> %:p:h/*<cr>   
nnoremap <leader>gR :grep \b<cword>\b *<cr>
nnoremap <leader>GR :grep \b<cword>\b %:p:h/*<cr>





vnoremap <unique> < <gv
vnoremap <unique> > >gv

" Move
cnoremap <m-b> <s-Left>
cnoremap <m-f> <s-Right>

" map Up & Down to gj & gk, helpful for wrap text edit
noremap <unique> <Up> gk
noremap <unique> <Down> gj

" CamelCase
nnoremap <leader>gu gUw



" make and run
nnoremap <Leader>mk :make<cr>

" encode

" paste
nnoremap <Leader>pa :set paste<cr>
nnoremap <Leader>np :set nopaste<cr>


""diff
nnoremap <Leader>dt :diffthis<cr>
nnoremap <Leader>do :diffoff <cr>


nmap <S-CR> O<Esc>j
nnoremap Y y$
nnoremap j gj
cmap w!! %!sudo tee > /dev/null %
" use very magic pattern
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
inoremap jk <esc>
inoremap kj <esc>
cnoremap %s/ %s/\v
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap ,hp :help<space> 
nnoremap ,hw :help<space><c-r><c-w>

nnoremap <Leader>ss :SCCompile<cr>
nnoremap <Leader>sr :SCCompileRun<cr>


command W w !sudo tee % > /dev/null


let mapleader=oldleader

vnoremap <c-insert> "*y
vnoremap cp         "*y
vnoremap <bs>  x

nmap + <c-a>
nmap - <c-x>

"" disable arrows
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>


nmap \ ,

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" vim: fdm=marker ts=4 sw=4
