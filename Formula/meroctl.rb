class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.32"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "537bb1dabb39c25ec8618b5e74abd22b585d819322fcf3eb81d4effbb32ce336"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6cfba388fcb1f124527a79e2f5a6e8b31c7982e692215a6b38591189fb5b490"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.32/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5b05d61826dab0836d2ba0e8803049730bb067c962b600323ec7e46487e5f6b3"
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
