# gatlen-resume

![Uses the Cookiecutter Data Science project template, GOTem style](https://img.shields.io/badge/GOTem-Project%20Instance-328F97?logo=cookiecutter) [![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)

<!-- [![tests](https://github.com/GatlenCulp/gatlen-resume/actions/workflows/tests.yml/badge.svg)](https://github.com/GatlenCulp/gatlen-resume/actions/workflows/tests.yml) -->
<!-- ![GitHub stars](https://img.shields.io/github/stars/GatlenCulp/gatlen-resume?style=social) -->

## 01 About

This is Gatlen's personal resume in a variety of formats (md, markdown, json (json-resume), etc.), using a single source of truth I can utilize elsewhere.

I'm mainly using this because I'm tired of destructively editing my Resume in the same Microsoft Word document I've been using since high school. I wanted version control. I wanted more flexibility and the ability to programmatically control its creation. I want to query this information elsewhere (potentially on my website or something). And I want to continually add to my Resume's data without deleting things from it directly.

## 02 Technologies

- [JSON-Resume](https://jsonresume.org/) -- The open source initiative to create a JSON-based standard for resumes. For developers, by developers.
    - [resumed](https://github.com/rbardini/resumed) -- Modern alternative to the resume-cli
- [RenderCV](https://docs.rendercv.com/) -- Typst-based Python package with a command-line interface (CLI) that allows you to version-control your CV/resume as source code. It reads a CV written in a YAML file with Markdown syntax, converts it into a Typst code, and generates a PDF.


There are some [other similar projects](https://jsonresume.org/projects)

## 03 Getting Started

### 03.01 Install Requirements

For python using uv and activate environment
```bash
uv sync
source ./.venv/bin/activate
```

For using json-resume (npm package):
```bash
npm install resumed jsonresume-theme-even
```

### 03.02 Build Typst Resume

Using RenderCV

```bash
# make run
rendercv render resume/Gatlen_Culp_CV.yaml --watch \
-o out
```

Using jsonresume (not to parity, use RenderCV above)

```bash
cd json-resume && \
npx resumed render resume.json \
--theme jsonresume-theme-even
```


## 04 Random Notes


### 04.01 Typst
Typst is pretty cool!!! Uncertain if it is more configurable than LaTeX or have access to similar packages but the syntax is far better and it is programmatic which is LOVELY.

### 04.02 `npm run` and `npx`

`npm run` is for running `package.json` scripts, `npx` runs a package directly.

---

## Things to potentially add (if not already there)

- [ ] METR SWE-Agent Integration and UK-AISI Inspect
- [ ] METR Help with an early evaluation of DeepSeek (minimal, sad.)