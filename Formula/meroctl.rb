class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "aa04070a43eca634274459a0e0c0625270ce02e02c47ab4ae94403d826e99f1f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "61e5a0756087b8fdaaae586d7ef5968ebbb1e2f1ee7e6096f86b8628e97e7781"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8024895b634b0570c74c8c5b625986c153cdae94428e06bb5971b029d8b7e574"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.4/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "274195c61f89826e09bdac8aed733cabcb5fb0d4432ab61c40daba7de27c9da6"
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
