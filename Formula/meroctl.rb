class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.44"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "f8f12fb901d382750a0c9281f162cfabfa9f09520839f4406542859fca240acd"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.44"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2b256231960e2361583d6cf6d6af1de1c38355b23c9e356b37b5b05ef2953391"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.44/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "50db57b9c8ec11ab95e06c9fff8dea6d50133890268e17ae7dc661ae7f77d972"
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
