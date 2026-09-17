# Slides

`talk.tex` is the deck for the 2026-09-30 talk (Beamer, metropolis theme,
16:9). `talk.pdf` is the committed build. `notes.md` is the speaker script
with timings and the cue points for the three video clips.

```sh
./slides/build.sh          # copies figures from outputs/ if present, runs tectonic
```

Requires `tectonic` (Homebrew). The first build downloads the LaTeX packages
it needs; later builds are offline. The deck uses Avenir Next when the system
has it (macOS) and falls back to Latin Modern Sans otherwise, so the PDF looks
slightly different on other machines but builds anywhere.

## Videos

PDFs do not play video reliably, so the deck shows the snapshot grid for each
clip and the script says when to switch to the clip. The clips live in
`outputs/` (gitignored, ~3.5 MB each); regenerate them with:

```sh
uv run python scripts/wave1d_demo.py --n 100 --sharpness 150 --out outputs/wave1d_naive_vs_aware_coarse.mp4
uv run python scripts/wave2d_demo.py                    # outputs/wave2d_naive_vs_aware.mp4
uv run python scripts/wave2d_demo.py --amplitude 0.02   # outputs/wave2d_naive_vs_aware_curved.mp4
```

Open all three in QuickTime before the talk and use Cmd-Tab to switch.

## Figures

`figures/` holds the PNGs the deck includes, copied from `outputs/` by
`build.sh` (committed so the deck builds from a fresh clone without running
the drivers).
