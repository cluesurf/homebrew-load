cask "task" do
  name "task"
  desc "Common Actions Interface Dependencies"
  homepage "https://github.com/termsurf/task"
  url "https://github.com/termsurf/homebrew-load/raw/make/Tool/task.zip"
  version "0.0.30"
  sha256 "68b79d6f77ff1a78dfa874e0da28b048dacf3c6812cf4d8d647421fc1c8e24f9"

  depends_on macos: ">= :sierra"

  depends_on formula: "openjdk"
  depends_on cask: "mactex-no-gui"
  depends_on cask: "calibre"
  depends_on cask: "libreoffice"
  depends_on formula: "imagemagick"
  depends_on formula: "fontforge"
  depends_on formula: "ffmpeg"
  depends_on formula: "go"
  depends_on formula: "unoconv"
  depends_on formula: "qpdf"
  depends_on formula: "mvn"
  depends_on formula: "objconv"
  depends_on formula: "wabt"
  depends_on formula: "unar"
  depends_on formula: "python"
  depends_on formula: "pyenv"
  depends_on formula: "jupyter"
  depends_on formula: "atool"
  depends_on formula: "perltidy"
  depends_on formula: "php-cs-fixer"
  depends_on formula: "swift"
  depends_on formula: "rust"

  installer script: "install.sh"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/go", args: ["install", "github.com/klauspost/asmfmt/cmd/asmfmt@ef134b9cec704e2b7b336fb02153b7d1a58247da"]
    system_command "pip3", args: ["install", "nbconvert"]
    system_command "pip3", args: ["install", "docx2pdf"]
    # system_command "#{staged_path}/install.sh"
  end

  def caveats
    <<~EOS
      You may have to add calibre to the $PATH
      in your .bash_profile or .profile:

        export PATH="/Applications/calibre.app/Contents/MacOS/:$PATH"
    EOS
  end
end
