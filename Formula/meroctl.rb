class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1e054475b1ba44ee31cdea1fa33d157232aa2862f65754fed52f34b0185b8c05"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "87c334d323f8b3c7c7e09dcc6020d5ef09a30116c4758c1bbbccc2f0ef9ad372"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.41/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d1a6310de6915c6e444c7cd207d5772f3c1c62152fd0b6d93fe944ffdb641c79"
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
