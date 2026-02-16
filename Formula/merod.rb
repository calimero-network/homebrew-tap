class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/merod_aarch64-apple-darwin.tar.gz"
    sha256 "789e3d2aabe3f0fa3b581febce01df8b76fa81747568e8c2db4ed3e6bdebabb9"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e2ca8157b943bd1196ef8575c1b3661134d90cc94590173d70821edc0c6ed5e0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8d6e70024ea59254f894503d20259aee42da50be5194821a145e83cb8e21c334"
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
