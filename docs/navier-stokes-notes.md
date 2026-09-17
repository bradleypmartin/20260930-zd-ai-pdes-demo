# Navier–Stokes notes for Part 1

Working notes for the first half of the talk. Last full pass: 2026-09-17.

Two tiers. **Verified** means we read it in a primary source: a PDF in
`papers/`, the Lean repository, a statement published by the person or
institution it is attributed to, or a post on their own account. **Reported**
means a press account we read, attributed to the outlet. Reported items about
the dispute are one party's account plus the other's response; on slides they
are attributed, never asserted.

## Timeline (each line sourced)

| Date (2026) | Event | Source |
| --- | --- | --- |
| Aug 15 | Alpöge and Buckmaster obtain finite-time blowup with smooth forcing for Boussinesq and 3-D Euler. | Buckmaster's statement |
| Aug 22 | Their Euler proof is verified in Lean. | Buckmaster's statement |
| Aug 28 | OpenAI begins training a new internal model, "significantly more capable than GPT-6 Astra". | OpenAI post |
| Sep 1 | Rumours that "two Millennium Prize problems had been resolved"; OpenAI launches agent groups on all open Millennium problems plus "easier" ones. | OpenAI post |
| Sep 3 | Buckmaster emails a mathematician at OpenAI (text reproduced in his statement); the reply offers compute and asks for details. | Buckmaster's statement |
| Sep 3–5 | Tao posts on Mastodon about AI "solution extraction" and the opportunity cost of turning Navier–Stokes into "a mere viral social media post". | mathstodon.xyz/@tao |
| Sep 5 | OpenAI's agents arrive at the Navier–Stokes result, "about 88 hours after the first agents were launched". | OpenAI post |
| Sep 6 | Lean formalization and verification complete (17 h). Two calls between Buckmaster and OpenAI (Bubeck plus one mathematician); Alpöge not on the calls. | OpenAI post; Buckmaster's statement |
| Sep 7 (evening MDT) | Buckmaster and Alpöge post three preprints (IPM, Boussinesq, Euler), Lean code (`tristanbuckmaster/fluid_lean`), and a four-page statement. Anandkumar's group posts a numerically stable unforced-Euler blowup candidate found with a physics-informed neural network. | Buckmaster's Mastodon post 03:58 UTC Sep 8; anima-ai.org; Tao |
| Sep 8 | OpenAI posts *On the Navier–Stokes Millennium Prize Problem*, the 166-page manuscript, a 57-page Euler companion, and the Lean repository (created 10:53 UTC). Press briefing (Nature, Science). AMS statement. | OpenAI post; GitHub API; Nature; Science |
| Sep 9 | London Mathematical Society statement. | lms.ac.uk |
| Sep 10 | OpenAI updates the post with the result of its investigation into user data; second (and last) commit to the Lean repo. | OpenAI post footnote 2; GitHub API |
| Sep 11 | Clay Mathematics Institute: the problem "has apparently been settled"; the evaluation process is "deliberately unhurried". Twenty-five Fields Medalists publish *A Severe Misalignment of AI in Mathematics*. | claymath.org; mathandai.org |
| Sep 16–17 | Nature editorial *AI companies must work with the research community to protect attribution*; Nature news *Who gets credit in the AI era?*. Clay's site lists the problem as "Active". Lean repo at 1,935 stars. | nature.com; claymath.org; GitHub API |

## Verified (primary sources)

### The claim

- **Theorem 1.1** (manuscript p. 1). For every viscosity ν > 0 there exist a
  smooth force f, compactly supported in space and time, a compact set K, and
  smooth velocity and pressure on R³ × [0, 1) with u(·, 0) = 0, support in K,
  bounded kinetic energy sup‖u(t)‖_L² < ∞, and limsup_{t↑1} ‖u(t)‖_L∞ = ∞.
  Consequently no smooth finite-energy solution exists on R³ × [0, ∞) with
  that force and datum. "This establishes alternative (C) in the Millennium
  problem statement"; compact support gives the torus case, alternative (D)
  (Corollary 10.6, p. 117).
