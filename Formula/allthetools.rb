# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v1.0.0/att-1.0.0-aarch64-apple-darwin"
      sha256 "4de19881f74439c5a056688f22f2369b5299f1ec8d49e070dc456b5395d5bd7f"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v1.0.0/att-1.0.0-x86_64-apple-darwin"
      sha256 "760515abe6b3a5c583a6e591b4458346f546c7057ad78d49ad3a0392c1cb9d47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v1.0.0/att-1.0.0-aarch64-unknown-linux-musl"
      sha256 "983420ff58029826fee6b739d8c2b8a7d02e5f16a459be507e1f8a1abd6dd098"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v1.0.0/att-1.0.0-x86_64-unknown-linux-musl"
      sha256 "a59b5ee75882737cde4d065e3e8199d44ea0f6e625ad0d6bf6b5518a6969196e"
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
