class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "b0e970f9fe340d722b9c62d7851c2053b2f8094bdaf0283f8c117d59d2c7ab1a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e81fc398fa48ba1f8138f4ab94b64dbdfc591031dc00f53e7571104f758de4db"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.13/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39977327d5914ef4f30b494e70fe40bb9def74448850f9a776761539f93f9f1d"
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
