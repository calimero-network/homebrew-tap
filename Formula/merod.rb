class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/merod_aarch64-apple-darwin.tar.gz"
    sha256 "45b622dd921aadd78d8ee9768a8d7cac513511140b15948da5fbfcf0722f0cbd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.11"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "56affee504a3ef686bd582b10d63c6a39a5ebdcd459e5df8b2e4ece2d784ae8f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.11/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a34c8f8fec0980b1672cde69798730013845876b17cdc71b4aa0e80768b397ff"
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
