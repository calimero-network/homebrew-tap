class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "fda63f60665ae8a7d45e5b9c092690933374e27c1874d35a5517a2ec155df6c8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "22854c4c17b30e04c234eb511f467d162f8aac453dcaea9709ec7ac317790bf4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6ac36b44bdd7035ddf3419fbecbb2fd7f4bf868b525a454dea3c3a3715dd5377"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "948f560647be2941cdb94648d18b814720abce738bf7d8f1032ac2c15a0cfb54"
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
