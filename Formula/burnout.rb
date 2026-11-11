# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.2.0/burnout-3.2.0-aarch64-apple-darwin"
      sha256 "1b223ae73f4b1793e7dbb872d721c08f2699eb82d2e5ab9b301f9b3c08daaf6c"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.2.0/burnout-3.2.0-x86_64-apple-darwin"
      sha256 "7f7752c558be5525ff2356743ff63173af1dabf5e895ec496107d8949dab97c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.2.0/burnout-3.2.0-aarch64-unknown-linux-musl"
      sha256 "de99dca9a8e0adee14ccc64317a6d906a9ba98b0af227694ac663d2f7cf95f5c"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.2.0/burnout-3.2.0-x86_64-unknown-linux-musl"
      sha256 "afba1a20428ea57bb3c334b32831d4cb1d39982625b817618d330722cca49fc9"
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
