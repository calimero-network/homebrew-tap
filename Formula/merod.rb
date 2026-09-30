class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.66"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/merod_aarch64-apple-darwin.tar.gz"
    sha256 "9c7935fb745f4bc9aef62b274a27bd66b292818e9f36265c66c84139bd29af88"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.66"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d57a0269c3fe36e1b93e5bcec12b97fe8c2fd3a78ec858528f0ef7f76f3e80d3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.66/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "80b36e797650b2f6c5721676e0f7bd324d90c80b41779d43828b014acb8d95e3"
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
