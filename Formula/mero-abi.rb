class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.17"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "990ac3ab631977f8809e4c3648580c3e1a21f85389a234033217d5a2d799e51b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "b6d03bd12cf9363155022fef59c3bbc5eb711011e0f67e09688c84648950e4ce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "611ec2a8f9200ec285d1c21b55afe62558cce558f94d0ff013662428a1771791"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.17/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3d7c8f9c667e81d3c67ff9fa80c201880ab60eae59aa38ca0747aa8519077b7d"
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
