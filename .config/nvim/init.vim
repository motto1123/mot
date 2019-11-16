"######################################################################
" main
"######################################################################

" ------------------------------------------------------------
"  key bind
" ------------------------------------------------------------
"行番号設定
set number
" コードの色分け
syntax on 
"検索のハイライト表示"
set hlsearch 
" タブをスペース4つに
set noautoindent
set smartindent
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
" ymlの時は2つ分
set shiftwidth=2
set tabstop=2
" 全角スペースをハイライトする設定
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" ------------------------------------------------------------
"  color scheme
" ------------------------------------------------------------
colorscheme peachpuff

" ------------------------------------------------------------
"  NERDTree
" ------------------------------------------------------------
"ctrl+yでNERDTreeを開く
nnoremap <silent><C-y> :NERDTreeToggle<CR>
"引数なしでvimを開いたらNERDTreeを起動、引数ありならNERDTreeは起動しないように
let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
endif

" 表示幅
let g:NERDTreeWinSize=50
" " ブックマークを表示
let g:NERDTreeShowBookmarks=1
" 親ディレクトリへ移動
let g:NERDTreeMapUpdir=''
" " ファイルの開き方
" let g:NERDTreeMapOpenSplit='<C-j>'
" let g:NERDTreeMapOpenVSplit='<C-l>'
" " ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1
" " 隠しファイルを表示
let g:NERDTreeShowHidden=1
" " 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
" " NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

" ------------------------------------------------------------
"  補完・履歴・コピー
" ------------------------------------------------------------

" argdo などファイル一括変換で「保存していない」から処理が止まる問題を解消
set hidden
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000
"y で自動的にクリップボードへ
set clipboard+=unnamed

" vimでペーストするときインデントさせない
"（注意 このコマンドはキーマッピングを完全に無効化するので基本的に使わない.）
" webサイトなどからコピーして，normal mode で一度Pasteを使ってペースト，
" その後 p を押せば問題なくコピーできる．
" set paste

" ------------------------------------------------------------
"  動作環境との統合関連の設定
" ------------------------------------------------------------

" vimshell がうまく入らない
"" vimshell の文字化け関連 言語　日本語
"let g:vimshell_interactive_encodings = {
"      \'/':'utf-8-mac',
"      \}
"let g:vimshell_user_prompt = 'iconv(fnamemodify(getcwd(),":~"),"utf-8-mac","char")'
 
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
" set clipboard=unnamed,unnamedplus


"007 のやつ　８進数を10進数へ"
set nrformats= 
" マウスの入力を受け付ける
set mouse=a

"######################################################################
" keymap
"######################################################################

"==============================
" file 操作
"==============================

" vimgrep のショートカット
nnoremap M :cprevious<CR>   " 前へ
nnoremap m :cnext<CR>       " 次へ
nnoremap <Leader>q :<C-u>cfirst<CR> " 最初へ
nnoremap <Leader>Q :<C-u>clast<CR>  " 最後へ

" バッファリストのショートカット
nnoremap <Leader>b :<C-u>bfirst<CR> " 最初へ
nnoremap <Leader>B :<C-u>blast<CR>  " 最後へ

" ctag jump タグジャンプのショートカット 
" (!ctags -Rでタグファイルを作成すること)
nnoremap T :tprevious<CR>   " 前へ
nnoremap t :tnext<CR>       " 次へ
nnoremap <Leader>t :<C-u>tfirst<CR> " 最初へ
nnoremap <Leader>T :<C-u>tlast<CR>  " 最後へ

nnoremap <Space>] g<C-]>1<CR>
nnoremap <Space>j :<C-u>tjump<Space>

nnoremap <Space>a :<C-u>args
nmap <Space>b :ls<CR>:buf

" Ctrl+hjklでウィンドウ間の移動ができる 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"
" open file (use <Leader>)
"

let mapleader=","
" ,v でvimrcを開く
nmap <Leader>v :edit $MYVIMRC<CR>
nmap <Leader>k :edit $MYVIMRCSUB/.vimrc_keymap<CR>
nmap <Leader>z :edit ~/.zshrc<CR>
nmap <Leader>p :edit $PYTHON_PROGRAM/ParallelProcess.py<CR>
nmap <Leader>c :edit $PYTHON_PROGRAM/func/my_cython_func.pyx<CR>
nmap <Leader>s :edit $PYTHON_PROGRAM/my_setting.py<CR>

"==============================
" movement key
"==============================
" 折り返し行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 入力モードで矢印キーでカーソル移動
inoremap <C-B> <Left>
inoremap <C-F> <Right>

