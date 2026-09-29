class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.63"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f0aefb054351c45a6019dd00f9f985d7a4c5dc1955570cc2106db6f73ef56840"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f68cebd90bee97bad5b108f062209bbf305c5019213366a53f4cc128d0ec19e6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.63/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a54d5031405377487f91b36e3996c2cbd68d837dd7d6d10dbbf8646942092758"
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
