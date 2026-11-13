# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-3.4.1-aarch64-apple-darwin"
      sha256 "f7985c37a0fc76f4d8955c7008e31b61ef878934ffc122ddf61d45d9fb145e2d"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-3.4.1-x86_64-apple-darwin"
      sha256 "6db038db85835a85e42e82f8f2f0794126bc942a3728c2623f655a078d18d765"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-3.4.1-aarch64-unknown-linux-musl"
      sha256 "59330f22c7194b15fc87ea8817fb442f4b49f6cb522049cda898199565b6e000"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-3.4.1-x86_64-unknown-linux-musl"
      sha256 "2fa55c058f79c39f823f511efe06a3a91563b722ba4ff1cfc6a2694c40228bc9"
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
