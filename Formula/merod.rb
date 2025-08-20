class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/merod_aarch64-apple-darwin.tar.gz"
    sha256 "c665c669bca00099a8f843f8b7b1bf68528d85360014fa80eadde6c2b7e513b8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/merod_x86_64-apple-darwin.tar.gz"
    sha256 "b8a7dc4bc96d806f5487af9900d10160ef87ca20dea76acacf837b3869dc126f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "03cb3361995400e3ff8b5d83c111eb4e5c2346dfc35633e454ae90bd8ba9b80b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.8/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c67a581c3d9b6cb105e11953f78bdd5d3f48ec8af827e70e97d923cf241f878a"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
