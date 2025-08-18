#!/bin/bash

# WordMove DB pull実行（正しいディレクトリに移動）
echo "=== WordMove DB Pull開始 ==="
cd /home && wordmove pull --db

# URL置換実行
echo "=== URL置換開始 ==="
echo "置換元: ${PRODUCTION_URL}"
echo "置換先: http://localhost:${LOCAL_SERVER_PORT}"

cd /var/www/html && wp search-replace "${PRODUCTION_URL}" "http://localhost:${LOCAL_SERVER_PORT}" --allow-root

echo "=== DB Pull & URL置換完了 ==="
