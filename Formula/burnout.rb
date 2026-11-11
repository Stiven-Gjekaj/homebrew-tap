# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.2.0/burnout-2.2.0-aarch64-apple-darwin"
      sha256 "1b7c0379704faccd7d218b5667ffbc28bbff8332fd2fba6c5048526a4e5cec3e"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.2.0/burnout-2.2.0-x86_64-apple-darwin"
      sha256 "0425009cc0c0858a53a49d9262afe46b900367433d002e1d934fa2cf320bed88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.2.0/burnout-2.2.0-aarch64-unknown-linux-musl"
      sha256 "6549fab77a451921abd309f4ed11de866e69dc31c41e49ab435cf7b7df898d62"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.2.0/burnout-2.2.0-x86_64-unknown-linux-musl"
      sha256 "c0a4551ff66c034f26186bbe93df3a459ef6affb8876ab9bcf6d75fb9e4e4090"
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
