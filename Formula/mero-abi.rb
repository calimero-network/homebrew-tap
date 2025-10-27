class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "cde507534ff948d036705d60e08172b3c313f49334cf747195958064d53672bf"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "491800de0fc9904ce25dbbb82af80d171bb8e5fc59c92adac2854d64cf3dd990"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b461385dcc931763739c675bfa4567aa382e56417acfbafd0760b677d4a3b6aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.5/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a88a3d54bfc4f50c680ba55c27f8399139b1668fa5ad393b3cb6147d2fc974b7"
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
