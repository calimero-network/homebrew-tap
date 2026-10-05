class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.82"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "8f1d2358077fd411019c7c54fa11709a2c8687fdde24057c77cf0f7dd3b25ad7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.82"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d775f9a6bf2620da398e41ee696ba845ba3c04307db3b5b617653e5b8645edd3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.82/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84f7d8b57a51abc13a51da212c6c3fa9d232c3d070040c1237ea3c3a224f84f5"
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
