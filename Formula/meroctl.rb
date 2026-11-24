class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.36/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b082f524350977f0019066fa527aaf3c444f4fa6e9da1b3107c22901c8715233"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.36 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.36/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e87689e6c3620a63c58f24342df78dff4e273e62f0057f4ea2cced6217a48c69"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.36/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "599ffda3ae61553aefac3b554e0874ab52e00d97f2b590909a7cc4025d5da6be"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
