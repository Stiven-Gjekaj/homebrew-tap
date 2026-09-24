# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v0.3.0/burnout-0.3.0-aarch64-apple-darwin"
      sha256 "67dda9fd25acd10bdd4e8af7ee9233dcf798eb9f0439a720bffd565e415e687b"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v0.3.0/burnout-0.3.0-x86_64-apple-darwin"
      sha256 "efbd7cb65d39663c87a2d5f0d1e7b3267f1ec2cef2c16eed3977b6c9462decfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v0.3.0/burnout-0.3.0-aarch64-unknown-linux-musl"
      sha256 "601d92d605b8571511d9baab7e61f3d11ace1c10c4d08b6682e5bc22fedafb7c"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v0.3.0/burnout-0.3.0-x86_64-unknown-linux-musl"
      sha256 "34d4df5a13df9f14c69ba94c0408a6e678a4f83305e9faf29501977f10704f2b"
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
