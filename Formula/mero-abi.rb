class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "7db1d6a9bf55b4c2714a19e98fc1b91a08dba64cc3f8c8899fed20ca137531e3"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e3819c50de7dd18e4b40fa54cd989ae8d5e9ef7de9c135d8270a652c0b640deb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.3/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1999d901329beec3b04718e2543dcbb99cfb79f058554895133f8bf47373f2a"
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
