class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "c946447657aa1516595e9b70a2a64ea5a76f180ef7f5bee955463c730cc475a5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6f444cb7e08bcc551baac3b9853180685b2e299aa73c82be82b7cfe253f13245"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fe2cc7ac5fcbb3834bd5f780843127785e5128267d78f700cbf60eb1ad84f083"
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
