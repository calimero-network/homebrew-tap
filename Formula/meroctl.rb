class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "7b6bd6778c64a5543eef3115bf804fe5c6792d8669faa98898dc4fc26aa27ced"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.16"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "67506c63b6b67d8c4636a9fb9d43a23c055e0afb2d1dd6e166b2553887585e95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.16/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e1d458fa0fc89d9e02fb5e479692d2d1042f0f9c14e45dbec433109e85084a22"
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