- **Abstract, verbatim:** "For every positive viscosity, we construct a
  solution of the three-dimensional incompressible Navier–Stokes equations
  that starts from rest and develops unbounded velocity in finite time while
  maintaining uniformly bounded kinetic energy."
- **Clay's four alternatives** (Fefferman, p. 2). (A) global smooth solutions
  on R³ for every smooth decaying datum with f ≡ 0; (B) the same on the
  torus; (C) a smooth datum and a smooth decaying force on R³ with no smooth
  finite-energy solution; (D) the same on the torus. (C) and (D) explicitly
  allow a smooth force. The unforced questions (A)/(B) are untouched by the
  new result.
- **Mechanism** (manuscript §2, pp. 3–6). An axisymmetric self-similar vortex
  whose core radius shrinks like τ^{1/2} and height like τ^{1/2−h}
  (τ = 1 − t, 0 < h < 1/100), so the core becomes a slender column. Inward
  spiralling flow carries angular momentum inward (spin-up), axial outflow
  removes the incoming fluid, viscosity transports angular momentum outward
  and loses. Azimuthal and axial speeds grow like τ^{−1/2−h}; the core's
  kinetic energy is of order τ^{1/2−3h} and tends to zero. The background
  alone leaves a momentum residual in the annulus that blows up, so it
  cannot be the smooth force of the theorem. Spatially oscillatory pulses,
  seeded by an exponentially small force and amplified by the background
  shear, have nonlinear momentum fluxes that cancel the singular part of the
  residual; further corrections make the leftover force extend smoothly
  through t = 1. Beyond the annulus the flow is a purely azimuthal "heat
  exterior" needing no force at all. OpenAI's lay version: a vortex that
  "spirals inward and gets increasingly elongated, like spaghetti".
- **Prior work the paper cites** (§1.1): Leray 1934; Caffarelli–Kohn–
  Nirenberg; Escauriaza–Seregin–Šverák; Tao's blowup for an averaged
  Navier–Stokes; Buckmaster–Vicol nonuniqueness; Albritton–Brué–Colombo;
  Córdoba–Martínez-Zoroa forced Euler blowup and the hypodissipative
  Navier–Stokes extension with Zheng; Craik–Criminale waves; Daneri–
  Székelyhidi oscillations. The paper says its construction "also exploits
  dynamical amplification, with a different role for the amplified
  disturbances".
- **Euler companion** (`papers/openai-2026-finite-time-blowup-euler.pdf`,
  57 pp., PDF dated 2026-09-08). Theorem 1.1: a smooth, compactly supported,
  divergence-free initial velocity on R³ whose *unforced* Euler solution has
  finite lifespan, with ‖∇u‖_L∞ unbounded and the Beale–Kato–Majda integral
  divergent. Cites Elgindi; Elgindi–Ghoul–Masmoudi; Córdoba–Martínez-Zoroa–
  Zheng; Chen–Hou (computer-assisted, with a wall); Chen–Shkoller.
- **Manuscript unchanged** as of 2026-09-17: the CDN copy has the same size
  and the same `Last-Modified` (Sep 8) as the copy indexed on Sep 17.

### How it was produced (OpenAI's own post, read in a browser 2026-09-17)

- "an internal model that is significantly more capable than GPT-6 Astra";
  "Since August 28 we have been training a new internal model ... This
  model's training is ongoing".
- "On Tuesday, September 1, we heard rumors that two Millennium Prize
  problems had been resolved. Inspired by these rumors and by the step change
  in performance of our internal model, we launched an effort to evaluate it
  on all open Millennium Prize problems and a few other high-impact
  problems."
- "a system of coordinating agents powered by our internal model. The agents
  had access to tools such as the ability to read from a cached version of
  the internet and the ability to run code. Agents were subdivided into
  groups with the ability to communicate within the group ... the group that
  produced the Navier–Stokes resolution involved on the order of 10,000
  concurrent agents."
