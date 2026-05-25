class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c3926f789220dfb97129c426038002dd8487655ede25091a94d77cd3d8a85d02"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4d366900f0f1cbeacb8e4b77136bdb6f9554db0d130c7f1bce81edf68519e2a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.43/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df9c745e89a63e79a845cb2d2f7752239a4ebc7f025ff9d28acff5eca5335ee8"
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
