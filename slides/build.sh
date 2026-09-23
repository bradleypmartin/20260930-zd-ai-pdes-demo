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
# The "How fast the error shrinks" frame shows the left panel of each
# convergence figure; crop them here so the drivers stay unchanged.
uv run --project "$root" --quiet python - <<'PY'
from PIL import Image  # bundled with matplotlib

for src, dst in [
    ("wave1d_convergence", "wave1d_convergence_wide"),
    ("wave2d_convergence", "wave2d_convergence_flat"),
]:
    im = Image.open(f"figures/{src}.png")
    w, h = im.size
    im.crop((0, int(0.105 * h), int(0.53 * w), h)).save(f"figures/{dst}.png")
PY
# tectonic stamps the build time into the PDF; pin it (to noon UTC on the talk
# date, unless the caller sets one) so the same sources build the same bytes.
export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-1790769600}"
tectonic talk.tex
echo "wrote $here/talk.pdf ($(pdfinfo talk.pdf 2>/dev/null | awk '/^Pages/ {print $2}') pages)"