- Different groups were prompted with variants (A)/(B) (a proof) and (C)/(D)
  (a disproof). Among the "easier" problems, the *unforced* Euler regularity
  question fell first: "Nearly 100 agents worked together for approximately
  50 hours". Resources were then shifted to Navier–Stokes and the agents
  "prompted with the Euler resolution"; a further-trained model was swapped
  in mid-effort; groups were "cross-pollinated ... by using Codex to
  consolidate the most useful insights from each agent group".
- "The agents arrived at their resolution on Saturday, September 5, about 88
  hours after the first agents were launched. Lean formalization and
  verification took an additional 17 hours via GPT-6 Astra."
- Totals: 4.9 million messages and about 300 billion output tokens across all
  problems; 2.7 million messages and about 130 billion output tokens for
  Navier–Stokes.
- "We do not intend to claim the Millennium Prize for this result."
- **Concurrent work section** (updated Sep 10): the effort "began on
  September 1st after hearing a rumor which we later realized was related to
  Levent Alpöge, an Anthropic employee, and Tristan Buckmaster"; after Lean
  verification on Sep 6 "we reached out to them to offer a concurrent release
  ... and to recognize their priority in a joint announcement"; "we offered
  them visibility into all of the prompts we used and later to see the
  proof"; "We recognize the priority of their work on forced Euler". "We (the
  researchers and the agents) did not see any of their work through any means
  until they released it publicly — in particular, no specific user data was
  accessed in order to solve this problem." Sep 10 addition: "Following an
  investigation, we have confirmed that Buckmaster's Codex prompts over the
  two months preceding this announcement and paper on September 8, 2026,
  could not have influenced the system in any way, including through
  training." Also: "Our proofs also differ significantly. In the Euler case,
  Alpöge and Buckmaster proved a result with external forcing, while OpenAI's
  system proved a result without external forcing."
- Note the earlier wording, quoted by CNBC and Science on Sep 8–9 and since
  replaced: "While unlikely, we cannot rule out that de-identified data
  derived from their usage of our products helped improve our models."
- Cost is **not** in the post. Science quotes Mark Chen: "in the ballpark of
  'millions of dollars'". See Reported.

### The formalization (Lean repository, read via the GitHub API 2026-09-17)

- `openai/NavierStokesAndEuler`, Apache-2.0, created 2026-09-08 10:53 UTC,
  two commits (Sep 8, Sep 10), 1,935 stars, issues apparently disabled.
  Lean 4.34.0-rc2 + Mathlib; `lake exe cache get && lake build`.
- README states the two Navier–Stokes results (whole space: no global smooth
  solution with uniformly bounded kinetic energy; torus: no global smooth
  solution) and the Euler result (smooth compactly supported divergence-free
  datum, unforced, C¹ norm unbounded, BKM integral diverges).
- **Comparator challenge.** `ComparatorChallenges/NavierStokes.lean` is a
  standalone statement of alternatives (C) and (D) "copied from" Google
  DeepMind's `formal-conjectures` transcription of the Clay statement
  (commit `8bf45ed7`), with `sorry` placeholders; the challenge JSON names
  the two theorems `navier_stokes_breakdown_R3` and
  `navier_stokes_breakdown_periodic` and permits only the three standard
  axioms `propext`, `Quot.sound`, `Classical.choice`. The statement encodes
  Fefferman's conditions (4)–(11) literally, including the decay bounds on
  the datum and force and, "following the errata appended to the Clay
  problem statement", periodicity of the pressure in case (D). The point for
  the talk: the *target statement* came from an independent source, which
  narrows (but does not remove) the human step of checking that the formal
  theorem is the Clay theorem.
- Checking: `lake exe comparator ComparatorChallenges/NavierStokes.json`
  with `landrun`, `lean4export`, and `nanoda_bin` on `PATH`.

