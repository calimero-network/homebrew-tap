class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/merod_aarch64-apple-darwin.tar.gz"
    sha256 "1375cc01b7fae5f32140cf83e26a753ef53735264782015def584e7f6711bd69"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/merod_x86_64-apple-darwin.tar.gz"
    sha256 "c1d3377c5faa484dd4670bb47f84fc3213933c957593e0f196eca5b71881c7d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2ddd3c722a5348c8611ae6cea9918a92a1430376d92a1ff38b97f0fc235799c6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.10/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0795c005cc5ac5b1259cbb90c3ca8ad718f50ebe27ea3a5abd7e05a79ad51b7e"
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
