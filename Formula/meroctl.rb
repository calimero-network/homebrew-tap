class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f28d5a6b26bcf9074090193ee65c361b802bd3670f4c7ef4e5ceba38338bd3a0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fea17369d090010f494ea2e5b73ff19b36a75833e10dd32b6ada66926c7b588b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.12/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "be5b2a0d1e45bdfb4460611cebdd4d5ad21e2750e28d4f907e3e6a996059693d"
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
