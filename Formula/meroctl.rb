class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.69"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "611e88cdad0c978d3b6178ff8acbd48995af2ddc4dee433bc9a182514f54be90"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3ca22b0d2e510478a88c3279547a770ec0f6c7c2d5dfd42ef95e000e67b14ded"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.69/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bf288ae1e0195d3b3203743755834796dd6dae58e672875c68ff980b59d39290"
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
