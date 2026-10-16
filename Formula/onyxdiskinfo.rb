# scripts/homebrew-formula.sh in the OnyxDiskInfo repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Onyxdiskinfo < Formula
  desc "Reads the health of every disk, and tests, formats and erases it"
  homepage "https://github.com/Stiven-Gjekaj/OnyxDiskInfo"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.2.0/onyx-0.2.0-aarch64-apple-darwin"
      sha256 "4d38869c9d84ea19d6078a7e9b55bb5ce2f91016eb86dd2745a866fdb6581a8f"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.2.0/onyx-0.2.0-x86_64-apple-darwin"
      sha256 "4ad2745bb730a397bc772f73674b04629d1991c9e0edf4d2a1cfbda53331053f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.2.0/onyx-0.2.0-aarch64-unknown-linux-musl"
      sha256 "25d906c788534d55fb4d3f0d4d8adcca104e60d2d6dd060c950ef95db4039afd"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v0.2.0/onyx-0.2.0-x86_64-unknown-linux-musl"
      sha256 "3b534c754fc5e41ae1722d792429947b6473ca3c96d62bb1787d824d0b119186"
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
