cask "task" do
  name "task"
  desc "Native tool dependencies for @cluesurf/task"
  homepage "https://github.com/cluesurf/task"
  url "https://github.com/cluesurf/homebrew-code/raw/make/Tool/task.zip"
  version "0.5.4"
  sha256 "c065d769b89fe209152a3c64034bd46355c01868c0ebbbb06173870d8324a649"

  depends_on macos: ">= :sierra"

  # Kept in sync with load/linux/shared/deps.sh and
  # load/windows/shared/deps.sh in the @cluesurf/task repo.
  # The Node CLI itself is installed separately from npm:
  #   pnpm add -g @cluesurf/task

  # toolchain
  depends_on formula: "git"
  depends_on formula: "curl"
  depends_on formula: "wget"
  depends_on formula: "gnupg"
  depends_on formula: "pkg-config"
  depends_on formula: "coreutils"
  depends_on formula: "gnu-sed"
  depends_on formula: "llvm"
  depends_on formula: "clang-format"

  # languages / runtimes
  depends_on formula: "node"
  depends_on formula: "python"
  depends_on formula: "pyenv"
  depends_on formula: "go"
  depends_on formula: "rust"
  depends_on formula: "ruby"
  depends_on formula: "openjdk"
  depends_on formula: "maven"
  depends_on formula: "antlr"
  depends_on formula: "php"
  depends_on formula: "php-cs-fixer"
  depends_on formula: "swift"
  depends_on formula: "swift-format"
  depends_on cask:    "julia"

  # extra formatters (`task format <lang>`)
  depends_on formula: "google-java-format"
  depends_on formula: "shfmt"
  depends_on formula: "ormolu"
  depends_on formula: "ocamlformat"
  depends_on formula: "prettier"
  depends_on formula: "sql-formatter"
  # gofmt ships with go, dart format with dart-sdk, zig fmt with
  # zig, clang-tidy with llvm — already in deps above.

  # extra compile targets (`task compile <lang>`)
  depends_on formula: "kotlin"
  depends_on formula: "zig"
  depends_on formula: "ghc"
  depends_on formula: "ocaml"
  depends_on formula: "dart-sdk"
  depends_on formula: "nim"
  depends_on formula: "crystal"
  depends_on formula: "vlang"
  depends_on formula: "typescript"
  depends_on formula: "emscripten"
  depends_on formula: "wasm-pack"
  # Coq proof assistant — `coq` provides `coqc` + `coq_makefile`.
  depends_on formula: "coq"
  # Bend (HVM-backed) — installed via `cargo install bend-lang` in
  # the postflight block below; needs `rust` (already declared).

  # media / documents
  depends_on cask:    "libreoffice"
  depends_on formula: "imagemagick"
  depends_on formula: "ffmpeg"
  depends_on formula: "inkscape"
  depends_on formula: "gifsicle"
  depends_on cask:    "calibre"
  depends_on formula: "pandoc"
  depends_on cask:    "mactex-no-gui"
  depends_on formula: "qpdf"
  depends_on formula: "poppler"
  depends_on formula: "mupdf"
  depends_on formula: "ghostscript"

  # fonts
  depends_on formula: "fontforge"
  depends_on formula: "woff2"
  depends_on formula: "harfbuzz"

  # archives
  depends_on formula: "p7zip"
  depends_on formula: "unar"
  depends_on formula: "atool"

  # extended image conversion — raster ↔ vector
  depends_on formula: "potrace"
  depends_on formula: "autotrace"
  depends_on formula: "pstoedit"         # autotrace runtime dep for EPS/PS output
  depends_on formula: "librsvg"          # ships rsvg-convert

  # extended image conversion — RAW
  depends_on formula: "dcraw"
  depends_on cask:    "darktable"
  depends_on cask:    "rawtherapee"

  # extended image conversion — HDR / Radiance
  depends_on formula: "openexr"
  depends_on formula: "pfstools"
  # Radiance's ra_tiff isn't in Homebrew core; users who need it
  # install the `radiance` formula from the hdri/radiance tap:
  #   brew tap hdri/radiance && brew install radiance

  # extended image conversion — animated
  depends_on formula: "apngasm"
  depends_on formula: "webp"             # ships img2webp / cwebp / dwebp

  # postgres client (task {inspect,query,measure,backup,export} db)
  depends_on formula: "libpq"            # psql + pg_dump, no server

  # binary analysis (task disassemble / inspect binary)
  depends_on formula: "radare2"
  depends_on formula: "rizin"

  # slides: marp-cli (md → html / pdf / pptx).
  # Reveal.js output already flows through pandoc, installed above.
  depends_on formula: "marp-cli"

  # services / notifications — macOS uses built-in launchctl + osascript,
  # nothing to install. (On Linux the Dockerfile adds libnotify-bin.)

  # kubernetes (task k8s ...)
  depends_on formula: "kubernetes-cli"   # kubectl
  depends_on formula: "stern"            # multi-pod log tail

  # digitalocean (task list machine --platform do, ...)
  depends_on formula: "doctl"

  # cloudflare (task inspect traffic / list worker / list bucket / ...)
  # wrangler installs via npm (see README install step); the Cloudflare
  # REST + GraphQL endpoints are hit with Node's built-in fetch, no
  # additional Homebrew formula is needed for direct analytics queries.

  # misc
  depends_on formula: "exiftool"
  depends_on formula: "ripgrep"
  depends_on formula: "fd"
  depends_on formula: "duckdb"
  depends_on formula: "jupyter"
  depends_on formula: "black"
  depends_on formula: "perltidy"
  depends_on formula: "id3v2"
  depends_on formula: "eye-d3"
  depends_on formula: "objconv"
  depends_on formula: "wabt"

  # Observability / profiling (`task profile cpu`, `task trace process`)
  # samply installs from crates.io in postflight (depends on rust).
  # macOS uses dtruss (ships with system) for `task trace process`;
  # nothing to install here.

  # Network / TLS / DNS diagnostics
  # openssl + dig (bind tools) ship with macOS — nothing extra needed.

  # Secret scanning (`task scan env`, `task scan secrets`)
  depends_on formula: "gitleaks"
  depends_on formula: "trufflehog"

  # `task download video` — yt-dlp covers 1500+ sites
  depends_on formula: "yt-dlp"

  # Pentest aggregator coverage (hackingtool integration)

  # Network / port scanners
  depends_on formula: "nmap"
  depends_on formula: "masscan"

  # Subdomain / web crawlers (Go, brew has prebuilt taps)
  depends_on formula: "subfinder"
  depends_on formula: "katana"
  depends_on formula: "httpx"
  depends_on formula: "ffuf"
  depends_on formula: "gobuster"
  depends_on formula: "amass"

  # Web vuln scanners
  depends_on formula: "nikto"
  # `wpscan` and `whatweb` aren't in homebrew core — installed via
  # `gem install` in postflight.
  # `wapiti` isn't in homebrew core — installed via `pip` in postflight.

  # SQL injection
  depends_on formula: "sqlmap"

  # Bruteforce / credential
  depends_on formula: "hydra"
  depends_on formula: "john-jumbo"
  depends_on formula: "hashcat"
  depends_on formula: "crunch"
  # `cewl` isn't in homebrew core — `gem install cewl` in postflight.

  # Wireless suite (Linux-only on the Dockerfile; macOS gets the
  # subset that builds — aircrack-ng compiles fine via brew).
  depends_on formula: "aircrack-ng"

  # Packet capture / replay
  depends_on formula: "wireshark"             # ships tshark
  depends_on formula: "tcpreplay"
  # tcpdump ships with macOS — nothing extra.

  # Forensics / file carving
  depends_on formula: "binwalk"
  depends_on formula: "foremost"
  depends_on formula: "sleuthkit"
  depends_on formula: "yara"

  # Steganography
  # `steghide` isn't in homebrew core anymore — try the tap
  # `brewsci/bio` or fall back to source. `outguess` IS in core.
  depends_on formula: "outguess"
  # zsteg installs as a Ruby gem in postflight.

  # Memory forensics — volatility3 installs via pip in postflight.

  # MITM / proxies / pivot
  depends_on formula: "bettercap"
  depends_on formula: "ettercap"
  depends_on formula: "proxychains-ng"
  depends_on formula: "tor"
  depends_on formula: "mitmproxy"

  # Posture / hardening / SSH audit
  depends_on formula: "lynis"
  depends_on formula: "ssh-audit"
  # chkrootkit / rkhunter are Linux-focused; skip on macOS.

  # CVE / dependency scanners (already partially via `task scan`)
  depends_on formula: "trivy"
  depends_on formula: "grype"
  depends_on formula: "syft"
  depends_on formula: "osv-scanner"

  # Metasploit Framework: not in homebrew core. Install on demand:
  #   brew tap rapid7/metasploit && brew install metasploit
  # — kept out of `depends_on` to avoid a build failure on hosts
  # without that tap.

  installer script: "install.sh"

  postflight do
    # pip metadata bug: https://stackoverflow.com/q/67074684
    system_command "find",
      args: ["#{HOMEBREW_PREFIX}/lib/python3.12/site-packages", "-empty", "-type", "d", "-delete"]

    # Go helper tools.
    system_command "#{HOMEBREW_PREFIX}/bin/go",
      args: ["install", "github.com/klauspost/asmfmt/cmd/asmfmt@ef134b9cec704e2b7b336fb02153b7d1a58247da"]
    system_command "#{HOMEBREW_PREFIX}/bin/go",
      args: ["install", "mvdan.cc/sh/v3/cmd/shfmt@v3.7.0"]

    # Bend — interaction-net language backed by HVM. Installed
    # from crates.io via `cargo`. The CUDA backend isn't required
    # for `bend run`; users on Apple Silicon get the CPU runtime.
    system_command "#{HOMEBREW_PREFIX}/bin/cargo",
      args: ["install", "bend-lang"]

    # Python helper tools (mirrors the Dockerfile / deb postinst).
    pip_install = [
      "nbconvert",
      "docx2pdf",
      "black[jupyter]",
      "patool",
      "huggingface_hub",
      "fonttools",
      # Pentest / OSINT tooling that lives on PyPI rather than brew
      "theHarvester",
      "maigret",
      "sherlock-project",
      "recon-ng",
      "bbot",
      "volatility3",
      "wapiti3",
    ]
    pip_install.each do |pkg|
      system_command "#{HOMEBREW_PREFIX}/bin/pip3",
        args: ["install", "--upgrade", "--no-cache-dir", pkg]
    end

    # Ruby gems — tools that aren't in homebrew core.
    %w[zsteg wpscan cewl whatweb].each do |gem|
      system_command "#{HOMEBREW_PREFIX}/bin/gem",
        args: ["install", gem]
    end

    # Rust crates — samply for `task profile cpu`.
    system_command "#{HOMEBREW_PREFIX}/bin/cargo",
      args: ["install", "samply"]
  end

  caveats <<~EOS
    To install the Node CLI:
      pnpm add -g @cluesurf/task

    Calibre lives inside an .app bundle; add it to PATH:
      export PATH="/Applications/calibre.app/Contents/MacOS/:$PATH"
  EOS
end
