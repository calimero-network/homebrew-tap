class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "bbcd27ca5088e837b917a96783dd921d9d147704249d22f365f208203f2dae33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7e7c759d0619cbc314bf43d7b7b4f7cb4d9a78ce75a0eb3a8350c601d6affaf2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f628cdb665aff114fef724a1ce14e71cce998260f8b68eb4360125ccc2cae60"
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
