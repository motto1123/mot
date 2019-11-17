"環境変数 MYVIMRCSUB は.zshrcで設定
"
"
"
" NeoBundle がインストールされていない時、
" もしくは、プラグインの初期化に失敗した時の処理
function! s:WithoutBundles()
  colorscheme desert
  " その他の処理
endfunction

" NeoBundle よるプラグインのロードと各プラグインの初期化
function! s:LoadBundles()
  " 読み込むプラグインの指定
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  " ...
  " 読み込んだプラグインの設定
  " ...
endfunction

" NeoBundle がインストールされているなら LoadBundles() を呼び出す
" そうでないなら WithoutBundles() を呼び出す
function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#rc(expand('~/.vim/bundle/'))
      call s:LoadBundles()
    catch
      call s:WithoutBundles()
    endtry 
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax on
endfunction

call s:InitNeoBundle()
" XXX push gf on below script in normal mode and go to this file
source $MYVIMRCSUB/.vimrc_main
source $MYVIMRCSUB/.vimrc_Neobundle
source $MYVIMRCSUB/.vimrc_keymap
source $MYVIMRCSUB/.vimrc_myfunction
source $MYVIMRCSUB/.vimrc_latex
source $MYVIMRCSUB/.vimrc_python


" コマンドラインの履歴を10000件保存する
" .vimrc_main ではうまくいかないので，ここに書く
set history=10000
