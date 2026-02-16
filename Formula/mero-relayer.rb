class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "1f749ee381a77281eec420f481ed46f7302ef48388f1767d59a4fef25b8baba3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "657583481527eb77cf8874728eeb7b4e794119ed7b09fc8efa5a95b46c2ba8a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.47/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60bb3e5d20635743ddf4a74d50c19b62164217c60917a3b0b03f57610a3e9beb"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
