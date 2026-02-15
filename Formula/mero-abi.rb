class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "dd9dbbaad4cfb902b4dac811ce868e3cef529e9896f912b2f1446bbb0dcf70d0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "20877f7ab4c0895374934aed2980bd08e9c300944b43022712700054d439c3a3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9c24cf90921d14d3477f8e8d561a5298ca61c9add162cad1ac36a760ff5180c5"
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
