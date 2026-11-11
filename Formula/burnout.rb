# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.1.0/burnout-2.1.0-aarch64-apple-darwin"
      sha256 "22658e1d4592233c5019ded193e24d3b8a430581643d9eb98996c249fdf09738"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.1.0/burnout-2.1.0-x86_64-apple-darwin"
      sha256 "abeb0c38ae576aef8a900bd02ee696987b75ccb139865c4ca3a9d239bdb8bc80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.1.0/burnout-2.1.0-aarch64-unknown-linux-musl"
      sha256 "b2ff0063686d8c3fb4582362e7eefb9f2a628882e621409b6a23d5a31cd57530"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v2.1.0/burnout-2.1.0-x86_64-unknown-linux-musl"
      sha256 "db8add2bf44e912f1ed63eb4a3254ce7d427834045a1c2c61576cd25b5a9ec41"
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
