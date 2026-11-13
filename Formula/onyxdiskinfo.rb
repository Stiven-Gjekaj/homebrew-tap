# scripts/homebrew-formula.sh in the OnyxDiskInfo repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Onyxdiskinfo < Formula
  desc "Reads the health of every disk, and tests, formats and erases it"
  homepage "https://github.com/Stiven-Gjekaj/OnyxDiskInfo"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.1.0/onyx-1.1.0-aarch64-apple-darwin"
      sha256 "ea07ca9eed580f154dd06bfffe928b20bcee8b5e5621f1b2ab8d9828d1fe48cc"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.1.0/onyx-1.1.0-x86_64-apple-darwin"
      sha256 "a10d4f3fb86fe3fbd64b20cbb8d50e5ea7261b78cc5175db5e8ab17cd55aebef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.1.0/onyx-1.1.0-aarch64-unknown-linux-musl"
      sha256 "e6a4ca9c0986bb7e8af56531c3683815490ffd54191c9da9d45be2caba23cbb7"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v1.1.0/onyx-1.1.0-x86_64-unknown-linux-musl"
      sha256 "bf400346a09dba3dc8140165bdb17fed203348eca391fd84ef4a23f5e8958eb6"
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
