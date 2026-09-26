# scripts/homebrew-cask.sh in the mimikr repository writes this file from the
# zip of the release. Change the script, and not this file.
cask "mimikr" do
  version "1.0.2"
  sha256 "2c7c3f35c541a70fce7f4b1c263ba2ff1a99f561b5d17a1e1fe5a592b23bceb7"

  url "https://github.com/Stiven-Gjekaj/mimikr/releases/download/v#{version}/mimikr-#{version}-macos-arm64.zip"
  name "mimikr"
  desc "Chatbot that writes like a person you know, with a local language model"
  homepage "https://github.com/Stiven-Gjekaj/mimikr"

  depends_on arch: :arm64
  # The Qt libraries in the application ask for macOS 13 or later.
  depends_on macos: :ventura

  app "mimikr.app"

  caveats <<~EOS
    No paid certificate signed mimikr, so macOS can refuse to open it.
    Install it with --no-quarantine, or take the mark off after the install:

      xattr -d com.apple.quarantine #{appdir}/mimikr.app

    mimikr keeps its settings, identities and rooms in ~/Documents/mimikr.
    An uninstall does not remove them.
  EOS
end
