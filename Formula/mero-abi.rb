class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.56"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "dcf1ce951ef2863de63f1d5065334f6cb1e3096ef7c945129a788057884e428b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.56"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fb4deb278d726a2d2d699c9aecdcf6445a8efbc8dbe724fbcfa7e52a139a4518"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.56/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9a39828dd074b49b2a117a84fd9607b5951b5398eb2b2bd1f3feb7e660da05a5"
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
