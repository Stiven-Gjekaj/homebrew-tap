# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.9.0/att-0.9.0-aarch64-apple-darwin"
      sha256 "5dc5fcb442775997db39cd2a8de7ee96f56bc1ce8ddf77a19b99bd410f927537"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.9.0/att-0.9.0-x86_64-apple-darwin"
      sha256 "8def85d60aab73f30aa3a57cca5b4f095e1a10705aa7f4174e23bcac3ba70f03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.9.0/att-0.9.0-aarch64-unknown-linux-musl"
      sha256 "0951a40bb9e8438118f18a7948b43985a681ed2913bc1ce7aff8e0485b7c2db1"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.9.0/att-0.9.0-x86_64-unknown-linux-musl"
      sha256 "f13fa0c09f2cd589d7e7159becb4412be9e068b480af54075e9cbbbba05445e8"
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
