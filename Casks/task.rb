cask "task" do
  name "task"
  desc "Common Actions Interface Dependencies"
  homepage "https://github.com/termsurf/task.js"
  url "https://github.com/termsurf/homebrew-load"
  version "0.0.16"
  sha256 "f6eb7406f21ac3cc54580c4bb4d232d2f8ad7d63dc0d6159276f21cfa79cecea"

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

  postflight do
    system_command "#{HOMEBREW_PREFIX}/bin/go", args: ["install", "github.com/klauspost/asmfmt/cmd/asmfmt@ef134b9cec704e2b7b336fb02153b7d1a58247da"]
    system_command "pip3", args: ["install", "nbconvert"]
    system_command "pip3", args: ["install", "docx2pdf"]
  end
end
