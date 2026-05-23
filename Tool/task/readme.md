<br/>
<br/>
<br/>

<h3 align='center'>cluesurf/tool/task</h3>
<p align='center'>
  Native tool dependencies for the @cluesurf/task CLI.
</p>

<br/>
<br/>

## Install

One tap, one cask, you're done. The cask declares every
native binary `@cluesurf/task` shells out to as a Homebrew
dependency, so installing it pulls the whole tool catalog
in one shot.

```bash
# 1. Add the tap
brew tap cluesurf/tool

# 2. Install the cask (drags in every dep below)
brew install --cask cluesurf/tool/task

# 3. Install the Node CLI itself
pnpm add -g @cluesurf/task

# 4. Wire shell completion (optional but worth it)
task autocomplete >> ~/.zshrc && exec zsh
```

If a stale Calibre install blocks the install, remove it
first:

```bash
brew remove --force --cask calibre
```

## What gets installed

The cask pulls in roughly 100 formulas and a handful of casks.
The `Channel` column shows how each one installs (`brew` formula,
`brew` cask, `pip`, `gem`, `cargo`, or `manual`). Items not in
Homebrew core install via the cask's `postflight` hook.

| category | lib | channel | purpose |
| --- | --- | --- | --- |
| toolchain | `git` | brew | Version control |
| toolchain | `curl` | brew | HTTP downloader |
| toolchain | `wget` | brew | HTTP downloader |
| toolchain | `gnupg` | brew | OpenPGP signing / key management |
| toolchain | `pkg-config` | brew | Compile-time package metadata resolver |
| toolchain | `coreutils` | brew | GNU userland on macOS |
| toolchain | `gnu-sed` | brew | GNU sed on macOS |
| toolchain | `llvm` | brew | LLVM toolchain |
| toolchain | `clang-format` | brew | C/C++ formatter |
| language | `node` | brew | Node.js runtime (the `task` CLI host) |
| language | `python` | brew | Python runtime |
| language | `pyenv` | brew | Python version manager |
| language | `go` | brew | Go toolchain |
| language | `rust` | brew | Rust toolchain |
| language | `ruby` | brew | Ruby runtime |
| language | `openjdk` | brew | JVM toolchain |
| language | `maven` | brew | Java build tool |
| language | `antlr` | brew | ANTLR4 parser generator |
| language | `php` | brew | PHP runtime |
| language | `php-cs-fixer` | brew | PHP formatter |
| language | `swift` | brew | Swift toolchain |
| language | `swift-format` | brew | Swift formatter |
| language | `julia` | brew (cask) | Julia runtime |
| format | `google-java-format` | brew | Java formatter |
| format | `shfmt` | brew | Shell formatter |
| format | `ormolu` | brew | Haskell formatter |
| format | `ocamlformat` | brew | OCaml formatter |
| format | `prettier` | brew | HTML/CSS/JS/TS/MD/YAML/JSON formatter |
| format | `sql-formatter` | brew | SQL formatter |
| format | `black` | pip | Python formatter |
| format | `perltidy` | brew | Perl formatter |
| compile | `kotlin` | brew | Kotlin compiler |
| compile | `zig` | brew | Zig compiler (also `zig fmt`) |
| compile | `ghc` | brew | Haskell compiler |
| compile | `ocaml` | brew | OCaml compiler |
| compile | `dart-sdk` | brew | Dart SDK + `dart format` |
| compile | `nim` | brew | Nim compiler |
| compile | `crystal` | brew | Crystal compiler |
| compile | `vlang` | brew | V compiler |
| compile | `typescript` | brew | TypeScript compiler |
| compile | `emscripten` | brew | C/C++ → WebAssembly |
| compile | `wasm-pack` | brew | Rust → WebAssembly |
| compile | `coq` | brew | Coq proof assistant |
| compile | `bend-lang` | cargo | Bend / HVM language |
| media | `libreoffice` | brew (cask) | Office-doc rendering / conversion |
| media | `imagemagick` | brew | Image conversion |
| media | `ffmpeg` | brew | Audio + video transcode |
| media | `inkscape` | brew | SVG renderer |
| media | `gifsicle` | brew | GIF optimizer |
| media | `calibre` | brew (cask) | Ebook conversion |
| media | `pandoc` | brew | Universal document converter |
| media | `mactex-no-gui` | brew (cask) | LaTeX distribution |
| media | `qpdf` | brew | PDF transformation |
| media | `poppler` | brew | PDF rendering (`pdftotext`, `pdftoppm`) |
| media | `mupdf` | brew | Lightweight PDF tools |
| media | `ghostscript` | brew | PostScript / PDF interpreter |
| font | `fontforge` | brew | Font editor / converter |
| font | `woff2` | brew | TTF/OTF ↔ WOFF2 |
| font | `harfbuzz` | brew | OpenType text shaping |
| archive | `p7zip` | brew | 7-Zip implementation |
| archive | `unar` | brew | The Unarchiver |
| archive | `atool` | brew | Archive frontend |
| image | `potrace` | brew | Bitmap → SVG/EPS tracer |
| image | `autotrace` | brew | Bitmap → vector tracer |
| image | `pstoedit` | brew | Autotrace EPS/PS dep |
| image | `librsvg` | brew | `rsvg-convert` |
| image | `dcraw` | brew | RAW decoder |
| image | `darktable` | brew (cask) | RAW developer |
| image | `rawtherapee` | brew (cask) | RAW developer |
| image | `openexr` | brew | HDR image library |
| image | `pfstools` | brew | HDR / Radiance tools |
| image | `apngasm` | brew | Animated PNG assembler |
| image | `webp` | brew | WebP codec |
| data | `libpq` | brew | Postgres client |
| data | `duckdb` | brew | Analytical SQL engine |
| data | `jupyter` | brew | Notebook runtime |
| binary | `radare2` | brew | Reverse-engineering framework |
| binary | `rizin` | brew | Radare2 fork |
| binary | `objconv` | brew | Object-file converter |
| binary | `wabt` | brew | WebAssembly Binary Toolkit |
| binary | `exiftool` | brew | Metadata reader/writer |
| binary | `id3v2` | brew | MP3 ID3 tag editor |
| binary | `eye-d3` | brew | MP3 ID3 tag editor |
| search | `ripgrep` | brew | Fast recursive grep |
| search | `fd` | brew | Fast `find` replacement |
| slides | `marp-cli` | brew | Markdown → HTML/PDF/PPTX |
| cloud | `kubernetes-cli` | brew | `kubectl` |
| cloud | `stern` | brew | Multi-pod log tail |
| cloud | `doctl` | brew | DigitalOcean CLI |
| profile | `samply` | cargo | Cross-platform CPU sampling profiler |
| scan-secret | `gitleaks` | brew | Secret-leak scanner |
| scan-secret | `trufflehog` | brew | Secret scanner with verification |
| pentest-port | `nmap` | brew | TCP/UDP port + service scanner |
| pentest-port | `masscan` | brew | High-speed asynchronous port scanner |
| pentest-web | `subfinder` | brew | Subdomain enumerator |
| pentest-web | `katana` | brew | Web crawler / spider |
| pentest-web | `httpx` | brew | HTTP probe |
| pentest-web | `ffuf` | brew | Web fuzzer |
| pentest-web | `gobuster` | brew | Directory / DNS / vhost brute-forcer |
| pentest-web | `amass` | brew | Attack-surface discovery |
| pentest-web | `nikto` | brew | Web-server vulnerability scanner |
| pentest-web | `wpscan` | gem | WordPress vulnerability scanner |
| pentest-web | `whatweb` | gem | Web fingerprinter |
| pentest-web | `wapiti3` | pip | Web app vulnerability scanner |
| pentest-web | `sqlmap` | brew | Automated SQL injection tester |
| pentest-cred | `hydra` | brew | Network login bruteforcer |
| pentest-cred | `john-jumbo` | brew | John the Ripper (jumbo edition) |
| pentest-cred | `hashcat` | brew | GPU-accelerated password recovery |
| pentest-cred | `crunch` | brew | Wordlist generator |
| pentest-cred | `cewl` | gem | Custom wordlist from a target site |
| pentest-wifi | `aircrack-ng` | brew | 802.11 WEP/WPA cracking suite |
| pentest-pcap | `wireshark` | brew | Network analyzer (ships `tshark`) |
| pentest-pcap | `tcpreplay` | brew | Replay PCAPs onto live interfaces |
| pentest-osint | `theHarvester` | pip | Email / subdomain / IP gatherer |
| pentest-osint | `maigret` | pip | Search 500+ sites for a username |
| pentest-osint | `sherlock-project` | pip | Username availability checker |
| pentest-osint | `recon-ng` | pip | Web-recon framework |
| pentest-osint | `bbot` | pip | Recursive recon swarm |
| pentest-forensics | `binwalk` | brew | Firmware / blob analysis |
| pentest-forensics | `foremost` | brew | File carver |
| pentest-forensics | `sleuthkit` | brew | Filesystem forensics toolkit |
| pentest-forensics | `yara` | brew | Pattern matching for samples |
| pentest-steg | `outguess` | brew | Universal steganographic tool |
| pentest-steg | `zsteg` | gem | Steg in PNG / BMP |
| pentest-forensics | `volatility3` | pip | Volatile memory forensics |
| pentest-mitm | `bettercap` | brew | Network attack & monitoring |
| pentest-mitm | `ettercap` | brew | LAN sniffer / MITM |
| pentest-mitm | `proxychains-ng` | brew | TCP-level proxy chainer |
| pentest-mitm | `tor` | brew | Onion-routing client / daemon |
| pentest-mitm | `mitmproxy` | brew | Interactive HTTP/HTTPS proxy |
| pentest-audit | `lynis` | brew | Host security auditor |
| pentest-audit | `ssh-audit` | brew | SSH config auditor |
| pentest-cve | `trivy` | brew | Vulnerability + SBOM scanner |
| pentest-cve | `grype` | brew | Vulnerability scanner (Anchore) |
| pentest-cve | `syft` | brew | SBOM generator |
| pentest-cve | `osv-scanner` | brew | OSV database vulnerability scanner |
| other | `nbconvert` | pip | Jupyter notebook conversion |
| other | `docx2pdf` | pip | DOCX → PDF |
| other | `patool` | pip | Archive frontend |
| other | `huggingface_hub` | pip | HF dataset / model CLI |
| other | `fonttools` | pip | Font subset / TTX |
| other | `asmfmt` | go | Assembly formatter |

### Not installed by the cask

A handful of upstream tools aren't in any major package
manager or are deliberately Linux-only on a dev laptop.
Install on demand or run via the prebuilt container.

| lib | reason | workaround |
| --- | --- | --- |
| `metasploit-framework` | Outside Homebrew core | `brew tap rapid7/metasploit && brew install metasploit`, or run via Docker |
| `chkrootkit`, `rkhunter` | Linux-server posture only | Run via Docker or skip |
| `steghide` | Removed from Homebrew core | Build from source or use Docker |
| `reaver`, `pixiewps` | macOS support patchy | Use the Linux Docker image |

## Related

- Cask formula: [`../../Casks/task.rb`](../../Casks/task.rb)
- Task CLI source + docs: [github.com/cluesurf/task](https://github.com/cluesurf/task)
