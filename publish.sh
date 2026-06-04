#!/usr/bin/env bash
set -euo pipefail

SOURCE="${HOME}/cloud-5/strudel/dist/web/"
TARGET="${HOME}/gogins.github.io"

echo "Source : ${SOURCE}"
echo "Target : ${TARGET}"
echo

read -p "Proceed to push? [y/N] " reply
case "$reply" in
    [yY]|[yY][eE][sS]) ;;
    *) echo "Aborted."; exit 0 ;;
esac

cd "${TARGET}"

rsync -av --delete \
    --exclude='.git/' \
    "${SOURCE}" \
    "${TARGET}/"

git status

echo
read -p "Commit and push changes? [y/N] " reply2
case "$reply2" in
    [yY]|[yY][eE][sS]) ;;
    *) echo "Sync complete, not pushed."; exit 0 ;;
esac

git add -A
git commit -m "Update site from cloud-5 strudel build"
git push