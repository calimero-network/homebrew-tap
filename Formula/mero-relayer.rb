class MeroRelayer < Formula
  desc "Service for relaying requests from Calimero to external blockchains"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/mero-relayer_aarch64-apple-darwin.tar.gz"
    sha256 "b179d47d45dbcc55a7069ef8fbd19c3238487b9e404614e3c1141ef7bef8ba90"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/mero-relayer_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0bf7bc6a21ea22dd2de2fcb833bdf0ff5cc8558e65fdc5f4492f5d57e12e4909"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.8/mero-relayer_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2cada44dfcb069bfbfc62ca2329e08d17eb4c2c48469c3b77988b835436082d8"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "mero-relayer"
  end

  test do
    assert_match "MeroRelayer CLI", shell_output("#{bin}/mero-relayer --help")
  end
end
