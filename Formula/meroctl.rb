class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3428c69df06019e0b4e9f182c803587e741d16ba3c584400d4f558f61f32b193"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "23f8b7a636866b8505b70128dfd635be39c804c08e0169e47268a329e40ca3c9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.22/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "801ba3f9e1f4e658f4fec1612079b8d6f28391bb1473cc37e7576bb77ba8003c"
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
