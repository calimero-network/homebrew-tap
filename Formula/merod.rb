class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.54"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4326a76e26a88ac358e5d03971134cc1e8811537ae3ddf561df88de35c6ae5b6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a54330343ff3e79c0a6cae248a058696039da148ed609821858490615ee52ecd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.54/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "403460ffc970aaeeae3328c17b56d27812164b86f8cb30c66f7f69bb880d2130"
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
