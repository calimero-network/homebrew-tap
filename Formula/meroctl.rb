class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "989d50a9a632367767cbbb7adb29d8213a80000511d021cd61e3a1757e0b880f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "92592fd1ef1bc7b2ba40ecebfec38c17b1a568dc5372dac06ad6c4434e46c650"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "073c36c7eafe77764e64c71dcfaa075c7305eece0db77be8c49d01ff92890829"
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
