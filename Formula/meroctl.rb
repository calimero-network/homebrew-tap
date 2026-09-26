class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.48"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c9652c5acd5f4ce4ec300cf8ec79f1607b862b7d7bf2177963b71ac4634f84aa"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "639154f194b0c1513826aa6dcf197aa954d25c15df87076f136974c95f2fd506"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.48/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aaf4d0e08bc241c66a4a4b221df3aa165cb775df3cecef6a976a0d53f11a7d2b"
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
