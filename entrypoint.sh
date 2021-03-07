#!/bin/bash

# 正常終了（0）以外のステータスが返ってきた場合シェルを終了
set -e

# rails特有の問題でserver.pidファイルが残ってしまうと
# サーバーがうまく立ち上がらなくなるので削除
rm -f /myapp/tmp/pids/server.pid

# コンテナのメインプロセス(DockerfileでCMDとして設定されているもの)を実行
exec "$@"
