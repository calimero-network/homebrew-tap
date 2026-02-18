class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "6a337e98d7830fd6b9c5e1f413541daf10ccf17ccee0bba99dc6b915d4d95556"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e9086fa42545cc4e607cca89c28da0e59efea36f07ab6df127f614fdab54c569"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efad18a7ef01a143458f52bd8d3304adccb66495367eb474c48f30b95b029509"
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
