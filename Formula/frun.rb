class Frun < Formula
  desc "Fast terminal UI for flutter run"
  homepage "https://github.com/okasutarto/flutter-run-tui"
  version "0.3.0"
  license "MIT"

  # Apple Silicon gets the prebuilt binary from the GitHub release, so installing
  # needs no Rust toolchain (and none of the LLVM it now pulls in). Intel Macs have
  # no prebuilt binary yet and still build from source.
  on_arm do
    url "https://github.com/okasutarto/flutter-run-tui/releases/download/v0.3.0/frun-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "269f5a8e70814129af839759c47edd86f1b6cbb41f4cabf7cd4eb0073cfa8713"
  end

  on_intel do
    url "https://github.com/okasutarto/flutter-run-tui/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "2e242ebd1d34e377b9b91827aae2876442afc9598c98f1f18376dcfe4fddc042"

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
