class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9c22176c77335ff004827ec9c7a80e492603f432b76ac6a56526559ee95d81e8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "80019853422e31c7e6e09dde7ba021add1e09f65ddb61b7079c946720c5e78cd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "889a254d13c721bf50e82a7549394db288b146a4973242ffbc1da9a83b8b2e49"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "642d2c52c08015f60ac6135544628e7101bbf02e99b0a24bac1f455832498fcb"
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
