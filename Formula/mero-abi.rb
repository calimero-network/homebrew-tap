class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "08bdd168e4ae9a661f32b5a4d7fe7cbc5b47865d078135adf6621f01a8981411"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17ee08a4031780678fb2cd547bdae2471bdda78c2ab849f8eb691567a84964a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c44ef60a1aee63a6607afc430b1b5fa9adcc1a352c5165eae03f171e73aa346"
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
