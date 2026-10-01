class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.74"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/merod_aarch64-apple-darwin.tar.gz"
    sha256 "efc82874e39c328bc0ed65833ed16dddef2d0f8d75a63f89ec7f86779c5d4e70"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.74"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f45690e8a8e20972b25e6ed3b2d5510c5d42505d0231acefe44c1bbe30220dbc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f79e941938ec159e636fc9e2bf046444cb599783d21b9af585372a46fdc5858f"
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
