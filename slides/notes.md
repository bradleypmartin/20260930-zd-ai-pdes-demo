# Speaker script, 30 minutes

Timings assume ~1 minute per slide with the clips inside Part 2. Rehearse on
Sep 29 and trim from the Reactions and Questions slides first if long.
Clip files are in `outputs/`; open all three in QuickTime beforehand.

| Slide | Time | Cue |
| --- | --- | --- |
| 1–2 | 0:00–1:30 | Title; why this talk |
| 3–13 | 1:30–15:00 | Part 1 |
| 14–22 | 15:00–28:00 | Part 2, with three clips (~30 s total) |
| 23–24 | 28:00–30:00 | Comparison table; resources; questions |

## 1. Title (0:00)

Two kinds of AI in research math. One made the news this month. The other is
the kind most of you could do tomorrow.

## 2. Why this talk (0:30)

Three things happened in two weeks. OpenAI said its AI settled a famous
$1M question about fluids. The night before, an NYU mathematician and an
Anthropic researcher published a year of closely related work, done with
Claude and Codex. And I rebuilt my dissertation's simulation methods with
Claude Code in a day. The thesis: "AI in research math" is two very different
activities, and the difference is who steers and who can check the result.

## 3. Fluids, Newton, and a question from 1934 (1:30)

No equations needed. Navier–Stokes is F = ma for a fluid. The question is
whether the equations can predict something physically impossible: infinite
speed in finite time, starting from a smooth state. If they can, the model
breaks down there and molecules have to take over. Clay put $1M on the answer
in 2000.

## 4. Four ways to win (2:30)

Point at (C) and (D): a counterexample is allowed to use a smooth stirring
force. That one word, "forced", is the hinge of the whole story. The popular
picture, "can turbulence blow up on its own", is the unforced version, and
nobody has answered that.

## 5. What happened, in two weeks (3:30)

Walk the timeline top to bottom. Emphasise: Alpöge and Buckmaster had results
in mid-August; OpenAI's sprint started on Sep 1 after a rumour; Sep 7 night
vs Sep 8 noon; Clay on Sep 11 said "apparently settled" and "unhurried"; the
Fields Medalists published the same day.

## 6. The claim, in words (5:00)

Read the abstract. Translate: at rest, smooth stirring force, finite energy,
top speed goes to infinity at t = 1. Say plainly what it is not: the unforced
question is untouched.

## 7. The picture (6:00)

Spaghetti vortex. Figure-skater effect. The clever part is the ripples that
cancel the singular force so the leftover force is smooth. This is the part
Tao and others want to understand, not just certify.

## 8. How it was produced (7:00)

All from OpenAI's own post. 10,000 agents, 88 hours, 130 billion output
tokens, 17 hours to formalize. Note the press discrepancy on the warm-up
(1,000 vs "nearly 100" agents) as a one-line aside: this is why every number
on these slides was checked against the primary source.

## 9. The parallel story (8:30)

Two people, a year, several models from both labs, paid out of one
professor's research funds. Both groups build on Córdoba and Martínez-Zoroa.
Buckmaster's own words on the first LLM proof and on "AI slop". "Deep
Blue–Kasparov moment." Mention the third route (Caltech, neural network) in
one sentence.

## 10. The dispute (10:00)

Read it as two columns, one account each. Do not adjudicate. Point out the
one thing both sides agree on: OpenAI's sprint started after the rumour. And
the one thing that moved: OpenAI's wording from "cannot rule out" on Sep 8 to
"could not have influenced" on Sep 10.

## 11. Reactions (11:30)

Clay is careful. AMS is warm. The 25 Fields Medalists are the strongest
statement a mathematical community has made about AI. Tao's "non-renewable
resource" line is the one to remember. Bubeck's line shows the other frame:
this is a capabilities demonstration, and the next targets are materials
and medicine.

## 12. What machine-checked means (12:30)

Lean checks the proof. Humans check the statement. OpenAI helped by targeting
an independent transcription of the Clay statement. Quanta's sentence is the
takeaway.

## 13. Questions (13:30)

Pick two and ask the room. Trust and compute get the most reaction with a
tech audience. Then: "Part 2 is the other kind."

## 14. Part 2 section (15:00)

## 15. My corner of this world (15:15)

Layered materials, seismic imaging, ultrasound. MATLAB, nine years old, no
licence. The experiment: re-derive from the papers, port, verify.

## 16. The problem in one picture (16:15)

Stencil, corner, wrong slope. The fix only touches the stencils near the
boundary. Everything else is the same code.

## 17. 1-D ringing (17:30)

Explain the figure, then **play clip 1**
(`outputs/wave1d_naive_vs_aware_coarse.mp4`, 10 s). Left panel rings, right
panel sits on the dashed exact curve. Both panels are the same grid and
time step.

## 18. 1-D convergence (19:00)

Halve vs divide by 16. Right panel: a layer thinner than the stencil.

## 19. 2-D scattered points (20:00)

No grid. Points straddling the boundary were the stability trick; it took
years and is still not proven. 30 nearest neighbours per stencil.

## 20. 2-D naive vs aware (21:00)

Explain the four columns, then **play clip 2**
(`outputs/wave2d_naive_vs_aware.mp4`, 8 s) and **clip 3**
(`outputs/wave2d_naive_vs_aware_curved.mp4`, 8 s). Watch the error maps: the
standard error is born at the boundary and travels with the wave.

## 21. 2-D convergence (23:00)

The dashed line is what you would get with no boundary at all. The
interface-aware error sits on it: nothing left to fix.

## 22. What the collaboration looked like (24:00)

Numbers on the left; the human list on the right. The human list is the same
list as Part 1's last question.

## 23. Two kinds (26:00)

The table. Capability is real at both ends. The difference is steering,
checking, and understanding.

## 24. For the curious (27:30)

Point at the gentle starts. Repo link. Open for questions.

## Backup slides

The equations; the stability (eigenvalue) figure; the numbers behind the
convergence plots. Use if someone asks "what does the equation look like" or
"how did you keep 2-D stable".
