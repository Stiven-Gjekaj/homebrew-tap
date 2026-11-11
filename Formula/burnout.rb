# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.1.0/burnout-3.1.0-aarch64-apple-darwin"
      sha256 "b8d9c3598a9c4e0169c6ec31e032336a9bad3948fd5fe28f1dd3ddc47566bf75"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.1.0/burnout-3.1.0-x86_64-apple-darwin"
      sha256 "b024d51a6ca42fd30f5bf773cffa1a6a5b9c6baf7d806de00e24914f8faa525b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.1.0/burnout-3.1.0-aarch64-unknown-linux-musl"
      sha256 "781d6c59bbcfb13c90d0b3c63fc182cad42053f120aae4d3dd704be844995721"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.1.0/burnout-3.1.0-x86_64-unknown-linux-musl"
      sha256 "bd6c4f20ab2bf3ccf58cdf78cbe62fdf55b9f52ae0cf31f06bce4e85aeea7feb"
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
