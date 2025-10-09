class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "53afcc73ef40dc12e35b79198021a1fa8dc7cdae3508884f120a5d07701a8dfb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "fa22bfb2ed07a79a9b4417b99c637ae60041b9455ab770c2287d773f3a5a88f8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "71e41e91788668c8914712d41ac952be3d1e673640733a71b1a14dfd813238db"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dbd7b68f75b600eea538d504d09de4c1cc3a8081de75962f9bf75ff986644a28"
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
