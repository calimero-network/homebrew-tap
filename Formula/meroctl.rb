class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3110434db50fcff43ed902d385523361e8212634c9bab50595477f75f6111abf"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0bf60ee78a5bb9c480c13c003f69549c453e6e79866861363137899cccc9e49e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.16/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f56c49c63ce97e3402f9e353ac099b7140b9f1dd2f91c8fd9e0abb6b563ca148"
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
