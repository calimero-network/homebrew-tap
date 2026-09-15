class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/merod_aarch64-apple-darwin.tar.gz"
    sha256 "661f3c5a0cd96ff77aa69c746169efd9c02d631c4988696964a34f6a1fa2ad27"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2646483a4297517ba9785743c9d65858e7502affa665505f0ead8c93cfd7752b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3086a6a559650e01b4f380ad6fc63c5dd95a79a10dc50c49db8e340409c7dd64"
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
