# qa-rails-ec-training-cactus

Rails 共同開発講座(7 期: サボテン組)のリポジトリです。

## Member

- 氏名: Ryo Yokoyama
  - 好きなメソッド: length

## Docker 操作

ゼロから docker 環境を立ち上げる場合は、上から順にコマンドを実行すれば OK

### docker image のビルド

```
docker-compose build
```

### docker-compose 起動

```
docker-compose up
```

`docker-compose up --build`にすると、`docker-compose up` の前に`docker-compose build`を自動的に実行してくれる
`docker-compose up -d`にすると、バックグラウンドで docker-compose が起動する

### docker-compose で起動しているコンテナを確認する

```
docker-compose ps
```

### docker 環境で bundle install

```
docker-compose exec web bundle install # docker-composeを起動中の場合
docker-compose run web bundle install # docker-composeを起動していない場合
```

`docker-compose run --rm web bundle install`で、bundle install しながら docker-compose が起動し、install 完了後コンテナが停止する

### rails コマンドを実行する

##### docker-compose で起動しているコンテナに入る

コンテナに入った後、rails コマンドが実行できる

```
docker-compose exec web bash
```

- DB を作成する

```
# rails db:create
```

- マイグレーション実行

```
# rails db:migrate
```

※rails ページが見れるようになります。http://localhost:3000/

- コンテナから出る

```
# exit
```

##### ※コンテナに入らず rails コマンド実行する方法

コンテナに入らず`docker-compose exec web`の引数に指定した rails コマンドを実行します。

```
例：

docker-compose exec web rails db:create

docker-compose exec web rails db:migrate
```

### 起動中の docker-compose コンテナを停止

```
docker-compose stop
```

`docker-compose down`を実行すると、`docker-compose stop`後に`docker-compose rm`を自動的に実行してくれる
停止した後起動したい場合は、`docker-compose up`,又は`docker-compose start`を実行する

### ログの確認

```
docker-compose logs
```

### 停止中の docker-compose コンテナの削除

※対象：カレントディレクトリの docker-compose コンテナ

```
docker-compose rm
```

### Docker のイメージ、コンテナ、ネットワーク、ボリューム一括削除

- 未使用なイメージ、コンテナ、ネットワークを一括削除（volume も含め全て削除）

```
docker system prune -a --volumes
```

### Docker コンテナ一覧表示

```
docker ps

docker-compose ps
```

※-a オプションをつけると終了したコンテナも表示される

## Webpacker configuration file not found /myapp/config/webpacker.yml が出たときの対処法

`docker-compose run --rm web rails webpacker:install`を実行

## Docker コンテナが落ちる問題の対処法

#### 発生状態

`docker-compose up`を実行し docker コンテナが正常に起動せず、log に以下の様に出力されます。

```
========================================
  Your Yarn packages are out of date!
  Please run `yarn install --check-files` to update.
========================================
```

#### 原因と対処法

以下の方法で、yarn を再インストールしてください。（更新される様です。）
※実行前に docker コンテナを`docker-compose stop`で落としてください。

```
$ docker-compose run --rm web yarn install
```

※実行後に、もし正常に起動していないようでしたら
　 docker コンテナ削除後に、`docker-compose up`で再度起動してください。

[この問題についての詳細はこちら]
https://qiita.com/yama_ryoji/items/1de1f2e9e206382c4aa5
