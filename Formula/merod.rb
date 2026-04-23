class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d60977e0e5d191c6c5522e232a5cc0e8da22b0489a2d0edd964767b55a4ec317"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7de8a8a7dabf72c155d009ae944e5d39e31b95364de4ec2b2db43e4f919224a1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.31/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4a456f92d0844e26bd6a72306cce2f77867b9e4be7136fb4b0d36504437e289"
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
