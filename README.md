# snappy

<img src="https://img.shields.io/badge/Donna-snappy-FF6347?style=for-the-badge" alt="Donna snappy"/> <a href="https://nikolasskyl.github.io/snappy/"><img src="https://img.shields.io/badge/Docs-Read-2F81F7?style=for-the-badge" alt="Docs - Read"/></a> <img src="https://img.shields.io/github/actions/workflow/status/NikolasSkyl/snappy/test.yml?branch=main&label=Test&style=for-the-badge" alt="Test status"/>

Snapshot testing for the [Donna](https://github.com/donna-lang/donna) programming language.

Inspired by [`birdie`](https://hexdocs.pm/birdie/) (Gleam) and [`insta`](https://insta.rs) (Rust).

## Installation

Add to your `donna.toml` as a dev-dependency:

```toml
[dev-dependencies]
snappy = { git = "https://github.com/NikolasSkyl/snappy", version = ">=0.1.0 and <1.0.0" }
```

## Quick start

```donna
import snappy

pub fn greet_test() -> String:
  snappy.snap("Hello, Donna!", "greet")

pub fn number_test() -> String:
  snappy.snap(string.from_int(42), "number")
```

Run checks:

```sh
donna check
donna test
```

## Interactive review

When stdin is a terminal, snappy prompts on each new or mismatched snapshot:

```
── new snapshot ─────────────────────────────────────────────
  title: greet
  file:  snapshots/greet.snap.new

─────────────────────────────────────────────────────────────
  1 + Hello, Donna!
─────────────────────────────────────────────────────────────

  a accept     accept the new snapshot
  r reject     reject the new snapshot
  s skip       skip the snapshot for now
  d hide diff  toggle snapshot diff
```

| Key | Action |
|-----|--------|
| `a` | accept (write `.snap`, delete `.snap.new`) |
| `r` | reject (delete `.snap.new`, test fails) |
| `s` | skip (keep `.snap.new`, test fails) |
| `d` | hide/show diff |


## Structure

```
snapshots/
  <title>.snap      — accepted snapshot
  <title>.snap.new  — pending new value (waiting for review)
```

## Licence

MIT
