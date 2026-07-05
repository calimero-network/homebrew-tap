class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/merod_aarch64-apple-darwin.tar.gz"
    sha256 "982cf52cd5fe760a36e5151c05990ef278ee53c6e263de3c8e967bff7fb251e1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6438ebae209a7ee14be9595e48cc146cbe4ebb74d2db17b85c952adf992c004f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.10/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "22244523ffcef88d681273a864a433a99ff9b0d62b1d8c1eb2d0259e92f4d6a5"
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
