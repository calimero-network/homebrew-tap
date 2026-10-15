class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.88"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "115fa8715d7bd9c13619a7cea50961bfcd8e97a8c7ff6ed33c52f09cf6e8739a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.88"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "60d76cb75bffe12137848b73dae438512ffac82542b40f9018389a3d531f01e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.88/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "016ab0bf85b49b78dbc498de058b61b2610d8463cba28e7cbe6eb60da45d0656"
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
