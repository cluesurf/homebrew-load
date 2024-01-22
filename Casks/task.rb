cask "task" do
  # name "task"
  # desc "Common Actions Interface Dependencies"
  # homepage "https://github.com/termsurf/task.js"
  # url "https://github.com/termsurf/task.js"
  # version "0.0.1"

  # depends_on macos: ">= :sierra"

  depends_on formula: "java"
  # depends_on cask: "mactex-no-gui"
  # depends_on formula: "calibre"
  # depends_on formula: "libreoffice"
  # depends_on formula: "imagemagick"
  # depends_on formula: "fontforge"
  # depends_on formula: "ffmpeg"
  # depends_on formula: "go"
  # depends_on formula: "unoconv"
  # depends_on formula: "qpdf"
  # depends_on formula: "mvn"
  # depends_on formula: "objconv"
  # depends_on formula: "wabt"
  # depends_on formula: "unar"
  # depends_on formula: "pyenv"
  # depends_on formula: "jupyter"
  # depends_on formula: "atool"
  # depends_on formula: "perltidy"
  # depends_on formula: "php-cs-fixer"

  # postflight do
  #   system_command "go install github.com/klauspost/asmfmt/cmd/asmfmt@ef134b9cec704e2b7b336fb02153b7d1a58247da"
  #   system_command "pip install nbconvert"
  #   system_command "pip install docx2pdf"
  # end
end
