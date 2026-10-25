class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.12.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "edb2ff2f6d4f3921ecd6a5b55c0aa4a9fd7b8b1a2c06d57ee93e55d5bf76c625"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.12.0-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "02320f90dba370f83d5963ae06a00412d5900c771a61c6f723c82496604f8c02"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.12.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fb96913d5d2a7f9793f8be794a343c029eaaa7f8404d4cf8c81c8c58250bdf14"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
