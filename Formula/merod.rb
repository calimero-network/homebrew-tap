class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d5973e9bff726bd36151b2fa1749f57540f15690aa9dcf74fb5184e7311a0cf2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d19b8c6e0d170a010bb5693aa961c6779f720d03cef20e8f8e48f23cbebef7bc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.28/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "345a2aac343341a83fe14ce08d66a798e5329cc764302c24365e5e3bc3a73b80"
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
