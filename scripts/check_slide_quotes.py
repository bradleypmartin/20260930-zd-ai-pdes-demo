"""Check that every \\q{...} in slides/talk.tex appears in docs/navier-stokes-notes.md.

Quotations on the slides must trace to the notes, which trace to the sources.
Both sides are normalised (LaTeX escapes, dashes, curly quotes, whitespace),
and a quotation with an ellipsis is checked fragment by fragment. Scare quotes
use \\sq{...} and are not checked. Exit status 1 if anything is missing.
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TEX = ROOT / "slides" / "talk.tex"
NOTES = ROOT / "docs" / "navier-stokes-notes.md"
MIN_FRAGMENT = 8


def normalise(text: str) -> str:
    text = text.replace("\\ldots", "...").replace("…", "...")
    text = re.sub(r"\\(emph|textbf|textit)\{([^}]*)\}", r"\2", text)
    text = re.sub(r"\\[,;!]", " ", text)
    for escaped in ("$", "%", "&"):
        text = text.replace("\\" + escaped, escaped)
    for dash in ("---", "--", "–", "—"):
        text = text.replace(dash, "-")
    for curly, straight in (("‘", "'"), ("’", "'"), ("“", '"'), ("”", '"')):
        text = text.replace(curly, straight)
    text = text.replace("``", '"').replace("''", '"')
    return re.sub(r"\s+", " ", text).strip()


def quotations(tex: str):
    """Yield the argument of each \\q{...}, honouring nested braces."""
    i = 0
    while (start := tex.find("\\q{", i)) != -1:
        depth, k = 0, start + 2
        while k < len(tex):
            if tex[k] == "{":
                depth += 1
            elif tex[k] == "}":
                depth -= 1
                if depth == 0:
                    break
            k += 1
        yield tex[start + 3 : k]
        i = k + 1


def main() -> int:
    notes = normalise(NOTES.read_text())
    missing = 0
    for quote in quotations(TEX.read_text()):
        for fragment in normalise(quote).split("..."):
            fragment = fragment.strip(" .,;:")
            if len(fragment) >= MIN_FRAGMENT and fragment not in notes:
                missing += 1
                print(f"MISSING: {fragment!r}")
    print(f"{missing} missing fragment(s)")
    return 1 if missing else 0


if __name__ == "__main__":
    sys.exit(main())
