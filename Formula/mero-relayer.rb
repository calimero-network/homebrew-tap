class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "2f5c3808520f54fbf16f449212ec7171370b53c42f05084896ee17ca9a7f79e3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ee6b6457ff4e205fdb0011e4bff8c956fbc6e51d91c3b8a2676f6661b6a54ae7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dd5a564181f94dfb2d4cd68530219406148156953ff4c6b991ac5210622a674f"
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
