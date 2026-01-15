class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.34"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "8ade4414d02d1037d80a2e18e71813adc33c16f4e4d1c07bb53776125ffa9097"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c94f70e20f023af003833b1f6064bddc85bac90253b3be29ae47b51edc43287"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.34/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb3ca2f7cc42e6e1548de11fd6122731446eab3bce32ea8b0e137dfb70a5df89"
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
