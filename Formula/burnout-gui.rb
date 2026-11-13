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
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-gui-3.4.0-aarch64-apple-darwin"
      sha256 "546d7169041df2e7a54edf84087b88b27198efa5f530afec31a55d91852f002d"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-gui-3.4.0-x86_64-apple-darwin"
      sha256 "0e7c604bb95e92425430833d9ddb9c9513134d121633ba2fb28c015d8097482c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-gui-3.4.0-aarch64-unknown-linux-gnu"
      sha256 "e08966d2dc0791022969b12b1515ac69c1ee847780bbbf1283ef804982f83917"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/burnout/releases/download/v3.4.0/burnout-gui-3.4.0-x86_64-unknown-linux-gnu"
      sha256 "34b970eb2a1779e25d0b535cd3dff135c1068bf067975e17970ea42821758a53"
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
