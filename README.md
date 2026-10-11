# The Homebrew tap of Burnout, mimikr, HotDogStand, AllTheTools and OnyxDiskInfo

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

## HotDogStand

[HotDogStand](https://github.com/Stiven-Gjekaj/HotDogStand) is a ticket
manager on your own computer, with the look of Windows 7.

    brew install --cask --no-quarantine stiven-gjekaj/tap/hotdogstand

The cask installs the macOS application of the release, for Apple silicon and
for Intel. No paid certificate signs it, so `--no-quarantine` keeps macOS from
refusing to open it. `scripts/homebrew-cask.sh` in the HotDogStand repository
writes `Casks/hotdogstand.rb` from the `SHA256SUMS` of each release.

## AllTheTools

[AllTheTools](https://github.com/Stiven-Gjekaj/AllTheTools) is one command,
`att`, with twenty tools that one system has and the other two do not, such
as lsusb, f3probe and caffeinate.

    brew install stiven-gjekaj/tap/allthetools

The formula installs the binary of the release: for macOS on Apple silicon
and on Intel, and for Linux on arm64 and on x86_64. `scripts/homebrew-formula.sh`
in the AllTheTools repository writes `Formula/allthetools.rb` from the
`SHA256SUMS` of each release.

## OnyxDiskInfo

[OnyxDiskInfo](https://github.com/Stiven-Gjekaj/OnyxDiskInfo) reads the
health of every disk, and tests, formats and erases it. The command line is
`onyx`, and the app is in the style of CrystalDiskInfo.

    brew install stiven-gjekaj/tap/onyxdiskinfo
    brew install --cask stiven-gjekaj/tap/onyxdiskinfo

The formula installs the command line of the release: for macOS on Apple
silicon and on Intel, and for Linux on arm64 and on x86_64. The cask installs
the macOS app, for Apple silicon and for Intel. The formula and the cask have
the same name, so the app takes `--cask`. No paid certificate signs the app,
so macOS asks before it opens the app the first time.
`scripts/homebrew-formula.sh` and `scripts/homebrew-cask.sh` in the
OnyxDiskInfo repository write `Formula/onyxdiskinfo.rb` and
`Casks/onyxdiskinfo.rb` from the `SHA256SUMS` of each release.

## Where the formula comes from

`scripts/homebrew-formula.sh` in the Burnout repository writes
`Formula/burnout.rb` from the `SHA256SUMS` of each release. Change the
script, and not the formula. A person writes each commit here. No bot pushes
to this tap.

Report a problem in the
[issues of Burnout](https://github.com/Stiven-Gjekaj/burnout/issues).
