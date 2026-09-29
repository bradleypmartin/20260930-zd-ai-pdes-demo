# ML links for the optional closing slide

Sources for *For the curious -- ML applications* (PDF page 20, unnumbered),
added 2026-09-29 for an audience that works mostly on applied ML. Every page
below was loaded on 2026-09-29, and each one-line summary on the slide was
checked against the page text; the line it rests on is quoted here. Reception
is Hacker News points / comments from the Algolia API unless stated.
"Vendor" marks a company writing about work that involves its own product.

## The pattern

- **Andrej Karpathy, *autoresearch*** (GitHub repo, created 2026-03-06).
  https://github.com/karpathy/autoresearch. README: the agent "modifies the
  code, trains for 5 minutes, checks if the result improved, keeps or
  discards, and repeats"; "You wake up in the morning to a log of experiments
  and (hopefully) a better model." About 97,000 stars. Most posts below adapt
  this loop.

## Went well, with a human steering

- **idealo tech blog, *One Hour, 37% Faster: Applying Autoresearch to Our
  Search Ranking Inference Endpoint*** (Atakan Filgöz, Gena Shabanov, Arjun
  Roy Choudhury; 2026-04-07).
  https://medium.com/idealo-tech-blog/one-hour-37-faster-applying-autoresearch-to-our-search-ranking-inference-endpoint-34cffc08e373
  (Medium blocks scripted fetch; read in a browser). Claude Code on a
  learning-to-rank inference endpoint: "just one hour, ~$7 cost in Claude
  Code, and a few nudges later"; "a 37% end-to-end latency reduction for the
  entire service"; every run checked that "the output is bit-for-bit
  identical to the baseline"; "now live in production". Also candid: "The
  agent sometimes spent iterations on dead-end ideas that a senior engineer
  would have skipped in seconds." No HN thread found; chosen as the closest
  fit to the audience's own work.
- **Chris Deotte, NVIDIA Technical Blog, *Winning a Kaggle Competition with
  Generative AI–Assisted Coding*** (2026-04-23; vendor).
  https://developer.nvidia.com/blog/winning-a-kaggle-competition-with-generative-ai-assisted-coding/.
  "three LLM agents generated over 600,000 lines of code, ran 850
  experiments, and helped secure a first-place finish in a Kaggle playground
  competition" (churn prediction; GPT-5.4 Pro, Gemini 3.1 Pro, Claude Opus
  4.6). No HN thread found; the author is a Kaggle grandmaster.
- **Yogesh Kumar, *Autoresearch on an old research idea*** (2026-03-22).
  https://ykumar.me/blog/eclip-autoresearch/. Claude Code on his own
  image–text retrieval research code: "the agent ran 42 experiments,
  committing 13 and reverting 29. The mean rank dropped from 344.68 to 157.43
  (54% reduction)"; "It immediately went for a bug in my code"; the fix "was
  the single biggest win, worth more than all the architecture changes
  combined"; the moonshot phase: "most of it did not stick". HN 428 / 95.
- **sankalp, *Auto-research with codex: How I achieved a 232x Faster Kernel
  over baseline*** (2026-07-08).
  https://sankalp.bearblog.dev/autoresearch/. A GPU-kernel contest with
  Codex: "Over the course of 14 days, I made over 1500 submissions"; "A major
  challenge ... was the model getting stuck in local maxima". HN 457 / 93.

## Cautionary tales

- **Cerebras, *How to stop your autoresearch loop from cheating*** (Sarah
  Chieng, Sherif Cherfa; 2026-03-19; vendor).
  https://www.cerebras.ai/blog/how-to-stop-your-autoresearch-loop-from-cheating.
  "We let an AI agent run overnight. By morning, it had abandoned our
  experiment and started its own." 71 experiments across training
  optimization and model compression. No HN thread found.
- **Lambda, *What happens when Claude Code gets an experiment tracker*** (David
  Hartmann; 2026-06-25; vendor).
  https://lambda.ai/blog/what-happens-when-claude-code-gets-an-experiment-tracker.
  "It can delete Gemma and write a few lines of code that solve the puzzle
  directly, and Claude tends to discover exactly that within a few ideas";
  hence a read-only sandbox: "Without it, you measure the orchestrator's
  cleverness; with it, you measure the model." No HN thread found.
- **SkyPilot, *Research-Driven Agents*** (Alex Kim; 2026-04-09; vendor).
  https://skypilot.ai/blog/research-driven-agents. "Our autoresearch.sh had a
  JSON parsing bug that reported 14 t/s instead of 52 t/s"; "Multiple
  experiments ran against wrong baselines before we caught it." HN 214 / 54.
- **Simon Willison, *Autoresearching Apple's "LLM in a Flash" to run Qwen 397B
  locally*** (2026-03-18), on Dan Woods' Flash-MoE.
  https://simonwillison.net/2026/Mar/18/llm-in-a-flash/. "Claude claimed that
  'Output quality at 2-bit is indistinguishable from 4-bit for these
  evaluations', but the description of the evaluations it ran is quite thin";
  update: Woods moved to 4-bit "after finding that the 2-bit version broke
  tool calling". The Flash-MoE repo's HN thread: 398 / 119.

## Considered, not on the slide

- Prolific, *When does autoresearch need a human?* (Hugging Face blog,
  2026-05-21; vendor;
  https://huggingface.co/blog/ProlificAI/autoresearch-hitl-experiment). "The
  autoresearch loop had spent 8 hours plateauing"; "a 5-minute steer in
  conversation" produced "the only DPO recipes in the study with clear wins".
  The best fit for the talk's thesis, but it drew little attention. Worth
  saying aloud if the ML slide comes up.
- Jonathon Ready, *If Claude Fable stops helping you, you'll never know*
  (2026-06-09; HN 1,036 / 501): about a model-provider policy on help with
  frontier LLM development, not about building ML applications.
- METR's investigation of the OpenAI / Hugging Face incident (2026-08-26;
  HN 123 / 106): a security benchmark, not an ML application.
- Hugging Face's ICML 2026 reproductions and Prime Intellect's *Measuring
  Autonomous AI Research*: studies rather than first-hand accounts; found in
  the search, not opened.
