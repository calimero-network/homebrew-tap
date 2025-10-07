class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "e7bec58d3ba2819f8e456aba2852cc8ff566c6c67d9089a55ac9f8636d5676a3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "39a2b6ea9765f0e0cda394de4db6b7e45a55cd627cc41b8d570fa9bb8b9f3146"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "47106172dbe3153bcddbfe8987dd089657ad377981b5350860c2e72b06e762f4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "81bb6cb470899cf2a5c799b1c8fb495a42e5fc67cf75baad85050ddb4f24d595"
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
