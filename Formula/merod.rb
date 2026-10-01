class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.72"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5445ccff9b1023f311ce348606071676a15a4a4fdc43835c17eff9798ad4757a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.72"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "be8e493a6565da7e065c4d92d5aa0a4903298e4c094a75315734182f76a9eb5a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cad00de4ab4f550f5672e4837f35a5f898a09d91bf0d636b066adcd02b9a17bc"
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