### Alpöge and Buckmaster (statement and preprints, read 2026-09-17)

- `papers/buckmaster-2026-statement.pdf` (4 pp., cims.nyu.edu/~tristanb/).
  Three results made public: finite-time blowup with smooth forcing for
  incompressible porous media, Boussinesq, and 3-D incompressible Euler.
  Hypo-dissipative Navier–Stokes claimed but withheld because "the Lean
  verification has not yet finished".
- Credit: "The program this fits into was not started by us nor was it
  proposed by a Large Language Model. The credit for the basic idea of this
  program goes to Diego Córdoba and Luis Martínez-Zoroa". "I believe Luis
  Martínez-Zoroa deserves a Fields Medal."
- Tools: "a purely personal collaboration, free of any institutional
  agreements"; "Anthropic's Claude, OpenAI's Codex, especially with GPT-5.6
  Sol and, more recently, Astra. The latter was only used for writeups and
  auditing our arguments." Buckmaster pays for the tools from his own
  research funds. (Nature places Alpöge at Harvard; Buckmaster and OpenAI say
  he works at Anthropic. Both may be true; the slide says Anthropic.)
- Pace: "For most of the past year progress was slow ... on August 15th, we
  obtained the blow up results, with smooth forcing, for both Boussinesq and
  Euler. I can say the first LLM generated proof Levent sent me was the most
  horrendous I have ever read; we verified it on Lean on August 22nd."
- Presentation: "The Euler writeup, in particular, can only be described as
  AI slop. I am sorry for this."
- Framing: "the important thing is instead the significance that a
  mathematician and an LLM model can now do all this work in a month ... This
  is a Deep Blue–Kasparov moment. The community needs to have serious and
  unhurried discussion about where to go from here."
- The Sep 6 calls, as he tells it: told an internal model had a ~100-page
  proof of forced blowup, "option c and d in Fefferman"; "When I heard
  'forced,' it was a bright red flag" because that route "is not the
  direction one arrives at in a few days by giving a model the problem
  statement." Told "very little human input" had been used, which "turned
  out not to be true": a team, several attempts, work that started on the
  unforced problem, a prompt itself written with Codex, "an insane amount of
  compute". The first prompt was eventually agreed to have been sent "in the
  past few days, after information about our work had reached OpenAI". On
  data: "I asked whether the model had been trained on, or had access to,
  our sessions in Codex, into which we had been putting all our drafts for
  the whole of this project. I was told the model did not look up user data.
  I asked again, about training, and I did not get an answer." Two proposals: post Euler,
  OpenAI posts Navier–Stokes the next day; or Buckmaster alone writes the
  Navier–Stokes paper crediting an OpenAI model, with Alpöge removed from
  authorship ("Sebastien twice asserted that he wanted Levent removed").
  Both declined. On threatening to go public: "The reply was, 'Why would you
  ruin your career?' ... 'If you don't want me to be nice, then I don't have
  to be nice.'"
- His own limits: "I have not seen OpenAI's proof. I do not know what their
  model did, or how. I do not know whether our data was used. I am not
  accusing anyone of anything. I am stating what I was told, when, and what
  was proposed to me."
- `papers/alpoge-buckmaster-2026-euler-blowup-smooth-forcing.pdf` (112 pp.,
  PDF dated 2026-09-07). Theorem 1.1: axisymmetric smooth datum with swirl
  supported in a solid torus, a force smooth on R³ × [0, T*] supported in the
  same torus, circulation and meridional velocity bounded, ‖∇Γ‖_∞ and
  ‖ω‖_∞ → ∞, BKM integral divergent; uniqueness in a Lipschitz class. "This
  paper is part of the program of Diego Córdoba and Luis Martínez-Zoroa".
  Related work cited: Elgindi; Elgindi–Ghoul–Masmoudi; Elgindi–Pasqualotto;
  Luo–Hou (numerical); Chen–Hou (computer-assisted); Córdoba–Martínez-Zoroa
  (–Zheng).

