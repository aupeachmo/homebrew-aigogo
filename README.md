# homebrew-aigogo

Homebrew tap for [aigogo](https://github.com/aupeachmo/aigogo)

## Install

```bash
brew tap aupeachmo/aigogo
brew install aigg
```

## Upgrade

```bash
brew update
brew upgrade aigg
```

## How it works

The formula in `Formula/aigg.rb` is automatically updated by the [aigogo release workflow](https://github.com/aupeachmo/aigogo/actions) each time a new version is tagged. The workflow downloads the release checksums, generates an updated formula, and commits it to this repository via the GitHub API (producing verified, signed commits).