"###大きくジャンプするやつ
noremap <S-h>   ^
noremap <S-l>   $
"上下の空白行を移動
noremap <S-j>   }
noremap <S-k>   {
"かっこをジャンプ かっこだから頭文字でk
noremap <Space>k  %


"行末までのヤンク Y
nnoremap Y y$
"数字のインクリメント、デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

"==============================
"コマンドモード(use <Space>)
"==============================

nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Leader>q  :<C-u>qa<CR>


"c言語コンパイル
":make
nnoremap <Leader>m :<C-u>w<CR>:<C-u>make<CR>:<C-u>cope<CR><CR>
nnoremap <Space>m :<C-u>w<CR>:<C-u>QuickRun make<CR>:<C-u>cope<CR><CR>
" Quick fix list を消す
nnoremap <Space>f :<C-u>ccl<CR>

":shell
"ちなみにshellを抜ける時はexit か <C-d>
nnoremap <Space>s :<C-U>shell<CR>
"ターミナルに移動したり、vimに戻ったりする ( fg<CR> : go back to vim )
nnoremap <Space>z <C-z>

"==でインデント整理
nnoremap == gg=G''

" インサートモードの時に C-j でノーマルモードに戻る
"imap <C-l> <ESC> 

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" jjでエスケープ
inoremap <silent> jj <ESC>
"inoremap <silent> jj <C-[>

" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>

" aaでかっこを抜ける
inoremap <silent> <C-e> <ESC>A
inoremap <silent> <C-a> <ESC>I


inoremap " ""<LEFT>
inoremap ' ''<LEFT>


" //で\
inoremap <silent> kk \



"==============================
" 検索
"==============================
"
" http://deris.hatenablog.jp/entry/2013/05/15/024932
"コマンドモード(use <Space>) very magic を有効にする
nnoremap /  /\v




set autoindent
set splitright
set clipboard=unnamed
set hls



set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

:command UP UpdateRemotePlugins




let g:jedi#completions_command = "<C-G>"

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_completion_start_length = 1
"
"
"let g:deoplete#sources#jedi#server_timeout=100
"let g:deoplete#sources#jedi#statement_length=100
" jedi本体の補完は切る（deoplete-jediで非同期処理をしてくれるため）
"let g:jedi#completions_enabled = 0



"==============================
" file 操作
"==============================

" vimgrep のショートカット
nnoremap M :cprevious<CR>   " 前へ
nnoremap m :cnext<CR>       " 次へ
nnoremap <Leader>q :<C-u>cfirst<CR> " 最初へ
nnoremap <Leader>Q :<C-u>clast<CR>  " 最後へ

" バッファリストのショートカット
nnoremap <C-p> :bprevious<CR>   " 前へ
nnoremap <C-n> :bnext<CR>       " 次へ
nnoremap <Leader>b :<C-u>bfirst<CR> " 最初へ
nnoremap <Leader>B :<C-u>blast<CR>  " 最後へ

" ctag jump タグジャンプのショートカット 
" (!ctags -Rでタグファイルを作成すること)
nnoremap T :tprevious<CR>   " 前へ
nnoremap t :tnext<CR>       " 次へ
nnoremap <Leader>t :<C-u>tfirst<CR> " 最初へ
nnoremap <Leader>T :<C-u>tlast<CR>  " 最後へ

nnoremap <Space>] g<C-]>1<CR>
nnoremap <Space>j :<C-u>tjump<Space>

nnoremap <Space>a :<C-u>args
nmap <Space>b :ls<CR>:buf

"
" open file (use <Leader>)
"

let mapleader=","
" ,v でvimrcを開く
nmap <Leader>v :edit $MYVIMRC<CR>
nmap <Leader>k :edit $MYVIMRCSUB/.vimrc_keymap<CR>
nmap <Leader>z :edit ~/.zshrc<CR>
nmap <Leader>p :edit $PYTHON_PROGRAM/ParallelProcess.py<CR>
nmap <Leader>c :edit $PYTHON_PROGRAM/func/my_cython_func.pyx<CR>
nmap <Leader>s :edit $PYTHON_PROGRAM/my_setting.py<CR>

"==============================
" movement key
"==============================
"かっこをジャンプ かっこだから頭文字でk
noremap <Space>k  %


"行末までのヤンク Y
nnoremap Y y$
"数字のインクリメント、デクリメント
nnoremap + <C-a>
nnoremap - <C-x>

"==============================
"コマンドモード(use <Space>)
"==============================

nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Leader>q  :<C-u>qa<CR>


"c言語コンパイル
":make
nnoremap <Leader>m :<C-u>w<CR>:<C-u>make<CR>:<C-u>cope<CR><CR>
nnoremap <Space>m :<C-u>w<CR>:<C-u>QuickRun make<CR>:<C-u>cope<CR><CR>
" Quick fix list を消す
nnoremap <Space>f :<C-u>ccl<CR>

":shell
"ちなみにshellを抜ける時はexit か <C-d>
nnoremap <Space>s :<C-U>shell<CR>
"ターミナルに移動したり、vimに戻ったりする ( fg<CR> : go back to vim )
nnoremap <Space>z <C-z>

"==でインデント整理
nnoremap == gg=G''

