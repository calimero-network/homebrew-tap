class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c9ee428adae876c5e3d964ebdaf4f1ff8bc53346c6cd1535207c105e689da4b6"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d92fd8c7b3267856e78babfad747e99ff8f8c452a8c0ebbc20c75bc191aef789"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.43/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "89ffcb59b7ad6d02740525a3bc1b1dc1bbf518a79f6410bb32d7c79d3299feb9"
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
