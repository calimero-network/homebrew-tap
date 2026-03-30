class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "f06f7d4ffdf621cab0afd5e16ea7b64b0da05fee92594ce982c03cf71039144e"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.12"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1427293a65b3d9e7900d20a6daabf820c6b680d770587301f39316a0505d1f79"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.12/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d4579e614a786876f699b937cf9037969b738a7f8c51f4c7e3b293758b1dd0b8"
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
