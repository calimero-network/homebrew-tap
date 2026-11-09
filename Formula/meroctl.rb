class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.12/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "564d771e2b5f336798b4cc8ed2e688b7ba595ca9b2eaa4f0c45af96834cb5657"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.12/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4ff080a15a2098af6f0fb2d4f929a3be13654adc210ea70bb282a003ea9be152"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.12/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "41f5102347c3ee568cf77ae3243396c648f73ed26e5776d925c4b15447b65c23"
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
