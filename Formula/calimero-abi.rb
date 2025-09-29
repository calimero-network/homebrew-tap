class CalimeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/calimero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "e221029a3cfc7453ec58063be2ae33eb349c5588822bcbcf51e3fdec8f62da02"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/calimero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "21a2a75093b13daf1d1d8e2140614f5a3fcd39dc166dc8aed23dd265c4645fe0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/calimero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4fab30999e6cab8396fa8ced80fea94459b842d4159590e0774a010a7cac7c44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/calimero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2144f8c32d2cd8970d3c865ca49a46c97a8cd41039d8ca7121df7365e84c3755"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "calimero-abi"
  end

  test do
    assert_match "CalimeroAbi CLI", shell_output("#{bin}/calimero-abi --help")
  end
end
