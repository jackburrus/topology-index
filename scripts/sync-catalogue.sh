#!/usr/bin/env bash
# Refresh the catalogue from the live service. Every page is the exact Markdown
# topologyindex.com serves, stored at the same path so its root-relative links resolve on GitHub.
set -euo pipefail
cd "$(dirname "$0")/.."
BASE=https://topologyindex.com
rm -rf patterns research starters docs
curl -fsS "$BASE/llms.txt" -o llms.txt
curl -fsS "$BASE/sitemap.txt" | while read -r url; do
  path=${url#"$BASE"}
  case "$path" in
    /patterns/*|/research/*|/starters/*|/docs/api/integration.md) ;;
    *) continue ;;
  esac
  mkdir -p ".$(dirname "$path")"
  curl -fsS "$url" -o ".$path"
done
echo "synced $(find patterns research starters docs -name '*.md' | wc -l | tr -d ' ') pages"
