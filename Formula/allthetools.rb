# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.3.0/att-0.3.0-aarch64-apple-darwin"
      sha256 "ca9cfa511e172d923be503ea41e439652c0a3d74e3481eac7c9fae7ff1b2baa2"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.3.0/att-0.3.0-x86_64-apple-darwin"
      sha256 "c77dab2d68216b360307ae4c2289ade9f864191f59ab762862041893e011770a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.3.0/att-0.3.0-aarch64-unknown-linux-musl"
      sha256 "82afa5e6aa20e514e1788cb73722cb46de24d6a19b0ab4cec62e99385738fe6c"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.3.0/att-0.3.0-x86_64-unknown-linux-musl"
      sha256 "985110e261f94f6040bbbcc83917f85390a1231ce55659cd06c65b26b29e1817"
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
