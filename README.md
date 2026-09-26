# The Homebrew tap of Burnout and mimikr

[Burnout](https://github.com/Stiven-Gjekaj/burnout) writes a bootable USB
drive from the command line. The commands are the same on Windows, on macOS
and on Linux.

## Install

    brew install stiven-gjekaj/tap/burnout

The formula installs the binary of the release: for macOS on Apple silicon
and on Intel, and for Linux on arm64 and on x86_64. Homebrew checks each
download against its SHA-256.

Burnout erases the drive that you give it, and nothing undoes that. Read
[TERMS.md](https://github.com/Stiven-Gjekaj/burnout/blob/main/TERMS.md)
before you run it.

## mimikr

[mimikr](https://github.com/Stiven-Gjekaj/mimikr) is a chatbot that writes
like a person you know, with a language model on your own computer.

    brew install --cask --no-quarantine stiven-gjekaj/tap/mimikr

The cask installs the macOS application of the release, for Apple silicon and
macOS 13 or later. No paid certificate signs it, so `--no-quarantine` keeps
macOS from refusing to open it. `scripts/homebrew-cask.sh` in the mimikr
repository writes `Casks/mimikr.rb` from the zip of each release.

## Where the formula comes from

`scripts/homebrew-formula.sh` in the Burnout repository writes
`Formula/burnout.rb` from the `SHA256SUMS` of each release. Change the
script, and not the formula. A person writes each commit here. No bot pushes
to this tap.

Report a problem in the
[issues of Burnout](https://github.com/Stiven-Gjekaj/burnout/issues).
