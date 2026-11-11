# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.0.0/burnout-2.0.0-aarch64-apple-darwin"
      sha256 "f45cc2a4eab4c70cc9d8c935bbb49f97b4e9b6a9ad51265bbc181c24a6fec1c8"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.0.0/burnout-2.0.0-x86_64-apple-darwin"
      sha256 "e33a92faefbd3a8ac7d95fd04025810581f74886494b1b45c3d4c90d245daa45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.0.0/burnout-2.0.0-aarch64-unknown-linux-musl"
      sha256 "ab8758adb13b79491fa7ec363dd620674cb47d36c52849aa0037eed9eb9ad631"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.0.0/burnout-2.0.0-x86_64-unknown-linux-musl"
      sha256 "e7eeb9adc23df45583381bbdc0ac38cf288115b239634a9b21c116a35a74a5a4"
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
