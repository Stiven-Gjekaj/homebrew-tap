# scripts/homebrew-cask.sh in the HotDogStand repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
cask "hotdogstand" do
  version "0.2.0"
  sha256 "6e817b77c7839508a01be975e719a9e8ac0a7f2d50e24bd8922f86c7057b6375"

  url "https://github.com/Stiven-Gjekaj/HotDogStand/releases/download/v#{version}/HotDogStand-macos-universal.zip"
  name "HotDogStand"
  desc "Ticket manager on your own computer, with the look of Windows 7"
  homepage "https://github.com/Stiven-Gjekaj/HotDogStand"

  depends_on :macos

  app "HotDogStand.app"

  zap trash: "~/Library/Application Support/HotDogStand"

  caveats <<~EOS
    No paid certificate signed HotDogStand, so macOS asks before it opens
    the app the first time. If macOS says that it cannot check the app, open
    System Settings, then Privacy & Security, and choose Open Anyway. Or take
    the mark off after the install:

      xattr -dr com.apple.quarantine #{appdir}/HotDogStand.app

    HotDogStand keeps your tickets in
    ~/Library/Application Support/HotDogStand/workspace.db.
    An uninstall does not remove them. "brew uninstall --zap" does.
  EOS
end
