#!/usr/bin/env bash
# Renders page 1 of the PDF in each publication folder to thumb.png.
# Skips folders whose thumbnail is newer than the PDF.
set -euo pipefail

for dir in assets/publications/*/; do
  [ -d "$dir" ] || continue
  pdf=$(ls "$dir"*.pdf 2>/dev/null | head -n1 || true)
  [ -z "$pdf" ] && continue
  if [ ! -f "${dir}thumb.png" ] || [ "$pdf" -nt "${dir}thumb.png" ]; then
    echo "Thumbnail: $pdf"
    pdftoppm -png -singlefile -f 1 -scale-to 800 "$pdf" "${dir}thumb"
  fi
done
