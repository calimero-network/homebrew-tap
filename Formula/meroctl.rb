class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.79"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "718872225ec165f1f4555553f427b2f6109928ff74885d62f56e1be31eaf175a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.79"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c171a3218e8f8e81ef39462a754913b197e290287e75e5d2ace024e0a32cd5b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.79/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "77e3872ff00fc4130736534f6f12f5e8ca11cadae23b68f8780cc916f3210b45"
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
