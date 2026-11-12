# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.3.0/burnout-3.3.0-aarch64-apple-darwin"
      sha256 "8993d05a4cbd562eb59c1560d7993ba48fb0c7298e02371862c0628d9aaa7813"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.3.0/burnout-3.3.0-x86_64-apple-darwin"
      sha256 "620bba3272876929e7a8acc34a994eebe83f219b288878f917867efb7e1c3706"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.3.0/burnout-3.3.0-aarch64-unknown-linux-musl"
      sha256 "856ee5e4d8914bdce9145b2b965aa66b8b235050f0e87875be30324307a884a5"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.3.0/burnout-3.3.0-x86_64-unknown-linux-musl"
      sha256 "96a4a6916ef5e91144e76a1812d42096444d5aa90128ba34867e07fab8e25366"
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
