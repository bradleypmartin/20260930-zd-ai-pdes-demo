# Navier–Stokes notes for Part 1

Working notes for the first half of the talk. Two tiers: **verified** means we
read it in a primary source in `papers/` or the Lean repo; **reported** means
a press account we have read, attributed to the outlet. Reported items about
the dispute are allegations and responses, not established facts; on slides
they should be attributed, not asserted.

## Verified (primary sources)

- **What was announced.** 2026-09-08: OpenAI posts *On the Navier–Stokes
  Millennium Prize Problem*, linking a 166-page manuscript *Finite Time
  Blowup for Navier–Stokes* (PDF creation date 2026-09-08), a companion
  *Finite Time Blowup for the Euler Equation*, and the Lean 4 repository
  `openai/NavierStokesAndEuler` (Apache-2.0, created 2026-09-08).
- **The theorem** (manuscript p. 1, Theorem 1.1). For every viscosity ν > 0
  there exist a smooth force f, compactly supported in space and time, and
  smooth velocity/pressure on R³ × [0, 1) starting from rest, supported in a
  fixed compact set, with bounded kinetic energy, whose maximum speed becomes
  unbounded as t → 1. Hence no global smooth finite-energy solution with that
  force and initial datum. This is alternative **(C)** of Fefferman's Clay
  statement; compact support gives the periodic case, alternative **(D)**
  (Corollary 10.6, p. 117). The unforced Euler companion is a separate
  result (Lean README).
- **Abstract, verbatim:** "For every positive viscosity, we construct a
  solution of the three-dimensional incompressible Navier–Stokes equations
  that starts from rest and develops unbounded velocity in finite time while
  maintaining uniformly bounded kinetic energy."
- **Mechanism** (manuscript §2, pp. 3–6). An axisymmetric self-similar
  vortex whose core collapses (radial width shrinking faster than axial
  length), spun up by inward spiralling flow with axial outflow carrying
  fluid away. The background flow alone leaves a momentum residual that
  blows up; spatially oscillatory pulses are added whose nonlinear momentum
  flux cancels the singular part, and further corrections make the leftover
  force extend smoothly through t = 1.
- **Prior work the paper cites** (§1.1): Leray 1934; Caffarelli–Kohn–
  Nirenberg; Escauriaza–Seregin–Šverák; Tao's blowup for an averaged
  Navier–Stokes; Buckmaster–Vicol nonuniqueness; Albritton–Brué–Colombo;
  Córdoba–Martínez-Zoroa forced Euler blowup and the hypodissipative
  Navier–Stokes extension with Zheng. Note that Buckmaster appears in the
  paper's own bibliography.
- **Formalization.** Lean 4.34.0-rc2 + Mathlib; README gives build steps and
  a "Comparator" procedure for independent checking. ~1.9k GitHub stars on
  2026-09-17.

## Reported (press; attribute on slides)

**How it was produced** (CNBC, 2026-09-09, quoting OpenAI's release):

- "coordinating agents" powered by an internal model, with tools to read a
  cached internet and run code, subdivided into communicating groups; "the
  group that produced the Navier–Stokes resolution involved on the order of
  10,000 concurrent agents."
- "The agents arrived at their resolution on Saturday, September 5, about 88
  hours after the first agents were launched."
- OpenAI said the effort began on 2026-09-01 after "hearing a rumor" about
  progress it later learned related to Alpöge and Buckmaster.
- The Week (aggregating New Scientist) adds: an internal model "significantly
  more capable" than the commercial one; 1,000 agents first on a related
  problem, then ~10,000; a customer running the same job would pay "around
  $15 million". The Week also reports OpenAI said it would not collect the
  $1M prize. (Second-hand; New Scientist not read directly.)

**The parallel human–AI result and the dispute:**

- Tristan Buckmaster (NYU) and Levent Alpöge (Anthropic) had been working on
  Navier–Stokes-related problems for most of a year, with rapid progress from
  mid-August; they published their work hours before OpenAI's announcement
  (Fortune, 2026-09-08; The Week). Fortune reports they used Anthropic's
  Claude and OpenAI's Codex, with an OpenAI model used only for auditing.
  Earlier reporting summarised in our first search describes their result as
  the inviscid (Euler) case; verify against their paper before stating.
- Buckmaster's statement (CNBC): Alpöge received "tips" that information
  about their progress had reached OpenAI; OpenAI's route was similar to
  theirs and "not the direction one arrives at in a few days by giving a
  model the problem statement"; he asked whether OpenAI models had been
  trained on or had access to their Codex sessions. He also said: "I have
  not seen OpenAI's proof. I do not know what their model did, or how. I do
  not know whether our data was used."
- OpenAI's statement (CNBC): "We (the researchers and the agents) did not see
  any of their work through any means until they released it publicly — in
  particular, no specific user data was accessed in order to solve this
  problem. While unlikely, we cannot rule out that de-identified data derived
  from their usage of our products helped improve our models."
- Fortune additionally reports Buckmaster's account of a conversation with
  OpenAI's Sébastien Bubeck about publication and credit, including remarks
  Buckmaster characterised as threatening, and Bubeck's denial of data use
  ("We did not use their prompts or proofs to prompt our models or direct our
  agents") and later acknowledgement of "the priority of Levent Alpöge and
  Tristan Buckmaster's work". This is one party's account plus the other's
  response; if used at all, present it exactly that way.
- Terence Tao (Fortune, paraphrased by the outlet) warned that indiscriminate
  "strip-mining" of open problems for solutions could damage the ecosystem
  from which new mathematical techniques develop.
- Axios via The Week: the episode "strikes at a core trust question for
  AI-assisted science", namely whether researchers can safely use frontier
  labs' tools on unpublished work.

**Reactions** (Nature news, Davide Castelvecchi, 2026-09-08; the piece's
"Announcement controversy" section was behind a cookie wall and unread):

- Martin Bridson, president of the Clay Mathematics Institute: "It is
  certainly an exciting day, as we contemplate the announcement of major
  advances in the human understanding of mathematics."
- Luis Martínez-Zoroa (CUNEF, Madrid; author of the forced-Euler blowup the
  paper builds on): "I think it is a truly remarkable result."
- Sébastien Bubeck (OpenAI): "the spectacular culmination of the arc we have
  seen over the last 12 months."
- Nature describes the Alpöge–Buckmaster release of 2026-09-07 as solving the
  simplified zero-viscosity (Euler) case using Claude, Codex, and Astra, with
  a solution to the general problem said to be coming soon.

**Verification status:** Clay Mathematics Institute had not commented as of
2026-09-09 (CNBC); earlier search summaries said the problem was still listed
"Active" on 2026-09-10. Machine-checked in Lean, independent human judgment
pending.

## Not yet read

- The "Announcement controversy" section of the Nature piece.
- New Scientist, Axios, WSJ, NYT pieces quoted by The Week.
- Alpöge–Buckmaster's own paper and Buckmaster's website statement.
- OpenAI's blog post itself (403 to scripted fetch; read in a browser).

## Talking points that survive the sourcing

1. The result is inside the letter of the Clay statement (forcing allowed in
   (C)/(D)) but not the version most physicists picture (unforced).
2. "Machine-checked" certifies the formal statement; whether it is the Clay
   statement, and whether the physics is illuminating, are human judgments
   still in progress.
3. Two routes to the same frontier in the same week: a year-long human–AI
   collaboration, and a three-day, ~10k-agent run. Both used frontier
   models; the difference is who steered.
4. The trust question for researchers using lab tools on unpublished work.
5. What is still human: choosing the problem, the physical picture, judging
   significance, deciding what to formalize.
