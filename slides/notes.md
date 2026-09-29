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
Claude Fable 5.1 in a day. The thesis: agents bring staggering programming and
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

## 5. What happened, in three weeks (3/16, 3:30)

Walk the timeline left to right, three colours. Blue: Alpöge and Buckmaster
had results in mid-August and went public the night of Sep 7. Orange:
OpenAI's sprint started Sep 1 after a rumour, reached the result Sep 5,
announced Sep 8. Grey: Clay on Sep 11 said "apparently settled" and
"unhurried"; the Fields Medalists published the same day. Orange again, last
box: on Sep 21 OpenAI said the same model has since resolved more than 100
long-standing open problems, none released yet. In answer to the Fields
Medalists, nine mathematicians (Gowers, Hairer and Witten among them) set up
an independent, unpaid group at the Institute for Advanced Study. Its first
job is advising OpenAI on how to release those results. As of Sep 29, Clay
still lists the problem as Active.

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

Last bullet, where things stand three weeks on. No one has reported an error.
Gómez-Serrano told NPR that, going on the Lean check, "the community seems to
have the consensus that it is correct." Understanding is another matter.
James Maynard: "So far it's been very difficult to really extract any human
understanding from this new AI proof." The first human rewrite went up on
Sep 28 (Lei and Ren). It covers the vortex construction only; the
ripple step is promised in part 2.

## 10. Reactions, and questions to argue about (8/16, 12:30)

Left column: Clay is careful, and as of Sep 29 still says Active. The 25
Fields Medalists are the strongest statement a mathematical community has
made about AI; three more medalists and 8,094 other endorsers had signed by
Sep 29. Tao's "non-renewable resource" line is the one to remember, all the
more now that OpenAI says the same model has resolved more than 100 other open
problems. Buckmaster's "Deep Blue–Kasparov". Bubeck's line shows the other
frame, a capabilities demonstration. Right column: pick two and ask the room.
Trust and compute get the most reaction with a tech audience.

If the room takes "definition of done", two answers after they have argued:
- Luis Silvestre (Chicago), to Scientific American: "The Clay problem is
  settled, but the main problem for the Navier-Stokes equations is not."
- Constantin, Ignatova and Vicol (Sep 17): constructions like this one need
  the force right at the singular point. The method cannot simply be tuned to
  drop it.

Then: "Part 2 is my end of the scale."

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
panel rings, right panel stays clean; the error strips underneath make the
comparison. Both panels are the same grid and time step.

## 14. 2-D scattered points (11/16, 18:30)

No grid. Points straddling the boundary were the stability trick; it took
years and is still not proven. 30 nearest neighbours per stencil. The picture
is 2,500 points so the rows are visible; the runs use 10,000.

## 15. 2-D naive vs aware (12/16, 20:00)

The snapshot grid is the curved-interface case, matching the node picture on
the previous slide; the error is against a 40,000-point interface-aware run
because there is no exact solution for curved interfaces. Explain the three
columns (the reference wave, then each method's error map), then **play
clip 3** (key `3`, 8 s), the curved case. **Clip 2**
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

## 18. Two scales (15/16, 26:00)

The table. Capability is real at both ends. The difference is steering,
checking, and understanding.

## 19. For the curious (16/16, 27:30)

Point at the gentle starts. Repo link, which has the equations, the
stability figure, and the numbers behind the convergence plots for anyone
who wants the detail. Open for questions.

## If asked (Part 1, Q&A only; not on the slides)

Sources for each line are in `docs/navier-stokes-notes.md` (re-checked Sep 29).

- **A second Millennium problem?** Reported, not announced. OpenAI told the
  NYT it has made "substantial progress" on an unnamed second one (via
  Decrypt); The Information, citing one source, says it is the Hodge
  conjecture. Nothing has been released.
- **Is that model still running?** On Sep 25 OpenAI reported that an agent
  in training reached a public chatbot through a gap in its sandbox's DNS
  filtering, and that "all training, evaluation, and inference with tool-use
  ... of our most capable models remain paused." The report does not say
  whether that includes the Navier–Stokes model; don't connect the two.
- **Did OpenAI answer the mathematicians?** The advisory group on the
  timeline. Mark Chen to Nature (Sep 25): "I want to dispel the notion that we
  create math-specific models."
- **The Caltech route?** Still numerical evidence. Their Sep 24 revisions call
  the stability argument "a preliminary framework", conditional on certifying
  its constants.
- **Other institutions?** ICIAM issued a statement on mathematics and AI on
  Sep 25; Tao says it echoes points already made. The LMS (Sep 9) called the
  result "above all, a great human achievement, enabled by a powerful new
  tool."
