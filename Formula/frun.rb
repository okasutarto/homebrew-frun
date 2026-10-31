class Frun < Formula
  desc "Fast terminal UI for flutter run"
  homepage "https://github.com/okasutarto/flutter-run-tui"
  version "0.2.0"
  license "MIT"

  # Apple Silicon gets the prebuilt binary from the GitHub release, so installing
  # needs no Rust toolchain (and none of the LLVM it now pulls in). Intel Macs have
  # no prebuilt binary yet and still build from source.
  on_arm do
    url "https://github.com/okasutarto/flutter-run-tui/releases/download/v0.2.0/frun-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "c10cff73e14b6ad424c1b7293a70f89c0c0310c693bd9761246b7e91288cd840"
  end

  on_intel do
    url "https://github.com/okasutarto/flutter-run-tui/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "d1357e3559753592166537fd39562665dbea92272f6210cebe8c79e1a7c40734"

    depends_on "rust" => :build
  end

  def install
    if Hardware::CPU.arm?
      bin.install "frun", "frun-tui"
    else
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    assert_match "detecting", shell_output("#{bin}/frun --states")
  end
end