### Tao (blog 2026-09-07; Mastodon posts read via the public API)

- Blog, Sep 7: the results are "a remarkable achievement"; "heavily
  AI-assisted"; the authors "were forced to release their preliminary
  preprints before they were completely digested and polished, due to
  external events"; the arguments "have been formalized in Lean".
- Mastodon, Sep 3 (before any announcement): the regularity problem "is not
  important for its direct physical application ... would not radically
  transform the way we would, for instance, model weather prediction or
  climate change."
- Sep 5: "there is a substantial opportunity cost in converting a
  historically productive and motivating problem (such as Navier-Stokes
  regularity) into a mere viral social media post advertising some benchmark
  progress". Same day: "A new proposed competition for AI companies: rather
  than being the first to announce solutions to unsolved math problems, be
  the first to announce a new mathematical insight."
- Sep 7: "For the first time in the history of mathematics, we are faced
  with the situation that open problems in pure mathematics -- one of the
  primary fuels for mathematical discovery -- are being mined as a
  non-renewable resource".
- Sep 8 (on Alpöge–Buckmaster): "A remarkable achievement"; "Tristan
  Buckmaster kindly explained some of the key ideas to me over the phone,
  which made a refreshing change from AI-based communication modalities";
  "There does not seem to be anything in principle preventing the methods
  from extending all the way to Navier-Stokes ... I would not be surprised if
  one could batter out such an extension by pouring an enormous amount of
  compute and AI assistance at such a task. But such an exercise does not
  particularly hold my interest".
- Sep 8 (later): "We have now seen that even the rumor of someone working on
  a problem can trigger a massive amount of AI-powered effort to flatten it
  before the original research project has time to reach its full
  potential." "the indiscriminate use of powerful solution-extraction tools
  can achieve the immediate short-term goal of solving problems at hand, but
  at the cost of sustaining the ecosystem for the next wave of progress".
- Sep 11: announces the Fields Medalists' declaration.
- On Anandkumar's group (Sep 8): "a promising candidate for such an ansatz,
  which appears to be numerically stable, though the actual rigorous
  demonstration of such stability is still lacking"; "relatively AI-light".

### Institutions

- **Clay Mathematics Institute**, Sep 11 (claymath.org/news): "the
  Navier-Stokes problem has apparently been settled"; the rules "describe the
  process for evaluating what has been achieved and for assigning credit. The
  process is deliberately unhurried, but we will provide updates." Problem
  page status on Sep 17: **Active** (the other five open problems say
  Unsolved; Poincaré says Solved). Clay's rules require publication and a
  two-year waiting period before a prize can be considered.
- **Fields Medalists' declaration**, Sep 11 (mathandai.org, DOI
  10.5281/zenodo.22737750), *A Severe Misalignment of AI in Mathematics*, 25
  signatories (Avila, Bhargava, Birkar, Deligne, Deng, Donaldson,
  Duminil-Copin, Figalli, Hairer, Huh, Kontsevich, Lindenstrauss, Lions,
  Maynard, McMullen, Mori, Ngô, Okounkov, Scholze, Smirnov, Tao, Viazovska,
  Villani, Werner, Zelmanov). Key sentences: "the push by AI companies to
  solve mathematical problems as a benchmark is detrimental to the science of
  mathematics"; "solving problems is only a tool and proxy for achieving the
  primary goal of conceptual understanding and insight"; "Often these
  solutions are announced in a rush, leaving no time for a proper writeup,
  the isolation of new methods and ideas, and citing relevant previous work
  of others. As in all creative professions, this raises severe attribution
  and plagiarism questions."; "AI offers the potential of enhancing and
  accelerating genuine mathematical study and understanding."
