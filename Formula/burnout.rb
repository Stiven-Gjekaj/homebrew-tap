# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-3.4.0-aarch64-apple-darwin"
      sha256 "8d703024fda274e1f67e3b5e021c52074a822df6878b657cf7216d8dadca55fb"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-3.4.0-x86_64-apple-darwin"
      sha256 "a093be646fe7ba7ffffb9bb6d0495d2c8fb0fe8c56ac0f6164d1ca7ec9ed79d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-3.4.0-aarch64-unknown-linux-musl"
      sha256 "1e8b0c49d52996372a08580ea642843f6af4c4e348653db8eca940ab43b47b33"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-3.4.0-x86_64-unknown-linux-musl"
      sha256 "097e8969390b92720fc9d130937b89d228ab87c7d6b70f16cdcb7c9fcfc2c683"
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
