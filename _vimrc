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

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'majutsushi/tagbar'

NeoBundle 'othree/eregex.vim'
nnoremap / :M/
nnoremap ? :M?
nnoremap ,/ /
nnoremap ,? ?

NeoBundle 'thinca/vim-qfreplace'

NeoBundle 'tomasr/molokai'

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle "scrooloose/syntastic"
NeoBundle 'ngmy/vim-rubocop'

NeoBundleLazy 'vim-jp/cpp-vim', {
      \ 'autoload' : {'filetypes' : 'cpp'}
      \ }

if executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '--std=c++11 --stdlib=libc++'
  let g:quickrun_config = {}
  let g:quickrun_config['cpp/clang++11'] = {
        \ 'cmdopt': '--std=c++11 --stdlib=libc++',
        \ 'type': 'cpp/clang++'
        \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
endif

NeoBundleLazy 'vim-erlang/vim-erlang-runtime'
NeoBundleLazy 'vim-erlang/vim-erlang-omnicomplete'
autocmd FileType erlang NeoBundleSource 'vim-erlang-complete', 'vim-erlang-omnicomplete'

NeoBundle 'elixir-lang/vim-elixir'

NeoBundle 'jeroenbourgois/vim-actionscript'
au BufNewFile,BufRead *.as setf actionscript

NeoBundle 'othree/html5.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundleLazy 'pangloss/vim-javascript',
    \ { 'autoload': { 'filetypes': ['javascript'] } }
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-scripts/mediawiki.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

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

NeoBundle 'lambdalisue/vim-gista', {
    \ 'depends': [
    \    'Shougo/unite.vim',
    \    'tyru/open-browser.vim',
    \]}
let g:gista#github_user = 'ochaochaocha3'

NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'mattn/jscomplete-vim'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  "   endfunction
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

call neobundle#end()

filetype plugin indent on " Required!

" Installation check.
NeoBundleCheck

" ここまで：neobundle.vim によるプラグイン管理

" マウスを有効にする
set mouse=a
set ttymouse=xterm2

" 編集
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set cinoptions=:0,g0,(1s,m1,j1,J1
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

" クリップボードを使用可能にする
set clipboard=unnamed

" カレントディレクトリ移動
command! CD call s:CDToFileDir()

function! s:CDToFileDir()
    lcd %:p:h
    pwd
endfunction
