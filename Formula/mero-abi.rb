class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.70"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2636047103b93ede277f4f8b19ff1fe97d08674398c93b9ee90384af81932368"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.70"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e4cc7dda3b30d0d182263e8942f19a2f4282f97502fb90baed9c973e1db4f3ae"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.70/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f47443dda5661787bb5c16e0760b9a5f154627a362e5226673fd911e278975e7"
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
