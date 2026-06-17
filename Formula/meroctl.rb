class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "007aea54a765714b7cbeaa2c43be61bf416c0f0c5fece91a018ca32ddd1b7262"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1015c7e20153af8ca058d8b66ba0e911d301882f36868f22eb64bde4f1da8a50"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.4/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e80ddfad2b3690ee20d23fb387963b5ad8be720702724c81510e423e6f55b6a9"
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
