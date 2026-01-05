class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "87851a5df1cebb098fa11f467d03d3e25f444487f8782df8e453151c78af0053"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "aaed22b272d444db9c083248e7cff7b0192fc42bb79e39c888e985eb3d5d0672"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f980460c42022d9de5d8e4fe2d28c8847277467f48b0d9afc0403d351c0d86d"
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
