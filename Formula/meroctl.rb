class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.35"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "7eee2e194cfaf13c4ffdb754b7d6f31ccd8f0e421eb4b2ae40280280f54237c4"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "838d298ccc4423a8444c056181ea8edbf8986c487541bdf6d3a8052c3f6b7d03"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.35/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "49f2eb1ff840bf6c91bd6fb2f4eccf7c5b9bd58e2ac55f1ce95c9ee1e92aa659"
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