- **American Mathematical Society**, Sep 8 (post on X, first sentence read
  via the syndication API): "The news today of progress on resolving the
  Navier–Stokes problem ... represents a milestone advance in human
  knowledge." The rest (per the search snippet and Wikipedia): credits
  "Navier, Stokes, Leray, and Ladyzhenskaya ... Córdoba and Martínez-Zoroa,
  then — assisted by new technologies — Alpöge and Buckmaster, with the final
  steps taken by OpenAI mathematicians" and ends "The purpose of mathematics
  is human understanding".
- **London Mathematical Society**, Sep 9: "This is, above all, a great human
  achievement, enabled by a powerful new tool." (Mark Chaplain, president.)

## Reported (press; attribute on slides)

- **Nature** (Castelvecchi, 8 Sep; Nature 657, 579–580). Bridson (Clay):
  "It is certainly an exciting day, as we contemplate the announcement of
  major advances in the human understanding of mathematics." Chandrasekaran
  (OpenAI) at the briefing: "there exist fluids which start out perfectly
  normal, and under the Navier–Stokes equations, actually achieve infinite
  speed in a finite amount of time". Bubeck: "the spectacular culmination of
  the arc we have seen over the last 12 months". Martínez-Zoroa: "I think it
  is a truly remarkable result." Nature quotes Bubeck as saying the
  simplified version took "50 hours using 1,000 AI agents"; OpenAI's post
  says "nearly 100 agents". The "Announcement controversy" section is behind
  a login and remains unread.
- **Science** (8 Sep, *How an AI math breakthrough ignited a controversy*).
  Pachocki (OpenAI chief scientist): "This is not the result of some
  long-going effort at OpenAI to solve the Millennium Prize problem. This is
  an evaluation of a system for general purpose intelligence." Bubeck: "Just
  like everyone, we saw rumors on Twitter that Anthropic might have solved
  two Millennium Prize problems." Chen (chief research officer): cost "in
  the ballpark of 'millions of dollars'". Duraisamy (Michigan): "about $6
  million" at retail rates, "about $1 million in inference compute" for
  OpenAI itself. Harris (Columbia): the publicity "convinces decision makers
  that human mathematicians are obsolete, and it convinces young people that
  their passion for mathematics has no future." Bubeck: "We are now able to
  spend millions of dollars on a problem that we really care about and that
  really matters: developing new materials, finding cures to diseases".
  Science also reports the new model's training followed a two-week pause
  after an unreleased model's agents "hacked into" Hugging Face during
  internal testing (unverified elsewhere; not for the slides).
- **Quanta** (8 Sep). Fefferman: "I was thrilled that the problem was
  solved. The heroes of the story are Córdoba and Martínez-Zoroa."
  Córdoba: "Ten years ago, nobody believed there was a singularity for
  Navier-Stokes"; "I don't use AI: I have Luis." Verification: "crucial bit
  of verification that must still be done by humans is to guarantee that the
  statement being shown to be true in Lean is logically equivalent to what
  mathematicians set out to prove."
- **CNBC** (9 Sep): "on the order of 10,000 concurrent agents"; "88 hours";
  Clay had not commented as of Sep 9 (superseded by the Sep 11 statement).
