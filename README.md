# NOVA IMS LaTeX Thesis Template

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg?color=green)](https://www.latex-project.org/)
[![GitHub license](https://img.shields.io/badge/License-LaTeX%20v1.3c-green.svg)](https://www.latex-project.org/lppl/lppl-1-3c)
[![Version](https://img.shields.io/badge/version-0.0.1-blue.svg)]()
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)]()

---

A simplified LaTeX thesis template for **NOVA IMS** dissertations. Forked from the [NOVAthesis](https://github.com/joaomlourenco/novathesis) template by João M. Lourenço, stripped down to a flat, easy-to-edit structure, and adapted for the NOVA IMS context. This was initially inspired by [Paulo de Campos Souza's IMS adaptation](https://github.com/pdecampossouza/nova-ims-thesis-template-2025), but later reworked to support DGI programs and to be a faithful LaTeX reproduction of the official NOVA IMS Word template. 

---

## Table of Contents

- [NOVA IMS LaTeX Thesis Template](#nova-ims-latex-thesis-template)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Current Support](#current-support)
  - [Project Structure](#project-structure)
  - [Getting Started](#getting-started)
    - [1. Install LaTeX](#1-install-latex)
    - [2. Configure your thesis](#2-configure-your-thesis)
    - [3. Add content](#3-add-content)
    - [4. Compile](#4-compile)
    - [5. Overleaf](#5-overleaf)
  - [Bibliography Styles](#bibliography-styles)
  - [Roadmap](#roadmap)
  - [Credits](#credits)

---

## Overview

This template is designed to be simple for day-to-day thesis writing. It:

- Produces output that matches the official NOVA IMS Word template
- Uses the current NOVA IMS brand identity
- Has a flat, non-nested directory structure — no hunting through subdirectories
- Requires minimal LaTeX knowledge to configure and use
- Manages bibliography automatically via `biblatex` + `biber`

---

## Current Support

| Program | Status |
|---------|--------|
| DGI (all programs) | Supported |
| Other NOVA IMS programs | Planned |

Extending support to other programs only requires adding the relevant cover pages and updating `config/cover.tex`. Contributions are welcome.

**Bibliography styles supported:**

- APA (default)
- Numeric
- Author-year

---

## Project Structure

```
main.tex                        # Compile entrypoint — DO NOT EDIT
Makefile                        # Build script
config/
  cover.tex                     # Thesis metadata: title, author, supervisors, dates, program
  bibliography.tex              # Bibliography style selection (apa / numeric / authoryear)
  bibliography-sources.tex      # Auto-generated from bibliography/*.bib — DO NOT EDIT
  files.tex                     # List of chapters/appendices to include
  packages.tex                  # Your extra packages and custom macros
chapters/
  preface.tex                   # Acknowledgements, abstract, etc.
  chapter-*.tex                 # Main thesis chapters
  appendix-*.tex                # Appendices
  annex-*.tex                   # Annexes
bibliography/
  *.bib                         # Your .bib files (all are picked up automatically)
figures/                        # All figures used in the document
style/
  novaims-dgi.sty               # Single consolidated style file
  assets/covers/DGI/            # DGI cover PDFs (EN and PT)
  assets/sdg/                   # SDG icon PDFs for abstract page (EN and PT)
```

---

## Getting Started

### 1. Install LaTeX

- **macOS:** [MacTeX](https://www.tug.org/mactex/)
- **Windows:** [TeX Live](https://www.tug.org) or [MikTeX](https://miktex.org)
- **Linux:** [TeX Live](https://www.tug.org)

Make sure `biber` is available (it ships with TeX Live and MacTeX by default).

### 2. Configure your thesis

Edit `config/cover.tex` to set your thesis title, author name, supervisor(s), program, and submission date. This is the only file you need to touch before you start writing.

### 3. Add content

- Write chapters in `chapters/chapter-*.tex`
- List them in `config/files.tex`
- Drop figures into `figures/`
- Add `.bib` files to `bibliography/` — they are picked up automatically

### 4. Compile

```bash
make
```

The `Makefile` scans `bibliography/*.bib`, generates `config/bibliography-sources.tex`, and runs the full `latexmk` + `biber` cycle. Output is `main.pdf`.

If you prefer to compile manually:

```bash
latexmk -shell-escape -file-line-error -pdf main
```

### 5. Overleaf

1. Download this repository as a ZIP
2. Upload to [Overleaf](https://www.overleaf.com)
3. Set `main.tex` as the root document
4. Compile

> **Note:** A paid Overleaf account will be required as the template will exceed the free plan's 20-second compilation limit.

---

## Bibliography Styles

In `config/bibliography.tex`, exactly one `\usepackage{biblatex}` block should be active. The three options are:

| Style | Notes |
|-------|-------|
| `apa` | Default. Author-date format per APA 7th edition |
| `numeric` | Numbered references in order of citation |
| `authoryear` | Author-year without full APA formatting |

Comment out the two blocks you are not using.

---

## Roadmap

- [ ] Add cover support for remaining NOVA IMS Master's programs
- [ ] Add cover support for Bachelor's programs
- [ ] Expand bibliography style options
- [ ] Overleaf template listing

Adding a new program is straightforward: provide the cover PDF assets and update `config/cover.tex`. Pull requests are welcome.

---

## Credits

- Original [NOVAthesis](https://github.com/joaomlourenco/novathesis) template by **João M. Lourenço**
- NOVA IMS adaptation by **Paulo de Campos Souza** ([nova-ims-thesis-template-2025](https://github.com/pdecampossouza/nova-ims-thesis-template-2025))
---

> **Disclaimer:** This is not an official NOVA IMS template. It has been created to match the official Word template as closely as possible, but compliance is not guaranteed. Always verify formatting requirements with your program coordinator.
- Configure content through files in `config/` and `chapters/preface.tex`.
- Put every figure under `figures/`.
- Set SDGs in `chapters/preface.tex` with `\setsdgs{...}` and print them with `\printsustainablegoals`.
