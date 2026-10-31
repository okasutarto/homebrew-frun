class Frun < Formula
  desc "Fast terminal UI for flutter run"
  homepage "https://github.com/okasutarto/flutter-run-tui"
  url "https://github.com/okasutarto/flutter-run-tui/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d1357e3559753592166537fd39562665dbea92272f6210cebe8c79e1a7c40734"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "detecting", shell_output("#{bin}/frun --states")
  end
end
