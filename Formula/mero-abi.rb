class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "19d0f42c8ce21d4f03a9bc1c6fc33a0da6706f2caf7ccbc155d2a38b8884ab41"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "7775882139f2be690736038fe8fcd794e853875940ff20e1c9ef7a45d48b3e0f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "25ef1d8e6fce98d093eae67a9c511df21f04770b02da486d8722905fd888775e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.2/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c8ae6c4cd055261143c60c5b687c3698e50e146f88c576687c9ef44d558f361"
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
