#!/usr/bin/env bash
# ใช้: ./scripts/push-to-github.sh https://github.com/<ชื่อบัญชี>/mih-connect-prototype.git
set -e
URL="$1"
if [ -z "$URL" ]; then echo "ใส่ URL ของ repo ด้วย เช่น ./scripts/push-to-github.sh https://github.com/you/mih-connect-prototype.git"; exit 1; fi
cd "$(dirname "$0")/.."
git remote remove origin 2>/dev/null || true
git remote add origin "$URL"
git branch -M main
git push -u origin main
echo "เสร็จแล้ว → ไปที่ https://vercel.com/new แล้ว Import repo นี้"
