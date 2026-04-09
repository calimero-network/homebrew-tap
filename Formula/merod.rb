class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.19"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/merod_aarch64-apple-darwin.tar.gz"
    sha256 "adcbc9924bcd81c80b790a35112f660dec7c0c4ca2088e31e9d00b7fce42ac59"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.19"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f510a2ae3dc1e2f83dd600780c15ab2450e78c830445baa28952161e2924c17b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.19/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc950e53026d4f467db8916b50660b67045d2ac78a0ff5f59e83380b92ad2f58"
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
