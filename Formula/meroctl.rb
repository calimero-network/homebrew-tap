class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3d78607a59a4bda495bc89602b85c385377b8fb6ebf77778c582a85e41ab3939"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6889bb6bbc397ce08eabe2ab4b862143d0b6f6a35e433c9ae1bbef9bea610610"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3da2fe18a7d33778e13fef15ad5d8b19a61269a59417a1b2048374f9e3c07aeb"
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
