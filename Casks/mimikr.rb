# scripts/homebrew-cask.sh in the mimikr repository writes this file from the
# zip of the release. Change the script, and not this file.
cask "mimikr" do
  version "1.0.1"
  sha256 "8d889802d40ed75af18f573f466a4cd1d0f504f53c1c15cbe6efd3303f37e2d3"

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
