class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "c99d2b6fe21637677a1de03a4be5decdec7eaa6dd376dbbc384ca69301fa178b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2e753036978c7681269d6f399fe94a4dd8694af8ee630aa992d5bcf46105ff0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6dbdfd5524eddc734524896b7b405d56970ab38aca86577a7052656cab5f0e25"
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
