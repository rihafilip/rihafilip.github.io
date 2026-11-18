#!/usr/bin/env bash
# Renders page 1 of each PDF in publications/ to publications/thumbs/<name>.png.
# Skips PDFs whose thumbnail is newer than the PDF.
set -euo pipefail

mkdir -p publications/thumbs

for pdf in publications/*.pdf; do
  [ -f "$pdf" ] || continue
  thumb="publications/thumbs/$(basename "$pdf" .pdf)"
  if [ ! -f "$thumb.png" ] || [ "$pdf" -nt "$thumb.png" ]; then
    echo "Thumbnail: $pdf"
    pdftoppm -png -singlefile -f 1 -scale-to 800 "$pdf" "$thumb"
  fi
done
