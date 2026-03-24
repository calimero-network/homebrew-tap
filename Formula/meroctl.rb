class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "17770c5d207b03d6527e63db6980ce6618b0309174baf72865eb0c370f373eb5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "318be238e42228a86b9aa12c2e05b93381bdc2d5b078b960c6c6b855e7d538d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b036a61be00bbbbe3bc94fff261496366185167e4f7a902eaeac424c26a1dc06"
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
