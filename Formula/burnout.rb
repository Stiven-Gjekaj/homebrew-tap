# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.0.0/burnout-3.0.0-aarch64-apple-darwin"
      sha256 "7b25b1d540cf9f4d3f02355dad471690cfe67ab70af291133ad0a1a1e033adae"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.0.0/burnout-3.0.0-x86_64-apple-darwin"
      sha256 "1f19f1e4b1668a824cfcd98683d32958f51e008a1433c0c303e7d7801cc0acc5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.0.0/burnout-3.0.0-aarch64-unknown-linux-musl"
      sha256 "0c21604524518637b625e39688a81396d8d914ab6a48703f0a2e029bbea5c224"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.0.0/burnout-3.0.0-x86_64-unknown-linux-musl"
      sha256 "3265d4a74bb0a974bd303e75b153858f37437356dbab3dbc4914efc8c301d3bb"
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
