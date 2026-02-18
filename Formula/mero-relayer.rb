class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "9bc4fc8065c7a3819ff9bd01cb7c350c7f455f1c5086faaf16c461429a6a3d8e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "502c5addedf94e84dd1264c77e7dbc01945b60eebf9bd4104e4b52dd74f32591"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cd3091d71a9b263e4e01ff0546d4df9dbdfdf901839153737a6f5f8c79dcc232"
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
