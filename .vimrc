"環境変数 MYVIMRCSUB は.zshrcで設定

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
