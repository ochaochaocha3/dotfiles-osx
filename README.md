Dotfiles for OS X
==================
Mac 用 dotfiles。対象プログラムは

* Vim
* Vimperator
* Git

Dotfile が環境依存のため、追加の操作を行う必要があるプログラムは

* Git

環境移行時にすること
--------------------
1. 以下を実行して、ホームディレクトリに dotfiles へのシンボリックリンクを配置する。
    
    ```bash
    # clone したディレクトリで
    ln -s `pwd`/_vimrc ~/.vimrc
    ln -s `pwd`/_vim ~/.vim
    ln -s `pwd`/_vimperatorrc ~/.vimperatorrc
    ln -s `pwd`/_gitignore ~/.gitignore
    ```

2. .gitconfig の設定。gitconfig.sh を `FIXME` の指示通りに修正して、実行する。
    
    ```bash
    # clone したディレクトリで
    ./gitconfig.sh
    ```
