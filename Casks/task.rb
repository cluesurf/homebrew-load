cask "task" do
  name "task"
  desc "Common Actions Interface Dependencies"
  homepage "https://github.com/termsurf/task"
  url "https://github.com/termsurf/homebrew-load/raw/make/Tool/task.zip"
  version "0.0.44"
  sha256 "c065d769b89fe209152a3c64034bd46355c01868c0ebbbb06173870d8324a649"

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
  depends_on formula: "rustfmt"
  depends_on formula: "llvm"
  depends_on formula: "clang-format"
  depends_on formula: "swift-format"
  depends_on cask: "julia"
  depends_on formula: "php"
  depends_on formula: "antlr"
  depends_on formula: "black"

  installer script: "install.sh"

  postflight do
    # https://stackoverflow.com/questions/67074684/pip-has-problems-with-metadata
    system_command "find", args: ["#{HOMEBREW_PREFIX}/lib/python3.11/site-packages", "-empty", "-type", "d", "-delete"]
    system_command "#{HOMEBREW_PREFIX}/bin/go", args: ["install", "github.com/klauspost/asmfmt/cmd/asmfmt@ef134b9cec704e2b7b336fb02153b7d1a58247da"]
    system_command "#{HOMEBREW_PREFIX}/bin/go", args: ["install", "mvdan.cc/sh/v3/cmd/shfmt@v3.7.0"]
    system_command "#{HOMEBREW_PREFIX}/bin/pip3", args: ["install", "--upgrade", "--no-cache-dir", "--use-deprecated=legacy-resolver", "nbconvert"]
    system_command "#{HOMEBREW_PREFIX}/bin/pip3", args: ["install", "--upgrade", "--no-cache-dir", "--use-deprecated=legacy-resolver", "docx2pdf"]
    system_command "#{HOMEBREW_PREFIX}/bin/pip3", args: ["install", "--upgrade", "--no-cache-dir", "--use-deprecated=legacy-resolver", "black[jupyter]"]
    system_command "#{HOMEBREW_PREFIX}/bin/pip3", args: ["install", "--upgrade", "--no-cache-dir", "--use-deprecated=legacy-resolver", "patool"]
  end

  def caveats
    <<~EOS
      You may have to add calibre to the $PATH
      in your .bash_profile or .profile:

        export PATH="/Applications/calibre.app/Contents/MacOS/:$PATH"
    EOS
  end
end
