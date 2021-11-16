# コードを実行するコンテナイメージ
FROM php:latest

# アクションのリポジトリからコードファイルをコンテナのファイルシステムパス `/`にコピー
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update \
 && apt-get -y --no-install-recommends install zip unzip graphviz \
 && COMPOSER_ALLOW_SUPERUSER=1 composer global require koriym/app-state-diagram

# アクションのリポジトリからコードファイルをコンテナのファイルシステムパス `/`にコピー
COPY entrypoint.sh /entrypoint.sh

# dockerコンテナが起動する際に実行されるコードファイル (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
