class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.65"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/merod_aarch64-apple-darwin.tar.gz"
    sha256 "293a3424b90633a1a184f1e6a38aaae15ba1c832b8354f6f81ad3ef8bf5cbf01"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.65"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "83b13704831135f5171967a9d75e24cb04f416a3fcd642ec3a57797680119af5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.65/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "88ea5ea4cecd731bdbe03d91cecc8d43be5ae306648e58859a88fcfdf6fc696e"
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
