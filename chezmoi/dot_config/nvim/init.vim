" Neovim 配置文件
" 兼容现有的 Vim 配置

" 设置 runtimepath 包含你的 Vim 配置目录（通过软链接 ~/.vim）
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after

" Neovim 特定设置
if has('nvim')
    " 禁用 neocomplete（Neovim 不支持）
    let g:loaded_neocomplete = 1
    
    " 使用真彩色（可选）
    " set termguicolors
    
    " Python3 支持（UltiSnips需要）
    if executable('python3')
        let g:python3_host_prog = exepath('python3')
    endif
    
    " 鼠标支持
    set mouse=a
endif

" 加载你的主 vimrc 文件
if filereadable(expand('~/workspace/my-conf/vimconfig/vimrc'))
    source ~/workspace/my-conf/vimconfig/vimrc
endif
