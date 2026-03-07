class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d30d61b9a3f4fb57e79e21544cc12579b144493bae1c4f555e0d262cb6f8829a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ee883425bbe438d35e9a91fb3ab246a4e671d04dea8e7bab9638ac56e4ec3468"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.2/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e76b72308f61cf112c62154a81dff92dff170d712c099d3f82d5969fb718327c"
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
