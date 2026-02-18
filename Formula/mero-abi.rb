class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.49"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b2378bfaaf40b9792c30a656b103ecdd722afbd106ca27b09fbc8713438be141"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8dce2308ac07f9a7f8160b34e53e1adf5ecd06334b1c4799a08792cd275c1961"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.49/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c901d8f97beef5a762c0e2dee50508ce332f054cc8ebebf3a85e739a0c5c1e1"
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
