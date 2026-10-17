# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.5.0/att-0.5.0-aarch64-apple-darwin"
      sha256 "fed9b7b5ff8a2ea07fdfd7e90674fe117a98d31eeda9302014084ff8f91bf320"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.5.0/att-0.5.0-x86_64-apple-darwin"
      sha256 "d25add0e1d6891af95ae48e3236c91be18b67ed8783bfedf829490328868192e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.5.0/att-0.5.0-aarch64-unknown-linux-musl"
      sha256 "4ccad3a4e2aa2ba32f008841f79f55d34ed74716ff88f80a5004464e950afa51"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.5.0/att-0.5.0-x86_64-unknown-linux-musl"
      sha256 "9b2c42f139c1798a0f098087b6a79d244aee1cc4a06b5c7263d4b16a8bd843bd"
    end
  end

  def install
    binary = Dir["att-*"].first
    chmod 0755, binary
    bin.install binary => "att"
  end

  def caveats
    <<~EOS
      att link makes the familiar names, such as lsusb and f3probe, run att.
    EOS
  end

  test do
    assert_match "att #{version}", shell_output("#{bin}/att --version")
  end
end
