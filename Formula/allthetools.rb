# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.2.0/att-0.2.0-aarch64-apple-darwin"
      sha256 "4fcedc98e006affb27c90aa63fb7877aa26e027b256b2bbc4235c314f10b9a06"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.2.0/att-0.2.0-x86_64-apple-darwin"
      sha256 "18b7eec3bbc511c7a7ea1499c594a0f79f4e9f39324e985d1bc5229d50058e48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.2.0/att-0.2.0-aarch64-unknown-linux-musl"
      sha256 "9bcca1ed0c6090f1a3c02421c1371d60f42765d0200206bd19cbbe58e1e35a75"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.2.0/att-0.2.0-x86_64-unknown-linux-musl"
      sha256 "4c03762cd8446ad9dceb5ad2e1b8053a109efc48823c427f8ae7336832445b74"
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
