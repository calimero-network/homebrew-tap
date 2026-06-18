class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "faec12ce629aeb002d0378323b671190bdddeb20517598032d663f08fdda8923"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1b43454cf2435236539d7502d03e3f0666301c30604ef0854c08a7a2244c3360"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.5/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3c5345d492c20a0e9e14e370a1d50a54aca839ede8ae0f7ce76e1ff1f5001616"
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