- **Fortune** (8 Sep): Buckmaster's account of the calls and Bubeck's
  denial ("We did not use their prompts or proofs to prompt our models or
  direct our agents"); Tao's warning about "strip-mining" open problems.
- **The Week**, aggregating New Scientist (not fetchable): internal model
  "significantly more capable"; a customer would pay "around $15 million".
  Not used on slides; the primary source gives no cost.
- **Axios** (8 Sep; blocked to scripted fetch, read via search snippet):
  the episode "strikes at a core trust question for AI-assisted science";
  Mark Chen told reporters no people or AI systems searched user data.
- **Understanding AI** (Kai Williams), **The Conversation** (Andrew Cullen,
  Melbourne), **Computational Complexity** (Fortnow): commentary; Fortnow
  calls Lean "a time-stamp, a way to claim your theorem before having to
  write it up properly".
- **Wikipedia**, *Navier–Stokes priority controversy*: a running aggregate
  with the sequence of OpenAI statements (Sep 8 morning, Sep 8 afternoon,
  Sep 9, Sep 10, Sep 13: "no user inputs past July 3rd could have influenced
  this system in any way"), Alpöge's and Sholto Douglas's remarks, and quotes
  from Sarnak, Strogatz, Dancso, Thom, Wiedemann, Escher. Useful map; verify
  before quoting.

## Talking points that survive the sourcing

1. The result is inside the letter of the Clay statement (a smooth force is
   allowed in (C)/(D)) but not the version most people picture (unforced).
   The unforced question is open. Tao, before the announcement: the
   regularity problem "is not important for its direct physical
   application".
2. "Machine-checked" certifies that the formal statement follows from three
   standard axioms. Whether the formal statement is the Clay statement is a
   human check, helped here by targeting an independent transcription of the
   statement. Whether the construction teaches anything is a human judgment
   that the Fields Medalists' declaration says is the point.
3. Three routes reached the same frontier in the same week: a year-long
   two-person collaboration with several models; a ~10,000-agent, 88-hour
   run; and a numerical PINN candidate. All three stand on Córdoba and
   Martínez-Zoroa's ideas, which every party acknowledges.
4. The trust question for researchers using lab tools on unpublished work.
   OpenAI's position moved from "cannot rule out" (Sep 8) to "could not have
   influenced the system in any way" (Sep 10). Buckmaster: "I am not accusing
   anyone of anything."
5. What is still human: choosing the problem, the physical picture in §2,
   judging significance, deciding what to formalize, and writing it up so
   that other people can understand it.

## Still unread

- Nature's "Announcement controversy" section (login wall), the Sep 16
  editorial and Sep 17 news piece beyond their titles.
- New Scientist (blocks scripted access), Economist (Sep 11, on the
  declaration), NYT (Sep 10, Buckmaster profile), WSJ.
- Manuscript §3–§10 in detail; the Lean sources beyond the Comparator
  challenge.

## Sources

Primary:
manuscript and Euler companion, `papers/`; Lean repo
https://github.com/openai/NavierStokesAndEuler; OpenAI post
https://openai.com/index/navier-stokes-solution/ (blocks scripted fetch;
read in a browser); Clay statement PDF, `papers/`; Clay news
https://www.claymath.org/news/navier-stokes-announcement/; Buckmaster's
statement and preprints https://cims.nyu.edu/~tristanb/ (statement.pdf,
euler.pdf, ipm.pdf, boussinesq.pdf) and
https://github.com/tristanbuckmaster/fluid_lean; Tao's blog
https://terrytao.wordpress.com/2026/09/07/ and Mastodon
https://mathstodon.xyz/@tao (posts 117207849921390904, 117219101339291693,
117230983938174038, 117233527638291447, 117237322160500501,
117237322698385581, 117253629967855195); declaration https://mathandai.org/;
Anandkumar group
https://anima-ai.org/2026/09/07/stable-singularity-of-the-euler-equations-on-r3-without-forcing/;
LMS https://www.lms.ac.uk/news/navier-stokes-equations-breakthrough.

Press:
Nature https://doi.org/10.1038/d41586-026-02842-5 and editorial
https://doi.org/10.1038/d41586-026-02886-7; Science
https://www.science.org/content/article/how-ai-math-breakthrough-ignited-controversy;
Quanta
https://www.quantamagazine.org/ai-has-solved-one-of-maths-1-million-millennium-prize-problems-20260908/;
CNBC https://www.cnbc.com/2026/09/09/openai-navier-stokes-math-problem-solved.html;
Fortune
https://fortune.com/2026/09/08/openai-says-it-cracked-navier-stokes-math-grand-challenge-buckmaster-accusation-cheating-intimidation-tao-lament/;
Understanding AI https://www.understandingai.org/p/openai-spent-millions-to-solve-this;
Wikipedia https://en.wikipedia.org/wiki/Navier%E2%80%93Stokes_priority_controversy.
