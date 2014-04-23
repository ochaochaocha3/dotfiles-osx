Dotfiles for OS X
==================

Mac 用 dotfiles。対象プログラムは

* ターミナル
* Vim
* Vimperator
* Git

追加の操作を行う必要があるプログラムは

* Vim
* Git

環境移行時に行うこと
--------------------

Homebrew と Git は設定済みとする。

1. ターミナルを起動し、プロファイルに Pro-ocha.terminal を追加、デフォルトに設定する。
2. サブモジュールを更新する。

    ```bash
    cd /path/to/dotfiles-osx
    git submodule update --init
    ```
3. 以下を実行して、ホームディレクトリに dotfiles へのシンボリックリンクを配置する。

    ```bash
    for f in _*; do
        ln -sf `pwd`/$f ~/${f/_/.}
    done
    ```
4. .gitconfig の設定。gitconfig.sh を `FIXME` の指示通りに修正して、実行する。

    ```bash
    vim gitconfig.sh # 編集
    ./gitconfig.sh
    ```
5. Vim の設定。
    1. Vim を起動して `NeoBundleInstall` を実行させる。
    2. vimproc の設定。以下を実行する。

        ```bash
        cd ~/.vim/bundle/vimproc
        make -f make_mac.mak
        ```
