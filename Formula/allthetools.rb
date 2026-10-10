# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.1.0/att-0.1.0-aarch64-apple-darwin"
      sha256 "193289edcfb0378786fbb1399b88b3a873bb82b56df9b76b4bf4a8d872243152"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.1.0/att-0.1.0-x86_64-apple-darwin"
      sha256 "0d8cc14de6e9aff563c97d9119f932a3a1355bd722f249e1fe604fd1deedc088"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.1.0/att-0.1.0-aarch64-unknown-linux-musl"
      sha256 "5d3987985ac6d51641eb5b0821e390caffb73e9df16f18e39757b1de2df3d199"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.1.0/att-0.1.0-x86_64-unknown-linux-musl"
      sha256 "59557bff2e6d75af499b1e4d2e120ca7ac3e579d843d52cafa5c417017cb2b1b"
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
