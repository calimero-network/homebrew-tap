class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1fac5d1525950122c29273fca4792bdd2ae2c663769253502657cd0ec6ec1fa5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "85a2dd89178f944f151544de9687a5dc48b4bc1f2a9ce30c9ddbe2b01395e19d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "30271f1698f123468ce104402d8adc48a223d7e480435dd59226408a73d99664"
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
