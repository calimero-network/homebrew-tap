class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.72"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "beaa41812124cbd9ec45266fc3edd89264085638da0f8037fa02664943b794df"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.72"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8ea3172ac5e5205b54a0ac91d9d0b231e067017292a2a01e9be6e4c4fa1b848b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.72/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ac906b6dd580b4bd387f8cf08c501269f8dfd62b5848643c05573d34e99c07b3"
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
