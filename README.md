# 現場Rails輪読会用taskleafアプリケーション

## 概要
このリポジトリはフィヨルドブートキャンプで行われている現場Rails輪読会で、書籍の中で作るtaskleafアプリケーションをハンズオンで作成する目的で作られたものです。
- [現場で使える Ruby on Rails 5速習実践ガイド \| マイナビブックス](https://book.mynavi.jp/ec/products/detail/id=93905)
- [FJORD BOOT CAMP（フィヨルドブートキャンプ）](https://bootcamp.fjord.jp/)

現場Rails輪読会では、RubyとRails、bundlerのバージョンを本に合わせて以下のようにしています。

- Ruby：2.5.1
- Rails：5.2.1
- Bundler：1.17.3
- node 12系

手元のパソコンで輪読会の進捗状況を再現したい場合、以下を行ってください。
環境構築でエラーやわからないところなどあれば、輪読会でガンガン聞いてください！聞いてくださるととても喜びます。

## 環境を合わせるために必要なこと
### nodeのバージョン
#### nvmを使っている場合
- `nvm ls-remote`でインストール可能なバージョンを一覧
- `nvm install v12.22.10`を実行
- `nvm use v12.22.10`を実行
### Rubyのインストール
- ターミナルで`rbenv install 2.5.1`を実行しRuby 2.5.1をインストール
- 現場Rails輪読会用のディレクトリを作成して、ターミナルで作成したディレクトリ内に移動し`rbenv local 2.5.1`を実行

### Bundlerのインストール
- `gem install bundler -v '1.17.3'`を実行してbundler 1.17.3 をインストール

### Ruby on Railsのインストール
- `gem install rails 5.2.1`を実行してRails5.2.1をインストール

### 輪読会用リポジトリをクローン
- ターミナルで作成した輪読会用ディレクトリ内に移動し、`git clone https://github.com/yatsuhashi168/taskleaf.git`を実行する
- `bundle install`を実行し動作に必要なアプリケーションをインストールする


#### 注意
> Railsの一部であるactivestorageが依存しているmimemagic gemが、ライセンス関連の問題でrubygems.orgから取り下げられました。これにより、mimemagic <= 0.3.5に依存しているRailsアプリがbundle installに失敗するようになりました。（中略）（2021/03/27現在）Rails 5.2.5 / 6.0.3.6 / 6.1.3.1 はmimemagicに依存しなくなりました。これらにバージョンアップしましょう。

[mimemagicの最新動向](https://hackmd.io/@mametter/mimemagic-info-ja)

もしrails5.2.1をインストールした際mimemagic関連のエラーが出た場合は1回rails5.2.1をアンインストールした後、rails5.2.5をインストールしてください。

### 確認
`ruby -v`でrubyのバージョンが2.5.1なのか確認する

例：ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin20]

`bundler -v`でbundlerのバージョンが1.17.3であることを確認する

例：Bundler version 1.17.3

`rails -v`でrailsのバージョンが5.2.1であることを確認する

### Rails編
データベースまわりでエラーが出たら、エラーメッセージを**よく読んだ上で**、以下を確認してみましょう！
- `rails db:create`はしているか
- その後`rails db:migrate`はしているか
- `brew services start postgresql`でpostgresqlを起動しているか
- 直近でpostgresqlのバージョンアップデートをしていたら、`brew postgresql-upgrade-database`をしているか
    - [PostgreSQL DB のアップグレードは brew postgresql-upgrade-database が便利](https://qiita.com/yasulab/items/237c3f9634055d665745)
