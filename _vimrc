" vim: filetype=vim

" neobundle.vim によるプラグイン管理

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

NeoBundle 'sudo.vim'

" 日本語ドキュメント
" インストールしても表示できない場合は以下を実行する
" :helptags ~/.vim/bundle/vimdoc-ja/doc
NeoBundle 'vim-jp/vimdoc-ja'

NeoBundle 'bling/vim-airline'
set laststatus=2

NeoBundle 'majutsushi/tagbar'

NeoBundle 'othree/eregex.vim'
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

NeoBundle 'thinca/vim-qfreplace'

NeoBundle 'tomasr/molokai'

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundleLazy 'vim-jp/cpp-vim', {
      \ 'autoload' : {'filetypes' : 'cpp'}
      \ }

NeoBundleLazy 'vim-erlang/vim-erlang-runtime'
NeoBundleLazy 'vim-erlang/vim-erlang-omnicomplete'
autocmd FileType erlang NeoBundleSource 'vim-erlang-complete', 'vim-erlang-omnicomplete'

NeoBundle 'jeroenbourgois/vim-actionscript'
au BufNewFile,BufRead *.as setf actionscript

NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundleLazy 'pangloss/vim-javascript',
    \ { 'autoload': { 'filetypes': ['javascript'] } }
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-scripts/mediawiki.vim'

NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {
\   '_': {
\     'runner': 'vimproc',
\     'runner/vimproc/updatetime': 60
\   },
\   'tex': {
\     'command': 'latexmk',
\     'exec': ['%c --gg -pdfdvi %s', 'open -ga /Applications/Skim.app %s:r.pdf']
\   }
\ }

call neobundle#end()

filetype plugin indent on " Required!

" Installation check.
NeoBundleCheck

" ここまで：neobundle.vim によるプラグイン管理

" マウスを有効にする
set mouse=a

" 編集
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

let g:tex_flavor = 'latex'

" 表示
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai

set wrap
set showcmd
set number
set ruler
set list
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set hlsearch "検索結果のハイライト。消すときは :nohl で。
" □や○があってもカーソル位置がずれないようにする
set ambiwidth=double
set wildmenu
syntax on

" 文字コード
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set nobomb
nnoremap ,U :set encoding=utf-8<CR>
nnoremap ,E :set encoding=euc-jp<CR>
nnoremap ,S :set encoding=cp932<CR>

" j、k ではカーソルを表示行で移動する。物理行移動は <C-n>、<C-p>。
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap j gj
nnoremap k gk

" カレントディレクトリ移動
command! CD call s:CDToFileDir()

function! s:CDToFileDir()
    lcd %:p:h
    pwd
endfunction
