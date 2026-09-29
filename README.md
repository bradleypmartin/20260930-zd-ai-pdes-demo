# 20260930-zd-ai-pdes-demo

Material for a 30-minute talk on **2026-09-30** to Ziff Davis coworkers,
*AI and Applied Math circa September 2026: excitement, ethics, and individual
exploration*. What frontier AI currently does in research mathematics, seen at
two scales in one narrow slice of it: partial differential equations.

1. **Navier–Stokes, the state of play.** OpenAI announced on 2026-09-08 a
   166-page manuscript, *Finite Time Blowup for Navier–Stokes*, plus Lean 4
   certificates, claiming alternatives (C) and (D) of the Clay Millennium
   problem: smooth, compactly supported forcing under which no global smooth
   finite-energy solution exists. What was claimed, how it was produced, the
   parallel Alpöge–Buckmaster result and the credit dispute, how the claim is
   being checked, and the questions it raises. Every statement on the slides
   traces to [`docs/navier-stokes-notes.md`](docs/navier-stokes-notes.md),
   which cites a PDF in `papers/` or a URL. The sources were last re-checked
   on 2026-09-29.
2. **Working with Claude on my own research.** Claude Code and I re-derived
   and re-implemented in Python the interface-aware wave solvers from my 2016
   CU Boulder applied-math dissertation: the 1-D wave equation through a
   heterogeneous layer with interface-aware finite differences, and the 2-D
   elastic wave equation on a scattered node set with curved interfaces using
   radial basis function-generated finite differences (RBF-FD). Both are
   verified against reference solutions: standard stencils lose accuracy at a
   material boundary, the interface-aware ones do not. All of it was built on
   2026-09-17.

## Parts 3–5: where the work went next

The talk covers Parts 1 and 2. The research kept going after the freeze, and
each later part has its own repository:

