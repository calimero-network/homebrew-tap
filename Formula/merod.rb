class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/merod_aarch64-apple-darwin.tar.gz"
    sha256 "59ca972959661a2fbbe2a58e9c79ef9e5a69d957998b27bab516058ea8743560"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "de5c870151e28a36c089d30e5aa46ab7e8d62698c2cd97bb303d4b3bd25afe13"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.34/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4bf61b8656a143d899296e664531d5bae2ad93b8e7cc5c88da2b6b1b81d628d7"
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
