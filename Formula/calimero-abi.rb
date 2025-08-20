class CalimeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/calimero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "d8cc241acc7725ae1e6b3080cf39d49f8ed587355b7a9e5ce7ac59159104c631"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/calimero-abi_x86_64-apple-darwin.tar.gz"
    sha256 "291ea4ebae51733de53a350a6794869cf3a0fbda4dc3ca6f0e1520c5a5d7e22d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/calimero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3143644d3a1791095e45f555527b22a0a7273de22c701f0c56f0b5bf19a9508d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/calimero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3441710257364a38332443477b6bcbc40b809965e8c95f1d2996f9a81c4100b"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "calimero-abi"
  end

  test do
    assert_match "CalimeroAbi CLI", shell_output("#{bin}/calimero-abi --help")
  end
end
