# Hello world docker action

このアクションは"Hello World"もしくは"Hello" + ログに挨拶する人物名を出力します。

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. デフォルトは `"World"`。

## Outputs

## `time`

The time we greeted you.

## 使用例

uses: actions/hello-world-docker-action@v1
with:
who-to-greet: 'Mona the Octocat'