class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "8222c5d6adf934ed1b5342b5b45794626fdc6cf04f51aab0cd0e1eb28117a8e8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "55fadaccb587731ea158316d8cb739ae753ccdd92d76ce718d13456a87aea551"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.29/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "75ef9fc8cf30098b9546e765533192943b54b10943764ec6c472d864b25c79a0"
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
