class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.45"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "b1a57bcbfae5973bbfa7069bd4893295296fb331c0a8487ac70e5f0026b8f3c4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.45"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "35a940c55f52bca4fc5aabc0520b82c86077a6f022fe59a64de72ea3bda3ad35"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.45/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5bee7f458f43d696bd11d88625a12965a1c754f553cba11dcabb21e666bfaab0"
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
