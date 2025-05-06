class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.6.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "678ac130c3c480418e7d843b7828d5bbf6f7d2b976ef9247cbdbbb51d6972985"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "fde8fe3341c561ce3e66dce0341f3d31434171373d822304205c3899890f343f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "10a7d7a90fb9f544ef6638433656070c1b4187a7ad35fbf549d198908b9b47c6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.6.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f1b2c695fc7aa5e579b02c7c96c718f4af9ceb58520464ed9b72e021d1270cb7"
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
