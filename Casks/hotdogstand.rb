# scripts/homebrew-cask.sh in the HotDogStand repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
cask "hotdogstand" do
  version "0.1.0"
  sha256 "6c8aff84ecff763021b44b37ee17356afe4fcc5d4137d3b4d03297dd1aab2a78"

  url "https://github.com/Stiven-Gjekaj/HotDogStand/releases/download/v#{version}/HotDogStand-macos-universal.zip"
  name "HotDogStand"
  desc "Ticket manager on your own computer, with the look of Windows 7"
  homepage "https://github.com/Stiven-Gjekaj/HotDogStand"

  depends_on :macos

  app "HotDogStand.app"

  zap trash: "~/Library/Application Support/HotDogStand"

  caveats <<~EOS
    No paid certificate signed HotDogStand, so macOS can refuse to open it.
    Install it with --no-quarantine, or take the mark off after the install:

      xattr -dr com.apple.quarantine #{appdir}/HotDogStand.app

    HotDogStand keeps your tickets in
    ~/Library/Application Support/HotDogStand/workspace.db.
    An uninstall does not remove them. "brew uninstall --zap" does.
  EOS
end
