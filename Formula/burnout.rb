# scripts/homebrew-formula.sh in the Burnout repository writes this file from
# the SHA256SUMS of the release. Change the script, and not this file.
class Burnout < Formula
  desc "Writes a bootable USB drive from an ISO or a disk image"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.0.0/burnout-1.0.0-aarch64-apple-darwin"
      sha256 "6a4881d303b330cd8928ef6799f8c1c097dddcfcb419f08b5f57b9ae5daf15df"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.0.0/burnout-1.0.0-x86_64-apple-darwin"
      sha256 "b019c0b04ce4e7f73b6d14403277aa3cbf077fbf771493dde9b7d79fb5c3135d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.0.0/burnout-1.0.0-aarch64-unknown-linux-musl"
      sha256 "4ee93538f123c011f09913c1fa484f8714fa70af458f4cc805e88d091cf64076"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v1.0.0/burnout-1.0.0-x86_64-unknown-linux-musl"
      sha256 "342cb7bded67a354975f0c0620965ffb4625c1419cdedb87bc07f44e42a5d843"
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
