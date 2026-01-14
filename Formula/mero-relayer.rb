class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "4a0356243cf48d4b21e3051b13da50612290846d9af6bb2372bfc76d7d67f647"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-relayer_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "01b3d59a3d57e2321d463fd7d898d5305f4ea19ade1c884352b90592747da8c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "99ecbe93bd09a0b308c50896fd052ba878ba5869e72e0d549278226c72eaca6c"
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
