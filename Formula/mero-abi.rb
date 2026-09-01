class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "3bac01f81a0f2e597418303eecad4b307500bfb8a52364101dc0078e070d1462"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e7cb95397fa50de40d71acfd25e6c84dd633c862a6151539ba2d2974fde8a03a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.30/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "21ce63007f6a68a265206725212a17da4fd203e84867c2e45819b821f93eddb2"
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