" インサートモードの時に C-j でノーマルモードに戻る
"imap <C-l> <ESC> 

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" jjでエスケープ
inoremap <silent> jj <ESC>
"inoremap <silent> jj <C-[>

" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>

" aaでかっこを抜ける
inoremap <silent> <C-e> <ESC>A
inoremap <silent> <C-a> <ESC>I


inoremap " ""<LEFT>
inoremap ' ''<LEFT>


" //で\
inoremap <silent> kk \



"==============================
" 検索
"==============================
"
" http://deris.hatenablog.jp/entry/2013/05/15/024932
"コマンドモード(use <Space>) very magic を有効にする
nnoremap /  /\v

call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('thinca/vim-quickrun')
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
\       "runner/vimproc/updatetime" : 10,
\       "outputter/buffer/close_on_empty" : 1,
\ }

" :QuickRun make
" で make する
" outputter や runner はお好みで
let g:quickrun_config = {
\   "make" : {
\       "command"   : "make",
\       "exec" : "%c %o",
\       "outputter" : "error:buffer:quickfix",
\       "runner" : "vimproc",
\   },
\}
" 自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

" make, grep などのコマンド後に自動的にQuickFixを開く
" autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen


"let g:quickrun_config = get(g:, 'quickrun_config', {})
"let g:quickrun_config._ = {
"      \ 'runner'    : 'vimproc',
"      \ 'runner/vimproc/updatetime' : 60,
"      \ 'outputter' : 'error',
"      \ 'outputter/error/success' : 'buffer',
"      \ 'outputter/error/error'   : 'quickfix',
"      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
"      \ 'outputter/buffer/close_on_empty' : 1,
"      \ } 

"let g:quickrun_config={'*': {'split': ''}}
"let g:quickrun_config._={ 'runner':'vimproc',
"\       "runner/vimproc/updatetime" : 10,
"\       "outputter/buffer/close_on_empty" : 1,
"\ }
""""
"""let g:quickrun_config = {
"""\   "_" : {
"""\       "runner" : "vimproc",
"""\       "runner/vimproc/updatetime" : 10,
"""\       "outputter/buffer/close_on_empty" : 1,
"""\   },
"""\}
""
"""
"""
"""
"" :QuickRun make
"" で make する
"" outputter や runner はお好みで
"let g:quickrun_config = {
"\   "make" : {
"\       "command"   : "make",
"\       "exec" : "%c %o",
"\       "outputter" : "error:buffer:quickfix",
"\       "runner" : "vimproc",
"\   },
"\}
"
"
"
""let g:quickrun_config = {
""\   "_" : {
""\       "outputter/buffer/split" : ":botright",
""\       "outputter/buffer/close_on_empty" : 1
""\   },
""\}
""
""" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
""" updatetime が一時的に書き換えられてしまうので注意して下さい
""let g:quickrun_config = {
""\   "_" : {
""\       "runner" : "vimproc",
"\       "runner/vimproc/updatetime" : 60
"\   },
"\}















" python 補完関係
"
"let g:syntastic_python_checkers = ['pyflakes', 'pep8']


"call dein#add('scrooloose/syntastic')
"
" Python 文法チェック関連
"

"let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" let g:syntastic_python_checkers = ['pylint', 'pycodestyle']
let g:syntastic_python_checkers = ['flake8', 'autopep8']
autocmd FileType python set equalprg=autopep8\ -



" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')

endfunction

" Shift + F で自動修正
autocmd FileType python nnoremap <S-P> :call Autopep8()<CR>


" dein で消したプラグインを反映
call dein#recache_runtimepath() 



" color
colorscheme peachpuff






if ! empty(dein#get("jedi-vim"))
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 1

  nnoremap [jedi] <Nop>
  xnoremap [jedi] <Nop>
  nmap <Leader>j [jedi]
  xmap <Leader>j [jedi]

  let g:jedi#completions_command = "<C-Space>"    " 補完キーの設定この場合はCtrl+Space
  let g:jedi#goto_assignments_command = "<C-g>"   " 変数の宣言場所へジャンプ（Ctrl + g)
  let g:jedi#goto_definitions_command = "<C-d>"   " クラス、関数定義にジャンプ（Gtrl + d）
  let g:jedi#documentation_command = "<S-U>"      " Pydocを表示（Ctrl + k）
  let g:jedi#rename_command = "[jedi]r"
  let g:jedi#usages_command = "[jedi]n"
  let g:jedi#popup_select_first = 0
  let g:jedi#popup_on_dot = 0

  autocmd FileType python setlocal completeopt-=preview

  " for w/ neocomplete
    if ! empty(dein#get("neocomplete.vim"))
        autocmd FileType python setlocal omnifunc=jedi#completions
        let g:jedi#completions_enabled = 0
        let g:jedi#auto_vim_configuration = 0
        let g:neocomplete#force_omni_input_patterns.python =
                        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    endif
endif
