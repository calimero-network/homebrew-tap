class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3a86fac9e15feb2194fa0fddf507d0e4c610d2ee9717a6534533ef3e0933805d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dc0591778fed58a3ce24c48d915d9fd598ef362c8bd1d592aecd9eed764e38d3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "57dfe0e4fb5d2ea6bc5cf8f60174693fedbff40b9da7485e8b57c1ea13e65635"
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
