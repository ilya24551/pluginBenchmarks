#!/bin/bash
# Copies the shared skill, logo and license into both plugins and builds the OpenAI ZIP
set -euo pipefail
cd "$(dirname "$0")"
for target in claude openai; do
  rm -rf "$target/skills" "$target/assets"
  cp -R skills assets "$target/"
  cp LICENSE "$target/LICENSE"
done
find . -name .DS_Store -not -path './.git/*' -delete
mkdir -p dist
rm -f dist/replads-openai.zip
(cd openai && zip -qrX ../dist/replads-openai.zip . -x '*.DS_Store')
echo "dist/replads-openai.zip"
