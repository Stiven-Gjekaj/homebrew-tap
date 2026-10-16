# scripts/homebrew-cask.sh in the OnyxDiskInfo repository writes this file
# from the SHA256SUMS of the release. Change the script, and not this file.
cask "onyxdiskinfo" do
  version "0.2.0"
  sha256 "7195f3d7fb882e499538d53157567388b7f2a39458e22886ef4409f0c6476782"

  url "https://github.com/Stiven-Gjekaj/OnyxDiskInfo/releases/download/v#{version}/OnyxDiskInfo-#{version}-macos-universal.zip"
  name "OnyxDiskInfo"
  desc "Reads the health of every disk, and tests, formats and erases it"
  homepage "https://github.com/Stiven-Gjekaj/OnyxDiskInfo"

  depends_on macos: ">= :big_sur"

  app "OnyxDiskInfo.app"

  zap trash: "~/Library/Application Support/OnyxDiskInfo"

  caveats <<~EOS
    No paid certificate signed OnyxDiskInfo, so macOS asks before it opens
    the app the first time. If macOS says that it cannot check the app, open
    System Settings, then Privacy & Security, and choose Open Anyway. Or take
    the mark off after the install:

      xattr -dr com.apple.quarantine #{appdir}/OnyxDiskInfo.app

    OnyxDiskInfo keeps the history of each drive in
    ~/Library/Application Support/OnyxDiskInfo/history.sqlite.
    An uninstall does not remove it. "brew uninstall --zap" does.
  EOS
end
