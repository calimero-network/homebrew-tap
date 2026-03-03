class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b4a9fb792b5f610211a3baeec2a2745a2bb3fc2227a83153d4395198e78a96cb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c73e6fcc08e704acda122a1d5d04e49908233f7b5f8d99e930da611111ecf344"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1a60cf42eb4ab3141e6a8aefb02f5c6d7a42105df7ba7be19bd891f91dc8b802"
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
