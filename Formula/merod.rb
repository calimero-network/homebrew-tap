class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2e35e6539f57a6d4aaf84a3632d68d1e546c65f8cde01ee3c5fe753ba5964689"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/merod_x86_64-apple-darwin.tar.gz"
    sha256 "72697febab0598c079fe6c71938865f1184f1c8967c397f921e07a9e54d90a5e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d7cd558f045088ad6139f0f8c92b9262eab2c15016657599fca5bbcea4eaa678"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b80fed2cafaed7896da33bcf24ac7dc23105d0d5e937cf35c8a7e475f0c0c1db"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
