class MeroAbi < Formula
  desc "CLI tool for extracting Calimero WASM ABI"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/mero-abi_aarch64-apple-darwin.tar.gz"
    sha256 "47797ac0524d953a54bd4ba432ee8011d018ae9cd88f59924bf526aa0404670b"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/mero-abi_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f4d52c5f896db919723db323521c69781f4633f94a24472232fd72b01e7ef172"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.9/mero-abi_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "13872a2462458f0323342bcc375ed04236101bb9ecd0435f0ec46cd567e729a8"
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
