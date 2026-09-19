# Slides

`talk.tex` is the deck for the 2026-09-30 talk (Beamer, metropolis theme,
16:9). `talk.pdf` is the committed build. `notes.md` is the speaker script
with timings and the cue points for the three video clips.

```sh
./slides/build.sh          # copies figures from outputs/ if present, runs tectonic
```

Requires `tectonic` (Homebrew) and the project venv (`uv sync`): `build.sh`
crops the left panel of each convergence figure with Pillow before running
tectonic. The first build downloads the LaTeX packages it needs; later builds
are offline. The deck uses Avenir Next when the system
has it (macOS) and falls back to Latin Modern Sans otherwise, so the PDF looks
slightly different on other machines but builds anywhere.

## Quotations

Every `\q{...}` in `talk.tex` must appear in `docs/navier-stokes-notes.md`,
which is where each quotation's source is recorded; scare quotes use
`\sq{...}`. After editing the deck:

```sh
uv run python scripts/check_slide_quotes.py
```

## Commit policy

`talk.pdf` is committed with every change to the deck, so the PDF on `main`
is always the current build. Run `./slides/build.sh` and commit `talk.tex`
and `talk.pdf` together.

## Videos

PDFs do not play video reliably, so the deck shows the snapshot grid for each
clip and the script says when to switch to the clip. The clips are committed
in `videos/` (~3.5 MB each, ~10 MB total). `build.sh` refreshes them from
`outputs/` when a fresh render exists there; regenerate with:

```sh
uv run python scripts/wave1d_demo.py --n 100 --sharpness 150 --out outputs/wave1d_naive_vs_aware_coarse.mp4
uv run python scripts/wave2d_demo.py                    # outputs/wave2d_naive_vs_aware.mp4
uv run python scripts/wave2d_demo.py --amplitude 0.02   # outputs/wave2d_naive_vs_aware_curved.mp4
```

Re-commit a clip only when its content changed (ffmpeg output differs
byte-for-byte between runs).

**Playing them in the talk:** open `slides/clips.html` in Chrome (a
`file://` URL is fine; it has no external resources), press `F` for full
screen, and use `1`, `2`, `3` to play each clip from the start. The same
page is hosted by GitHub Pages from `main` at
<https://bradleypmartin.github.io/20260930-zd-ai-pdes-demo/slides/clips.html>
(the deck: `.../slides/talk.pdf`; landing page at the root). Use the local
copy on the day; the hosted one is for sharing. `space`
pauses, `R` restarts, arrows cycle, `L` toggles looping. Keep it in a window
next to the PDF and Cmd-Tab between them. QuickTime works as a fallback.

## Figures

`figures/` holds the PNGs the deck includes, copied from `outputs/` by
`build.sh` (committed so the deck builds from a fresh clone without running
the drivers).
