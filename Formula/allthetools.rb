# scripts/homebrew-formula.sh in the AllTheTools repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
class Allthetools < Formula
  desc "The same small tools on Windows, on macOS and on Linux, in one binary"
  homepage "https://github.com/Stiven-Gjekaj/AllTheTools"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.4.0/att-0.4.0-aarch64-apple-darwin"
      sha256 "54f85a188a665f97674f85c47f4675dba5abd557080eeb7e387591fea7b5d19e"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.4.0/att-0.4.0-x86_64-apple-darwin"
      sha256 "f9c059f824bb98985d9ae1ca9f2b4f4b469cb72ea6227a8fafad13f61a2f9cb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.4.0/att-0.4.0-aarch64-unknown-linux-musl"
      sha256 "f8f1544a273ba377f32c02396550dc3153ce68bac46370a301ad46b33c9c7c8c"
    end
    on_intel do
      url "https://github.com/Stiven-Gjekaj/AllTheTools/releases/download/v0.4.0/att-0.4.0-x86_64-unknown-linux-musl"
      sha256 "3259158680ebf00610ec678311cdcdad28e98654bfc03a6e72c4d189a1be62f1"
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
