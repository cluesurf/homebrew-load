cask "task" do
  name "task"
  desc "Common Actions Interface Dependencies"
  homepage "https://github.com/termsurf/task.js"
  url "https://github.com/termsurf/task.js"
  version "0.0.1"
  sha256 ""

  depends_on macos: ">= :sierra"

  depends_on "openjdk"
  depends_on "mactex-no-gui"
  depends_on "calibre"
  depends_on "libreoffice"
  depends_on "imagemagick"
  depends_on "fontforge"
  depends_on "ffmpeg"
  depends_on "go"
  depends_on "unoconv"
  depends_on "qpdf"
  depends_on "mvn"
  depends_on "objconv"
  depends_on "wabt"
  depends_on "unar"
  depends_on "pyenv"
  depends_on "jupyter"
  depends_on "atool"
  depends_on "perltidy"
  depends_on "php-cs-fixer"

  def install
    system "go", "install", "github.com/klauspost/asmfmt/cmd/asmfmt@ef134b9cec704e2b7b336fb02153b7d1a58247da"
    system "pip", "install", "nbconvert"
    system "pip", "install", "docx2pdf"
  end

  test do
  end
end
