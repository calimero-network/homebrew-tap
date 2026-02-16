class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "52c0d28694b2a1cf97dbda5f74fd5c2c835e2636bf0b9e431e288e2e61f54ad2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6d3d9c78e11628379474c7619e65f0fb9ff4ba10bb28217ce26d57213ae2e7f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.44/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "35848f38c6282b4f505111cec97b69b6d00fb77de341188cdc59c7c23ced224f"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
