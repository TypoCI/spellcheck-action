<p align="center">
  <img src="https://typoci.com/images/typo-ci-logo.svg" alt="Typo CI Logo - It's a sword surrounded by brackets" width="96">
</p>

<h1 align="center">
  Typo CI - Spellcheck Action
</h1>

<p align="center">
Checks for spelling errors within commits via a GitHub Action
</p>

[![Twitter Follow](https://img.shields.io/twitter/follow/MikeRogers0?label=Follow%20%40MikeRogers0%20For%20Updates&style=social)](https://twitter.com/MikeRogers0)
[![RSpec](https://github.com/TypoCI/spellcheck-action/workflows/RSpec/badge.svg)](https://github.com/TypoCI/spellcheck-action/actions?query=workflow:RSpec)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/cc1820c92e584c289289d52b2e5823cc)](https://www.codacy.com/gh/TypoCI/spellcheck-action?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=TypoCI/spellcheck-action&amp;utm_campaign=Badge_Grade)

**Note: If you're using this GitHub Action on a private repository you must [purchase a license](https://gum.co/MvvBE) after 30 days.**

## Installation

Copy add the following to `.github/workflows/spellcheck.yml`:

```yml
# Add to: .github/workflows/spellcheck.yml
name: Typo CI

on:
  push:
    branches:
      - master
  pull_request:
jobs:
  spellcheck:
    name: Typo CI (GitHub Action)
    runs-on: ubuntu-latest
    timeout-minutes: 4
    if: "!contains(github.event.head_commit.message, '[ci skip]')"
    steps:
    - name: TypoCheck
      uses: typoci/spellcheck-action@master
      # with:
        # A license can be purchased via:
        # https://gumroad.com/l/MvvBE
        # typo_ci_license_key: ${{ secrets.TYPO_CI_LICENSE_KEY }}
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Configuration

You can tweak how Typo CI analyses your code by adding a `.typo-ci.yml` file to the root of your repository. Here is a sample file:

```yml
# This is a sample .typo-ci.yml file, it's used to configure how Typo CI will behave.
# Add it to the root of your project and push it to github.
---

# What language dictionaries should it use? Currently Typo CI supports:
# de
# en
# en_GB
# es
# fr
# it
# pt
# pt_BR
# tr
dictionaries:
  - en
  - en_GB

# Any files/folders we should ignore?
excluded_files:
  - "vendor/**/*"
  - "node_modules/**/*"
  - "*.key"
  - "*.enc"
  - "*.min.css"
  - "*.css.map"
  - "*.min.js"
  - "*.js.map"
  - "*.mk"
  - "package-lock.json"
  - "yarn.lock"
  - "Gemfile.lock"
  - ".typo-ci.yml"

# Any typos we should ignore?
excluded_words:
  - typoci

# Would you like filenames to also be spellchecked?
spellcheck_filenames: true
```

## The Prosperity Public License 3.0.0

This is free for open source, but if you're using it on a private repo then your are required to purchase a license key after 30 days of usage.

You can purchase a license via [Gumroad](https://gum.co/MvvBE) for $15 (excluding taxes). It helps support the ongoing development and every purchase is very appreciated.

## Dictionaries

### Development Languages

To help the spell checker detect words that are valid in the programming world, I've created a collection of language specific dictionaries which are stored in [db/dict/contextual](https://github.com/TypoCI/spellcheck-action/tree/master/db/dict/contextual).

These are pragmatically generated by analysing open source projects.

### Spoken Language Dictionaries

The `en`, `en_GB` & `pt_BR` dictionaries were built from [https://github.com/en-wl/wordlist](https://github.com/en-wl/wordlist) and they are stored in [db/dict/imported](https://github.com/TypoCI/spellcheck-action/tree/master/db/dict/imported).

Other languages have been imported via NPM from [wooorm/dictionaries](https://github.com/wooorm/dictionaries).
