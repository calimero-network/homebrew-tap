class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "8f3aade0eaed5d217c78db6f3f9b4e81b6490c0bbec12df4a290d51fa6f4899a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "1704686846354aedc19e8e176a59c66683d5681631c7660b59b88d96a565b92a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53c28b3a9a796d46bd9f4de665ee498968ffef97577720da857e361b0b5707e9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c8d5cd9a4b55da76f6f8f85f0d344ec1ef5bc6bc998a7ec6111f750c8e297c75"
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
