" ============================================================================
" 轻量级 Vim 配置 - 适用于偶尔编辑脚本和配置文件
" ============================================================================
" 最后修改: 2026-03-13
" 说明: 此配置注释掉了重型编程插件,保留基本编辑功能
" ============================================================================

let mapleader=','

" ============================================================================
" 🚫 禁用的重型插件 (适合完整开发环境)
" ============================================================================

" -- neocomplete (需要 Vim+Lua 支持,重型补全)
" 问题: NeoVim 不支持,需要 Lua 编译支持
" 替代: 使用内置的 Ctrl-N/Ctrl-P 补全,或 NeoVim 的 nvim-cmp
" source $HOME/.vim/plugins/neocomplete.vim
let g:neocomplete#enable_at_startup = 0

" -- UltiSnips (需要 Python3 支持,代码片段引擎)
" 问题: 需要 Python3 编译支持
" 替代: 简单场景可用 vim-snippets + 手动补全
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"

" -- OmniCppComplete (C++ 重型补全)
" 仅在 C++ 开发时需要
" imap <C-]> <C-X><C-O>

" -- Tagbar/TagList (依赖 ctags,代码大纲)
" 轻量场景不需要代码结构浏览
" nmap <localleader>tb <ESC>:TagbarToggle<cr>
" let g:tagbar_width = 25

" -- cscope (代码导航,大型项目用)
" 偶尔编辑不需要
" if has('cscope')
"   set cscopetag cscopeverbose
" endif

" -- exUtility 系列插件 (exTagSelect, exGlobalSearch 等)
" 重型项目管理工具
" nnoremap <Leader>ts :ExtsSelectToggle<CR>

" -- vimwiki (个人 Wiki 系统)
" 如果不用来做笔记,可以禁用
" let g:vimwiki_list = [...]

" -- DoxygenToolkit (代码文档生成)
" 适合正式开发项目
" nnoremap <leader>cx :Dox<cr>

" -- dbext (数据库客户端)
" let g:dbext_default_type = 'mysql'

" -- FuzzyFinder (模糊查找,已被 ctrlp 替代)
" nnoremap <silent> <leader>ff :FufFile<CR>

" -- Command-T (需要编译 Ruby 扩展)
" let g:CommandTMatchWindowAtTop = 1

" -- vim-go (Go 语言开发)
" let g:go_snippet_engine = "neosnippet"

" -- evervim (Evernote 集成)
" let g:evervim_devtoken='...'


" ============================================================================
" ✅ 保留的轻量级插件
" ============================================================================

" -- NERDTree (文件浏览器 - 基础功能)
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter = 1
let NERDTreeShowHidden = 0
let NERDTreeWinSize = 31
" 不自动启动 NERDTree
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_synchronize_view = 0
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp', '\.git', '\.DS_Store']
let NERDTreeShowBookmarks=1

" -- ctrlp (模糊文件查找 - 轻量高效)
set wildignore+=*.swp,*.zip,*.tgz,*.tar.gz,*.pyc,*.o,*.obj,*.so
let g:ctrlp_map='<c-p>'
let g:ctrlp_working_path_mode = 'ra'
" 使用 ag 加速搜索 (如果安装了 ag)
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden 
                \ --ignore .git 
                \ --ignore .svn 
                \ --ignore .hg 
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""'
endif

" -- NERDCommenter (注释插件 - 基础必备)
" 保留默认快捷键: <leader>cc (注释), <leader>cu (取消注释)
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" -- vim-surround (快速编辑包围符号 - 轻量高效)
let g:surround_{char2nr('?')} = "<?php \r ?>"
let g:surround_{char2nr('!')} = "<!-- \r -->"
nmap <Leader>' ysiw'
nmap <Leader>" ysiw"
nmap <Leader>[ ysiw[

" -- EasyMotion (快速跳转 - 轻量高效)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
map <Leader><leader>w <Plug>(easymotion-w)
map <Leader><Leader>b <Plug>(easymotion-b)
map <Leader><leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>. <Plug>(easymotion-repeat)

" -- vim-easy-align (对齐插件 - 轻量)
vmap <Enter>   <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" -- BufExplorer (缓冲区浏览 - 轻量)
let g:BufExplorerDefaultHelp = 0
let g:BufExplorerReverseSort = 1
let g:BufExplorerShowRelativePath = 1

" -- Netrw (内置文件浏览器 - 无需额外插件)
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_liststyle = 1
let g:netrw_list_hide = "\.bak,\.pyc,\.o,\.so"
let g:netrw_browse_split = 2

" -- FencView (编码检测 - 处理中文文件很有用)
let g:fencview_autodetect=1
let g:fencview_checklines=20
nnoremap <leader>fv :FencView<cr>
nnoremap <leader>fu :exec "edit! ++enc=utf-8"<cr>
nnoremap <leader>fg :exec "edit! ++enc=gb18030"<cr>

" -- ShowMarks (可视化标记 - 轻量)
let g:showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let showmarks_ignore_type = "hqm"
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 0


" ============================================================================
" 🆕 推荐的轻量级替代方案
" ============================================================================

" 1. 代码补全
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" 使用内置补全即可,无需 neocomplete
" Ctrl-N: 向下查找补全
" Ctrl-P: 向上查找补全
" Ctrl-X Ctrl-L: 整行补全
" Ctrl-X Ctrl-F: 文件名补全
" Ctrl-X Ctrl-O: Omni 补全
set completeopt=menu,menuone,noselect
set complete=.,w,b,u,t,i

" 简单的 Tab 补全
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" 2. 文件导航
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" 使用 ctrlp 或内置命令:
" :e **/*pattern  - 模糊查找文件
" :find filename  - 查找并打开文件
" gf              - 跳转到光标下的文件
set path+=**

" 3. 代码搜索
" ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
" 使用 :grep 或 :vimgrep
" 推荐安装 ripgrep (rg) 或 ag 加速搜索
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
elseif executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
endif
set grepformat=%f:%l:%c:%m

" 快捷搜索当前单词
nnoremap <leader>g :grep <C-R><C-W><CR>
nnoremap <leader>G :grep 


" ============================================================================
" 语法高亮配置 (轻量级)
" ============================================================================

" PHP 语法
let PHP_removeCRwhenUnix = 1
let php_folding = 0
let php_sql_query = 1
let php_htmlInStrings = 1

" XML 自动折叠
let g:xml_syntax_folding = 1

" Shell 脚本高亮
let g:is_bash = 1


" ============================================================================
" 简单的代码片段 (无需 UltiSnips)
" ============================================================================

" Bash 脚本模板
autocmd BufNewFile *.sh 0r ~/.vim/templates/bash.sh

" Python 脚本模板  
autocmd BufNewFile *.py 0r ~/.vim/templates/python.py


" ============================================================================
" 其他保留的配置
" ============================================================================

let mapleader='\'

" vi: fdm=marker ts=2 sw=2 sts=2 et
