# scripts/homebrew-formula.sh in the OnyxDiskInfo repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Onyxdiskinfo < Formula
  desc "Reads the health of every disk, and tests, formats and erases it"
  homepage "https://github.com/Stiven-Gjekaj/OnyxDiskInfo"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.1.0/onyx-0.1.0-aarch64-apple-darwin"
      sha256 "befac1bf2d05d492dd561ce497a7b97dc16057183526ca69b0c6a307ed74b8a9"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.1.0/onyx-0.1.0-x86_64-apple-darwin"
      sha256 "3617290ca1003137c2bc5ec7013066052cd6af7f169b0eb3ca3e8e7aac9bf189"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.1.0/onyx-0.1.0-aarch64-unknown-linux-musl"
      sha256 "3047dd0a3e0e7e8722ac440ab3fa04074fbeaabbb9901ce696be7b59aa488bba"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.1.0/onyx-0.1.0-x86_64-unknown-linux-musl"
      sha256 "e9ad781447167dc6f2213ecab6bd59fa98d640e7e4ecf0fec13395b89a704ea8"
    end
  end

  def install
    binary = Dir["onyx-*"].first
    chmod 0755, binary
    bin.install binary => "onyx"
  end

  def caveats
    <<~EOS
      Most hosts read the health of a drive only as root or Administrator:
        sudo onyx health <number>
    EOS
  end

  test do
    assert_match "onyx #{version}", shell_output("#{bin}/onyx --version")
  end
end
