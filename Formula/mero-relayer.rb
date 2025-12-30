class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.26"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "62a26eccdd371f9412d75cef1e0e397e11e3972583e2487c7b41d8558cd8bbd7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "214599c78ff096a4af8371120264f947f9a19ae96d5d02f6f3e7876a8abae301"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.26/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "30666f16f0569407480c9b87c38fc424dc89217517f843c545daf888798c5127"
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
