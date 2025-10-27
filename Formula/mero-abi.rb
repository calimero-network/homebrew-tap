class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "670ce89a6280696eb93cdde909675d7bd562330f9e5323d79b0bd56da910544a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/mero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "c6adb8a8814852e1a8e1a4757eb56ed398f8b5601fbaedde9a997827f1ecd016"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c0110dd41a99346f809bdf9a3cccccd1cece50360a983be51b2c7b0a1c91ee88"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c0f9a27dd841dfdfc89f2e784327abedd923792976cc54ebdcabe1e39bd4f61f"
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
