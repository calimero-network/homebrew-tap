class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "37ce1be5fe351e08b657f5430fe8107aee5d72123c22b2da004f7308a5cfec73"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "888367edc3679da8b177e5e61fcecee2ff4765a221d3260377896107b3322d3f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c50ee25dc24df56352162aa785782812fef86ee24a3474af8c36c32231df6b19"
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
