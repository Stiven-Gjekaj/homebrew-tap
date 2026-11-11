# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.3.0/burnout-2.3.0-aarch64-apple-darwin"
      sha256 "b7f501bea874be592bb38ff4e79177c8825f68fe46f66671d3a3e2d208c6f71a"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.3.0/burnout-2.3.0-x86_64-apple-darwin"
      sha256 "b59c948490add03d22bd76bd7cbdd7c1b1b65588130b4e2e750358c0a00ebbea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.3.0/burnout-2.3.0-aarch64-unknown-linux-musl"
      sha256 "488cccef3962cd049f6417d2ba8e95af052f87dea44902095eafac5f4443b5ba"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.3.0/burnout-2.3.0-x86_64-unknown-linux-musl"
      sha256 "a8640c1d3ab7a0fe2a972f1caf233ed83454a284169d91be79fce3c2de064776"
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
