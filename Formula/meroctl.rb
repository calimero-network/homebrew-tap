class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.57"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "441959777b41987636d841d0284dbe38d4e7c3e35bceb4e7e2a18709dfbb8f85"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.57"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4ab0b62e778b7c00fbfb5382b09067a8b4895426a17f6a08f194c782589428cf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.57/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55a235b0a3f15e0ae0c0064690226ebdf1e910a2143c28ce01cb178776cb8f8f"
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
