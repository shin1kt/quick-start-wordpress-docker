#!/bin/bash

# Push前にURL置換実行（ローカルURL → 本番URL）
echo "=== Push前URL置換開始 ==="
echo "置換元: http://localhost:${LOCAL_SERVER_PORT}"
echo "置換先: ${PRODUCTION_URL}"

cd /var/www/html && wp search-replace "http://localhost:${LOCAL_SERVER_PORT}" "${PRODUCTION_URL}" --allow-root

# WordMove push実行（正しいディレクトリに移動）
echo "=== WordMove Push開始 ==="
cd /home && wordmove push --all

# Push後にURL置換実行（本番URL → ローカルURL）
echo "=== Push後URL置換開始 ==="
echo "置換元: ${PRODUCTION_URL}"
echo "置換先: http://localhost:${LOCAL_SERVER_PORT}"

cd /var/www/html && wp search-replace "${PRODUCTION_URL}" "http://localhost:${LOCAL_SERVER_PORT}" --allow-root

echo "=== Push & URL置換完了 ==="
