class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ecde9a7e7d51658835fb6c0c4f1186e8030c4057bdecd26ad1572f4e34e93689"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d557afd66db77c09cfc500cc78b67df62188d4774b1b71f78794a5803e249b54"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "82d987f1dbbb4fcdc8f32285784888a677906699b0baa6055df4a381cb1fa161"
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
