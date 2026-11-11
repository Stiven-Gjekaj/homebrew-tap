# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.1.0/burnout-1.1.0-aarch64-apple-darwin"
      sha256 "4094e88ac33877c9743a52566d5679732969dab5931dc9e6def950ead0b87903"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.1.0/burnout-1.1.0-x86_64-apple-darwin"
      sha256 "b7bfd0eccdcc790c836e7b38ee90be4380bc7d4354d0bbc0775a886bb8f9b3ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.1.0/burnout-1.1.0-aarch64-unknown-linux-musl"
      sha256 "a4f10b19adb5efad57e6bbb3e7e8325ef80ad877a243a19e5c5d9284285f1505"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.1.0/burnout-1.1.0-x86_64-unknown-linux-musl"
      sha256 "3adc615b9d42292948bfd479b4736ae2f4a1af58ef1bb6b582eaf9819cbff36e"
    end
  end

  def install
    binary = Dir["burnout-*"].first
    chmod 0755, binary
    bin.install binary => "burnout"
  end

  test do
    assert_match "burnout #{version}", shell_output("#{bin}/burnout --version")
  end
end
