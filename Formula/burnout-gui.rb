# scripts/homebrew-gui-formula.sh in the Burnout repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class BurnoutGui < Formula
  desc "Writes a bootable USB drive, in a window"
  homepage "https://github.com/Stiven-Gjekaj/burnout"
  license "MIT"

  # The program starts burnout to write, and refuses a burnout of another
  # version. The two formulas of one tap change together.
  depends_on "stiven-gjekaj/tap/burnout"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-gui-3.4.1-aarch64-apple-darwin"
      sha256 "d179e35d26a80cc5db251de1cbd62bf897dde513f2395476028564cf14adb7a9"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-gui-3.4.1-x86_64-apple-darwin"
      sha256 "1f0ea08d8c5780f9b41de4a65608a0886bec48f1035baad399e4c150c5fdce9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-gui-3.4.1-aarch64-unknown-linux-gnu"
      sha256 "04a2eec5c8a261758ddc6df306d81d1ecc6fc81fd71340ee514a212b499e8b78"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.1/burnout-gui-3.4.1-x86_64-unknown-linux-gnu"
      sha256 "7d43106164ca2a4f99c2aaca8adfd8049e602d270ad2ac1aa2d2c5e113548df1"
    end
  end

  def install
    binary = Dir["burnout-gui-*"].first
    chmod 0755, binary
    bin.install binary => "burnout-gui"
  end

  test do
    assert_match "burnout-gui #{version}", shell_output("#{bin}/burnout-gui --version")
  end
end
