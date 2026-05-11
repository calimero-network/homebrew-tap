class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.37"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "9aca293a4b745648baed31368c9e48a560a8157b90ac60e560659fcdad08c173"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e935eaa95afd9be4d4fbddbcc41e4ce3b1b6d9e50fa9008cb12104c3f77210b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.37/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "22ca61015adb727ce7ac3682d7200e68a90e43a24f2056232ad1ed6b4a0e0442"
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
