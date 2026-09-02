class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.31"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d5dcd08acd343abce119288b4841055b22f7fdc86dee0c28fced3ecb7ba686b0"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "33e96faea424ab22f5ed2925701166a70b6f866d02bc6fdc7685defc94a7fe9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.31/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d9b1b3727c5326edd37d49f939e1f8c8be9193f990562f1cdcc359eb8ce6e1f4"
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
