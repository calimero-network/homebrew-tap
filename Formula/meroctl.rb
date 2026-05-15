class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b0a32e90f50b2345974d34c56fe9d3089a11f6f87a0d548104b44a30925041fe"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cbd28ad1b383d01d5cc5d3c62b5185e21d47fe204d719195963268e24b714ccf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.38/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a1d17197dfac466a5a4c6a959f747e19e5603a0daff295242e51da5ac1a8801b"
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
