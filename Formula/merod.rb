class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.64"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/merod_aarch64-apple-darwin.tar.gz"
    sha256 "20ecda53892832755ab55c7afa4dab3a10864b87ca62aba46c73bc48746e8e69"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.64"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1c414bf782ab83372caf9043fc09bf7200d0ca8c06e4bc4b4efb7ec7385fe39c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.64/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c019249b19c8de37fc904e2ab4030f8d01aec356c5e1ef891c82d6e658811823"
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
