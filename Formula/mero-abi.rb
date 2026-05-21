class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "2db14616604d8e536dd94e72d32ecc391c2ceb25f11c9db52dce40d697265db7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.42"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ad462b1026f852816ca374b4daa1e4455b3c699ab66267ea47620610238b14a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.42/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7b4cbc312d5b9efe94a75d7b867d9268e1fe98e61d276aa89092ba4e1bdc47cc"
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
