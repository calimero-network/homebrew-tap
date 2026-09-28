class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.59"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/merod_aarch64-apple-darwin.tar.gz"
    sha256 "33b7f8cde865ec47c68b29a3626c11901a67c4e66dc941ee0f42758880026e17"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "954c86dae64ee01d1ec9fcd19efcb774a98b604794da4998e33b45934372579e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cf12832d200d652d6ee8db27e72eca8e8d4f47d2fa0a2241af34fda7c6ee1d84"
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
