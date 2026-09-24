# The Homebrew tap of Burnout

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

## Where the formula comes from

`scripts/homebrew-formula.sh` in the Burnout repository writes
`Formula/burnout.rb` from the `SHA256SUMS` of each release. Change the
script, and not the formula. A person writes each commit here. No bot pushes
to this tap.

Report a problem in the
[issues of Burnout](https://github.com/Stiven-Gjekaj/burnout/issues).
