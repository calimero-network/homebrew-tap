class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d453d31e26d5060c1d23d3b829aaf3cd4e4c0c8bbca4e104ce0381d77b54c9c6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ca4273db5c6353e3236629ef334e857fa67c398f9981b04faccde3e48788d111"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.24/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "86c97fb369c331140a55b65a7c8bf95f905ce96da8b24655dbee4289df4a05e3"
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
