class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.75"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "60323b84243ca4107a4a6241d9f49da136d79fc52c91990310af7ed6e3d3b5f2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bcff9c6d70a350596ee50d69f7e3ab01ecaf2bc98eacc134923679eaa58895a6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.75/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d2547cb3f65b1255f3c7515dd640c3972e3f3fe27e4575573a2c32e3d7eb6b2a"
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
