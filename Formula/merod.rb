class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "cb4a0c83b42fb81a7a0677305c7d1df549a5dfe5e1e576e427673f76306297b5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "4bfd62c8a0db2bce44cb2f3e9e1436449ef3d46d56c013ec51e00500df255d0f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "477eef515198d223deeef6f9da5def12dc3a12762e0ec28eefb788c2d785a61b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8287d8367cef401b59956bdb1cbb804b20402c0e06c369b52cd249d0e4e04e08"
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
