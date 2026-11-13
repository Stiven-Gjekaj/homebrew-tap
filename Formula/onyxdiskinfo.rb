# scripts/homebrew-formula.sh in the OnyxDiskInfo repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Onyxdiskinfo < Formula
  desc "Reads the health of every disk, and tests, formats and erases it"
  homepage "https://github.com/Stiven-Gjekaj/OnyxDiskInfo"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.0.0/onyx-1.0.0-aarch64-apple-darwin"
      sha256 "7c160c305540c221c57cdbdff2c5d610d40b329f87a5cd23ca57a2b304a85a45"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.0.0/onyx-1.0.0-x86_64-apple-darwin"
      sha256 "83307557d844ad8da41ac7cff2fd59c6a41b2ad6b45055d66896ee8b773a2ba0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.0.0/onyx-1.0.0-aarch64-unknown-linux-musl"
      sha256 "b87fc19bb2b81909343b99e328b9370224dbc41ae979d8aba1415340ebb3d440"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.0.0/onyx-1.0.0-x86_64-unknown-linux-musl"
      sha256 "5844dcfe2d0474edd1d72fd1b7edbe4918fbc861b96dc600608de949c00297cd"
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
