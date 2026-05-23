cask "rock" do
  name "Rock"
  desc "Headless, hackable terminal workspace system"
  homepage "https://github.com/cluesurf/rock"
  version "0.0.0"

  # The published artifact is a zipped Rock.app produced by
  # `electron-builder --mac` and uploaded to GitHub Releases.
  # Both arm64 and x64 builds are bundled in the same zip for
  # simplicity; the .app contains a universal binary slice
  # picker if you ship a universal2 build, or platform-specific
  # zips can be selected via `on_arm` / `on_intel` blocks.
  url "https://github.com/cluesurf/rock/releases/download/v#{version}/Rock-#{version}-mac.zip"

  # Placeholder sha256. Replace after each release:
  #   shasum -a 256 dist/Rock-<version>-mac.zip
  sha256 :no_check

  depends_on macos: ">= :catalina"

  app "Rock.app"

  zap trash: [
    "~/Library/Application Support/Rock",
    "~/Library/Preferences/com.cluesurf.rock.plist",
    "~/Library/Saved Application State/com.cluesurf.rock.savedState",
    "~/Library/Logs/Rock",
    "~/.rock",
  ]

  caveats <<~EOS
    Rock is a desktop terminal workspace app.

    For project-specific workspaces, bind rock to a project:
      cd ~/code/your-project
      rock bind

    Or open the default workspace:
      open -a Rock
  EOS
end
