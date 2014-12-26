Dotfiles for OS X
==================

Mac 用 dotfiles。対象プログラムは

* Vim
* Vimperator
* Git
* Ruby

追加の操作を行う必要があるプログラムは

* Vim
* Git
* Ruby

環境移行時に行うこと
--------------------

Homebrew と Git は設定済みとする。

### サブモジュールの更新

サブモジュールを更新する。

```bash
cd /path/to/dotfiles-osx
git submodule update --init
```

### シンボリックリンクの配置

dotfiles へのシンボリックリンクを配置する。

```bash
cd /path/to/dotfiles-osx
./install.sh
```

### .gitconfig の設定

.gitconfig の設定。gitconfig.sh を `FIXME` の指示通りに修正して、実行する。

```bash
vim gitconfig.sh # 編集
./gitconfig.sh
```

### Vim の設定

Vim を起動して `NeoBundleInstall` を実行させる。

### Ruby の設定

Homebrew で rbenv と関連プラグインをインストールする。

```bash
brew install rbenv ruby-build rbenv-default-gems rbenv-gem-rehash
```

インストールするバージョン（`rbenv` の引数として渡される）を指定して Ruby をインストールする。default-gems で指定した gem もインストールされる。

```bash
install-ruby.sh 2.2.0
```
