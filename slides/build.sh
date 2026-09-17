#!/usr/bin/env bash
# Build slides/talk.pdf with tectonic (XeTeX; downloads packages on first run,
# offline afterwards). Refreshes slides/figures/ and slides/videos/ from
# outputs/ when the drivers have been run; otherwise the committed copies are
# used as they are.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "$here/.." && pwd)"

figures=(
  wave1d_naive_vs_aware_coarse.png
  wave1d_convergence.png
  wave2d_nodes.png
  wave2d_naive_vs_aware.png
  wave2d_naive_vs_aware_curved.png
  wave2d_convergence.png
  wave2d_eigenvalues.png
)

videos=(
  wave1d_naive_vs_aware_coarse.mp4
  wave2d_naive_vs_aware.mp4
  wave2d_naive_vs_aware_curved.mp4
)

mkdir -p "$here/figures" "$here/videos"
for f in "${figures[@]}"; do
  if [[ -f "$root/outputs/$f" ]]; then
    cp "$root/outputs/$f" "$here/figures/$f"
  elif [[ ! -f "$here/figures/$f" ]]; then
    echo "missing $f: run the matching driver in scripts/ first" >&2
    exit 1
  fi
done
# Clips are copied only when a fresh render exists; ffmpeg output is not
# byte-identical between runs, so commit them only when the content changed.
for f in "${videos[@]}"; do
  if [[ -f "$root/outputs/$f" ]]; then
    cp "$root/outputs/$f" "$here/videos/$f"
  fi
done

cd "$here"
tectonic talk.tex
echo "wrote $here/talk.pdf ($(pdfinfo talk.pdf 2>/dev/null | awk '/^Pages/ {print $2}') pages)"
