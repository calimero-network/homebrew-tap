class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6bbc3fbf051488eed2e23a6685f5cb177849093f1f2fd4ae8bd5e10500ec4807"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "e86e59b04aa315cb8683c19b3410c48bdfe7662ad3d3fed69352e36e91bc2d1f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b892093385e08e004c363c6d84562b520d0b01a29566bd2679481375cac45212"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f53721ce685a610c09f77f96a537f9dee45a084abd98ed2f2953213b85b94855"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
