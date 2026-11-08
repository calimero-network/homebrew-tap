class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.11/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e17267f2c60c0eca25745e12900c2e0fc9dda379a9aaddfeac23a958ff78964d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.11/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8e435686b27c032b271d24f057dd373aac21c6298c6c6ffeb5d66bf473c09250"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.11/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "12861a48ef7fee06c84334aa13f31b56f7f9d9cfad4d9e45d1977c477eaf20af"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
