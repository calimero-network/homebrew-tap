class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "eaa5909f42f56f6935cb9718624a92a471eb0a162e331fa5b1560765be47b0ab"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "d8c06ea265985da4a4286614619fbfd3d01ede2ca1ecb46530f5c10cb946a1da"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "befefd6bd179e88ea63d7e67a4abde6c3feacb4b859178fc31c5da8e6b7bef61"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aec3552117abedd78d642e97f98190be768d6301ceb70b20df2f08b1e258ba8c"
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
