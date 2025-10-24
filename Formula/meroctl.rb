class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "09f13765bfa2aa77cfae6f2dc6a48cc0d9163c3401cc71bc6b75d58791512df1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "bb67b2c8d16fa2a44122dd6f06def159b1cd4f56d3a462f14a4d8ad95c0fcddd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "710f2082b34701f196297a706c07a761d6bab21855170aa7487fbab063a3e0b1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.3/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "18453ebb67f68a5c565da994269c66826cf9cbd67c0c923d47136d68dcd392ee"
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
