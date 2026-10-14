class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.87"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "8292d642ca2867726e650afbff82ee80090336cb7edc14a2170a9fe1b4baf214"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.87"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b3a09ddf912aa3bb116b248ab8f0f249fecf9a145ffbbcee273360aed667d4d5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2e385f979aee298bb996a6ac09057e623c76123bb153926d2086946b41e0e50"
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