- **Part 3: material edges too steep for the node spacing, in the wave
  equation.** An idea from my research that never got written up, and an
  arXiv manuscript about it:
  [`bradleypmartin/rbf-hyperbolic-interfaces-2026`](https://github.com/bradleypmartin/rbf-hyperbolic-interfaces-2026).
  It started here and moved on 2026-09-22 with its history. That repo carries
  the Part 2 solvers forward too.
- **Part 4: the same for elliptic and parabolic equations.** A port of the
  heat-transport half of the dissertation, extended the way Part 3 extends
  the wave solvers, with its own manuscript:
  [`bradleypmartin/rbf-elliptic-parabolic-interfaces-2026`](https://github.com/bradleypmartin/rbf-elliptic-parabolic-interfaces-2026).
- **Part 5: wave-equation inverse problems.** First steps into full-waveform
  inversion, in `bradleypmartin/hyperbolic-inverses-intro-2026`. It is
  private for now, and not for secrecy: the inversion campaigns need a lot of
  compute and time. The plan is a manuscript, with the repo going public
  alongside it.

### Part 3's history here

- The tag
  [`part3-pre-split`](https://github.com/bradleypmartin/20260930-zd-ai-pdes-demo/tree/part3-pre-split)
  marks the state Part 3 lived in here, and every Part 3 pull request (#35
  to #77) is in this history. Resolve the `git_sha` values in the results
  cache through the new repo's
  [commit map](https://github.com/bradleypmartin/rbf-hyperbolic-interfaces-2026/blob/main/docs/split-commit-map.txt),
  not through this tag: three of them are commits of the #54 branch from
  before its rebase, which never reached `main`.
- The code (`src/`, `scripts/`, `tests/`) and the clips are exactly as at
  `0a2a8a7` (#26, the last commit before Part 3). #78 regenerated the talk
  from that code, and everything came out as committed: the figures, the
  clips frame for frame, and the text of `slides/talk.pdf`. The one
  pixel-level difference is explained on #78.
- Since then, #81 re-rendered the 1-D convergence figure and pinned the build
  date, and #82 and #83 updated the deck, the script and the notes on
  2026-09-29.

To regenerate the figures, the clips and the deck from that code (about five
minutes in all):

```sh
uv run python scripts/wave1d_demo.py --n 100 --sharpness 150 --out outputs/wave1d_naive_vs_aware_coarse.mp4  # clip 1 and its still
uv run python scripts/wave1d_convergence.py
uv run python scripts/wave2d_nodes.py
uv run python scripts/wave2d_demo.py                    # clip 2 and its still
uv run python scripts/wave2d_demo.py --amplitude 0.02   # clip 3 and its still
uv run python scripts/wave2d_convergence.py
./slides/build.sh                                       # copy them into slides/, build talk.pdf
```

## Talk materials

Hosted from `main` by GitHub Pages: [landing page](https://bradleypmartin.github.io/20260930-zd-ai-pdes-demo/),
[slides (PDF)](https://bradleypmartin.github.io/20260930-zd-ai-pdes-demo/slides/talk.pdf),
[the three clips](https://bradleypmartin.github.io/20260930-zd-ai-pdes-demo/slides/clips.html).
Sources in `slides/` (see its README for the build, the quotation checker, and
the clip player). The deck ends with two links slides. The second, on applied
ML, is optional and unnumbered; its sources are in
[`docs/ml-links.md`](docs/ml-links.md).

To play the clips in the talk: open `slides/clips.html` in Chrome, press `F`
for full screen, then `1`, `2` or `3` to play a clip from the start (`space`
pauses, `R` restarts). `slides/notes.md` is the speaker script and says when
to switch to which clip.

## Quickstart

```sh
uv sync                                       # Python 3.13 venv with numpy / scipy / matplotlib
uv run pytest                                 # 106 tests: convergence orders and analytic comparisons
./papers/fetch_papers.sh                      # public reference PDFs (gitignored), checksum-checked
./slides/build.sh                             # rebuild slides/talk.pdf with tectonic
uv run python scripts/check_slide_quotes.py   # every quotation on a slide is in the notes
open slides/clips.html                        # the clip player (keys 1, 2, 3; F for full screen)
```

Drivers in `scripts/` write figures and animations to `outputs/` (gitignored):

```sh
uv run python scripts/wave1d_convergence.py   # error vs resolution (dissertation Fig. 2-8)
uv run python scripts/wave1d_demo.py          # two-panel MP4 + snapshot PNG, naive vs aware
uv run python scripts/wave1d_demo.py --n 100 --sharpness 150 --out outputs/wave1d_naive_vs_aware_coarse.mp4  # clip 1: coarse grid, ringing visible
uv run python scripts/wave2d_nodes.py         # interface-fitted node set (dissertation Fig. 3-3)
uv run python scripts/wave2d_eigenvalues.py   # operator spectrum with/without hyperviscosity (Fig. 3-2)
uv run python scripts/wave2d_hyperviscosity.py  # error and stability vs hyperviscosity amplitude
uv run python scripts/wave2d_convergence.py   # 2-D error vs resolution, flat and curved interfaces (Fig. 3-5 / 3-8)
uv run python scripts/wave2d_demo.py          # clip 2: 2-D two-panel MP4 + snapshot PNG; --amplitude 0.02 for clip 3 (curved)
```

Both demo drivers take `--png-only` to refresh a still without re-rendering a
clip.

## Layout

| Path | Contents |
| --- | --- |
| `src/pdes_demo/` | Library. `wave1d/`: FD stencils across interfaces, RK4, exact ray-sum solution. `wave2d/`: node sets, periodic kNN, Gaussian RBF-FD weights, interface-aware stencils, hyperviscosity, sparse elastic operators, RK4, analytic plane-wave reference, one-sided resampling. Shared Fornberg weights and plotting palette. |
| `scripts/` | Drivers for the figures and clips; `check_slide_quotes.py` |
| `tests/` | pytest suite (convergence and analytic checks) |
| `docs/` | `demo-outline.md` (results tables, decisions log, what happened when), `navier-stokes-notes.md` (sourced notes for Part 1), `ml-links.md` (sources for the ML-links slide), `paper-index.md` (page ranges per PDF) |
| `slides/` | `talk.tex` → `talk.pdf`, `notes.md` speaker script, `figures/`, `videos/` (the three clips), `clips.html` clip player, `build.sh` |
| `papers/` | Index of reference papers with links and checksums, fetch script; PDFs are not committed |
| `index.html` | GitHub Pages landing page |

## Reference papers

See [`papers/README.md`](papers/README.md) for the full table. Headline links:

- OpenAI, *Finite Time Blowup for Navier–Stokes* (2026):
  [PDF](https://cdn.openai.com/pdf/32d9f210-8b73-45e0-91bc-82a30aef8a9a/navier-stokes.pdf) ·
  [announcement](https://openai.com/index/navier-stokes-solution/) ·
  [Lean certificates](https://github.com/openai/NavierStokesAndEuler)
- OpenAI, companion *Finite Time Blowup for the Euler Equation* (2026):
  [PDF](https://cdn.openai.com/pdf/315b36cd-ec98-4023-8342-93345194ece1/euler.pdf)
- L. Alpöge, T. Buckmaster, *Blowup for the Euler equations with smooth
  forcing* (2026, preprint): [PDF](https://cims.nyu.edu/~tristanb/euler.pdf) ·
  [Lean](https://github.com/tristanbuckmaster/fluid_lean)
- T. Buckmaster, [statement of 2026-09-07](https://cims.nyu.edu/~tristanb/statement.pdf)
  on the results, the tools used, and the contacts with OpenAI
- Clay Mathematics Institute, [official problem statement](https://www.claymath.org/wp-content/uploads/2022/06/navierstokes.pdf) (Fefferman)
- B. Martin, *Application of RBF-FD to Wave and Heat Transport Problems in
  Domains with Interfaces*, PhD dissertation, CU Boulder, 2016
  ([ProQuest](https://www.proquest.com/openview/ae4d936114520c2d34e604adeda7d81a/1?pq-origsite=gscholar&cbl=18750))
- B. Martin, B. Fornberg, A. St-Cyr, *Seismic modeling with RBF-FD*,
  Geophysics 2015 ([preprint](https://www.colorado.edu/amath/sites/default/files/attached-files/2015_mfstc_rbf-fd_2d_geophys_submitted_0.pdf))
- B. Martin, B. Fornberg, *Seismic modeling with RBF-FD – a simplified
  treatment of interfaces*, J. Comput. Phys. 2017
  ([preprint](https://www.colorado.edu/amath/sites/default/files/attached-files/2016_mf_rbf-fd_seismic_jcp_submitted.pdf))

The original MATLAB implementations live in a separate repo,
[`bradleypmartin/MathGraduateResearchAndCourseWork`](https://github.com/bradleypmartin/MathGraduateResearchAndCourseWork),
and were used as a read-only reference for the Python ports here. `CLAUDE.md`
lists what was ported and what was not.

## Status

- [x] Environment, papers, plan (2026-09-17)
- [x] 1-D wave equation: Fornberg FD weights, interface-aware stencils,
      thin-layer "double-cross", RK4, exact reference solution, tests,
      convergence figure, two-panel video (2026-09-17)
- [x] Navier–Stokes notes and slides: sourced notes in `docs/`, Beamer deck
      and speaker script in `slides/` (2026-09-17)
- [x] 2-D RBF-FD, naive: interface-fitted periodic node set, kNN stencils,
      Gaussian RBF-FD weights, hyperviscosity, sparse block operators, RK4,
      analytic plane-wave reference (2026-09-17)
- [x] 2-D interface-aware stencils: coupled piecewise-polynomial bases
      across interfaces, error down to the resolution floor on the analytic
      test problem (2026-09-17)
- [x] 2-D curved-interface runs, convergence figure, two-panel videos with
      error maps (flat: vs the exact solution; curved: vs a 4x finer
      interface-aware run) (2026-09-17)
- [x] Deck culled to seven content slides per part, slide-by-slide passes,
      new title and thesis (2026-09-19)
- [x] Clip pass: re-rendered with the final palette, 1-D clip simplified,
      2-D still reduced to the reference wave and two error maps (2026-09-19)
- [x] Docs pass (2026-09-19)
- [x] Part 3 and its manuscript moved to their own repo; this tree back to
      the talk (2026-09-22)
- [x] News pass on Part 1: sources re-checked, Sep 21 added to the
      timeline, review status on the machine-checked slide (#82); optional
      ML-links slide (#83) (2026-09-29)
- [x] Rehearsal (2026-09-29); frozen at the tag `talk-2026-09-30`

## License

MIT. Reference papers are the property of their respective authors and
publishers and are not redistributed here.
