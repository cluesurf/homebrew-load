require 'formula'

class CalibrePatch < Formula
  desc "Patch for Calibre to auto add $PATH variable."
  homepage "https://github.com/termsurf/task"
  url "https://github.com/termsurf/homebrew-load"
  version "0.0.1"

  depends_on "calibre"

  def caveats
    <<~EOS
      You may have to add calibre to the $PATH
      in your .bash_profile or .profile:

        export PATH="/Applications/calibre.app/Contents/MacOS/:$PATH"
    EOS
  end
end
