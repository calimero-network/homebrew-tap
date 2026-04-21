class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "cb03488ee49545fcc2aceafdd910f0cf111a93a48e6ae89bcc6c60245f92bc73"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3bbb4f6b20f1d11f4e79a2d69d3aca723fa3ee881781b0ae9af83740f0dd667c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.29/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "693c7a6b437a621611d0003b3a42e1ca21cce7e88b4e4cd9adbdd12124600bfd"
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
