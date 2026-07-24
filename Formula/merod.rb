class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4cb6ac9582d5aefb5afbff58f8fd95d1d0295ad1a36203de67620b14d963d2d2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.18"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2137d1f7305923160f2d102cee16fd175753d6b5b7b0fdfb741f75415171c02a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.18/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d93f376b2b47cc7db48d8eeca37e7bc83a395f05dad52428e113593b2cdfe866"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
