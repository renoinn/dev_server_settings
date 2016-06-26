# dev_server_settings

## 使い方
新しい環境でcloneしてきた場合は
```
$ ./dev_init.sh
```
ってすると、適当に`git submodule update`とか、シンボリックリンクとか貼られる。

その環境独自の設定とかを加える場合はブランチを切って、そこで管理する。
```
$ git checkout -b `hostname`
```

## vimプラグインの追加
基本は`.vim/bundle/`以下にぶち込めばいい。gitリポジトリがあるプラグインなら
```
$ git submodule add https://github.com/scrooloose/nerdtree .vim/bundle/nerdtree
```
とかして`submodule`として管理する。
