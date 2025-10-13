class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2aca8101186691ca09a7c3dccdd70a3ec7ca37b085761dbfd9f8d616a42eb23b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "b905edd119ba3d121cf42141f1f285b364d1b5739491149fdf7cd3f9126dd1fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "44341187b9f25cda8dd9564c698a1d5ff6944f951a9462d8454ea4e12783951d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "879c9baaede06e0461c8c2b807d88fb9af66fc9314390a8ba6ce48ae1a93150b"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-abi"
  end

  test do
    assert_match "MeroAbi CLI", shell_output("#{bin}/mero-abi --help")
  end
end
