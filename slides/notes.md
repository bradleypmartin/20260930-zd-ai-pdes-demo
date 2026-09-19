# Speaker script, 30 minutes

Nineteen PDF pages: title, a framing slide, two section slides, seven content
slides per part, and a links slide for the Q&A. Headings give the PDF page,
the footer number printed on the slide (content slides only, n/16), and the
start time. Timings assume about two minutes per content slide, with the
clips inside Part 2. Rehearse on Sep 29; if it runs long, trim the reactions
and the questions on 8/16 first, then the collaboration slide (14/16). Clips
play from `slides/clips.html` (open in Chrome, `F` for full screen, `1`/`2`/`3`
to play each from the start); the files are in `slides/videos/`.

| PDF page | Footer | Time | Cue |
| --- | --- | --- | --- |
| 1–2 | 1/16 | 0:00–1:30 | Title; why this talk |
| 3–10 | 2–8/16 | 1:30–14:30 | Part 1, seven slides |
| 11–17 | 9–14/16 | 14:30–26:00 | Part 2, seven slides, three clips (~30 s total) |
| 18–19 | 15–16/16 | 26:00–30:00 | Comparison table; links; questions |

## 1. Title (0:00)

Two kinds of AI in research math. One made the news this month. The other is
the kind most of you could do tomorrow.

## 2. Why this talk (1/16, 0:30)

Three things happened in two weeks. OpenAI said its AI settled a famous $1M
question about fluids. The night before, an NYU mathematician and an
Anthropic researcher published a year of closely related work, done with
Claude and Codex. And I rebuilt my dissertation's simulation methods with
Claude Code in a day. The thesis: agents bring staggering programming and
logical power; paired with a human's intuition in a field they make progress
fast at every scale, from 10,000 agents to one assistant.

## 3. Part 1 section (1:30)

## 4. Fluids, Newton, and a question from 1934 (2/16, 1:30)

No equations. Navier–Stokes is F = ma for a fluid. The question is whether
the equations can predict something physically impossible: infinite speed in
finite time, starting from a smooth state. If they can, the model breaks down
there and molecules have to take over. Clay put $1M on the answer in 2000.

Walk the diagram: smooth start in, equations in the middle, two possible
outcomes out; either one wins. Then the hinge of the whole story: the official
statement lets a counterexample use a smooth stirring force. The popular
picture, "can turbulence blow up on its own", is the unforced version, and
nobody has answered that.

## 5. What happened, in two weeks (3/16, 3:30)

Walk the timeline left to right, two colours. Blue: Alpöge and Buckmaster had
results in mid-August and went public the night of Sep 7. Orange: OpenAI's
sprint started Sep 1 after a rumour, reached the result Sep 5, announced
Sep 8. Grey: Clay on Sep 11 said "apparently settled" and "unhurried"; the
Fields Medalists published the same day; a week later Clay still lists the
problem as Active.

## 6. The claim, and the picture behind it (4/16, 5:15)

Read the abstract. Translate: at rest, smooth stirring force, finite energy,
top speed goes to infinity at t = 1. Then the picture: spaghetti vortex,
figure-skater effect. The clever part is the ripples that cancel the singular
force so the leftover force is smooth. This is the part Tao and others want
to understand, not just certify. Say plainly what it is not: the unforced
question is untouched.

## 7. How it was produced (5/16, 7:15)

All from OpenAI's own post. Read the tiles: 10,000 agents, 88 hours, 130
billion output tokens, 17 hours to formalize, millions of dollars. Then the
shape of it: one model, groups of agents, one group per variant of the
problem; the easier Euler question fell first and seeded the rest. Note the
press discrepancy on the warm-up (1,000 vs "nearly 100" agents) as a one-line
aside: every number on these slides was checked against the primary source.

## 8. The parallel story, and the dispute (6/16, 9:00)

Two people, a year, models from both labs, paid out of one professor's
research funds. Both groups build on Córdoba and Martínez-Zoroa.
Buckmaster's own words on "AI slop". Then the two columns, one account each.
Do not adjudicate. Point out the one thing both sides agree on: OpenAI's
sprint started after the rumour. And the one thing that moved: OpenAI's
wording from "cannot rule out" on Sep 8 to "could not have influenced" on
Sep 10.

## 9. What machine-checked means (7/16, 11:00)

Lean checks the proof. Humans check the statement. OpenAI helped by targeting
an independent transcription of the Clay statement. Quanta's sentence is the
takeaway.

## 10. Reactions, and questions to argue about (8/16, 12:30)

Left column: Clay is careful; the 25 Fields Medalists are the strongest
statement a mathematical community has made about AI; Tao's "non-renewable
resource" line is the one to remember; Buckmaster's "Deep Blue–Kasparov";
Bubeck's line shows the other frame, a capabilities demonstration. Right
column: pick two and ask the room. Trust and compute get the most reaction
with a tech audience. Then: "Part 2 is my end of the scale."

## 11. Part 2 section (14:30)

## 12. My corner of this world (9/16, 14:30)

Layered materials, seismic imaging, ultrasound. Then the picture: a stencil
is a few neighbouring points used to estimate a slope; at a material boundary
the wave has a corner; a stencil that straddles the corner fits a smooth
curve through it and gets the slope wrong. The fix only touches the stencils
near the boundary. Everything else is the same code. Last bullet: MATLAB,
nine years old, no licence; re-derive from the papers, port, verify, one day.

## 13. 1-D ringing (10/16, 16:30)

Explain the figure, then **play clip 1** (key `1` in clips.html, 10 s). Left
panel rings, right panel sits on the dashed exact curve. Both panels are the
same grid and time step.

## 14. 2-D scattered points (11/16, 18:30)

No grid. Points straddling the boundary were the stability trick; it took
years and is still not proven. 30 nearest neighbours per stencil. The picture
is 2,500 points so the rows are visible; the runs use 10,000.

## 15. 2-D naive vs aware (12/16, 20:00)

The snapshot grid is the curved-interface case, matching the node picture on
the previous slide; the error is against a 40,000-point interface-aware run
because there is no exact solution for curved interfaces. Explain the four
columns, then **play clip 3** (key `3`, 8 s), the curved case. **Clip 2**
(key `2`, 8 s) is the flat case with the exact solution; play it if there is
time. Watch the error maps: the standard error is born at the boundary and
travels with the wave.

## 16. How fast the error shrinks (13/16, 22:00)

Left, 1-D: halve vs divide by 16. Right, 2-D: halve vs divide by 4. Same
orders (first or second vs fourth); in 2-D doubling the points only shrinks
the spacing by root two, which is why the 2-D factors are smaller. The dashed
line is what you would get with no boundary at all, and the interface-aware
error sits on it: nothing left to fix. The thin-layer and curved-boundary
panels are in the repo for anyone who asks.

## 17. What the collaboration looked like (14/16, 24:00)

Tiles first: one day, nine PRs, 106 tests, four real bugs caught before the
demo. Then the two columns. The human list is the same list as Part 1's
questions: steering, judging what matters, designing the verification.

## 18. Two kinds (15/16, 26:00)

The table. Capability is real at both ends. The difference is steering,
checking, and understanding.

## 19. For the curious (16/16, 27:30)

Point at the gentle starts. Repo link, which has the equations, the
stability figure, and the numbers behind the convergence plots for anyone
who wants the detail. Open for questions.
