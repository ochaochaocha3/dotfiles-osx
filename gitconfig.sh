#!/bin/sh

# デフォルトのユーザー名とメールアドレスの設定
# FIXME: "Your xxx" を設定してコメント解除すること
# git config --global user.name "Your name"
# git config --global user.email "Your email"

# Git で使用するエディタの設定
git config --global core.editor vim

# すべてのリポジトリで無視するパターンの登録
git config --global core.excludesfile "~/.gitignore"

# git push のデフォルトの挙動を simple モードにする
git config --global push.default simple
