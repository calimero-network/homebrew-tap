class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.70"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "41cd0355a740548fcb082bf174b095e8c607c1327ea7fe8c0d8273b0720929b4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.70"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ee1411c8913485b9ab54fd1e13b85c2bf38f1be4273f530eb23171c66bcd99e2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bf79df417d74f6620f378e76f604e8aa58cf5b2d77526ec1de01d9c38fed67b1"
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
