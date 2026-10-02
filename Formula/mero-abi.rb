class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.74"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "21a7a688961afa12fa373c754a1eecbd9f28e619b0b9e8ca98e66842876da618"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.74"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9641d1083cd408f76930c637402c9667cb5eb62f24ece04846d669612799e701"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.74/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1710da7d419697fbd10824586471938f9bed2bb6ec0e93d1efa27eddecda5301"
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
